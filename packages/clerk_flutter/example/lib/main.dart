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

  /// This function maps a [Uri] into a [ClerkDeepLink], which is essentially
  /// just a container for the [Uri]. The [ClerkDeepLink] can also
  /// contain a [clerk.Strategy], to use in preference to a strategy
  /// inferred from the [Uri]
  ClerkDeepLink? createClerkLink(Uri uri) {
    if (uri.pathSegments.first == 'auth') {
      return ClerkDeepLink(uri: uri);
    }

    // If the host app deems the deep link to be not relevant to the Clerk SDK,
    // we return [null] instead of a [ClerkDeepLink] to inhibit its processing.
    return null;
  }

  /// A function that returns an appropriate deep link [Uri] for the oauth
  /// redirect for a given [clerk.Strategy], or [null] if redirection should
  /// be handled in-app
  Uri? generateDeepLink(BuildContext context, clerk.Strategy strategy) {
    return Uri.parse('clerk://example.com/auth/$strategy');

    // if you want to use the default in-app SSO, just remove the
    // [redirectionGenerator] parameter from the [ClerkAuthConfig] object
    // below, or...

    // return null;
  }

  @override
  Widget build(BuildContext context) {
    return ClerkAuth(
      config: ClerkAuthConfig(
        publishableKey: publishableKey,
        redirectionGenerator: generateDeepLink,
      ),
      deepLinkStream: AppLinks().allUriLinkStream.map(createClerkLink),
      child: MaterialApp(
        theme: ThemeData.light(),
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
