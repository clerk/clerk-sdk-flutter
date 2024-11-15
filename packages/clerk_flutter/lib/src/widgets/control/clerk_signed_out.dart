import 'package:clerk_flutter/src/widgets/common.dart';
import 'package:flutter/material.dart';

import 'clerk_auth.dart';

/// A widget that builds its child only if we are signed out
/// i.e. a user is not present on the client
class ClerkSignedOut extends StatelessWidget {
  final Widget child;

  const ClerkSignedOut({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final client = ClerkAuth.of(context).client;

    if (client.user == null) {
      return child;
    }

    return emptyWidget;
  }
}
