import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/control/clerk_change_observer.dart';
import 'package:flutter/material.dart';

/// A screen to allow additional accounts to be signed into
/// after a user has already completed sign in with one account
///
class AddAccountPanel extends StatelessWidget {
  /// Create an [AddAccountPanel]
  const AddAccountPanel({super.key, this.onDone});

  /// The function to call when completed
  final ValueChanged<BuildContext>? onDone;

  @override
  Widget build(BuildContext context) {
    final auth = ClerkAuth.of(context, listen: false);
    return ClerkChangeObserver<DateTime>(
      accumulateData: () => auth.client.sessions.map((s) => s.user.updatedAt),
      onChange: onDone,
      builder: (context) => const ClerkAuthentication(),
    );
  }
}
