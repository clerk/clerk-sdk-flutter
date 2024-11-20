import 'package:clerk_flutter/src/widgets/common.dart';
import 'package:flutter/material.dart';

import 'clerk_auth.dart';

/// A widget that builds its child only if we are signed in
/// i.e. a user is present on the client
class ClerkSignedIn extends StatelessWidget {
  const ClerkSignedIn({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final client = ClerkAuth.of(context).client;

    if (client.user != null) {
      return child;
    }

    return emptyWidget;
  }
}
