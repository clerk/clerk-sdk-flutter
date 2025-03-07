import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// Example of how to use clerk auth with provided sign in form.
@immutable
class ClerkSignInExample extends StatelessWidget {
  /// Constructs an instance of [ClerkSignInExample].
  const ClerkSignInExample({super.key});

  /// Path to this page.
  static const path = '/clerk-sign-in-example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clerk UI Sign In'),
      ),
      body: SafeArea(
        child: ClerkErrorListener(
          child: ClerkAuthBuilder(
            signedInBuilder: (context, authState) {
              if (authState.env.organization.isEnabled == false) {
                return const ClerkUserButton();
              }
              return const _UserAndOrgTabs();
            },
            signedOutBuilder: (context, authState) {
              return const ClerkAuthentication();
            },
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
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Example App'),
          bottom: const TabBar(
            tabs: [
              Tab(child: Text('Users')),
              Tab(child: Text('Organizations')),
            ],
          ),
        ),
        body: TabBarView(
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
    );
  }
}
