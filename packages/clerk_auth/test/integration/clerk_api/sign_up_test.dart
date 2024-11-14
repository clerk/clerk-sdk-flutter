import 'package:clerk_auth/src/clerk_api/api.dart';
import 'package:clerk_auth/src/utils/logging.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

import '../../test_helpers.dart';

// Note that these are integration tests with a live backend. The configuration of the backend
// will affect the outcome of the tests. It is assumed that email and phone number are not required,
// but will need to be verified if present.

void main() {
  late final Api api;
  late final TestEnv env;

  String emailAddress = '';
  String phoneNumber = '';
  String username = '';
  String password = '';

  setUp(() async {
    password = const Uuid().v4();
    username = 'user-$password';
    emailAddress = '$username+clerk_test@some.domain';
    phoneNumber = '+15555550109';
  });

  setUpAll(() async {
    env = TestEnv('.env.test');
    api = Api(publicKey: env.publicKey, publishableKey: env.publishableKey);
    await setUpLogging(printer: TestLogPrinter());
  });

  tearDown(() async => await api.deleteUser());

  group('Can sign up:', () {
    test('with email verification', () async {
      await runWithLogging(() async {
        late ApiResponse response;

        response = await api.createSignUp(
          emailAddress: emailAddress,
          username: username,
          password: password,
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
        expect(client?.activeSession?.publicUserData.identifier.isNotEmpty, true);
      });
    });

    test('with phone verification', () async {
      await runWithLogging(() async {
        late ApiResponse response;

        response = await api.createSignUp(
          phoneNumber: phoneNumber,
          username: username,
          password: password,
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
        expect(client?.activeSession?.publicUserData.identifier.isNotEmpty, true);
      });
    });
  });
}
