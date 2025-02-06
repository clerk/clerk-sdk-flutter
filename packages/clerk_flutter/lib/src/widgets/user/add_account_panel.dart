import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// A screen to allow additional accounts to be signed into
/// after a user has already completed sign in with one account
///
class AddAccountPanel extends StatefulWidget {
  const AddAccountPanel._();

  @override
  State<AddAccountPanel> createState() => _AddAccountPanelState();
}

class _AddAccountPanelState extends State<AddAccountPanel> {
  late ClerkAuthState authState;
  late final Set<String> userIds;

  @override
  void initState() {
    super.initState();
    authState = ClerkAuth.of(context);
    userIds = authState.client.userIds.toSet();
    authState.addListener(_onAuthStateChanged);
  }

  void _onAuthStateChanged() {
    // if we successfully logged in and got a new session, pop the screen
    final newUserIds = authState.client.userIds.toSet();
    if (newUserIds.difference(userIds).isNotEmpty) {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    authState.removeListener(_onAuthStateChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const ClerkAuthenticationWidget();
  }
}
