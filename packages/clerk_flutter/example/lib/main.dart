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
class ExampleApp extends StatefulWidget {
  /// Constructs an instance of Example App
  const ExampleApp({
    super.key,
    required this.publishableKey,
  });

  /// Publishable Key
  final String publishableKey;

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClerkAuth(
        publishableKey: widget.publishableKey,
        child: Scaffold(
          backgroundColor: ClerkColors.whiteSmoke,
          body: SafeArea(
            child: Padding(
              padding: horizontalPadding32,
              child: Center(
                child: ClerkAuthBuilder(
                  signedInBuilder: (context, auth) {
                    final translator = auth.translator;
                    return ClerkUserButton(
                      sessionActions: [
                        ClerkUserAction(
                          icon: Icons.settings,
                          label: translator.translate('Manage account'),
                          callback: _manageAccount,
                        ),
                        ClerkUserAction(
                          icon: Icons.logout,
                          label: translator.translate('Sign out'),
                          callback: _signOut,
                        ),
                      ],
                      additionalActions: [
                        if (auth.env.config.singleSessionMode == false)
                          ClerkUserAction(
                            icon: Icons.add,
                            label: translator.translate('Add account'),
                            callback: _addAccount,
                          ),
                      ],
                    );
                  },
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

  Future<void> _addAccount(BuildContext context, ClerkAuthProvider auth) async {
    AddAccountPage.show(context);
  }

  Future<T?> _manageAccount<T>(BuildContext context, ClerkAuthProvider auth) =>
      _navigateTo<T>(context, (_) => const ManageAccountPage());

  Future<T?> _navigateTo<T>(BuildContext context, WidgetBuilder builder) =>
      Navigator.of(context).push<T>(MaterialPageRoute(builder: builder));

  Future<void> _signOut<T>(BuildContext context, ClerkAuthProvider auth) async {
    if (auth.client.sessions.length == 1) {
      auth.call(context, () => auth.signOut());
    } else {
      auth.call(context, () => auth.signOutOf(auth.client.activeSession!));
    }
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
