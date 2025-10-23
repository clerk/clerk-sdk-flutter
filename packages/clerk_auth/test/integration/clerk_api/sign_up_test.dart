import 'package:clerk_auth/src/clerk_api/api.dart';
import 'package:clerk_auth/src/models/api/api_response.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/logging.dart';

import '../../test_helpers.dart';

void main() {
  late Api api;
  late TestEnv env;
  late TestHttpService httpService;

  setUpAll(() async {
    await setUpLogging(printer: TestLogPrinter(), level: Level.INFO);
  });

  Future<void> initialiseForTest(String testName) async {
    env = TestEnv.withOpenIdentifiers('.env.test', testName);
    httpService = TestHttpService('clerk_api/sign_up_test', env)
      ..recordPath = testName;

    api = Api(
      config: TestAuthConfig(
        publishableKey: env.publishableKey,
        httpService: httpService,
      ),
    );
    await api.initialize();
  }

  tearDown(() async {
    await api.deleteUser();
  });

  group('Can sign up:', () {
    test('with email code', () async {
      await runWithLogging(() async {
        await initialiseForTest('email_code');

        ApiResponse response = await api.createSignUp(
          strategy: Strategy.emailCode,
          emailAddress: env.email,
          phoneNumber: env.phoneNumber,
          username: env.username,
          password: env.password,
          firstName: env.username,
          lastName: env.username,
          legalAccepted: true,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.prepareSignUp(
          response.client!.signUp!,
          strategy: Strategy.emailCode,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.attemptSignUp(
          response.client!.signUp!,
          strategy: Strategy.emailCode,
          code: env.code,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.prepareSignUp(
          response.client!.signUp!,
          strategy: Strategy.phoneCode,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.attemptSignUp(
          response.client!.signUp!,
          strategy: Strategy.phoneCode,
          code: env.code,
        );
        final client = response.client;
        expect(client?.signUp, null);
        expect(client?.activeSession?.status, Status.active);
        expect(client?.activeSession?.publicUserData.identifier?.isNotEmpty);
      });
    });

    test('with phone code', () async {
      await runWithLogging(() async {
        await initialiseForTest('phone_code');

        ApiResponse response = await api.createSignUp(
          strategy: Strategy.phoneCode,
          emailAddress: env.email,
          phoneNumber: env.phoneNumber,
          username: env.username,
          password: env.password,
          firstName: env.username,
          lastName: env.username,
          legalAccepted: true,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.prepareSignUp(
          response.client!.signUp!,
          strategy: Strategy.phoneCode,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.attemptSignUp(
          response.client!.signUp!,
          strategy: Strategy.phoneCode,
          code: env.code,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.prepareSignUp(
          response.client!.signUp!,
          strategy: Strategy.emailCode,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.attemptSignUp(
          response.client!.signUp!,
          strategy: Strategy.emailCode,
          code: env.code,
        );
        final client = response.client;
        expect(client?.signUp, null);
        expect(client?.activeSession?.status, Status.active);
        expect(
            client?.activeSession?.publicUserData.identifier?.isNotEmpty, true);
      });
    });
  });
}
