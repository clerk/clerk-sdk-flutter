import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/material.dart';

/// A label to sit at the end of a row or tile
///
class ClerkRowLabel extends StatelessWidget {
  /// Construct a [ClerkRowLabel]
  const ClerkRowLabel({
    super.key,
    this.color = ClerkColors.charcoalGrey,
    required this.label,
    this.onTap,
  });

  /// The [Color]
  final Color color;

  /// The contents of the label
  final String label;

  /// Optional callback
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: topPadding2,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: DecoratedBox(
          decoration:
              BoxDecoration(border: Border.all(color: color, width: 0.5)),
          child: Center(
            child: Padding(
              padding: horizontalPadding4 + verticalPadding2,
              child: Text(
                label.toUpperCase(),
                style: ClerkTextStyle.rowLabel.copyWith(color: color),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
