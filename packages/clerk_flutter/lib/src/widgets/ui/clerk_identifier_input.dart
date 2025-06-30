import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/localization_extensions.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_phone_number_form_field.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_text_form_field.dart';
import 'package:clerk_flutter/src/widgets/ui/closeable.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/widgets.dart';

/// A class that allows an identifier to be input, depending on what the
/// env allows
///
/// Will swap between phone based input and pure textual
///
class ClerkIdentifierInput extends StatefulWidget {
  /// Constructor
  const ClerkIdentifierInput({
    super.key,
    required this.isPhoneInput,
    required this.onToggle,
    required this.onChanged,
    required this.strategies,
    this.onSubmit,
  });

  /// are we showing the phone input panel?
  final bool isPhoneInput;

  /// The method to toggle phone/email input
  final VoidCallback onToggle;

  /// The method to call when the input text changes
  final ValueChanged<String> onChanged;

  /// The method to call when the input text is submitted
  final ValueChanged<String>? onSubmit;

  /// Available strategies
  final List<clerk.Strategy> strategies;

  @override
  State<ClerkIdentifierInput> createState() => _ClerkIdentifierInputState();
}

class _ClerkIdentifierInputState extends State<ClerkIdentifierInput> {
  late List<clerk.Strategy> phoneStrategies;
  late List<clerk.Strategy> emailStrategies;

  final _identFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    phoneStrategies = widget.strategies.where((f) => f.isPhone).toList();
    emailStrategies =
        widget.strategies.where((f) => f.isPhone == false).toList();
    _setFocus();
  }

  @override
  void didUpdateWidget(covariant ClerkIdentifierInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPhoneInput != oldWidget.isPhoneInput) {
      _setFocus();
    }
  }

  void _setFocus() {
    if (widget.isPhoneInput) {
      _phoneFocusNode.requestFocus();
    } else {
      _identFocusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    _identFocusNode.unfocus();
    _identFocusNode.dispose();
    _phoneFocusNode.unfocus();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  bool get hasEmailStrategies => emailStrategies.isNotEmpty;

  bool get hasPhoneStrategies => phoneStrategies.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    if (widget.strategies.isEmpty) {
      return emptyWidget;
    }

    final authState = ClerkAuth.of(context);
    final l10ns = authState.localizationsOf(context);
    return Column(
      children: [
        if (hasEmailStrategies) //
          Closeable(
            closed: widget.isPhoneInput,
            child: ClerkTextFormField(
              key: const Key('identifier'),
              label: StringExt.alternatives(
                emailStrategies.map((i) => i.localizedMessage(l10ns)).toList(),
                connector: l10ns.or,
              ).capitalized,
              onChanged: widget.onChanged,
              onSubmit: widget.onSubmit,
              focusNode: _identFocusNode,
              trailing: hasPhoneStrategies
                  ? _SwapIdentifierButton(
                      strategies: phoneStrategies,
                      localizations: l10ns,
                      onTap: widget.onToggle,
                    )
                  : null,
            ),
          ),
        if (hasPhoneStrategies) //
          Closeable(
            closed: widget.isPhoneInput == false,
            child: ClerkPhoneNumberFormField(
              key: const Key('phoneIdentifier'),
              label: StringExt.alternatives(
                phoneStrategies.map((i) => i.localizedMessage(l10ns)).toList(),
                connector: l10ns.or,
              ).capitalized,
              onChanged: widget.onChanged,
              onSubmit: widget.onSubmit,
              focusNode: _phoneFocusNode,
              trailing: hasEmailStrategies
                  ? _SwapIdentifierButton(
                      strategies: emailStrategies,
                      localizations: l10ns,
                      onTap: widget.onToggle,
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
    required this.strategies,
    required this.onTap,
    required this.localizations,
  });

  final List<clerk.Strategy> strategies;
  final VoidCallback onTap;
  final ClerkSdkLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    final options = StringExt.alternatives(
      strategies
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
