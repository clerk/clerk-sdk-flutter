import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// Widget to display error messages as errors are received
/// from the [ClerkAuthProvider].
///
/// [ClerkErrorMessage] must be placed in the widget tree below both a
/// [ClerkAuth] widget and a [Scaffold]
///
class ClerkErrorMessage extends StatelessWidget {
  /// Construct a [ClerkErrorMessage] widget
  const ClerkErrorMessage({super.key});

  Future<void> _showError(BuildContext context, clerk.AuthError error) async {
    await null;
    if (context.mounted) {
      final translator = ClerkAuth.translatorOf(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          content: Text(
            translator.translate(
              error.message,
              substitution: error.substitution,
            ),
            style: ClerkTextStyle.subtitle.copyWith(color: ClerkColors.white),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<clerk.AuthError>(
      stream: ClerkAuth.errorStreamOf(context),
      builder: (context, snapshot) {
        if (snapshot.data case clerk.AuthError error) {
          _showError(context, error);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
