import 'package:clerk_auth/clerk_auth.dart';
import 'package:test/test.dart';

import '../../test_helpers.dart';

void main() {
  late final Auth auth;
  late final TestEnv env;

  setUpAll(() async {
    env = TestEnv('.env.test');
    auth = Auth(publicKey: env.publicKey, publishableKey: env.publishableKey);
    await setUpLogging(printer: TestLogPrinter());
  });

  tearDown(() => auth.signOut());

  group('SignIn', () {
    test('can sign in with password in separate steps', () async {
      await runWithLogging(() async {
        expect(auth.user, null);
        final client = await auth.attemptSignIn(identifier: 'test1+clerk_test@devangels.london');
        expect(client.signIn?.status, Status.needsFirstFactor);

        final client2 =
            await auth.attemptSignIn(strategy: Strategy.password, password: env.password);
        expect(client2.signIn, null);
        expect(client2.user is User, true);
      });
    });

    test('can sign in with password in one step', () async {
      await runWithLogging(() async {
        expect(auth.user, null);
        final client = await auth.attemptSignIn(
          identifier: 'test1+clerk_test@devangels.london',
          strategy: Strategy.password,
          password: env.password,
        );
        expect(client.signIn, null);
        expect(client.user is User, true);
      });
    });

    test('can sign in with email code', () async {
      await runWithLogging(() async {
        expect(auth.user, null);
        final client = await auth.attemptSignIn(
          identifier: 'test1+clerk_test@devangels.london',
          strategy: Strategy.emailCode,
          code: env.code,
        );
        expect(client.signIn, null);
        expect(client.user is User, true);
      });
    });

    test('can sign in with phone code', () async {
      await runWithLogging(() async {
        expect(auth.user, null);
        final client = await auth.attemptSignIn(
          identifier: 'test1+clerk_test@devangels.london',
          strategy: Strategy.phoneCode,
          code: env.code,
        );
        expect(client.signIn, null);
        expect(client.user is User, true);
      });
    });

    // UNCOMMENT TO TEST AGAINST A LIVE ACCOUNT
    // test('can sign in with email link', () async {
    //   await runWithLogging(() async {
    //     expect(await auth.user, null);
    //     final client = await auth.attemptSignIn(
    //       identifier: 'REGISTERED EMAIL ADDRESS',
    //       strategy: Strategy.emailLink,
    //       redirectUrl: 'https://www.clerk.com',
    //     );
    //     expect(client.signIn?.status, Status.complete);
    //     expect(client.user is User, true);
    //   });
    // });
  });
}
