import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/widgets/ui/social_connection_button.dart';
import 'package:clerk_flutter_example/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

// Finds the Google social icon and taps on it
Future<void> launchAndTapGoogleSignIn(
  PatrolIntegrationTester $, {
  bool useWebView = false,
}) async {
  app.main(useWebView: useWebView);
  await $.pumpAndSettle();

  await $('Clerk UI Sign In').tap();
  await $.pumpAndSettle();

  await $.tester.tap(googleSocialButtonSelector);
  await $.pumpAndSettle();
}

Finder get googleSocialButtonSelector {
  return find.byWidgetPredicate(
    (widget) =>
        widget is SocialConnectionButton &&
        widget.connection.strategy == clerk.Strategy.oauthGoogle,
  );
}

Future<void> signOut(PatrolIntegrationTester $) async {
  await $('Sign out').waitUntilVisible(timeout: const Duration(seconds: 10));
  await $('Sign out').tap();

  // TODO: Confirm sign out
}
