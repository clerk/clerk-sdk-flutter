import 'package:clerk_auth/src/clerk_auth/auth.dart';
import 'package:clerk_auth/src/clerk_auth/http_service.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/client/user.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/logging.dart';

import '../../test_helpers.dart';

void main() {
  late Auth auth;
  late final TestEnv env;
  late final TestHttpService httpService;

  setUpAll(() async {
    env = TestEnv('.env.test');
    httpService = TestHttpService('integration/clerk_auth/sign_in_test', env);
    await setUpLogging(printer: TestLogPrinter(), level: Level.SEVERE);
  });

  Future<void> initialiseForTest(String testName) async {
    httpService.reset();

    httpService.recordPath = testName;

    httpService.expect(HttpMethod.post, '/v1/client');
    httpService.expect(HttpMethod.get, '/v1/environment');

    auth = Auth(
        config: TestAuthConfig(
      publishableKey: env.publishableKey,
      httpService: httpService,
    ));
    await auth.initialize();
  }

  group('SignIn', () {
    test('can sign in with password in one step', () async {
      await runWithLogging(() async {
        await initialiseForTest('sign_in_with_password');

        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ins',
          params: {'identifier': env.email, 'password': env.password},
        );

        expect(auth.user, null);
        await auth.attemptSignIn(
          identifier: env.email,
          strategy: Strategy.password,
          password: env.password,
        );
        expect(auth.signIn, null);
        expect(auth.user is User);

        expect(httpService.isCompleted);
      });
    });

    test('can sign in with email code', () async {
      await runWithLogging(() async {
        await initialiseForTest('sign_in_with_email_code');

        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ins',
          params: {'identifier': env.email},
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ins/SIGN_IN_ID/prepare_first_factor',
          params: {
            'strategy': 'email_code',
            'email_address_id': 'IDENTIFIER_ID'
          },
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ins/SIGN_IN_ID/attempt_first_factor',
          params: {'strategy': 'email_code', 'code': env.code},
        );

        await auth.attemptSignIn(
          identifier: env.email,
          strategy: Strategy.emailCode,
        );
        await auth.attemptSignIn(
          strategy: Strategy.emailCode,
          code: env.code,
        );
        expect(auth.signIn, null);
        expect(auth.user is User);

        expect(httpService.isCompleted);
      });
    });

    test('can sign in with phone code', () async {
      await runWithLogging(() async {
        await initialiseForTest('sign_in_with_phone_code');

        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ins',
          params: {'identifier': env.phoneNumber},
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ins/SIGN_IN_ID/prepare_first_factor',
          params: {
            'strategy': 'phone_code',
            'phone_number_id': 'IDENTIFIER_ID'
          },
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ins/SIGN_IN_ID/attempt_first_factor',
          params: {'strategy': 'phone_code', 'code': env.code},
        );

        await auth.attemptSignIn(
          identifier: env.phoneNumber,
          strategy: Strategy.phoneCode,
        );
        await auth.attemptSignIn(
          strategy: Strategy.phoneCode,
          code: env.code,
        );
        expect(auth.signIn, null);
        expect(auth.user is User);

        expect(httpService.isCompleted);
      });
    });

    test('can sign in with email link', () async {
      await runWithLogging(() async {
        await initialiseForTest('sign_in_with_email_link');

        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ins',
          params: {'identifier': env.emailForLink},
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ins/SIGN_IN_ID/prepare_first_factor',
          params: {
            'strategy': 'email_link',
            'email_address_id': 'IDENTIFIER_ID',
            'redirect_url': 'https://somedomain.com'
          },
        );
        httpService.expect(HttpMethod.get, '/v1/client');
        httpService.expect(HttpMethod.get, '/v1/client');

        await auth.attemptSignIn(
          identifier: env.emailForLink,
          strategy: Strategy.emailLink,
          redirectUrl: 'https://somedomain.com',
        );
        expect(auth.signIn?.status, Status.needsFirstFactor);
        while (auth.user == null) {
          await Future.delayed(const Duration(milliseconds: 300));
        }
        expect(auth.signIn?.status, Status.complete);
        expect(auth.user is User);

        expect(httpService.isCompleted);
      });
    });
  });
}
