import 'dart:convert';

import 'package:clerk_auth/src/clerk_auth/auth.dart';
import 'package:clerk_auth/src/clerk_auth/http_service.dart';
import 'package:clerk_auth/src/models/client/client.dart';
import 'package:clerk_auth/src/models/client/field.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/client/user.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/logging.dart';
import 'package:test/test.dart';

import '../../test_helpers.dart';

void main() {
  late Auth auth;
  late TestEnv env;
  late TestHttpService httpService;

  setUpAll(() async {
    await setUpLogging(printer: TestLogPrinter(), level: Level.SEVERE);
  });

  tearDown(() async {
    httpService.expect(HttpMethod.delete, '/v1/me');
    httpService.expect(HttpMethod.get, '/v1/client');
    await auth.deleteUser();
  });

  Future<void> initialiseForTest(String testName) async {
    final id = base64Encode(testName.codeUnits).replaceAll('=', '');
    env = TestEnv(
      '.env.test',
      overrides: {
        'password': 'Ab$id%',
        'username': 'user$id',
        'email': 'user$id+clerk_test@somedomain.com',
        'phone_number': '+155555501${(testName.hashCode % 90) + 10}',
        'use_open_identifiers': true,
      },
    );
    httpService = TestHttpService('clerk_auth/sign_up_test', env)
      ..recordPath = testName;

    httpService.expect(HttpMethod.post, '/v1/client');
    httpService.expect(HttpMethod.get, '/v1/environment');

    auth = Auth(
      config: TestAuthConfig(
        publishableKey: env.publishableKey,
        httpService: httpService,
      ),
    );
    await auth.initialize();
  }

  group('SignUp', () {
    test('can sign up with emailCode and phoneCode in separate steps',
        () async {
      await runWithLogging(() async {
        await initialiseForTest('sign_up_with_email_and_phone_code');

        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups',
          params: {
            'strategy': 'email_code',
            'password': env.password,
            'email_address': env.email,
            'phone_number': env.phoneNumber,
            'first_name': env.username,
            'last_name': env.username,
            'legal_accepted': true,
          },
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups/SIGN_UP_ID/prepare_verification',
          params: {'strategy': 'email_code'},
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups/SIGN_UP_ID/prepare_verification',
          params: {'strategy': 'phone_code'},
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups/SIGN_UP_ID/attempt_verification',
          params: {'strategy': 'email_code', 'code': '424242'},
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups/SIGN_UP_ID/attempt_verification',
          params: {'strategy': 'phone_code', 'code': '424242'},
        );

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
        expect(
          client.signUp?.unverifiedFields.contains(Field.emailAddress),
          true,
        );

        client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          code: env.code,
        );
        expect(client.signUp?.status, Status.missingRequirements);
        expect(
          client.signUp?.unverifiedFields.contains(Field.phoneNumber),
          true,
        );

        client = await auth.attemptSignUp(
          strategy: Strategy.phoneCode,
          code: env.code,
        );
        expect(client.signUp, null);
        expect(client.user is User, true);

        expect(httpService.isCompleted, true);
      });
    });

    test('can sign up with emailCode with typo in first email', () async {
      await runWithLogging(() async {
        await initialiseForTest('sign_up_with_email_code_and_typo');

        final typoEmailAddress =
            '${env.username}-TYPO+clerk_test@somedomain.com';

        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups',
          params: {
            'strategy': 'email_code',
            'email_address': typoEmailAddress,
            'phone_number': env.phoneNumber,
            'password': env.password,
            'first_name': env.username,
            'last_name': env.username,
            'legal_accepted': true,
          },
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups/SIGN_UP_ID/prepare_verification',
          params: {'strategy': 'email_code'},
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups/SIGN_UP_ID/prepare_verification',
          params: {'strategy': 'phone_code'},
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups/SIGN_UP_ID/prepare_verification',
          params: {'strategy': 'email_code'},
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups/SIGN_UP_ID/prepare_verification',
          params: {'strategy': 'phone_code'},
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups/SIGN_UP_ID/attempt_verification',
          params: {'strategy': 'email_code', 'code': '424242'},
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups/SIGN_UP_ID/attempt_verification',
          params: {'strategy': 'phone_code', 'code': '424242'},
        );

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
        expect(
          client.signUp?.unverifiedFields.contains(Field.emailAddress),
          true,
        );

        client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: env.email,
        );
        expect(client.signUp?.status, Status.missingRequirements);
        expect(
          client.signUp?.unverifiedFields.contains(Field.emailAddress),
          true,
        );

        client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: env.email, // correct the address
          code: env.code,
        );
        expect(client.signUp?.status, Status.missingRequirements);
        expect(
          client.signUp?.unverifiedFields.contains(Field.phoneNumber),
          true,
        );

        client = await auth.attemptSignUp(
          strategy: Strategy.phoneCode,
          code: env.code,
        );
        expect(client.signUp, null);
        expect(client.user is User, true);

        expect(httpService.isCompleted, true);
      });
    });

    test('does not updateSignUp when values are unchanged', () async {
      await runWithLogging(() async {
        expect(auth.user, null);

        // 1) Create initial sign up with emailCode and an email address
        httpService.expect(
          'POST /v1/client/sign_ups strategy=email_code&email_address=$emailAddress',
          200,
          '{"response":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["oauth_github","oauth_google","email_address","phone_number","username","last_name","first_name","oauth_apple"],"missing_fields":["password"],"unverified_fields":["email_address"],"verifications":{"email_address":null,"phone_number":null,"web3_wallet":null,"external_account":null},"username":null,"email_address":"$emailAddress","phone_number":null,"web3_wallet":null,"password_enabled":false,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732107014735,"legal_accepted_at":null},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":null,"sign_up":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["phone_number","username","first_name","last_name","oauth_github","oauth_google","oauth_apple","email_address"],"missing_fields":["password"],"unverified_fields":["email_address"],"verifications":{"email_address":null,"phone_number":null,"web3_wallet":null,"external_account":null},"username":null,"email_address":"$emailAddress","phone_number":null,"web3_wallet":null,"password_enabled":false,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732107014735,"legal_accepted_at":null},"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732020614717,"updated_at":1732020614748}}',
        );

        // Initial create
        Client client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: emailAddress,
        );
        expect(client.signUp?.status, Status.missingRequirements);

        // 2) Call attemptSignUp again with the same email
        // No HTTP expectation should be queued for this invocation.
        client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: emailAddress, // unchanged
        );

        // State should remain in missing requirements; no extra PATCH occurred.
        expect(client.signUp?.status, Status.missingRequirements);
      });
    });

    test('updates SignUp when provided value changes', () async {
      await runWithLogging(() async {
        expect(auth.user, null);

        final firstEmail = '$username+first@some.domain';
        final secondEmail = '$username+second@some.domain';

        // 1) Create initial sign up with first email
        httpService.expect(
          'POST /v1/client/sign_ups strategy=email_code&email_address=$firstEmail',
          200,
          '{"response":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["oauth_github","oauth_google","email_address","phone_number","username","last_name","first_name","oauth_apple"],"missing_fields":["password"],"unverified_fields":["email_address"],"verifications":{"email_address":null,"phone_number":null,"web3_wallet":null,"external_account":null},"username":null,"email_address":"$firstEmail","phone_number":null,"web3_wallet":null,"password_enabled":false,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732107014735,"legal_accepted_at":null},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":null,"sign_up":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["phone_number","username","first_name","last_name","oauth_github","oauth_google","oauth_apple","email_address"],"missing_fields":["password"],"unverified_fields":["email_address"],"verifications":{"email_address":null,"phone_number":null,"web3_wallet":null,"external_account":null},"username":null,"email_address":"$firstEmail","phone_number":null,"web3_wallet":null,"password_enabled":false,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732107014735,"legal_accepted_at":null},"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732020614717,"updated_at":1732020614748}}',
        );

        Client client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: firstEmail,
        );
        expect(client.signUp?.status, Status.missingRequirements);

        // 2) Provide a different email -> should PATCH
        httpService.expect(
          'PATCH /v1/client/sign_ups/SIGN_UP_ATTEMPT_ID strategy=email_code&email_address=$secondEmail',
          200,
          '{"response":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["oauth_github","oauth_google","email_address","phone_number","username","last_name","first_name","oauth_apple"],"missing_fields":["password"],"unverified_fields":["email_address"],"verifications":{"email_address":null,"phone_number":null,"web3_wallet":null,"external_account":null},"username":null,"email_address":"$secondEmail","phone_number":null,"web3_wallet":null,"password_enabled":false,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732107014735,"legal_accepted_at":null},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":null,"sign_up":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["phone_number","username","first_name","last_name","oauth_github","oauth_google","oauth_apple","email_address"],"missing_fields":["password"],"unverified_fields":["email_address"],"verifications":{"email_address":null,"phone_number":null,"web3_wallet":null,"external_account":null},"username":null,"email_address":"$secondEmail","phone_number":null,"web3_wallet":null,"password_enabled":false,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732107014735,"legal_accepted_at":null},"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732020614717,"updated_at":1732020614748}}',
        );

        client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: secondEmail,
        );

        // Still in missing requirements, but email reflected the change via PATCH
        expect(client.signUp?.status, Status.missingRequirements);
        expect(client.signUp?.emailAddress, secondEmail);
      });
    });
  });
}
