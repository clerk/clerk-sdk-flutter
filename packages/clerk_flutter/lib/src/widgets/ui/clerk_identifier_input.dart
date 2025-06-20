import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/localization_extensions.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_phone_number_form_field.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_text_form_field.dart';
import 'package:clerk_flutter/src/widgets/ui/closeable.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/widgets.dart';

/// A class that allows an identifier to be input, depending on what the
/// env allows
///
/// Will swap between phone based input and pure textual
///
class ClerkIdentifierInput extends StatefulWidget {
  /// Constructor
  const ClerkIdentifierInput({super.key, required this.onChanged});

  /// The method to call when the input text changes
  final ValueChanged<String> onChanged;

  @override
  State<ClerkIdentifierInput> createState() => _ClerkIdentifierInputState();
}

class _ClerkIdentifierInputState extends State<ClerkIdentifierInput> {
  bool _showPhoneInput = false;

  void _togglePhoneInput() =>
      setState(() => _showPhoneInput = !_showPhoneInput);

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    final l10ns = authState.localizationsOf(context);
    final env = authState.env;
    final identifiers = env.identificationStrategies.toList(growable: false);
    final phoneIdentifiers =
        env.phoneIdentificationStrategies.toList(growable: false);

    return Column(
      children: [
        if (identifiers.isNotEmpty) //
          Closeable(
            closed: _showPhoneInput,
            child: ClerkTextFormField(
              key: const Key('identifier'),
              label: StringExt.alternatives(
                identifiers.map((i) => i.localizedMessage(l10ns)).toList(),
                connector: l10ns.or,
              ).capitalized,
              onChanged: widget.onChanged,
              trailing: phoneIdentifiers.isNotEmpty
                  ? _SwapIdentifierButton(
                      identifiers: phoneIdentifiers,
                      localizations: l10ns,
                      onTap: _togglePhoneInput,
                    )
                  : null,
            ),
          ),
        if (phoneIdentifiers.isNotEmpty) //
          Closeable(
            closed: _showPhoneInput == false,
            child: ClerkPhoneNumberFormField(
              key: const Key('phoneIdentifier'),
              label: StringExt.alternatives(
                phoneIdentifiers.map((i) => i.localizedMessage(l10ns)).toList(),
                connector: l10ns.or,
              ).capitalized,
              onChanged: widget.onChanged,
              trailing: identifiers.isNotEmpty
                  ? _SwapIdentifierButton(
                      identifiers: identifiers,
                      localizations: l10ns,
                      onTap: _togglePhoneInput,
                    )
                  : null,
            ),
          ),
      ],
    );
  }
}

class _SwapIdentifierButton extends StatelessWidget {
  const _SwapIdentifierButton({
    required this.identifiers,
    required this.onTap,
    required this.localizations,
  });

  final List<clerk.Strategy> identifiers;
  final VoidCallback onTap;
  final ClerkSdkLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    final options = StringExt.alternatives(
      identifiers
          .map((i) => i.localizedMessage(localizations, concise: true))
          .toList(),
      connector: localizations.or,
    );
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Text(
          '${localizations.switchTo} $options',
          style: ClerkTextStyle.clickable,
        ),
      ),
    );
  }
}
