import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/multi_digit_code_input.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/material.dart';

/// Widget which wraps a [MultiDigitCodeInput] widget, providing
/// [title] and [subtitle] etc
class ClerkCodeInput extends StatelessWidget {
  /// Construct a [ClerkCodeInput]
  const ClerkCodeInput({
    super.key,
    required this.onSubmit,
    this.title,
    this.subtitle,
    this.isSmall = false,
  });

  /// Title for the input
  final String? title;

  /// Subtitle for the input
  final String? subtitle;

  /// Function to call when code is submitted
  final Future<bool> Function(String) onSubmit;

  /// Should the input boxes be compressed?
  final bool isSmall;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title case String title)
          FittedBox(
            child: Text(
              title,
              textAlign: TextAlign.start,
              maxLines: 2,
              style: subtitle is String
                  ? ClerkTextStyle.title
                  : ClerkTextStyle.subtitleDark,
            ),
          ),
        if (subtitle case String subtitle)
          Text(
            subtitle,
            textAlign: TextAlign.start,
            maxLines: 2,
            style: ClerkTextStyle.subtitleDark,
          ),
        verticalMargin4,
        MultiDigitCodeInput(onSubmit: onSubmit, isSmall: isSmall),
      ],
    );
  }
}
