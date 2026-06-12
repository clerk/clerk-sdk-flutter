import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// Example showing how [ClerkSignedIn] and [ClerkSignedOut] conditionally
/// render their children based on the current authentication state.
/// Only one will be visible at any given time.
@immutable
class ClerkSignedInOutExample extends StatelessWidget {
  /// Constructs an instance of [ClerkSignedInOutExample].
  const ClerkSignedInOutExample({super.key});

  /// Path to this page.
  static const path = '/clerk-signed-in-out-example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClerkSignedIn / ClerkSignedOut'),
      ),
      body: SafeArea(
        child: ClerkErrorListener(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClerkSignedIn(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ClerkSignedIn',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'This content is only visible when a user is signed in.',
                      ),
                      const SizedBox(height: 16),
                      const ClerkUserButton(),
                    ],
                  ),
                ),
                ClerkSignedOut(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ClerkSignedOut',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'This content is only visible when no user is signed in.',
                      ),
                      const SizedBox(height: 16),
                      const ClerkAuthentication(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
