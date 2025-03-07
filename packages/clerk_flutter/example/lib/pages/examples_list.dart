import 'package:clerk_flutter_example/pages/clerk_sign_in_example.dart';
import 'package:clerk_flutter_example/pages/custom_email_sign_in_example.dart';
import 'package:clerk_flutter_example/pages/custom_sign_in_example.dart';
import 'package:flutter/material.dart';

/// List of examples. Navigate to each.
@immutable
class ExamplesList extends StatelessWidget {
  /// Constructs an instance of [ExamplesList].
  const ExamplesList({super.key});

  /// Path to this page.
  static const path = '/examples-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Examples'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Clerk UI Sign In'),
            onTap: () =>
                Navigator.of(context).pushNamed(ClerkSignInExample.path),
          ),
          ListTile(
            title: const Text('Custom Sign In'),
            onTap: () =>
                Navigator.of(context).pushNamed(CustomOAuthSignInExample.path),
          ),
          ListTile(
            title: const Text('Custom Email Sign In'),
            onTap: () =>
                Navigator.of(context).pushNamed(CustomEmailSignInExample.path),
          ),
        ],
      ),
    );
  }
}
