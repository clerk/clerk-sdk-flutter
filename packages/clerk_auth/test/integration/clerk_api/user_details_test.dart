import 'package:clerk_auth/src/clerk_api/api.dart';
import 'package:clerk_auth/src/models/api/api_response.dart';
import 'package:clerk_auth/src/models/client/email.dart';
import 'package:clerk_auth/src/models/client/phone_number.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/client/user.dart';
import 'package:clerk_auth/src/models/enums.dart';
import 'package:clerk_auth/src/utils/logging.dart';

import '../../test_helpers.dart';

// Note that these are integration tests with a live backend. The configuration of the backend
// will affect the outcome of the tests. It is assumed that the account has been configured to
// allow users to change their first and last names

void main() {
  late Api api;
  late TestEnv env;
  late TestHttpService httpService;

  setUpAll(() async {
    await setUpLogging(printer: TestLogPrinter(), level: Level.SEVERE);
  });

  Future<void> initialiseForTest(String testName) async {
    env = TestEnv('.env.test', overrides: {'use_open_identifiers': true});
    httpService = TestHttpService('clerk_api/user_details', env)
      ..recordPath = testName;
    api = Api(
      config: TestAuthConfig(
        publishableKey: env.publishableKey,
        httpService: httpService,
      ),
    );
    await api.initialize();

    final response = await api.createSignIn(identifier: env.email);

    await api.attemptSignIn(
      response.client!.signIn!,
      stage: Stage.first,
      strategy: Strategy.password,
      password: env.password,
    );
  }

  group('Can update user:', () {
    test('with new name', () async {
      await runWithLogging(() async {
        await initialiseForTest('new_name');

        late ApiResponse response;
        late User? user;

        response = await api.getUser();
        expect(response.client?.activeSession?.user is User);
        final originalUser = response.client!.activeSession!.user;

        response = await api.updateUser(firstName: 'New', lastName: 'Cognomen');
        expect(response.isOkay);

        response = await api.getUser();
        user = response.client?.activeSession?.user;
        expect(user?.name, 'New Cognomen');

        response = await api.updateUser(
          firstName: originalUser.firstName,
          lastName: originalUser.lastName,
        );
        expect(response.isOkay);
      });
    });

    test('with additional email', () async {
      await runWithLogging(() async {
        await initialiseForTest('additional_email');

        late ApiResponse response;
        late User? user;

        const emailAddress = 'newemail+clerk_test@somedomain.com';

        response = await api.getUser();
        user = response.client?.activeSession?.user;
        expect(user is User);

        response = await api.addIdentifyingDataToCurrentUser(
          emailAddress,
          IdentifierType.emailAddress,
        );
        expect(response.isOkay);

        response = await api.getUser();
        user = response.client?.activeSession?.user;
        final email = user?.emailAddresses
            ?.where((e) => e.emailAddress == emailAddress)
            .first;
        expect(email is Email);

        response = await api.deleteIdentifyingData(email!);
        expect(response.isOkay);
      });
    });

    test('with additional phone number', () async {
      await runWithLogging(() async {
        await initialiseForTest('additional_phone_number');

        late ApiResponse response;
        late User? user;

        const newNumber = '+447950777777';

        response = await api.getUser();
        user = response.client?.activeSession?.user;
        expect(user is User);

        response = await api.addIdentifyingDataToCurrentUser(
          newNumber,
          IdentifierType.phoneNumber,
        );
        expect(response.isOkay);

        response = await api.getUser();
        user = response.client?.activeSession?.user;
        final number =
            user?.phoneNumbers?.where((p) => p.phoneNumber == newNumber).first;
        expect(number is PhoneNumber);

        response = await api.deleteIdentifyingData(number!);
        expect(response.isOkay);
      });
    });
  });
}
