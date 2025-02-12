import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/control/clerk_account_change_observer.dart';
import 'package:flutter/material.dart';

/// A screen to allow additional accounts to be signed into
/// after a user has already completed sign in with one account
///
class AddAccountPanel extends StatelessWidget {
  /// Create an [AddAccountPanel]
  const AddAccountPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ClerkAccountChangeObserver(
      onChange: () => Navigator.of(context).pop(),
      builder: (context) => const ClerkAuthentication(),
    );
  }
}
