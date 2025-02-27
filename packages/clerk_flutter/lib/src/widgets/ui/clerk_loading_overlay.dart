import 'package:clerk_flutter/src/utils/clerk_auth_config.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/widgets.dart';

/// Clerk Loading Overlay
class ClerkLoadingOverlay {
  /// Constructs a [ClerkLoadingOverlay]
  ClerkLoadingOverlay(ClerkAuthConfig config)
      : _overlayEntry = OverlayEntry(
          builder: (context) => config.loading ?? defaultLoadingWidget,
        );

  final OverlayEntry _overlayEntry;

  /// Shows the loading overlay
  void show(BuildContext context) {
    final overlay = Overlay.of(context);
    if (overlay.context.mounted && _overlayEntry.mounted == false) {
      overlay.insert(_overlayEntry);
    }
  }

  /// Hides the loading overlay
  void hide() {
    _overlayEntry.remove();
  }
}
