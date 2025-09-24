import 'package:clerk_flutter/clerk_flutter.dart';
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
    this.focusNode,
    this.trailing,
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

  /// An optional focus node
  final FocusNode? focusNode;

  /// A widget for the end of the label
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        InputLabel(
          label: label,
          isRequired: isMissing,
          isOptional: isOptional,
          trailing: trailing,
        ),
        verticalMargin4,
        DecoratedBox(
          decoration: inputBoxBorderDecoration,
          child: _PhoneInput(
            initial: initial,
            onChanged: onChanged,
            onSubmit: onSubmit,
            focusNode: focusNode,
          ),
        ),
      ],
    );
  }
}

class _PhoneInput extends StatefulWidget {
  const _PhoneInput({
    required this.initial,
    required this.onChanged,
    required this.onSubmit,
    required this.focusNode,
  });

  final String? initial;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onSubmit;
  final FocusNode? focusNode;

  @override
  State<_PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<_PhoneInput> {
  static const _kIsoCode = 'phone_number.iso_code';

  late PhoneNumber _phoneNumber;

  // widget.initial is String ? PhoneNumber.parse(widget.initial!) : null;
  late bool _isValid = _phoneNumber.isValid() == true;
  late IsoCode _isoCode;

  late Future<PhoneNumber> _phoneNumberFuture;

  @override
  void initState() {
    super.initState();
    _phoneNumberFuture = _getPhoneNumber();
  }

  Future<PhoneNumber> _getPhoneNumber() async {
    final persistor = ClerkAuth.of(context, listen: false).config.persistor;
    if (widget.initial case String initial) {
      _phoneNumber = PhoneNumber.parse(initial);
      _isoCode = _phoneNumber.isoCode;
      persistor.write(_kIsoCode, _isoCode.name);
    } else {
      final isoCode = await persistor.read<String>(_kIsoCode) ?? 'US';
      _isoCode = IsoCode.fromJson(isoCode);
      _phoneNumber = PhoneNumber(isoCode: _isoCode, nsn: '');
    }

    return _phoneNumber;
  }

  Future<void> _checkIsoCode(IsoCode isoCode) async {
    if (_isoCode != isoCode) {
      _isoCode = isoCode;
      final persistor = ClerkAuth.of(context, listen: false).config.persistor;
      await persistor.write(_kIsoCode, isoCode.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _phoneNumberFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return emptyWidget;
        }

        return PhoneInput(
          initialValue: _phoneNumber,
          defaultCountry: _isoCode,
          autovalidateMode: AutovalidateMode.always,
          showFlagInInput: true,
          flagSize: 16,
          focusNode: widget.focusNode,
          onChanged: (phoneNumber) {
            if (phoneNumber case PhoneNumber phoneNumber) {
              final valid = phoneNumber.isValid();
              if (valid != _isValid) setState(() => _isValid = valid);
              if (valid) {
                widget.onChanged(phoneNumber.international);
              }
              _checkIsoCode(phoneNumber.isoCode);
            }
          },
          onSubmitted: widget.onSubmit,
          style: ClerkTextStyle.inputText.copyWith(
            color: _isValid //
                ? ClerkColors.charcoalGrey
                : ClerkColors.incarnadine,
          ),
          decoration: const InputDecoration(
            errorStyle: TextStyle(
              color: Colors.transparent,
              height: 0.01,
            ), // weird hack because 0 doesn't work
            isDense: true,
            border: InputBorder.none,
            constraints: BoxConstraints(maxHeight: 32, minHeight: 32),
          ),
          countrySelectorNavigator: const CountrySelectorNavigator.dialog(
            addFavoriteSeparator: true,
            favorites: [IsoCode.US, IsoCode.GB],
          ),
        );
      },
    );
  }
}
