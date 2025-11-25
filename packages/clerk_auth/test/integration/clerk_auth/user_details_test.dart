import 'package:clerk_auth/src/clerk_auth/auth.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/client/user.dart';
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
      ),
    );
    await auth.initialize();

    // Sign in to get a valid session
    await auth.attemptSignIn(
      identifier: env.email,
      strategy: Strategy.password,
      password: env.password,
    );
  }

  group('Auth.updateUser', () {
    test('can set primary email address', () async {
      await runWithLogging(() async {
        await initialiseForTest('set_primary_email');

        expect(auth.user is User);
        final originalPrimaryEmailId = auth.user!.primaryEmailAddressId;

        const newEmail = 'secondary+clerk_test@somedomain.com';

        // Get the new email's ID
        final newEmailId = auth.user!.emailAddresses
            ?.firstWhere(
              (e) => e.emailAddress == newEmail,
            )
            .id;
        expect(newEmailId != null);
        expect(newEmailId != originalPrimaryEmailId);

        // Set the new email as primary
        await auth.updateUser(primaryEmailAddressId: newEmailId!);

        // Verify primary changed
        expect(auth.user!.primaryEmailAddressId, newEmailId);
        expect(auth.user!.primaryEmailAddressId != originalPrimaryEmailId);

        // Cleanup: restore original primary and delete test email
        await auth.updateUser(primaryEmailAddressId: originalPrimaryEmailId);

        expect(httpService.isCompleted);
      });
    });

    test('can set primary phone number', () async {
      await runWithLogging(() async {
        await initialiseForTest('set_primary_phone');

        expect(auth.user is User);

        const newNumber = '+447950999999';

        // Get the phone's ID
        final phone = auth.user!.phoneNumbers?.firstWhere(
          (p) => p.phoneNumber == newNumber,
        );
        expect(phone != null);

        // Set the phone as primary
        await auth.updateUser(primaryPhoneNumberId: phone!.id);

        // Verify primary was set
        expect(auth.user!.primaryPhoneNumberId, phone.id);

        expect(httpService.isCompleted);
      });
    });
  });
}
