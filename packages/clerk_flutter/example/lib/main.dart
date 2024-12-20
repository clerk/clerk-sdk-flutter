import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/logging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await setUpLogging(printer: const LogPrinter());

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
  const ExampleApp({
    super.key,
    required this.publishableKey,
  });

  /// Publishable Key
  final String publishableKey;

  @override
  Widget build(BuildContext context) {
    return ClerkAuth(
      publishableKey: publishableKey,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (BuildContext context, Widget? child) {
          return ClerkErrorListener(child: child!);
        },
        home: Scaffold(
          backgroundColor: ClerkColors.whiteSmoke,
          body: SafeArea(
            child: Padding(
              padding: horizontalPadding32,
              child: Center(
                child: ClerkAuthBuilder(
                  signedInBuilder: (context, auth) => const ClerkUserButton(),
                  signedOutBuilder: (context, auth) {
                    return const ClerkAuthenticationWidget();
                  },
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
class LogPrinter extends Printer {
  /// Constructs an instance of [LogPrinter]
  const LogPrinter();

  @override
  void print(String output) {
    Zone.root.print(output);
  }
}
