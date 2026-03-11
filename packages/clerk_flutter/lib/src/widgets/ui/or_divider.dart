import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_divider.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/material.dart';

/// A reusable divider with the text 'or' in the middle. Meant to divide vertical content.
///
@immutable
class OrDivider extends StatelessWidget {
  /// Constructs a new [OrDivider].
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = ClerkAuth.localizationsOf(context);
    final themeExtension = ClerkAuth.themeExtensionOf(context);
    return Padding(
      padding: verticalPadding8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(child: ClerkDivider(padding: EdgeInsets.zero)),
          horizontalMargin16,
          Text(
            localizations.or,
            style: themeExtension.styles.text,
          ),
          horizontalMargin16,
          const Expanded(child: ClerkDivider(padding: EdgeInsets.zero)),
        ],
      ),
    );
  }
}
