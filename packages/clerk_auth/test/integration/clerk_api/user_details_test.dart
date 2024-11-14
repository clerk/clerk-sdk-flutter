import 'package:clerk_auth/src/clerk_api/api.dart';
import 'package:clerk_auth/src/utils/logging.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

import '../../test_helpers.dart';

// Note that these are integration tests with a live backend. The configuration of the backend
// will affect the outcome of the tests. It is assumed that the account has been configured to
// allow users to change their first and last names

void main() {
  late final Api api;
  late final TestEnv env;

  setUpAll(() async {
    env = TestEnv('.env.test');
    api = Api(publicKey: env.publicKey, publishableKey: env.publishableKey);
    await setUpLogging(printer: TestLogPrinter());
  });

  Future<void> signIn(int id) async {
    await api.signOut();

    final response = await api.createSignIn(identifier: 'test$id+clerk_test@devangels.london');
    await api.attemptSignIn(
      response.client!.signIn!,
      stage: Stage.first,
      strategy: Strategy.password,
      password: 'password',
    );
  }

  tearDown(() async {
    await api.signOut();
  });

  group('Can update user:', () {
    test('with new name', () async {
      await runWithLogging(() async {
        await signIn(1);

        late ApiResponse response;
        late User? user;

        response = await api.getUser();
        expect(response.client?.activeSession?.user is User, true);

        user = response.client!.activeSession!.user;
        response = await api.updateUser(user.copyWith(firstName: 'New', lastName: 'Cognomen'));
        expect(response.isOkay, true);

        response = await api.getUser();
        user = response.client?.activeSession?.user;
        expect(user?.name, 'New Cognomen');

        user = response.client!.activeSession!.user;
        response = await api.updateUser(user.copyWith(firstName: 'Test', lastName: 'User'));
        expect(response.isOkay, true);

        response = await api.getUser();
        user = response.client?.activeSession?.user;
        expect(user?.name, 'Test User');
      });
    });

    test('with additional email', () async {
      await runWithLogging(() async {
        await signIn(2);

        late ApiResponse response;
        late User? user;

        response = await api.getUser();
        user = response.client?.activeSession?.user;
        expect(user is User, true);

        final emailAddress = 'user-${const Uuid().v4()}+clerk_test@some.domain';

        response = await api.addEmailAddressToCurrentUser(emailAddress);
        expect(response.isOkay, true);

        response = await api.getUser();
        user = response.client?.activeSession?.user;
        final email = user?.emailAddresses?.where((e) => e.emailAddress == emailAddress).first;
        expect(email is Email, true);

        response = await api.deleteEmailAddress(email!.id);
        expect(response.isOkay, true);
      });
    });

    test('with additional phone number', () async {
      await runWithLogging(() async {
        await signIn(3);

        late ApiResponse response;
        late User? user;

        response = await api.getUser();
        user = response.client?.activeSession?.user;
        expect(user is User, true);

        const phoneNumber = '+447700777777';

        response = await api.addPhoneNumberToCurrentUser(phoneNumber);
        expect(response.isOkay, true);

        response = await api.getUser();
        user = response.client?.activeSession?.user;
        final number = user?.phoneNumbers?.where((p) => p.phoneNumber == phoneNumber).first;
        expect(number is PhoneNumber, true);

        response = await api.deletePhoneNumber(number!.id);
        expect(response.isOkay, true);
      });
    });
  });
}
