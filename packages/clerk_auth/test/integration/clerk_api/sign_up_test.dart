import 'package:clerk_auth/clerk_api/clerk_api.dart';
import 'package:common/common.dart';
import 'package:dart_dotenv/dart_dotenv.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

import '../../test_helpers.dart';

// Note that these are integration tests with a live backend. The configuration of the backend
// will affect the outcome of the tests. It is assumed that email and phone number are not required,
// but will need to be verified if present.

void main() {
  late final Api api;

  final env = TestEnv();

  String emailAddress = '';
  String phoneNumber = '';
  String username = '';
  String password = '';

  setUpAll(() async {
    final dotEnv = DotEnv(filePath: '.env.test');
    final values = dotEnv.getDotEnv();
    env.addAll(values);

    api = Api(publicKey: env.publicKey, publishableKey: env.publishableKey);

    password = Uuid().v4();
    username = 'user-$password';
    emailAddress = '$username+clerk_test@some.domain';
    phoneNumber = '+15555550101';

    await setUpLogging(printer: TestLogPrinter());
  });

  group('Can sign up:', () {
    test('with email verification', () async {
      late ApiResponse response;

      response = await api.createSignUp(
        emailAddress: emailAddress,
        username: username,
        password: password,
      );
      expect(response.client?.signUp?.status, Status.missingRequirements);

      response = await api.prepareSignUpVerification(
        response.client!.signUp!,
        strategy: Strategy.emailCode,
      );
      expect(response.client?.signUp?.status, Status.missingRequirements);

      response = await api.attemptSignUpVerification(
        response.client!.signUp!,
        strategy: Strategy.emailCode,
        code: env.code,
      );
      final client = response.client;
      expect(client?.signUp, null);
      expect(client?.activeSession?.status, Status.active);
      expect(client?.activeSession?.publicUserData.identifier.isNotEmpty, true);

      final hasDeletedUser = await api.deleteUser();
      expect(hasDeletedUser, true);
    });

    test('with phone verification', () async {
      late ApiResponse response;

      response = await api.createSignUp(
        phoneNumber: phoneNumber,
        username: username,
        password: password,
      );
      expect(response.client?.signUp?.status, Status.missingRequirements);

      response = await api.prepareSignUpVerification(
        response.client!.signUp!,
        strategy: Strategy.phoneCode,
      );
      expect(response.client?.signUp?.status, Status.missingRequirements);

      response = await api.attemptSignUpVerification(
        response.client!.signUp!,
        strategy: Strategy.phoneCode,
        code: env.code,
      );
      final client = response.client;
      expect(client?.signUp, null);
      expect(client?.activeSession?.status, Status.active);
      expect(client?.activeSession?.publicUserData.identifier.isNotEmpty, true);

      final hasDeletedUser = await api.deleteUser();
      expect(hasDeletedUser, true);
    });
  });
}
