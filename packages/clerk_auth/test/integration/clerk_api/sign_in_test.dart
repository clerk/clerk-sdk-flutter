import 'package:clerk_auth/clerk_api/clerk_api.dart';
import 'package:common/common.dart';
import 'package:dart_dotenv/dart_dotenv.dart';
import 'package:test/test.dart';

import '../../test_helpers.dart';

void main() {
  late final Api api;

  final env = TestEnv();

  setUpAll(() async {
    final dotEnv = DotEnv(filePath: '.env.test');
    final values = dotEnv.getDotEnv();
    env.addAll(values);

    api = Api(publicKey: env.publicKey, publishableKey: env.publishableKey);

    await setUpLogging(printer: TestLogPrinter());
  });

  group('Can sign in:', () {
    test('with email and password', () async {
      late ApiResponse response;

      response = await api.createSignIn(identifier: env.email);
      expect(response.client?.signIn?.status, Status.needsFirstFactor);

      final signIn = response.client!.signIn!;
      response = await api.attemptSignInVerification(
        signIn,
        stage: FactorStage.first,
        strategy: Strategy.password,
        password: env.password,
      );

      final client = response.client;
      expect(client?.signIn, null);
      expect(client?.activeSession?.status, Status.active);
      expect(client?.activeSession?.publicUserData.identifier.isNotEmpty, true);

      await api.signOut();
    });

    test('with email code', () async {
      late ApiResponse response;
      late SignIn signIn;

      response = await api.createSignIn(identifier: env.email);
      expect(response.client?.signIn?.status, Status.needsFirstFactor);

      signIn = response.client!.signIn!;
      response = await api.prepareSignInVerification(
        signIn,
        stage: FactorStage.first,
        strategy: Strategy.emailCode,
      );
      expect(response.client?.signIn?.status, Status.needsFirstFactor);

      signIn = response.client!.signIn!;
      response = await api.attemptSignInVerification(
        signIn,
        stage: FactorStage.first,
        strategy: Strategy.emailCode,
        code: env.code,
      );
      expect(response.client!.sessions.length > 0, true);

      final client = response.client;
      expect(client?.signIn, null);
      expect(client?.activeSession?.status, Status.active);
      expect(client?.activeSession?.publicUserData.identifier.isNotEmpty, true);

      await api.signOut();
    });

    test('with email link', () async {
      late ApiResponse response;
      late SignIn signIn;

      response = await api.createSignIn(identifier: env.email);
      expect(response.client?.signIn?.status, Status.needsFirstFactor);

      final redirectUrl = 'https://redirect.to.somewhere';

      signIn = response.client!.signIn!;
      response = await api.prepareSignInVerification(
        signIn,
        stage: FactorStage.first,
        strategy: Strategy.emailLink,
        redirectUrl: redirectUrl,
      );
      expect(response.client?.signIn?.status, Status.needsFirstFactor);

      // no way to test onward journey easily
    });

    test('with phone code', () async {
      late ApiResponse response;
      late SignIn signIn;

      response = await api.createSignIn(identifier: env.phoneNumber);
      expect(response.client?.signIn?.status, Status.needsFirstFactor);

      signIn = response.client!.signIn!;
      response = await api.prepareSignInVerification(
        signIn,
        stage: FactorStage.first,
        strategy: Strategy.phoneCode,
      );
      expect(response.client?.signIn?.status, Status.needsFirstFactor);

      signIn = response.client!.signIn!;
      response = await api.attemptSignInVerification(
        signIn,
        stage: FactorStage.first,
        strategy: Strategy.phoneCode,
        code: env.code,
      );
      expect(response.client!.sessions.length > 0, true);

      final client = response.client;
      expect(client?.signIn, null);
      expect(client?.activeSession?.status, Status.active);
      expect(client?.activeSession?.publicUserData.identifier.isNotEmpty, true);

      await api.signOut();
    });
  });
}
