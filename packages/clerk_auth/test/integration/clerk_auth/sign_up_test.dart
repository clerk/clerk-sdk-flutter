import 'package:clerk_auth/src/clerk_auth/auth.dart';
import 'package:clerk_auth/src/models/client/client.dart';
import 'package:clerk_auth/src/models/client/field.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/client/user.dart';
import 'package:clerk_auth/src/models/status.dart';
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
    httpService = TestHttpService('clerk_auth/sign_up_test', env)
      ..recordPath = testName;

    auth = Auth(
      config: TestAuthConfig(
        publishableKey: env.publishableKey,
        httpService: httpService,
      ),
    );
    await auth.initialize();
  }

  group('SignUp', () {
    test('can sign up with emailCode and phoneCode in separate steps',
        () async {
      await runWithLogging(() async {
        await initialiseForTest('sign_up_with_email_and_phone_code');

        Client client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: env.email,
          phoneNumber: env.phoneNumber,
          password: env.password,
          passwordConfirmation: env.password,
          firstName: env.username,
          lastName: env.username,
          legalAccepted: true,
        );
        expect(client.signUp?.status, Status.missingRequirements);
        expect(client.signUp?.unverifiedFields.contains(Field.emailAddress));

        client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          code: env.code,
        );
        expect(client.signUp?.status, Status.missingRequirements);
        expect(client.signUp?.unverifiedFields.contains(Field.phoneNumber));

        client = await auth.attemptSignUp(
          strategy: Strategy.phoneCode,
          code: env.code,
        );
        expect(client.signUp, null);
        expect(client.user is User);

        await auth.deleteUser();

        expect(httpService.isCompleted);
      });
    });

    test('can sign up with emailCode with typo in first email', () async {
      await runWithLogging(() async {
        await initialiseForTest('sign_up_with_email_code_and_typo');

        final typoEmailAddress =
            '${env.username}-TYPO+clerk_test@somedomain.com';

        Client client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: typoEmailAddress,
          phoneNumber: env.phoneNumber,
          password: env.password,
          passwordConfirmation: env.password,
          firstName: env.username,
          lastName: env.username,
          legalAccepted: true,
        );
        expect(client.signUp?.status, Status.missingRequirements);
        expect(client.signUp?.unverifiedFields.contains(Field.emailAddress));

        client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: env.email,
        );
        expect(client.signUp?.status, Status.missingRequirements);
        expect(client.signUp?.unverifiedFields.contains(Field.emailAddress));

        client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: env.email, // correct the address
          code: env.code,
        );
        expect(client.signUp?.status, Status.missingRequirements);
        expect(client.signUp?.unverifiedFields.contains(Field.phoneNumber));

        client = await auth.attemptSignUp(
          strategy: Strategy.phoneCode,
          code: env.code,
        );
        expect(client.signUp, null);
        expect(client.user is User);

        await auth.deleteUser();

        expect(httpService.isCompleted);
      });
    });

    test('does not update SignUp when values are unchanged', () async {
      await runWithLogging(() async {
        await initialiseForTest('does_not_update_unchanged_values');

        const email = 'newemail+clerk_test@somedomain.com';

        // 1) Create initial sign up with emailCode and an email address
        // Initial create
        Client client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: email,
        );
        expect(client.signUp?.status, Status.missingRequirements);
        final hitCount = httpService.hitCount;

        // 2) Call attemptSignUp again with the same email
        // No HTTP expectation should be queued for this invocation.
        client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: email, // unchanged
        );

        // State should remain in missing requirements; no extra PATCH occurred.
        expect(client.signUp?.status, Status.missingRequirements);

        // hit count should not have changed
        expect(httpService.hitCount, hitCount);
      });
    });

    test('updates SignUp when provided value changes', () async {
      await runWithLogging(() async {
        await initialiseForTest('does_update_changed_values');

        final firstEmail = '${env.username}+first@somedomain.com';
        final secondEmail = '${env.username}+second@somedomain.com';

        // 1) Create initial sign up with first email
        Client client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: firstEmail,
        );
        expect(client.signUp?.status, Status.missingRequirements);
        final hitCount = httpService.hitCount;

        // 2) Provide a different email -> should PATCH
        client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: secondEmail,
        );

        // Still in missing requirements, but email reflected the change via PATCH
        expect(client.signUp?.status, Status.missingRequirements);
        expect(client.signUp?.emailAddress, secondEmail);

        // The hit count should have gone up by one
        expect(httpService.hitCount, hitCount + 1);
      });
    });
  });
}
