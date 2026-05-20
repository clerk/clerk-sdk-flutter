import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/widgets/ui/social_connection_button.dart';
import 'package:clerk_flutter_example/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  const googleEmail = String.fromEnvironment('GOOGLE_EMAIL');

  // patrol test --target patrol_test/sign_in_with_google_test.dart --dart-define=publishable_key=<key> --dart-define=GOOGLE_EMAIL=<email> --no-clear-test-steps
  patrolTest(
    'Sign in with Google',
    platformAutomatorConfig: PlatformAutomatorConfig.fromOptions(
      findTimeout: const Duration(seconds: 30),
    ),
    ($) async {
      assert(
          googleEmail.isNotEmpty, 'Provide --dart-define=GOOGLE_EMAIL=<email>');

      app.main();
      await $.pumpAndSettle();

      await $('Clerk UI Sign In').tap();
      await $.pumpAndSettle();

      // Tap the Google OAuth button identified by its connection strategy
      await $.tester.tap(
        find.byWidgetPredicate(
          (widget) =>
              widget is SocialConnectionButton &&
              widget.connection.strategy == clerk.Strategy.oauthGoogle,
        ),
      );
      await $.pumpAndSettle();

      $.log('${DateTime.now().toIso8601String()} :: Choose an account');
      // Chrome opens Google's "Choose an account" page — tap the test email
      await $.platform.tap(Selector(text: googleEmail));

      await Future.delayed(const Duration(milliseconds: 600));

      $.log('${DateTime.now().toIso8601String()} :: Tap continue');

      // Tap "Continue" on the Google consent screen
      await $.platform.tap(Selector(text: 'Continue'));

      $.log('${DateTime.now().toIso8601String()} :: Should return to app and be signed in');

      // App returns to foreground via deep link; pumpAndSettle settles immediately
      // because Flutter has no pending frames until the deep link is processed.
      // Use waitUntilVisible to poll until the signed-in UI actually appears.

      await $('Profile').waitUntilVisible(timeout: const Duration(seconds: 30));

      $.log('${DateTime.now().toIso8601String()} :: Waiting for signed-in UI to settle');

      expect($('Profile'), findsOneWidget);
      expect($('Sign out'), findsOneWidget);
      expect($('Organizations'), findsOneWidget);

      $.log('${DateTime.now().toIso8601String()} :: Check for buttons');
    },
  );
}
