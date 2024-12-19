import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// The [ClerkSignOutPanel] renders a UI for signing out users.
///
@immutable
class ClerkSignOutPanel extends StatelessWidget {
  /// Constructs a new [ClerkSignOutPanel].
  const ClerkSignOutPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = ClerkAuth.of(context);
    return Padding(
      padding: horizontalPadding16,
      child: ClerkMaterialButton(
        onPressed: () => auth.signOut(),
        label: Text(auth.translator.translate('Sign Out')),
      ),
    );
  }
}
