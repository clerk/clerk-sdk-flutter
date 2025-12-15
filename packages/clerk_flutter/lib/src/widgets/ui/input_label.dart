import 'package:clerk_flutter/src/widgets/control/clerk_auth.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/material.dart';

/// A row providing a label for an input box
///
class InputLabel extends StatelessWidget {
  /// Construct an [InputLabel]
  const InputLabel({
    super.key,
    required this.label,
    this.isRequired,
    this.isOptional,
    this.trailing,
  });

  /// The [label]
  final String? label;

  /// Add `required` to the row?
  final bool? isRequired;

  /// Add `optional` to the row?
  final bool? isOptional;

  /// A widget for the end of the label
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final localizations = ClerkAuth.localizationsOf(context);
    final themeExtension = ClerkAuth.themeExtensionOf(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (label case String label) //
          Expanded(
            child: Text(
              label,
              textAlign: TextAlign.start,
              maxLines: 2,
              style: themeExtension.styles.text.copyWith(
                color: isRequired == true ? themeExtension.colors.error : null,
              ),
            ),
          ),
        if (isRequired == true) //
          _LabelModifier(
            localizations.requiredField,
            color: themeExtension.colors.error,
          )
        else if (isOptional == true) //
          _LabelModifier(localizations.optional),
        if (trailing case Widget trailing) //
          trailing,
      ],
    );
  }
}

class _LabelModifier extends StatelessWidget {
  const _LabelModifier(this.label, {this.color});

  final Color? color;

  final String label;

  @override
  Widget build(BuildContext context) {
    final themeExtension = ClerkAuth.themeExtensionOf(context);
    final color = this.color ?? themeExtension.colors.text;
    return Padding(
      padding: leftPadding4,
      child: Text(
        label,
        textAlign: TextAlign.end,
        maxLines: 1,
        style: themeExtension.styles.inputText.copyWith(color: color),
      ),
    );
  }
}
