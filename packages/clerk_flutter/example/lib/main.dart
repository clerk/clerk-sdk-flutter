import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart';
import 'package:clerk_flutter/clerk_flutter.dart';
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
      pollMode: SessionTokenPollMode.hungry,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (BuildContext context, Widget? child) {
          return ClerkErrorListener(child: child!);
        },
        home: Scaffold(
          backgroundColor: ClerkColors.whiteSmoke,
          body: SafeArea(
            child: Center(
              child: ClerkAuthBuilder(
                signedInBuilder: (context, auth) {
                  if (auth.env.organization.isEnabled == false) {
                    return const ClerkUserButton();
                  }

                  return DefaultTabController(
                    length: 2,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: AppBar(
                              backgroundColor: ClerkColors.whiteSmoke,
                              bottom: const TabBar(
                                tabs: [
                                  SizedBox(
                                    height: 30,
                                    child: Text('Users'),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Text('Organizations'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: allPadding16,
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: ClerkUserButton(),
                                  ),
                                ),
                                Padding(
                                  padding: allPadding16,
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: ClerkOrganizationList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
