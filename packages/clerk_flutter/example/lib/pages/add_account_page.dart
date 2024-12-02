import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

import 'example_page.dart';

/// Sign in to an additional account
class AddAccountPage extends StatefulWidget {
  /// Construct a [AddAccountPage]
  const AddAccountPage({super.key, required this.auth});

  /// The encompassing [ClerkAuthProvider]
  final ClerkAuthProvider auth;

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
    auth.addListener(_exitOnChange);
  }

  void _exit() {
    auth.removeListener(_exitOnChange);
    Navigator.of(context).pop();
  }

  void _exitOnChange() {
    final newUserIds = Set<String>.from(auth.client.userIds);
    if (newUserIds.difference(origUserIds).isNotEmpty) _exit();
  }

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      onExit: _exit,
      child: const ClerkAuthenticationWidget(),
    );
  }
}
