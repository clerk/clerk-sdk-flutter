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
    env = TestEnv('.env.test', overrides: {'use_open_identifiers': true});
    httpService = TestHttpService('clerk_auth/user_details_test', env)
      ..recordPath = testName;

    auth = Auth(
        config: TestAuthConfig(
      publishableKey: env.publishableKey,
      httpService: httpService,
    ));
    await auth.initialize();

    // Sign in to have an active session
    await auth.attemptSignIn(
      identifier: env.email,
      strategy: Strategy.password,
      password: env.password,
    );
  }

  group('deleteIdentifyingData', () {
    test('removes email address from user', () async {
      await runWithLogging(() async {
        await initialiseForTest('delete_email');

        const emailAddress = 'deleteme+clerk_test@somedomain.com';

        // First add an email address
        await auth.addIdentifyingData(
            emailAddress, IdentifierType.emailAddress);

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

        expect(httpService.isCompleted);
      });
    });

    test('removes phone number from user', () async {
      await runWithLogging(() async {
        await initialiseForTest('delete_phone');

        const phoneNumber = '+447950881234';

        // First add a phone number
        await auth.addIdentifyingData(phoneNumber, IdentifierType.phoneNumber);

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

        expect(httpService.isCompleted);
      });
    });
  });
}
