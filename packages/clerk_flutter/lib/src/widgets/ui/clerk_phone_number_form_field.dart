import 'package:clerk_flutter/clerk_flutter.dart';
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
    this.optional = false,
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
  final bool optional;

  /// initial value
  final String? initial;

  /// default country
  final IsoCode defaultCountry;

  @override
  Widget build(BuildContext context) {
    final translator = ClerkAuth.translatorOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            if (label case String label) //
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  translator.translate(label),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: ClerkTextStyle.inputLabel,
                ),
              ),
            spacer,
            if (optional)
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
        ),
        verticalMargin4,
        DecoratedBox(
          decoration: insetBoxShadowDecoration,
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
    super.key,
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
  bool _isValid = false;

  @override
  Widget build(BuildContext context) {
    return PhoneInput(
      initialValue:
          widget.initial is String ? PhoneNumber.parse(widget.initial!) : null,
      defaultCountry: widget.defaultCountry,
      showFlagInInput: true,
      flagSize: 16,
      onChanged: (phoneNumber) {
        if (phoneNumber case PhoneNumber phoneNumber) {
          final valid = phoneNumber.isValid();
          if (valid != _isValid) setState(() => _isValid = valid);
          widget.onChanged(phoneNumber.intlFormattedNsn);
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
