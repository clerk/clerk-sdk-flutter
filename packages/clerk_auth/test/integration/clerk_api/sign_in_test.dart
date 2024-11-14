import 'package:clerk_auth/clerk_api/clerk_api.dart';
import 'package:common/common.dart';
import 'package:test/test.dart';

import '../../test_helpers.dart';

void main() {
  late final Api api;
  late final TestEnv env;

  setUpAll(() async {
    env = TestEnv('.env.test');
    api = Api(publicKey: env.publicKey, publishableKey: env.publishableKey);
    await setUpLogging(printer: TestLogPrinter());
  });

  tearDown(() async {
    await api.signOut();
  });

  group('Can sign in:', () {
    test('with email and password', () async {
      await runWithLogging(() async {
        late ApiResponse response;

        response = await api.createSignIn(identifier: 'test1+clerk_test@devangels.london');
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
        expect(client?.activeSession?.publicUserData.identifier.isNotEmpty, true);
      });
    });

    test('with email code', () async {
      await runWithLogging(() async {
        late ApiResponse response;
        late SignIn signIn;

        response = await api.createSignIn(identifier: 'test2+clerk_test@devangels.london');
        expect(response.client?.signIn?.status, Status.needsFirstFactor);

        signIn = response.client!.signIn!;
        response = await api.prepareSignIn(
          signIn,
          stage: Stage.first,
          strategy: Strategy.emailCode,
        );
        expect(response.client?.signIn?.status, Status.needsFirstFactor);

        signIn = response.client!.signIn!;
        response = await api.attemptSignIn(
          signIn,
          stage: Stage.first,
          strategy: Strategy.emailCode,
          code: env.code,
        );
        expect(response.client!.sessions.length > 0, true);

        final client = response.client;
        expect(client?.signIn, null);
        expect(client?.activeSession?.status, Status.active);
        expect(client?.activeSession?.publicUserData.identifier.isNotEmpty, true);
      });
    });

    test('with email link', () async {
      await runWithLogging(() async {
        late ApiResponse response;
        late SignIn signIn;

        response = await api.createSignIn(identifier: 'test3+clerk_test@devangels.london');
        expect(response.client?.signIn?.status, Status.needsFirstFactor);

        final redirectUrl = 'https://redirect.to.somewhere';

        signIn = response.client!.signIn!;
        response = await api.prepareSignIn(
          signIn,
          stage: Stage.first,
          strategy: Strategy.emailLink,
          redirectUrl: redirectUrl,
        );
        expect(response.client?.signIn?.status, Status.needsFirstFactor);

        // no way to test onward journey easily
      });
    });

    test('with phone code', () async {
      await runWithLogging(() async {
        late ApiResponse response;
        late SignIn signIn;

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
        expect(response.client!.sessions.length > 0, true);

        final client = response.client;
        expect(client?.signIn, null);
        expect(client?.activeSession?.status, Status.active);
        expect(client?.activeSession?.publicUserData.identifier.isNotEmpty, true);
      });
    });
  });
}
