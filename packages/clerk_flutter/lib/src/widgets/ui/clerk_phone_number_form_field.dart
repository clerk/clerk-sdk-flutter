import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/input_label.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:phone_input/phone_input_package.dart';

/// A reusable and Clerk styled [TextFormField] for collecting phone numbers.
///
class ClerkPhoneNumberFormField extends StatelessWidget {
  /// Constructs a new [ClerkPhoneNumberFormField].
  const ClerkPhoneNumberFormField({
    super.key,
    required this.onChanged,
    this.onSubmit,
    this.label,
    this.isOptional = false,
    this.isMissing = false,
    this.initial,
    this.defaultCountry = IsoCode.US,
  });

  /// Report changes back to calling widget
  final ValueChanged<String> onChanged;

  /// Report submission back to calling widget
  final ValueChanged<String>? onSubmit;

  /// Show label?
  final String? label;

  /// Is this field optional?
  final bool isOptional;

  /// Do we need to mark this field as required?
  final bool isMissing;

  /// initial value
  final String? initial;

  /// default country
  final IsoCode defaultCountry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        InputLabel(label: label, isRequired: isMissing, isOptional: isOptional),
        verticalMargin4,
        DecoratedBox(
          decoration: inputBoxBorderDecoration,
          child: _PhoneInput(
            initial: initial,
            defaultCountry: defaultCountry,
            onChanged: onChanged,
            onSubmit: onSubmit,
          ),
        ),
      ],
    );
  }
}

class _PhoneInput extends StatefulWidget {
  const _PhoneInput({
    required this.initial,
    required this.defaultCountry,
    required this.onChanged,
    required this.onSubmit,
  });

  final String? initial;
  final IsoCode defaultCountry;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onSubmit;

  @override
  State<_PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<_PhoneInput> {
  late final _phoneNumber =
      widget.initial is String ? PhoneNumber.parse(widget.initial!) : null;
  late bool _isValid = _phoneNumber?.isValid() == true;

  @override
  Widget build(BuildContext context) {
    return PhoneInput(
      initialValue: _phoneNumber,
      defaultCountry: widget.defaultCountry,
      autovalidateMode: AutovalidateMode.always,
      showFlagInInput: true,
      flagSize: 16,
      onChanged: (phoneNumber) {
        if (phoneNumber case PhoneNumber phoneNumber) {
          final valid = phoneNumber.isValid();
          if (valid != _isValid) setState(() => _isValid = valid);
          if (valid) {
            widget.onChanged(phoneNumber.intlFormattedNsn);
          }
        }
      },
      onSubmitted: widget.onSubmit,
      style: ClerkTextStyle.inputLabel.copyWith(
        color: _isValid ? ClerkColors.charcoalGrey : ClerkColors.incarnadine,
      ),
      decoration: const InputDecoration(
        errorStyle: TextStyle(
            color: Colors.transparent,
            height: 0.01), // weird hack because 0 doesn't work
        isDense: true,
        border: InputBorder.none,
        constraints: BoxConstraints(maxHeight: 32, minHeight: 32),
      ),
      countrySelectorNavigator: const CountrySelectorNavigator.dialog(
        addFavoriteSeparator: true,
        favorites: [IsoCode.US, IsoCode.GB],
      ),
    );
  }
}
