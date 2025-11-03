import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/logging.dart';
import 'package:clerk_flutter_example/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:integration_test/integration_test.dart';

import '../test_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late final TestEnv env;

  setUpAll(() async {
    env = TestEnv('.env.test');
    await setUpLogging(printer: TestLogPrinter(), level: Level.INFO);
  });

  Future<ClerkAuthConfig> initialiseForTest(String testName) async {
    FlutterError.onError = setIgnoreOverflowErrors(FlutterError.onError);

    final httpService = TestHttpService('flow/sign_in_flow_test', env)
      ..recordPath = testName;

    return TestAuthConfig(
      publishableKey: env.publishableKey,
      httpService: httpService,
    ).toClerkAuthConfig();
  }

  group('sign in: ', () {
    testWidgets('with email and password', (tester) async {
      // Load app widget.
      final config = await initialiseForTest('with_email_and_password');
      await tester.pumpWidget(ExampleApp(config: config));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Clerk UI Sign In'));
      await tester.pumpAndSettle();

      final emailInput = find.byKey(kEmailInputField);
      await tester.tap(emailInput);
      tester.testTextInput.enterText(env.email);

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      final passwordInput = find.byKey(kPasswordInputField);
      await tester.tap(passwordInput);
      tester.testTextInput.enterText(env.password);

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text(env.email), findsOneWidget);

      final signOutButton = find.text('Sign out');
      expect(signOutButton, findsOneWidget);
      await tester.tap(signOutButton);
      await tester.pumpAndSettle();

      expect(find.text('Are you sure?'), findsOneWidget);
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(
        find.text('Welcome back! Please sign in to continue'),
        findsOneWidget,
      );
    });
  });
}
