import 'package:clerk_flutter/src/widgets/control/clerk_auth.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/material.dart';

/// A simple divider widget for use in Clerk UIs.
///
class ClerkDivider extends StatelessWidget {
  /// Constructs a new [ClerkDivider].
  const ClerkDivider({
    super.key,
    this.padding = topPadding16,
    this.narrow = false,
  });

  /// The padding to apply to the divider
  final EdgeInsetsGeometry padding;

  /// Should the divider be narrow?
  final bool narrow;

  @override
  Widget build(BuildContext context) {
    final themeExtension = ClerkAuth.themeExtensionOf(context);
    return Padding(
      padding: padding,
      child: Divider(
        color: themeExtension.colors.borderSide,
        thickness: narrow ? 0.0 : 1.0,
        height: 1.0,
      ),
    );
  }
}
