import 'dart:async';
import 'dart:core';

import 'package:clerk_auth/clerk_auth.dart' as Clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/logging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  await setUpLogging(printer: const LogPrinter());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  final persistor = const _Persistor();

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ClerkAuth(
        publicKey: const String.fromEnvironment('public_key'),
        publishableKey: const String.fromEnvironment('publishable_key'),
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

class LogPrinter extends Printer {
  const LogPrinter();

  @override
  void print(String output) {
    Zone.root.print(output);
  }
}

class _Persistor implements Clerk.Persistor {
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
