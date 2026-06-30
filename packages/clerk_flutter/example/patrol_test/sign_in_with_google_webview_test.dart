import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import 'sign_in_with_google_common.dart';

// Integration test: Sign In with Google (OAuth) via in-app WebView
//
// Tests the _SsoWebViewOverlay branch of ssoSignIn — the path taken when no
// redirectionGenerator is configured, so the OAuth consent page is shown
// inside a WebView dialog within the app rather than in an external browser.
//
//   1. Launches the example app in webview-SSO mode (use_webview_sso=true).
//   2. Navigates to the Clerk sign-in screen.
//   3. Taps the Google OAuth button, which opens _SsoWebViewOverlay.
//   4. Selects the test Google account and taps "Continue" inside the WebView.
//   5. The WebView catches the com.clerk.flutter://callback redirect, dismisses
//      the dialog, and ssoSignIn calls parseDeepLink to complete sign-in.
//   6. Confirms the signed-in UI (Profile, Sign out, Organizations) is visible.
//
// Run with:
//   patrol test \
//     --target patrol_test/sign_in_with_google_webview_test.dart \
//     --dart-define=publishable_key=<key> \
//     --dart-define=use_webview_sso=true \
//     --dart-define=GOOGLE_EMAIL=<email> \
//     --dart-define=GOOGLE_PASSWORD=<password> \
//     --no-clear-test-steps
//
// Note: the in-app WebView is a native WKWebView (iOS) / WebView (Android).
// Patrol drives its content via XCTest / UiAutomator2 the same way it drives
// external browsers, but without specifying an appId since the view is inside
// the current app.
void main() {
  const googleEmail = String.fromEnvironment('GOOGLE_EMAIL');
  const googlePassword = String.fromEnvironment('GOOGLE_PASSWORD');

  patrolTest(
    'Sign in with Google via in-app WebView',
    platformAutomatorConfig: PlatformAutomatorConfig.fromOptions(
      findTimeout: const Duration(seconds: 30),
    ),
    ($) async {
      assert(
        googleEmail.isNotEmpty,
        'Provide --dart-define=GOOGLE_EMAIL=<email>',
      );
      assert(
        googlePassword.isNotEmpty,
        'Provide --dart-define=GOOGLE_PASSWORD=<password>',
      );

      await launchAndTapGoogleSignIn($, useWebView: true);

      // _SsoWebViewOverlay is now open — the Google sign-in page is loading
      // inside the in-app WebView. No appId is needed because the WebView is
      // embedded in the current app, not an external browser process.
      //
      // Google may show an account picker (text matches googleEmail) or a
      // standard email/password form. We handle both paths here.
      final accountSelector = Selector(text: googleEmail);
      final emailFieldSelector = Selector(text: 'Email or phone');
      final signInGoogleAccounts = Selector(text: 'Sign in - Google Accounts');

      await Future.delayed(const Duration(milliseconds: 600));

      final visible = await Future.any([
        isBothVisible(
          $,
          selector1: emailFieldSelector,
          selector2: signInGoogleAccounts,
        ).then((found) => found
            ? FirstVisibleView.email
            : Completer<FirstVisibleView>().future),
        isVisible($, accountSelector).then((found) => found
            ? FirstVisibleView.account
            : Completer<FirstVisibleView>().future),
        Future.delayed(const Duration(seconds: 2))
            .then((_) => FirstVisibleView.timeout),
      ]);

      $.log('Visible => $visible');

      if (visible == FirstVisibleView.account) {
        await $.platform.tap(accountSelector);
        await Future.delayed(const Duration(milliseconds: 600));

        await $.platform.tap(Selector(text: 'Continue'));
      } else {
        await $.platform.tap(emailFieldSelector);
        await $.platform.mobile.enterText(
          emailFieldSelector,
          text: googleEmail,
        );

        await $.platform.tap(Selector(text: 'Next'));

        final passwordSelector = Selector(text: 'Enter your password');
        await $.platform.mobile.waitUntilVisible(passwordSelector);
        await $.platform.tap(passwordSelector);

        await $.platform.mobile.enterText(
          passwordSelector,
          text: googlePassword,
        );
        await $.platform.tap(Selector(text: 'Next'));

        await Future.delayed(const Duration(milliseconds: 1800));

        final allowButton = Selector(text: 'Allow');
        await $.platform.tap(allowButton);
      }

      // Google redirects to com.clerk.flutter://callback. The WebView's
      // NavigationDelegate intercepts it, pops the dialog with the URL, and
      // ssoSignIn calls parseDeepLink to complete the OAuth flow.
      await $('Profile').waitUntilVisible(timeout: const Duration(seconds: 30));

      expect($('Profile'), findsOneWidget);
      expect($('Sign out'), findsOneWidget);
      expect($('Organizations'), findsOneWidget);

      await signOut($);
    },
  );
}

Future<bool> isVisible(
  PatrolIntegrationTester $,
  Selector selector, {
  Duration timeout = const Duration(milliseconds: 1400),
}) async {
  try {
    await $.platform.mobile.tap(selector, timeout: timeout);
    return true;
  } catch (_) {
    return false;
  }
}

Future<bool> isBothVisible(
  PatrolIntegrationTester $, {
  required Selector selector1,
  required Selector selector2,
  Duration timeout = const Duration(milliseconds: 1400),
}) async {
  try {
    await Future.wait([
      $.platform.mobile.tap(selector1, timeout: timeout),
      $.platform.mobile.tap(selector2, timeout: timeout)
    ]);
    return true;
  } catch (_) {
    return false;
  }
}

enum FirstVisibleView { account, email, timeout }
