import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/input_label.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/material.dart';

/// A reusable and Clerk styled [TextFormField].
///
class ClerkTextFormField extends StatelessWidget {
  /// Constructs a new [ClerkTextFormField].
  const ClerkTextFormField({
    super.key,
    this.label,
    this.isOptional = false,
    this.obscureText = false,
    this.autofocus = false,
    this.isMissing = false,
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
  final bool isOptional;

  /// can we see the text or not?
  final bool obscureText;

  /// Should the input box immediately take focus?
  final bool autofocus;

  /// Do we need to mark this field as required?
  final bool isMissing;

  /// function to change obscurity
  final VoidCallback? onObscure;

  /// Is the string valid yet?
  /// NB: NOT a [FormFieldValidator], just returns a boolean
  final bool Function(String?)? validator;

  /// initial value
  final String? initial;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        InputLabel(label: label, isRequired: isMissing, isOptional: isOptional),
        verticalMargin4,
        SizedBox(
          height: 32.0,
          child: DecoratedBox(
            decoration: inputBoxBorderDecoration,
            child: _TextField(
              optional: isOptional,
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
