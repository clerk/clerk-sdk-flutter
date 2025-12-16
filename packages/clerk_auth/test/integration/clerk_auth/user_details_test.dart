import 'package:clerk_auth/src/clerk_auth/auth.dart';
import 'package:clerk_auth/src/models/client/email.dart';
import 'package:clerk_auth/src/models/client/phone_number.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/client/user.dart';
import 'package:clerk_auth/src/models/enums.dart';
import 'package:clerk_auth/src/utils/logging.dart';

import '../../test_helpers.dart';

void main() {
  late Auth auth;
  late TestEnv env;
  late TestHttpService httpService;

  setUpAll(() async {
    await setUpLogging(printer: TestLogPrinter(), level: Level.SEVERE);
  });

  Future<void> initialiseForTest(String testName) async {
    env = TestEnv.withOpenIdentifiers('.env.test', testName);
    httpService = TestHttpService('clerk_auth/user_details_test', env)
      ..recordPath = testName;

    auth = Auth(
      config: TestAuthConfig(
        publishableKey: env.publishableKey,
        httpService: httpService,
      ),
    );
    await auth.initialize();

    // Sign up to have an active session
    await auth.attemptSignUp(
      strategy: Strategy.password,
      emailAddress: env.email,
      firstName: env.firstName,
      lastName: env.lastName,
      phoneNumber: env.phoneNumber,
      legalAccepted: true,
      password: env.password,
      passwordConfirmation: env.password,
    );
    await auth.attemptSignUp(
      strategy: Strategy.emailCode,
      code: env.code,
    );
    await auth.attemptSignUp(
      strategy: Strategy.phoneCode,
      code: env.code,
    );
  }

  group('Auth.updateUser:', () {
    test('can set primary email address', () async {
      await runWithLogging(() async {
        await initialiseForTest('set_primary_email');

        expect(auth.user is User);
        final originalPrimaryEmailId = auth.user!.primaryEmailAddressId;

        const newEmail = 'secondary+clerk_test@somedomain.com';
        await auth.addIdentifyingData(newEmail, IdentifierType.emailAddress);
        await auth.verifyIdentifyingData(
          auth.user!.identifierFrom(newEmail)!,
          env.code,
        );

        // Get the new email's ID
        final newEmailId = auth.user!.emailAddresses
            ?.firstWhere((e) => e.emailAddress == newEmail)
            .id;
        expect(newEmailId != null);
        expect(newEmailId != originalPrimaryEmailId);

        // Set the new email as primary
        await auth.updateUser(primaryEmailAddressId: newEmailId!);

        // Verify primary changed
        expect(auth.user!.primaryEmailAddressId, newEmailId);
        expect(auth.user!.primaryEmailAddressId != originalPrimaryEmailId);

        await auth.deleteUser();

        expect(httpService.isCompleted);
      });
    });

    test('can set primary phone number', () async {
      await runWithLogging(() async {
        await initialiseForTest('set_primary_phone');

        expect(auth.user is User);

        const newNumber = '+15555550109';
        await auth.addIdentifyingData(newNumber, IdentifierType.phoneNumber);
        await auth.verifyIdentifyingData(
          auth.user!.identifierFrom(newNumber)!,
          env.code,
        );

        // Get the phone's ID
        final phone = auth.user!.phoneNumbers
            ?.firstWhere((p) => p.phoneNumber == newNumber);
        expect(phone != null);

        // Set the phone as primary
        await auth.updateUser(primaryPhoneNumberId: phone!.id);

        // Verify primary was set
        expect(auth.user!.primaryPhoneNumberId, phone.id);

        await auth.deleteUser();

        expect(httpService.isCompleted);
      });
    });
  });

  group('Auth.deleteIdentifyingData:', () {
    test('removes email address from user', () async {
      await runWithLogging(() async {
        await initialiseForTest('delete_email');

        const emailAddress = 'deleteme+clerk_test@somedomain.com';

        // First add an email address
        await auth.addIdentifyingData(
          emailAddress,
          IdentifierType.emailAddress,
        );
        await auth.verifyIdentifyingData(
          auth.user!.identifierFrom(emailAddress)!,
          env.code,
        );

        // Verify email was added
        expect(auth.user is User);
        final addedEmail = auth.user?.emailAddresses
            ?.where((e) => e.emailAddress == emailAddress)
            .firstOrNull;
        expect(addedEmail is Email);

        // Delete the email address
        await auth.deleteIdentifyingData(addedEmail!);

        // Verify email was removed from user
        final deletedEmail = auth.user?.emailAddresses
            ?.where((e) => e.emailAddress == emailAddress)
            .firstOrNull;
        expect(deletedEmail, null);

        await auth.deleteUser();

        expect(httpService.isCompleted);
      });
    });

    test('removes phone number from user', () async {
      await runWithLogging(() async {
        await initialiseForTest('delete_phone');

        const phoneNumber = '+15555550109';

        // First add a phone number
        await auth.addIdentifyingData(phoneNumber, IdentifierType.phoneNumber);
        await auth.verifyIdentifyingData(
          auth.user!.identifierFrom(phoneNumber)!,
          env.code,
        );

        // Verify phone was added
        expect(auth.user is User);
        final addedPhone = auth.user?.phoneNumbers
            ?.where((p) => p.phoneNumber == phoneNumber)
            .firstOrNull;
        expect(addedPhone is PhoneNumber);

        // Delete the phone number
        await auth.deleteIdentifyingData(addedPhone!);

        // Verify phone was removed from user
        final deletedPhone = auth.user?.phoneNumbers
            ?.where((p) => p.phoneNumber == phoneNumber)
            .firstOrNull;
        expect(deletedPhone, null);

        await auth.deleteUser();

        expect(httpService.isCompleted);
      });
    });
  });
}
