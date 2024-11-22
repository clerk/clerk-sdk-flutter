import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// A reusable and Clerk styled [TextFormField].
///
class ClerkTextFormField extends StatelessWidget {
  /// Constructs a new [ClerkTextFormField].
  const ClerkTextFormField({
    super.key,
    this.label,
    this.optional = false,
    this.obscureText = false,
    this.onChanged,
    this.onSubmit,
    this.initial,
    this.onObscure,
  });

  /// Report changes back to calling widget
  final ValueChanged<String>? onChanged;

  /// Callback for when field submitted
  final ValueChanged<String>? onSubmit;

  /// Optional label.
  final String? label;

  /// Is this field optional?
  final bool optional;

  /// can we see the text or not?
  final bool obscureText;

  /// function to change obscurity
  final VoidCallback? onObscure;

  /// initial value
  final String? initial;

  @override
  Widget build(BuildContext context) {
    final translator = ClerkAuth.translatorOf(context);
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (label case String label) //
              Expanded(
                child: Text(
                  translator.translate(label),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: ClerkTextStyle.inputLabel,
                ),
              ),
            if (optional) ...[
              spacer,
              Text(
                translator.translate('Optional'),
                textAlign: TextAlign.end,
                maxLines: 1,
                style: ClerkTextStyle.inputLabel.copyWith(
                  color: ClerkColors.stormGrey,
                  fontSize: 12.0,
                ),
              ),
            ],
          ],
        ),
        verticalMargin4,
        SizedBox(
          height: 32.0,
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: borderRadius8,
            child: DecoratedBox(
              decoration: insetBoxShadowDecoration,
              child: TextFormField(
                initialValue: initial,
                onChanged: onChanged,
                onFieldSubmitted: onSubmit,
                obscureText: obscureText,
                decoration: InputDecoration(
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: outlineInputBorder,
                  contentPadding: horizontalPadding8,
                  suffixIcon: _obscureTextIcon(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget? _obscureTextIcon() {
    if (onObscure case VoidCallback onObscure) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onObscure,
        child: Icon(obscureText ? Icons.visibility : Icons.visibility_off,
            size: 16),
      );
    }
    return null;
  }
}
