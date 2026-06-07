import 'dart:convert';

import 'package:clerk_auth/src/clerk_auth/auth.dart';
import 'package:clerk_auth/src/clerk_auth/http_service.dart';
import 'package:clerk_auth/src/models/client/client.dart';
import 'package:clerk_auth/src/models/client/field.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/client/user.dart';
import 'package:clerk_auth/src/models/enums.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/logging.dart';
import 'package:http/http.dart' show ByteStream, Response;

import '../../test_helpers.dart';

void main() {
  late Auth auth;
  late TestEnv env;
  late TestHttpService httpService;

  setUpAll(() async {
    await setUpLogging(printer: TestLogPrinter(), level: Level.SEVERE);
  });

  Future<void> initialiseForTest(String testName) async {
    env = TestEnv.withOpenIdentifiers('.env.test', testName);
    httpService = TestHttpService('clerk_auth/sign_up_test', env)
      ..recordPath = testName;

    auth = Auth(
      config: TestAuthConfig(
        publishableKey: env.publishableKey,
        httpService: httpService,
      ),
    );
    await auth.initialize();
  }

  group('SignUp', () {
    test(
      'can sign up with emailCode and phoneCode in separate steps',
      () async {
        await runWithLogging(() async {
          await initialiseForTest('sign_up_with_email_and_phone_code');

          Client client = await auth.attemptSignUp(
            strategy: Strategy.emailCode,
            emailAddress: env.email,
            phoneNumber: env.phoneNumber,
            password: env.password,
            passwordConfirmation: env.password,
            firstName: env.username,
            lastName: env.username,
            legalAccepted: true,
          );
          expect(client.signUp?.status, Status.missingRequirements);
          expect(client.signUp?.unverifiedFields.contains(Field.emailAddress));

          client = await auth.attemptSignUp(
            strategy: Strategy.emailCode,
            code: env.code,
          );
          expect(client.signUp?.status, Status.missingRequirements);
          expect(client.signUp?.unverifiedFields.contains(Field.phoneNumber));

          client = await auth.attemptSignUp(
            strategy: Strategy.phoneCode,
            code: env.code,
          );
          expect(client.signUp, null);
          expect(client.user is User);

          await auth.deleteUser();

          expect(httpService.isCompleted);
        });
      },
    );

    test('can sign up with emailCode with typo in first email', () async {
      await runWithLogging(() async {
        await initialiseForTest('sign_up_with_email_code_and_typo');

        final typoEmailAddress =
            '${env.username}-TYPO+clerk_test@somedomain.com';

        Client client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: typoEmailAddress,
          phoneNumber: env.phoneNumber,
          password: env.password,
          passwordConfirmation: env.password,
          firstName: env.username,
          lastName: env.username,
          legalAccepted: true,
        );
        expect(client.signUp?.status, Status.missingRequirements);
        expect(client.signUp?.unverifiedFields.contains(Field.emailAddress));

        client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: env.email,
        );
        expect(client.signUp?.status, Status.missingRequirements);
        expect(client.signUp?.unverifiedFields.contains(Field.emailAddress));

        client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: env.email, // correct the address
          code: env.code,
        );
        expect(client.signUp?.status, Status.missingRequirements);
        expect(client.signUp?.unverifiedFields.contains(Field.phoneNumber));

        client = await auth.attemptSignUp(
          strategy: Strategy.phoneCode,
          code: env.code,
        );
        expect(client.signUp, null);
        expect(client.user is User);

        await auth.deleteUser();

        expect(httpService.isCompleted);
      });
    });

    test('signs up Google ID token when external account is not found',
        () async {
      await runWithLogging(() async {
        env = TestEnv('.env.test');
        final googleHttpService = _GoogleIdTokenSignUpHttpService();
        auth = Auth(
          config: TestAuthConfig(
            publishableKey: env.publishableKey,
            httpService: googleHttpService,
          ),
        );

        await auth.initialize();

        await auth.idTokenSignUp(
          provider: IdTokenProvider.google,
          idToken: 'native-id-token',
        );

        expect(auth.signUp, null);
        expect(auth.user is User);

        expect(
          googleHttpService.requests,
          [
            'post /v1/client',
            'get /v1/environment',
            'post /v1/client/sign_ins strategy=google_one_tap&token=native-id-token',
            'post /v1/client/sign_ups strategy=google_one_tap&token=native-id-token',
            'post /v1/client/sessions/SESSION_ID/touch',
          ],
        );
        expect(googleHttpService.isCompleted);
      });
    });

    test('does not update SignUp when values are unchanged', () async {
      await runWithLogging(() async {
        await initialiseForTest('does_not_update_unchanged_values');

        const email = 'newemail+clerk_test@somedomain.com';

        // 1) Create initial sign up with emailCode and an email address
        // Initial create
        Client client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: email,
        );
        expect(client.signUp?.status, Status.missingRequirements);
        final hitCount = httpService.hitCount;

        // 2) Call attemptSignUp again with the same email
        // No HTTP expectation should be queued for this invocation.
        client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: email, // unchanged
        );

        // State should remain in missing requirements; no extra PATCH occurred.
        expect(client.signUp?.status, Status.missingRequirements);

        // hit count should not have changed
        expect(httpService.hitCount, hitCount);
      });
    });

    test('updates SignUp when provided value changes', () async {
      await runWithLogging(() async {
        await initialiseForTest('does_update_changed_values');

        final firstEmail = '${env.username}+first@somedomain.com';
        final secondEmail = '${env.username}+second@somedomain.com';

        // 1) Create initial sign up with first email
        Client client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: firstEmail,
        );
        expect(client.signUp?.status, Status.missingRequirements);
        final hitCount = httpService.hitCount;

        // 2) Provide a different email -> should PATCH
        client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: secondEmail,
        );

        // Still in missing requirements, but email reflected the change via PATCH
        expect(client.signUp?.status, Status.missingRequirements);
        expect(client.signUp?.emailAddress, secondEmail);

        // The hit count should have gone up by one
        expect(httpService.hitCount, hitCount + 1);
      });
    });
  });
}

class _GoogleIdTokenSignUpHttpService implements HttpService {
  final requests = <String>[];
  final _responses = <Map<String, dynamic>>[
    _client(),
    _environment(),
    _externalAccountNotFound(),
    _googleTokenSignUp(),
    _activeClient(),
  ];

  bool get isCompleted => _responses.isEmpty;

  @override
  Future<void> initialize() async {}

  @override
  void terminate() {}

  @override
  Future<bool> ping(Uri uri, {required Duration timeout}) async => true;

  @override
  Future<Response> send(
    HttpMethod method,
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    String? body,
  }) async {
    requests.add(_requestKey(method, uri, params));
    if (_responses.isEmpty) {
      throw StateError('Unexpected request: ${requests.last}');
    }
    return Response(jsonEncode(_responses.removeAt(0)), 200);
  }

  @override
  Future<Response> sendByteStream(
    HttpMethod method,
    Uri uri,
    ByteStream byteStream,
    int length,
    Map<String, String> headers,
  ) async {
    throw UnimplementedError();
  }

  static String _requestKey(
    HttpMethod method,
    Uri uri,
    Map<String, dynamic>? params,
  ) {
    final pairs = (params ?? const <String, dynamic>{})
        .entries
        .where((entry) => entry.value != null)
        .map((entry) => '${entry.key}=${entry.value}')
        .toList()
      ..sort();
    return [
      method.name,
      uri.path,
      if (pairs.isNotEmpty) pairs.join('&'),
    ].join(' ');
  }

  static Map<String, dynamic> _client() => {
        'response': _clientObject(
          sessions: const [],
          signUp: null,
          lastActiveSessionId: null,
        ),
        'client': null,
      };

  static Map<String, dynamic> _environment() => {
        'maintenance_mode': true,
      };

  static Map<String, dynamic> _externalAccountNotFound() => {
        'errors': [
          {
            'message': 'The External Account was not found.',
            'code': 'external_account_not_found',
            'long_message': 'The External Account was not found.',
          },
        ],
        'client': null,
      };

  static Map<String, dynamic> _googleTokenSignUp() {
    final signUp = _signUp();
    return {
      'response': signUp,
      'client': _clientObject(
        sessions: [_session(status: 'pending')],
        signUp: signUp,
        lastActiveSessionId: null,
      ),
    };
  }

  static Map<String, dynamic> _activeClient() => {
        'response': _clientObject(
          sessions: [_session(status: 'active')],
          signUp: null,
          lastActiveSessionId: 'SESSION_ID',
        ),
      };

  static Map<String, dynamic> _clientObject({
    required List<Map<String, dynamic>> sessions,
    required Map<String, dynamic>? signUp,
    required String? lastActiveSessionId,
  }) =>
      {
        'object': 'client',
        'id': 'CLIENT_ID',
        'sessions': sessions,
        'sign_in': null,
        'sign_up': signUp,
        'last_active_session_id': lastActiveSessionId,
        'last_authentication_strategy': null,
        'cookie_expires_at': null,
        'captcha_bypass': false,
        'created_at': 1,
        'updated_at': 2,
      };

  static Map<String, dynamic> _signUp() => {
        'object': 'sign_up_attempt',
        'id': 'SIGN_UP_ID',
        'status': 'complete',
        'required_fields': const [],
        'optional_fields': const [],
        'missing_fields': const [],
        'unverified_fields': const [],
        'verifications': const {},
        'username': null,
        'email_address': 'user@example.com',
        'phone_number': null,
        'web3_wallet': null,
        'password_enabled': false,
        'first_name': null,
        'last_name': null,
        'unsafe_metadata': const {},
        'public_metadata': const {},
        'custom_action': false,
        'external_id': null,
        'created_session_id': 'SESSION_ID',
        'created_user_id': 'USER_ID',
        'abandon_at': 3,
      };

  static Map<String, dynamic> _session({required String status}) => {
        'object': 'session',
        'id': 'SESSION_ID',
        'status': status,
        'expire_at': 4,
        'abandon_at': 5,
        'last_active_at': 6,
        'last_active_organization_id': null,
        'public_user_data': {
          'identifier': 'user@example.com',
          'has_image': false,
        },
        'user': _user(),
      };

  static Map<String, dynamic> _user() => {
        'id': 'USER_ID',
        'object': 'user',
        'username': null,
        'first_name': null,
        'last_name': null,
        'profile_image_url': null,
        'image_url': null,
        'has_image': false,
        'primary_email_address_id': null,
        'primary_phone_number_id': null,
        'primary_web3_wallet_id': null,
        'public_metadata': const {},
        'private_metadata': const {},
        'unsafe_metadata': const {},
        'email_addresses': const [],
        'phone_numbers': const [],
        'web3_wallets': const [],
        'passkeys': const [],
        'organization_memberships': const [],
        'external_accounts': const [],
        'create_organization_enabled': false,
        'password_enabled': false,
        'two_factor_enabled': false,
        'totp_enabled': false,
        'backup_code_enabled': false,
        'last_sign_in_at': 7,
        'banned': false,
        'locked': false,
        'lockout_expires_in_seconds': null,
        'verification_attempts_remaining': 100,
        'updated_at': 8,
        'created_at': 9,
        'last_active_at': 10,
        'delete_self_enabled': false,
      };
}
