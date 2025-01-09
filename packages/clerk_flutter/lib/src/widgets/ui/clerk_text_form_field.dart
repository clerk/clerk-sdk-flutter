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
    this.autofocus = false,
    this.onChanged,
    this.onSubmit,
    this.initial,
    this.onObscure,
    this.validator,
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

  /// Should the input box immediately take focus?
  final bool autofocus;

  /// function to change obscurity
  final VoidCallback? onObscure;

  /// Is the string valid yet?
  /// NB: NOT a [FormFieldValidator], just returns a boolean
  final bool Function(String?)? validator;

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
                  label,
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
          child: DecoratedBox(
            decoration: inputBoxBorderDecoration,
            child: _TextField(
              label: label,
              optional: optional,
              obscureText: obscureText,
              onChanged: onChanged,
              onSubmit: onSubmit,
              initial: initial,
              onObscure: onObscure,
              validator: validator,
              autofocus: autofocus,
            ),
          ),
        ),
      ],
    );
  }
}

class _TextField extends StatefulWidget {
  const _TextField({
    required this.label,
    required this.optional,
    required this.obscureText,
    required this.onChanged,
    required this.onSubmit,
    required this.initial,
    required this.onObscure,
    required this.validator,
    required this.autofocus,
  });

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmit;
  final String? label;
  final bool optional;
  final bool obscureText;
  final bool autofocus;
  final VoidCallback? onObscure;
  final bool Function(String?)? validator;
  final String? initial;

  @override
  State<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<_TextField> {
  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initial,
      autofocus: widget.autofocus,
      style: ClerkTextStyle.inputLabel.copyWith(
        color: _isValid ? ClerkColors.charcoalGrey : ClerkColors.incarnadine,
      ),
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmit,
      obscureText: widget.obscureText,
      validator: (text) {
        if (widget.validator?.call(text) case bool valid) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => setState(() => _isValid = valid),
          );
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        contentPadding: horizontalPadding8,
        errorStyle: const TextStyle(fontSize: 0),
        suffixIcon: _obscureTextIcon(),
      ),
    );
  }

  Widget? _obscureTextIcon() {
    if (widget.onObscure case VoidCallback onObscure) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onObscure,
        child: Icon(
          widget.obscureText ? Icons.visibility : Icons.visibility_off,
          size: 16,
        ),
      );
    }
    return null;
  }
}
