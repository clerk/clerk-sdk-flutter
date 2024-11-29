import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/logging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  await setUpLogging(printer: const LogPrinter());

  const publicKey = String.fromEnvironment('public_key');
  const publishableKey = String.fromEnvironment('publishable_key');
  if (publicKey.isEmpty || publishableKey.isEmpty) {
    if (kDebugMode) {
      print(
        'Please run the example with: '
        '--dart-define-from-file=example.env',
      );
    }
    exit(1);
  }

  runApp(const ExampleApp(
    publicKey: publicKey,
    publishableKey: publishableKey,
  ));
}

/// Example App
class ExampleApp extends StatefulWidget {
  /// Constructs an instance of Example App
  const ExampleApp({
    super.key,
    required this.publicKey,
    required this.publishableKey,
  });

  /// Public Key
  final String publicKey;

  /// Publishable KEy
  final String publishableKey;

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  final persistor = const _Persistor();

  late final publicKey = widget.publicKey.replaceAll(r'\n', '\n');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ClerkAuth(
        publicKey: publicKey,
        publishableKey: widget.publishableKey,
        persistor: persistor,
        child: Scaffold(
          backgroundColor: ClerkColors.whiteSmoke,
          body: Padding(
            padding: horizontalPadding32,
            child: Center(
              child: ClerkAuthBuilder(
                signedInBuilder: (context, auth) => const ClerkUserButton(),
                signedOutBuilder: (context, auth) =>
                    const ClerkAuthenticationWidget(),
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

class _Persistor implements clerk.Persistor {
  const _Persistor();

  @override
  Future<void> delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  @override
  Future<String?> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<void> write(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}
