import 'package:clerk_auth/clerk_auth.dart';
import 'package:common/common.dart';
import 'package:dart_dotenv/dart_dotenv.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

import '../../test_helpers.dart';

void main() {
  late final ClerkAuth auth;

  final env = TestEnv();

  String emailAddress = '';
  String phoneNumber = '';
  String username = '';
  String password = '';

  setUp(() async {
    password = Uuid().v4();
    username = 'user-$password';
    emailAddress = '$username+clerk_test@some.domain';
    phoneNumber = '+15555550109';
  });

  setUpAll(() async {
    final dotEnv = DotEnv(filePath: '.env.test');
    final values = dotEnv.getDotEnv();
    env.addAll(values);

    auth = ClerkAuth(publicKey: env.publicKey, publishableKey: env.publishableKey);

    await setUpLogging(printer: TestLogPrinter());
  });

  tearDown(() => auth.deleteUser());

  group('SignUp', () {
    test('can sign up with emailLink in separate steps', () async {
      await runWithLogging(() async {
        expect(await auth.user, null);

        Client client = await auth.attemptSignUp(emailAddress: emailAddress);
        expect(client.signUp?.status, Status.missingRequirements);

        client = await auth.attemptSignUp(
          strategy: Strategy.emailLink,
          username: username,
        );
        expect(client.signUp?.status, Status.missingRequirements);
        expect(client.signUp?.unverifiedFields.contains(Field.emailAddress), true);

        client = await auth.attemptSignUp(
          strategy: Strategy.emailLink,
          code: env.code,
        );
        expect(client.signUp, null);
        expect(client.user is User, true);
      });
    });

    test('can sign up with emailCode in separate steps', () async {
      await runWithLogging(() async {
        expect(await auth.user, null);

        Client client = await auth.attemptSignUp(emailAddress: emailAddress);
        expect(client.signUp?.status, Status.missingRequirements);

        client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          username: username,
          password: password,
          passwordConfirmation: "$password", // technically a 'different' string
        );
        expect(client.signUp?.status, Status.missingRequirements);
        expect(client.signUp?.unverifiedFields.contains(Field.emailAddress), true);

        client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          code: env.code,
        );
        expect(client.signUp, null);
        expect(client.user is User, true);
      });
    });

    test('can sign up with phoneCode in separate steps', () async {
      await runWithLogging(() async {
        expect(await auth.user, null);

        Client client = await auth.attemptSignUp(phoneNumber: phoneNumber);
        expect(client.signUp?.status, Status.missingRequirements);

        client = await auth.attemptSignUp(
          strategy: Strategy.phoneCode,
          username: username,
          password: password,
          passwordConfirmation: "$password", // technically a 'different' string
        );
        expect(client.signUp?.status, Status.missingRequirements);
        expect(client.signUp?.unverifiedFields.contains(Field.phoneNumber), true);

        client = await auth.attemptSignUp(
          strategy: Strategy.phoneCode,
          code: env.code,
        );
        expect(client.signUp, null);
        expect(client.user is User, true);
      });
    });
  });
}
