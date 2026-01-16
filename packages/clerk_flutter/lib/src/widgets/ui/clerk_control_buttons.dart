import 'package:clerk_flutter/src/widgets/control/clerk_auth.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/material.dart';

/// A simple button providing a UI for continuing
///
class ClerkControlButtons extends StatelessWidget {
  /// Constructor
  const ClerkControlButtons({
    super.key,
    required this.onContinue,
    required this.onBack,
  });

  /// Callback for continue button
  final VoidCallback? onContinue;

  /// Callback for back button
  final VoidCallback? onBack;

  bool get _requiresContinue => onContinue is VoidCallback;

  bool get _requiresBack => onBack is VoidCallback;

  @override
  Widget build(BuildContext context) {
    final l10ns = ClerkAuth.localizationsOf(context);
    return Row(
      children: [
        if (_requiresBack) //
          Expanded(
            child: ClerkMaterialButton(
              onPressed: onBack,
              label: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.arrow_left_sharp),
                  horizontalMargin4,
                  Center(child: Text(l10ns.back)),
                ],
              ),
            ),
          ),
        if (_requiresBack && _requiresContinue) //
          horizontalMargin8,
        if (_requiresContinue) //
          Expanded(
            child: ClerkMaterialButton(
              onPressed: onContinue,
              label: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(child: Text(l10ns.cont)),
                  horizontalMargin4,
                  const Icon(Icons.arrow_right_sharp),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
