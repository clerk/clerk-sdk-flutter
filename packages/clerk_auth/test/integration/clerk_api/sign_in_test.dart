import 'package:clerk_auth/src/clerk_api/api.dart';
import 'package:clerk_auth/src/clerk_auth/http_service.dart';
import 'package:clerk_auth/src/models/api/api_response.dart';
import 'package:clerk_auth/src/models/models.dart';
import 'package:clerk_auth/src/utils/logging.dart';
import 'package:test/test.dart';

import '../../test_helpers.dart';

void main() {
  late final Api api;
  late final TestEnv env;
  late final TestHttpService httpService;

  setUpAll(() async {
    env = TestEnv('.env.test');
    httpService = TestHttpService('clerk_api/sign_in_test', env);
    api = Api(
      config: TestAuthConfig(
        publishableKey: env.publishableKey,
        httpService: httpService,
      ),
    );

    await api.initialize();
    await setUpLogging(printer: TestLogPrinter(), level: Level.SEVERE);
  });

  setUp(() async {
    httpService.reset();
  });

  tearDown(() async {
    httpService.expect(HttpMethod.delete, '/client');
    await api.signOut();
  });

  group('Can sign in:', () {
    test('with email and password', () async {
      await runWithLogging(() async {
        httpService.recordPath = 'email_and_password';

        late ApiResponse response;

        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ins',
          params: {'identifier': env.email},
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ins/SIGN_IN_ATTEMPT_ID/attempt_first_factor',
          params: {'strategy': 'password', 'password': 'password'},
        );

        response = await api.createSignIn(identifier: env.email);
        expect(response.client?.signIn?.status, Status.needsFirstFactor);

        final signIn = response.client!.signIn!;
        response = await api.attemptSignIn(
          signIn,
          stage: Stage.first,
          strategy: Strategy.password,
          password: env.password,
        );

        final client = response.client;
        expect(client?.signIn, null);
        expect(client?.activeSession?.status, Status.active);
        expect(
            client?.activeSession?.publicUserData.identifier?.isNotEmpty, true);
      });
    });

    test('with email code', () async {
      await runWithLogging(() async {
        httpService.recordPath = 'email_code';

        late ApiResponse response;

        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ins',
          params: {'identifier': 'user+clerk_test@somedomain.com'},
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ins/SIGN_IN_ATTEMPT_ID/prepare_first_factor',
          params: {
            'strategy': 'email_code',
            'email_address_id': 'IDENTIFIER_ID'
          },
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ins/SIGN_IN_ATTEMPT_ID/attempt_first_factor',
          params: {'strategy': 'email_code', 'code': '424242'},
        );

        response = await api.createSignIn(
          identifier: 'user+clerk_test@somedomain.com',
        );
        expect(response.client?.signIn?.status, Status.needsFirstFactor);

        response = await api.prepareSignIn(
          response.client!.signIn!,
          stage: Stage.first,
          strategy: Strategy.emailCode,
        );
        expect(response.client?.signIn?.status, Status.needsFirstFactor);

        response = await api.attemptSignIn(
          response.client!.signIn!,
          stage: Stage.first,
          strategy: Strategy.emailCode,
          code: env.code,
        );
        expect(response.client!.sessions.isNotEmpty, true);

        final client = response.client;
        expect(client?.signIn, null);
        expect(client?.activeSession?.status, Status.active);
        expect(
            client?.activeSession?.publicUserData.identifier?.isNotEmpty, true);
      });
    });

    test('with email link', () async {
      await runWithLogging(() async {
        httpService.recordPath = 'email_link';

        late ApiResponse response;
        late SignIn signIn;

        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ins',
          params: {'identifier': 'user+clerk_test@somedomain.com'},
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ins/SIGN_IN_ATTEMPT_ID/prepare_first_factor',
          params: {
            'strategy': 'email_link',
            'email_address_id': 'IDENTIFIER_ID',
            'redirect_url': 'https://redirect.to.somewhere'
          },
        );

        response = await api.createSignIn(
            identifier: 'user+clerk_test@somedomain.com');
        expect(response.client?.signIn?.status, Status.needsFirstFactor);

        const redirectUrl = 'https://redirect.to.somewhere';

        signIn = response.client!.signIn!;
        response = await api.prepareSignIn(
          signIn,
          stage: Stage.first,
          strategy: Strategy.emailLink,
          redirectUrl: redirectUrl,
        );
        expect(response.client?.signIn?.status, Status.needsFirstFactor);

        // no way to test onward journey easily, but this is covered
        // in ../clerk_auth/sign_in_test.dart
      });
    });

    test('with phone code', () async {
      await runWithLogging(() async {
        httpService.recordPath = 'phone_code';

        late ApiResponse response;
        late SignIn signIn;

        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ins',
          params: {'identifier': '+15555550100'},
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ins/SIGN_IN_ATTEMPT_ID/prepare_first_factor',
          params: {
            'strategy': 'phone_code',
            'phone_number_id': 'IDENTIFIER_ID'
          },
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ins/SIGN_IN_ATTEMPT_ID/attempt_first_factor',
          params: {'strategy': 'phone_code', 'code': '424242'},
        );

        response = await api.createSignIn(identifier: env.phoneNumber);
        expect(response.client?.signIn?.status, Status.needsFirstFactor);

        signIn = response.client!.signIn!;
        response = await api.prepareSignIn(
          signIn,
          stage: Stage.first,
          strategy: Strategy.phoneCode,
        );
        expect(response.client?.signIn?.status, Status.needsFirstFactor);

        signIn = response.client!.signIn!;
        response = await api.attemptSignIn(
          signIn,
          stage: Stage.first,
          strategy: Strategy.phoneCode,
          code: env.code,
        );
        expect(response.client!.sessions.isNotEmpty, true);

        final client = response.client;
        expect(client?.signIn, null);
        expect(client?.activeSession?.status, Status.active);
        expect(
            client?.activeSession?.publicUserData.identifier?.isNotEmpty, true);
      });
    });
  });
}
