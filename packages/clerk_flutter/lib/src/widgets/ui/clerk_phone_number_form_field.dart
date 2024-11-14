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
    this.label,
    this.optional = false,
    this.initial,
  });

  /// Report changes back to calling widget
  final ValueChanged<String> onChanged;

  /// Show label?
  final String? label;

  /// Is this field optional?
  final bool optional;

  /// initial value
  final String? initial;

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
          child: PhoneInput(
            initialValue: initial is String ? PhoneNumber.parse(initial!) : null,
            showFlagInInput: true,
            flagSize: 16,
            onChanged: (phoneNumber) {
              if (phoneNumber case PhoneNumber phoneNumber) {
                onChanged(phoneNumber.intlFormattedNsn);
              }
            },
            decoration: const InputDecoration(
              errorStyle: TextStyle(
                  color: Colors.transparent, height: 0.01), // weird hack because 0 doesn't work
              isDense: true,
              border: InputBorder.none,
              constraints: BoxConstraints(maxHeight: 32, minHeight: 32),
            ),
            countrySelectorNavigator: const CountrySelectorNavigator.dialog(
              addFavoriteSeparator: true,
              favorites: [IsoCode.US, IsoCode.GB],
            ),
            validator: PhoneValidator.valid(),
          ),
        ),
      ],
    );
  }
}

extension on PhoneNumber {
  String get intlFormattedNsn => '(+$countryCode) ${getFormattedNsn()}';
}
