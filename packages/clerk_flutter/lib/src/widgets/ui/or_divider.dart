import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// A reusable divider with the text 'or' in the middle. Meant to divide vertical content.
///
@immutable
class OrDivider extends StatelessWidget {
  /// Constructs a new [OrDivider].
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final translator = ClerkAuth.translatorOf(context);
    return Row(
      children: [
        const Expanded(child: Divider(color: ClerkColors.whiteSmoke)),
        horizontalMargin24,
        Text(
          translator.translate('or'),
          style: ClerkTextStyle.subtitle.copyWith(fontSize: 12.0),
        ),
        horizontalMargin24,
        const Expanded(child: Divider(color: ClerkColors.whiteSmoke)),
      ],
    );
  }
}
