import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// A screen to allow additional accounts to be signed into
/// after a user has already completed sign in with one account
///
class AddAccountScreen extends StatefulWidget {
  const AddAccountScreen._({
    required this.auth,
  });

  /// An injected [ClerkAuthProvider]
  final ClerkAuthProvider auth;

  /// The name of the route to this screen
  static const routeName = 'clerk_add_account';

  /// static method to show an [AddAccountScreen]
  static Future<void> show(BuildContext context) async {
    final auth = ClerkAuth.of(context, listen: false);
    await Navigator.of(context).push(
      MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return AddAccountScreen._(auth: auth);
        },
      ),
    );
  }

  @override
  State<AddAccountScreen> createState() => _AddAccountScreenState();
}

class _AddAccountScreenState extends State<AddAccountScreen> {
  late Set<String> userIds;

  @override
  void initState() {
    super.initState();
    userIds = widget.auth.client.userIds.toSet();
    widget.auth.addListener(_onAuthStateChanged);
  }

  void _onAuthStateChanged() {
    // if we successfully logged in and got a new session, pop the screen
    final newUserIds = widget.auth.client.userIds.toSet();
    if (newUserIds.difference(userIds).isNotEmpty) {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    widget.auth.removeListener(_onAuthStateChanged);
    super.dispose();
  }

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
