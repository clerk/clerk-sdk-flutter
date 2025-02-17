import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_vertical_card.dart';
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/material.dart';

/// Creates a dialog containing a [child] widget which, typically,
/// allows some kind of input
///
class ClerkInputDialog extends StatelessWidget {
  /// Construct a [ClerkInputDialog]
  const ClerkInputDialog._({
    required this.child,
    required this.authState,
    this.showOk = true,
  });

  /// The child [Widget]
  final Widget child;

  /// An injected [ClerkAuthState]
  final ClerkAuthState authState;

  /// Show the OK button
  final bool showOk;

  /// Display an input box containing [child]
  static Future<bool> show(
    BuildContext context, {
    required Widget child,
    bool showOk = true,
  }) async {
    final authState = ClerkAuth.of(context, listen: false);
    return await showDialog(
      context: context,
      builder: (_) => ClerkInputDialog._(
        authState: authState,
        showOk: showOk,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final translator = authState.translator;
    return Padding(
      padding: allPadding16 + MediaQuery.viewInsetsOf(context),
      child: Center(
        child: ClerkVerticalCard(
          topPortion: Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClerkAuth(authState: authState, child: child),
                verticalMargin16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClerkMaterialButton(
                      label: Text(translator.translate('Cancel')),
                      onPressed: () => Navigator.of(context).pop(false),
                      style: ClerkMaterialButtonStyle.light,
                      height: 16,
                    ),
                    if (showOk) ...[
                      horizontalMargin8,
                      ClerkMaterialButton(
                        label: Text(translator.translate('OK')),
                        onPressed: () => Navigator.of(context).pop(true),
                        style: ClerkMaterialButtonStyle.light,
                        height: 16,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
