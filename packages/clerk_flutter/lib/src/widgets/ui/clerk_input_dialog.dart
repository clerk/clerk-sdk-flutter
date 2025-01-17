import 'package:clerk_flutter/clerk_flutter.dart';
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
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      content: Material(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClerkAuth(authState: authState, child: child),
            verticalMargin8,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (showOk) //
                  ClerkMaterialButton(
                    label: Text(translator.translate('OK')),
                    onPressed: () => Navigator.of(context).pop(true),
                    style: ClerkMaterialButtonStyle.light,
                    height: 16,
                  ),
                horizontalMargin8,
                ClerkMaterialButton(
                  label: Text(translator.translate('Cancel')),
                  onPressed: () => Navigator.of(context).pop(false),
                  style: ClerkMaterialButtonStyle.light,
                  height: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
