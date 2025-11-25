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

    test('with primary email address', () async {
      await runWithLogging(() async {
        await initialiseForTest('set_primary_email');

        late ApiResponse response;
        late User? user;

        response = await api.getUser();
        user = response.client?.activeSession?.user;
        expect(user is User);

        final originalPrimaryEmailId = user!.primaryEmailAddressId;
        expect(originalPrimaryEmailId, isNotNull);

        // Find a different email to set as primary
        final otherEmail = user.emailAddresses?.firstWhere(
          (e) => e.id != originalPrimaryEmailId,
        );
        expect(otherEmail, isNotNull);

        final newEmailId = otherEmail!.id;
        expect(newEmailId != originalPrimaryEmailId, isTrue);

        // Set the other email as primary
        response = await api.updateUser(primaryEmailAddressId: newEmailId);
        expect(response.isOkay);

        // Verify it changed
        user = response.client?.activeSession?.user;
        expect(user?.primaryEmailAddressId, newEmailId);

        // Restore original primary email
        response =
            await api.updateUser(primaryEmailAddressId: originalPrimaryEmailId);
        expect(response.isOkay);
        expect(response.client?.activeSession?.user?.primaryEmailAddressId,
            originalPrimaryEmailId);

        expect(httpService.isCompleted);
      });
    });

    test('with primary phone number', () async {
      await runWithLogging(() async {
        await initialiseForTest('set_primary_phone');

        late ApiResponse response;
        late User? user;

        response = await api.getUser();
        user = response.client?.activeSession?.user;
        expect(user is User);

        final originalPrimaryPhoneId = user!.primaryPhoneNumberId;
        expect(originalPrimaryPhoneId, isNotNull);

        // Find a different phone to set as primary
        final otherPhone = user.phoneNumbers?.firstWhere(
          (p) => p.id != originalPrimaryPhoneId,
        );
        expect(otherPhone, isNotNull);

        final newPhoneId = otherPhone!.id;
        expect(newPhoneId != originalPrimaryPhoneId, isTrue);

        // Set the other phone as primary
        response = await api.updateUser(primaryPhoneNumberId: newPhoneId);
        expect(response.isOkay);

        // Verify it changed
        user = response.client?.activeSession?.user;
        expect(user?.primaryPhoneNumberId, newPhoneId);

        // Restore original primary phone
        response =
            await api.updateUser(primaryPhoneNumberId: originalPrimaryPhoneId);
        expect(response.isOkay);
        expect(response.client?.activeSession?.user?.primaryPhoneNumberId,
            originalPrimaryPhoneId);

        expect(httpService.isCompleted);
      });
    });

    test(
      'with primary web3 wallet',
      skip: 'Requires web3 wallet configured in test Clerk instance',
      () async {
        await runWithLogging(() async {
          await initialiseForTest('set_primary_web3_wallet');

          late ApiResponse response;
          late User? user;

          response = await api.getUser();
          user = response.client?.activeSession?.user;
          expect(user is User);

          final originalPrimaryWeb3WalletId = user!.primaryWeb3WalletId;
          expect(originalPrimaryWeb3WalletId, isNotNull);

          // Find a different web3 wallet to set as primary
          final otherWallet = user.web3Wallets?.firstWhere(
            (w) => w.id != originalPrimaryWeb3WalletId,
          );
          expect(otherWallet, isNotNull);

          final newWalletId = otherWallet!.id;
          expect(newWalletId != originalPrimaryWeb3WalletId, isTrue);

          // Set the other wallet as primary
          response = await api.updateUser(primaryWeb3WalletId: newWalletId);
          expect(response.isOkay);

          // Verify it changed
          user = response.client?.activeSession?.user;
          expect(user?.primaryWeb3WalletId, newWalletId);

          // Restore original primary wallet
          response = await api.updateUser(
              primaryWeb3WalletId: originalPrimaryWeb3WalletId);
          expect(response.isOkay);
          expect(
              response.client?.activeSession?.user?.primaryWeb3WalletId,
              originalPrimaryWeb3WalletId);

          expect(httpService.isCompleted);
        });
      },
    );
  });
}
