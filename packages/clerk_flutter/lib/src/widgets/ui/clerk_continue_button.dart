import 'package:clerk_flutter/src/widgets/control/clerk_auth.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/material.dart';

/// A simple button providing a UI for continuing
///
class ClerkContinueButton extends StatelessWidget {
  /// Constructor
  const ClerkContinueButton({super.key, required this.onPressed});

  /// The function to call when the button is tapped
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final l10ns = ClerkAuth.localizationsOf(context);
    return ClerkMaterialButton(
      onPressed: onPressed,
      label: Row(
        children: [
          horizontalMargin16,
          Expanded(child: Center(child: Text(l10ns.cont))),
          const SizedBox(width: 16, child: Icon(Icons.arrow_right_sharp)),
        ],
      ),
    );
  }
}
