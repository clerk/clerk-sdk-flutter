import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await clerk.setUpLogging(printer: const LogPrinter());

  const publishableKey = String.fromEnvironment('publishable_key');
  if (publishableKey.isEmpty) {
    if (kDebugMode) {
      print(
        'Please run the example with: '
        '--dart-define-from-file=example.env',
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

  @override
  Widget build(BuildContext context) {
    return ClerkAuth(
      config: ClerkAuthConfig(publishableKey: publishableKey),
      child: MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: ClerkErrorListener(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ClerkAuthBuilder(
                  signedInBuilder: (context, authState) =>
                      const ClerkUserButton(),
                  signedOutBuilder: (context, authState) =>
                      const ClerkAuthentication(),
                ),
              ),
            ),
          ),
        ),
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
