import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

import 'example_page.dart';

/// Sign in to an additional account
class AddAccountPage extends StatefulWidget {
  /// Construct a [AddAccountPage]
  const AddAccountPage({super.key, required this.auth});

  /// The encompassing [ClerkAuthProvider]
  final ClerkAuthProvider auth;

  /// Route name for [AddAccountPage]
  static const routeName = 'clerk_add_account';

  /// Show [AddAccountPage] as a full-screen-dialog route
  static Future<void> show(BuildContext context) async {
    final auth = ClerkAuth.of(context);
    await Navigator.of(context).push(
      MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return AddAccountPage(auth: auth);
        },
      ),
    );
  }

  @override
  State<AddAccountPage> createState() => _AddAccountPageState();
}

class _AddAccountPageState extends State<AddAccountPage> {
  late final Set<String> origUserIds;

  ClerkAuthProvider get auth => widget.auth;

  @override
  void initState() {
    super.initState();
    origUserIds = Set<String>.from(auth.client.userIds);
    auth.addListener(_onAuthChanged);
  }

  void _onAuthChanged() {
    // if we successfully logged in, pop the screen
    final newUserIds = Set<String>.from(auth.client.userIds);
    if (newUserIds.difference(origUserIds).isNotEmpty) {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    auth.removeListener(_onAuthChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClerkAuth(
      auth: auth,
      child: const ExamplePage(
        child: ClerkAuthenticationWidget(),
      ),
    );
  }
}

class _AddAccountScreen extends StatefulWidget {
  const _AddAccountScreen._({
    required this.auth,
  });

  final ClerkAuthProvider auth;

  @override
  State<_AddAccountScreen> createState() => _AddAccountScreenState();
}

class _AddAccountScreenState extends State<_AddAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return ClerkAuth(
      auth: widget.auth,
      child: Scaffold(
        backgroundColor: ClerkColors.whiteSmoke,
        appBar: AppBar(
          forceMaterialTransparency: true,
        ),
        body: const Padding(
          padding: horizontalPadding32,
          child: ClerkAuthenticationWidget(),
        ),
      ),
    );
  }
}
