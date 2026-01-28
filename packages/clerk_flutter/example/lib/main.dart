import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:app_links/app_links.dart';
import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter_example/pages/clerk_sign_in_example.dart';
import 'package:clerk_flutter_example/pages/custom_email_sign_in_example.dart';
import 'package:clerk_flutter_example/pages/custom_sign_in_example.dart';
import 'package:clerk_flutter_example/pages/examples_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await clerk.setUpLogging(printer: const LogPrinter());

  const publishableKey = String.fromEnvironment('publishable_key');
  if (publishableKey.isEmpty) {
    if (kDebugMode) {
      print(
        'Please run the example with: '
        '--dart-define-from-file=example.json',
      );
    }
    exit(1);
  }

  runApp(
    const ExampleApp(
      publishableKey: publishableKey,
    ),
  );
}

/// Example App
class ExampleApp extends StatelessWidget {
  /// Constructs an instance of Example App
  const ExampleApp({super.key, required this.publishableKey});

  /// Publishable Key
  final String publishableKey;

  static const _redirectionScheme = 'clerk';
  static const _redirectionHost = 'example.com';
  static const _oauthRedirectionPath = '/oauth';
  static const _emailLinkRedirectionPath = '/email_link';
  static const _redirectionPaths = [
    _oauthRedirectionPath,
    _emailLinkRedirectionPath
  ];

  /// This function checks a [Uri] to see if it's a deep link that the
  /// Clerk SDK should handle. If so, the [Uri] is returned to be consumed
  /// by the SDK's `deepLinkStream`. If not, the [Uri] is handled another
  /// way, and null returned to tell the Clerk SDK to ignore it.
  Future<Uri?> handleDeepLink(Uri uri) async {
    // Check the [Uri]] to see if it should be handled by the Clerk SDK...
    if (uri.scheme == _redirectionScheme &&
        uri.host == _redirectionHost &&
        _redirectionPaths.contains(uri.path)) {
      // ...and if so return it, telling the SDK to handle it.
      return uri;
    }

    // If the host app deems the deep link to be not relevant to the Clerk SDK,
    // we can choose here to process it separately. Alternatively, we can just
    // ignore it for now, and let the app handle it in a different manner.
    await handleDeepLinkInAnotherWay(uri);

    // We then return [null] to inhibit further processing by the SDK.
    return null;
  }

  /// This function handles a deep link that is not relevant to the Clerk SDK
  Future<void> handleDeepLinkInAnotherWay(Uri uri) async {
    // do something with the deep link that is outside the remit
    // of the Clerk SDK
  }

  /// A function that returns an appropriate deep link [Uri] for the oauth
  /// redirect for a given [clerk.Strategy], or [null] if redirection should
  /// be handled in-app
  Uri? generateDeepLink(BuildContext context, clerk.Strategy strategy) {
    if (strategy.isOauth) {
      return Uri(
        scheme: _redirectionScheme,
        host: _redirectionHost,
        path: _oauthRedirectionPath,
      );
    }

    if (strategy.isEmailLink) {
      return Uri(
        scheme: _redirectionScheme,
        host: _redirectionHost,
        path: _emailLinkRedirectionPath,
      );
    }

    // if you want to use the default in-app SSO, just remove the
    // [redirectionGenerator] parameter from the [ClerkAuthConfig] object
    // below, or...

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ClerkAuth(
      config: ClerkAuthConfig(
        publishableKey: publishableKey,
        redirectionGenerator: generateDeepLink,
        deepLinkStream: AppLinks().allUriLinkStream.asyncMap(handleDeepLink),
      ),
      child: MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        initialRoute: ExamplesList.path,
        routes: {
          ExamplesList.path: (context) => const ExamplesList(),
          ClerkSignInExample.path: (context) => const ClerkSignInExample(),
          CustomOAuthSignInExample.path: (context) =>
              const CustomOAuthSignInExample(),
          CustomEmailSignInExample.path: (context) =>
              const CustomEmailSignInExample(),
        },
      ),
    );
  }
}

/// Log Printer
class LogPrinter extends clerk.Printer {
  /// Constructs an instance of [LogPrinter]
  const LogPrinter();

  @override
  void print(String output) {
    Zone.root.print(output);
  }
}
