import 'package:clerk_auth/src/clerk_api/api.dart';
import 'package:clerk_auth/src/models/api/api_response.dart';
import 'package:clerk_auth/src/models/models.dart';
import 'package:clerk_auth/src/utils/logging.dart';

import '../../test_helpers.dart';

void main() {
  late Api api;
  late final TestEnv env;
  late TestHttpService httpService;

  setUpAll(() async {
    env = TestEnv('.env.test');
    await setUpLogging(printer: TestLogPrinter(), level: Level.SEVERE);
  });

  Future<void> initialiseForTest(String testName) async {
    httpService = TestHttpService('clerk_api/sign_in_test', env)
      ..recordPath = testName;
    api = Api(
      config: TestAuthConfig(
        publishableKey: env.publishableKey,
        httpService: httpService,
      ),
    );

    await api.initialize();
  }

  group('Can sign in:', () {
    test('with email and password', () async {
      await runWithLogging(() async {
        await initialiseForTest('email_and_password');

        late ApiResponse response;

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
        expect(client?.activeSession?.publicUserData.identifier?.isNotEmpty);
      });
    });

    test('with email code', () async {
      await runWithLogging(() async {
        await initialiseForTest('email_code');

        late ApiResponse response;

        response = await api.createSignIn(identifier: env.email);
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
        expect(response.client!.sessions.isNotEmpty);

        final client = response.client;
        expect(client?.signIn, null);
        expect(client?.activeSession?.status, Status.active);
        expect(client?.activeSession?.publicUserData.identifier?.isNotEmpty);
      });
    });

    test('with email link', () async {
      await runWithLogging(() async {
        await initialiseForTest('email_link');

        late ApiResponse response;
        late SignIn signIn;

        const redirectUrl = 'https://redirect.to.somewhere';

        response = await api.createSignIn(identifier: env.email);
        expect(response.client?.signIn?.status, Status.needsFirstFactor);

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
        await initialiseForTest('phone_code');

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
        expect(response.client!.sessions.isNotEmpty);

        final client = response.client;
        expect(client?.signIn, null);
        expect(client?.activeSession?.status, Status.active);
        expect(
            client?.activeSession?.publicUserData.identifier?.isNotEmpty, true);
      });
    });
  });
}
