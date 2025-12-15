import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// Example of how to use clerk auth with provided sign in form.
@immutable
class ClerkSignInExample extends StatefulWidget {
  /// Constructs an instance of [ClerkSignInExample].
  const ClerkSignInExample({super.key});

  /// Path to this page.
  static const path = '/clerk-sign-in-example';

  @override
  State<ClerkSignInExample> createState() => _ClerkSignInExampleState();
}

class _ClerkSignInExampleState extends State<ClerkSignInExample> {
  bool bright = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: bright ? ThemeData.light() : ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Clerk UI Sign In'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () => setState(() => bright = !bright),
                child: const Icon(Icons.brightness_4),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: ClerkErrorListener(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ClerkAuthBuilder(
                signedInBuilder: (context, authState) {
                  if (authState.env.organization.isEnabled == false ||
                      authState.user!.hasOrganizations == false) {
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
        ),
      ),
    );
  }
}

class _UserAndOrgTabs extends StatelessWidget {
  const _UserAndOrgTabs();

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ColoredBox(
            color: Colors.blue,
            child: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(child: Text('Users')),
                Tab(child: Text('Organizations')),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ClerkUserButton(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
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
    );
  }
}
