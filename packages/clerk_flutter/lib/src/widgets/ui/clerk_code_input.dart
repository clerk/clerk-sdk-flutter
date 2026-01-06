import 'package:clerk_flutter/src/widgets/control/clerk_auth.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_text_form_field.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/multi_digit_code_input.dart';
import 'package:flutter/material.dart';

/// Widget which wraps a [MultiDigitCodeInput] widget, providing
/// [title] and [subtitle] etc
class ClerkCodeInput extends StatelessWidget {
  /// Construct a [ClerkCodeInput]
  const ClerkCodeInput({
    super.key,
    required this.onSubmit,
    this.onChanged,
    this.focusNode,
    this.title,
    this.subtitle,
    this.isSmall = false,
    this.code = '',
    this.isTextual = false,
  });

  /// Title for the input
  final String? title;

  /// Subtitle for the input
  final String? subtitle;

  /// Function to call when code is submitted
  final Future<bool> Function(String) onSubmit;

  /// Function to call when code is changed
  final ValueChanged<String>? onChanged;

  /// Should the input boxes be compressed?
  final bool isSmall;

  /// focus node
  final FocusNode? focusNode;

  /// Kicker to update the code from outside
  final String code;

  /// Requires textual rather than six-digit code
  final bool isTextual;

  @override
  Widget build(BuildContext context) {
    final themeExtension = ClerkAuth.themeExtensionOf(context);
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
                  ? themeExtension.styles.heading
                  : themeExtension.styles.subheading,
            ),
          ),
        if (subtitle case String subtitle)
          Padding(
            padding: topPadding8,
            child: Text(
              subtitle,
              textAlign: TextAlign.start,
              maxLines: 2,
              style: themeExtension.styles.subheading,
            ),
          ),
        verticalMargin12,
        if (isTextual) //
          ClerkTextFormField(
            autofocus: true,
            focusNode: focusNode,
            onSubmit: onSubmit,
            onChanged: onChanged,
          )
        else //
          MultiDigitCodeInput(
            isSmall: isSmall,
            focusNode: focusNode,
            code: code,
            onSubmit: onSubmit,
          ),
      ],
    );
  }
}
