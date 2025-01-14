import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// A widget that builds its child only if we are signed out
/// i.e. a user is not present on the client
class ClerkSignedOut extends StatefulWidget {
  /// Construct a [ClerkSignedOut] widget
  const ClerkSignedOut({super.key, required this.child});

  /// The [Widget] to be built if no user is signed in
  final Widget child;

  @override
  State<ClerkSignedOut> createState() => _ClerkSignedOutState();
}

class _ClerkSignedOutState extends TelemetricState<ClerkSignedOut> {
  @override
  Map<String, dynamic> telemetryPayload(
    clerk.Auth auth,
    ClerkSignedOut widget,
  ) {
    return {
      'user_is_signed_in': auth.user is clerk.User,
    };
  }

  @override
  Widget build(BuildContext context) {
    final client = ClerkAuth.of(context).client;

    if (client.user is! clerk.User) {
      return widget.child;
    }

    return emptyWidget;
  }
}
