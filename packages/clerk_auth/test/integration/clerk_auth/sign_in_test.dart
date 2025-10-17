import 'package:clerk_auth/src/clerk_auth/auth.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/client/user.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/logging.dart';

import '../../test_helpers.dart';

void main() {
  late Auth auth;
  late TestEnv env;
  late TestHttpService httpService;

  setUpAll(() async {
    await setUpLogging(printer: TestLogPrinter(), level: Level.SEVERE);
  });

  Future<void> initialiseForTest(String testName) async {
    env = TestEnv('.env.test');
    httpService = TestHttpService('clerk_auth/sign_in_test', env)
      ..recordPath = testName;

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

        await auth.attemptSignIn(
          identifier: env.email,
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

        const redirectUrl = 'https://redirect.to.somewhere';

        await auth.attemptSignIn(
          identifier: env.emailForLink,
          strategy: Strategy.emailLink,
          redirectUrl: redirectUrl,
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
