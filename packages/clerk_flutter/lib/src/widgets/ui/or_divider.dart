import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
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
    return Padding(
      padding: verticalPadding8,
      child: Row(
        children: [
          const Expanded(child: Divider(color: ClerkColors.whiteSmoke)),
          horizontalMargin24,
          Text(
            localizations.or,
            style: ClerkTextStyle.subtitle.copyWith(fontSize: 12.0),
          ),
          horizontalMargin24,
          const Expanded(child: Divider(color: ClerkColors.whiteSmoke)),
        ],
      ),
    );
  }
}
