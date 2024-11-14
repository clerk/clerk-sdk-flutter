import 'dart:async';
import 'dart:core';

import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/logging.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await setUpLogging(printer: const LogPrinter());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ClerkAuth(
        publicKey: const String.fromEnvironment('public_key'),
        publishableKey: const String.fromEnvironment('publishable_key'),
        child: Scaffold(
          backgroundColor: ClerkColors.whiteSmoke,
          body: Padding(
            padding: horizontalPadding32,
            child: Center(
              child: ClerkAuthBuilder(
                signedInBuilder: (context, auth) => const ClerkUserButton(),
                signedOutBuilder: (context, auth) => const ClerkAuthenticationWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LogPrinter extends Printer {
  const LogPrinter();

  @override
  void print(String output) {
    Zone.root.print(output);
  }
}
