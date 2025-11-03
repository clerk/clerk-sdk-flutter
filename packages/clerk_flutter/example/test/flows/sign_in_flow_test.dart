import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/logging.dart';
import 'package:clerk_flutter_example/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:integration_test/integration_test.dart';

import '../test_helpers.dart';

Future<void> _signOut(WidgetTester tester) async {
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
}

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
      phoneNumberWhiteList: [env.phoneNumber],
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

      final emailInput = find.byKey(kIdentifierInputField);
      await tester.tap(emailInput);
      tester.testTextInput.enterText(env.email);

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text(env.email), findsOneWidget);

      await tester.tap(find.byKey(kPasswordInputField));
      tester.testTextInput.enterText(env.password);

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text(env.email), findsOneWidget);

      await _signOut(tester);
    });

    testWidgets('with username and password', (tester) async {
      // Load app widget.
      final config = await initialiseForTest('with_username_and_password');
      await tester.pumpWidget(ExampleApp(config: config));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Clerk UI Sign In'));
      await tester.pumpAndSettle();

      final usernameInput = find.byKey(kIdentifierInputField);
      await tester.tap(usernameInput);
      tester.testTextInput.enterText(env.username);

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text(env.username), findsOneWidget);

      await tester.tap(find.byKey(kPasswordInputField));
      tester.testTextInput.enterText(env.password);

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text(env.email), findsOneWidget);

      await _signOut(tester);
    });

    testWidgets('with phone number and password', (tester) async {
      // Load app widget.
      final config = await initialiseForTest('with_phone_number_and_password');
      await tester.pumpWidget(ExampleApp(config: config));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Clerk UI Sign In'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Switch to phone'));
      await tester.pumpAndSettle();

      final phoneInput = find.byKey(kPhoneInputField);
      expect(phoneInput, findsOneWidget);

      // try changing zones away from the default +1/US to +44/UK...
      await tester.tap(find.text('+ 1'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('United Kingdom'));
      await tester.pumpAndSettle();

      // ...and back
      await tester.tap(find.text('+ 44'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('United States'));
      await tester.pumpAndSettle();

      await tester.tap(phoneInput);
      final local = env.phoneNumber.replaceFirst('+1', '');
      tester.testTextInput.enterText(local);

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(kPasswordInputField));
      tester.testTextInput.enterText(env.password);

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text(env.email), findsOneWidget);

      await _signOut(tester);
    });
  });
}
