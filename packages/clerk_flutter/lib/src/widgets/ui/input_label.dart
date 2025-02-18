import 'package:clerk_flutter/src/widgets/control/clerk_auth.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/material.dart';

/// A row providing a label for an input box
///
class InputLabel extends StatelessWidget {
  /// Construct an [InputLabel]
  const InputLabel({
    super.key,
    required this.label,
    required this.isRequired,
    required this.isOptional,
  });

  /// The [label]
  final String? label;

  /// Add `required` to the row?
  final bool isRequired;

  /// Add `optional` to the row?
  final bool isOptional;

  @override
  Widget build(BuildContext context) {
    final translator = ClerkAuth.translatorOf(context);
    return Row(
      children: [
        if (label case String label) //
          Expanded(
            child: Text(
              translator.translate(label),
              textAlign: TextAlign.start,
              maxLines: 2,
              style: ClerkTextStyle.inputLabel.copyWith(
                color: isRequired ? ClerkColors.incarnadine : null,
              ),
            ),
          ),
        if (isOptional) //
          _LabelModifier(translator.translate('(optional)')),
        if (isRequired) //
          _LabelModifier(
            translator.translate('(required)'),
            color: ClerkColors.incarnadine,
          ),
      ],
    );
  }
}

class _LabelModifier extends StatelessWidget {
  const _LabelModifier(
    this.label, {
    this.color = ClerkColors.stormGrey,
  });

  final Color color;

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: leftPadding4,
      child: Text(
        label,
        textAlign: TextAlign.end,
        maxLines: 1,
        style: ClerkTextStyle.inputLabel.copyWith(
          color: color,
          fontSize: 12.0,
        ),
      ),
    );
  }
}
