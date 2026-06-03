import 'package:clerk_auth/src/clerk_auth/auth.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
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
      ),
    );
    await auth.initialize();
  }

  group('Client.updatedAt', () {
    test('server returns non-zero updated_at after sign-in', () async {
      await runWithLogging(() async {
        await initialiseForTest('sign_in_with_password');

        await auth.attemptSignIn(
          identifier: env.email,
          strategy: Strategy.password,
          password: env.password,
        );

        // Non-zero updated_at is required for the stale-client guard in
        // ClerkAuthState to compare timestamps correctly.
        expect(auth.client.updatedAt.microsecondsSinceEpoch, greaterThan(0));
      });
    });
  });
}
