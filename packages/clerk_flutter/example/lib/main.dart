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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: ClerkAuth.materialAppBuilder(publishableKey: publishableKey),
      home: Scaffold(
        backgroundColor: const Color(0xFFf5f5f5),
        body: SafeArea(
          child: Center(
            child: ClerkAuthBuilder(
              signedInBuilder: (context, auth) {
                if (auth.env.organization.isEnabled == false) {
                  return const ClerkUserButton();
                }
                return const _UserAndOrgTabs();
              },
              signedOutBuilder: (context, auth) {
                return const ClerkAuthentication();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _UserAndOrgTabs extends StatelessWidget {
  const _UserAndOrgTabs();

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    return DefaultTabController(
      length: 2,
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: AppBar(
                backgroundColor: const Color(0xFFf5f5f5),
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
            Expanded(
              child: TabBarView(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ClerkUserButton(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ClerkOrganizationList(
                        initialUser: authState.user!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
