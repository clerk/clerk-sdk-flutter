import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// A widget that builds its child only if we are signed in
/// i.e. a user is present on the client
class ClerkSignedIn extends StatefulWidget {
  /// Construct a [ClerkSignedIn] widget
  const ClerkSignedIn({super.key, required this.child});

  /// the [Widget] to be built if a user is signed in
  final Widget child;

  @override
  State<ClerkSignedIn> createState() => _ClerkSignedInState();
}

class _ClerkSignedInState extends State<ClerkSignedIn>
    with ClerkTelemetryStateMixin {
  @override
  Map<String, dynamic> get telemetryPayload {
    return {
      'user_is_signed_in': ClerkAuth.of(context).user is clerk.User,
    };
  }

  @override
  Widget build(BuildContext context) {
    final client = ClerkAuth.of(context).client;

    if (client.user is clerk.User) {
      return widget.child;
    }

    return emptyWidget;
  }
}
