import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/clerk_sdk_localization_ext.dart';
import 'package:clerk_flutter/src/utils/clerk_telemetry.dart';
import 'package:clerk_flutter/src/utils/localization_extensions.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_code_input.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_phone_number_form_field.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_text_form_field.dart';
import 'package:clerk_flutter/src/widgets/ui/closeable.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/material.dart';
import 'package:phone_input/phone_input_package.dart';

typedef _ValueChanger = void Function(String value);

/// The [ClerkSignUpPanel] renders a UI for signing up users.
///
/// The functionality of the [ClerkSignUpPanel] is controlled by the instance settings
/// you specify in your Clerk Dashboard, such as sign-in and social connections. You can
/// further customize your [ClerkSignUpPanel] by passing additional properties.
///
/// https://clerk.com/docs/components/authentication/sign-up
///
@immutable
class ClerkSignUpPanel extends StatefulWidget {
  /// Construct a new [ClerkSignUpPanel]
  const ClerkSignUpPanel({super.key, this.isActive = false});

  /// [true] if we are currently signing up
  @Deprecated('no longer needed - will be removed')
  final bool isActive;

  @override
  State<ClerkSignUpPanel> createState() => _ClerkSignUpPanelState();
}

class _ClerkSignUpPanelState extends State<ClerkSignUpPanel>
    with ClerkTelemetryStateMixin {
  static final _phoneNumberRE = RegExp(r'[^0-9+]');

  final _values = <clerk.UserAttribute, String?>{};
  bool _isObscured = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final authState = ClerkAuth.of(context, listen: false);
    if (authState.signUp case clerk.SignUp signUp) {
      _values[clerk.UserAttribute.firstName] ??= signUp.firstName;
      _values[clerk.UserAttribute.lastName] ??= signUp.lastName;
      _values[clerk.UserAttribute.username] ??= signUp.username;
      _values[clerk.UserAttribute.emailAddress] ??= signUp.emailAddress;
      _values[clerk.UserAttribute.phoneNumber] ??= signUp.phoneNumber is String
          ? PhoneNumber.parse(signUp.phoneNumber!).intlFormattedNsn
          : null;

      if (signUp.missingFields case List<clerk.Field> missingFields
          when missingFields.isNotEmpty) {
        final l10ns = authState.localizationsOf(context);
        authState.addError(
          clerk.AuthError(
            code: clerk.AuthErrorCode.signUpFlowError,
            message: l10ns.grammar.toLitany(
              missingFields.map((f) => f.localizedMessage(l10ns)).toList(),
              context: context,
              note: l10ns.youNeedToAdd,
              inclusive: true,
            ),
          ),
        );
      }
    }
  }

  String? _valueOrNull(clerk.UserAttribute attr) =>
      _values[attr]?.orNullIfEmpty;

  Future<void> _continue({
    String? code,
    clerk.Strategy? strategy,
  }) async {
    final authState = ClerkAuth.of(context);
    await authState.safelyCall(
      context,
      () async {
        final password = _valueOrNull(clerk.UserAttribute.password);
        final passwordConfirmation =
            _valueOrNull(clerk.UserAttribute.passwordConfirmation);
        if (authState.checkPassword(password, passwordConfirmation, context)
            case String errorMessage) {
          authState.addError(clerk.AuthError(
            code: clerk.AuthErrorCode.invalidPassword,
            message: errorMessage,
          ));
        } else {
          await authState.attemptSignUp(
            strategy: strategy ?? clerk.Strategy.password,
            firstName: _valueOrNull(clerk.UserAttribute.firstName),
            lastName: _valueOrNull(clerk.UserAttribute.lastName),
            username: _valueOrNull(clerk.UserAttribute.username),
            emailAddress: _valueOrNull(clerk.UserAttribute.emailAddress),
            phoneNumber: _valueOrNull(clerk.UserAttribute.phoneNumber)
                ?.replaceAll(_phoneNumberRE, '')
                .orNullIfEmpty,
            password: password,
            passwordConfirmation: passwordConfirmation,
            code: code,
          );
        }
      },
    );
  }

  void _onObscure() => setState(() => _isObscured = !_isObscured);

  _ValueChanger _change(clerk.UserAttribute attr) =>
      (String value) => _values[attr] = value;

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    final signUp = authState.signUp;
    final hasMissingFields = signUp?.missingFields.isNotEmpty == true;
    final unverifiedFields = signUp?.unverifiedFields ?? const [];
    final hasPassword =
        _values[clerk.UserAttribute.password]?.isNotEmpty == true;
    final l10ns = authState.localizationsOf(context);
    final attributes = authState.env.user.attributes.entries
        .where((a) => a.value.isEnabled)
        .map(_Attribute.fromMapEntry)
        .toList(growable: false)
      ..sort((a, b) => a.index - b.index);

    bool isMissing(clerk.UserAttribute attr) =>
        signUp?.missing(attr.relatedField) == true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final attr in const [
          clerk.UserAttribute.phoneNumber,
          clerk.UserAttribute.emailAddress,
        ]) //
          _CodeInputBox(
            attribute: attr,
            value: _values[attr] ?? '',
            closed: hasMissingFields ||
                hasPassword == false ||
                signUp?.unverified(attr.relatedField) != true,
            onSubmit: (code) async {
              await _continue(
                strategy: clerk.Strategy.forUserAttribute(attr),
                code: code,
              );
              return false;
            },
            onResend: () => _continue(
              strategy: clerk.Strategy.forUserAttribute(attr),
            ),
          ),
        Closeable(
          closed: hasMissingFields == false &&
              hasPassword &&
              unverifiedFields.isNotEmpty,
          child: Column(
            children: [
              for (final attribute in attributes) ...[
                if (attribute.isPhoneNumber) //
                  ClerkPhoneNumberFormField(
                    initial: _values[clerk.UserAttribute.phoneNumber],
                    label: attribute.title(l10ns),
                    isMissing: isMissing(clerk.UserAttribute.phoneNumber),
                    isOptional: attribute.isOptional,
                    onChanged: _change(clerk.UserAttribute.phoneNumber),
                  )
                else if (attribute.isPassword) ...[
                  ClerkTextFormField(
                    initial: _values[clerk.UserAttribute.password],
                    label: attribute.title(l10ns),
                    isMissing: isMissing(clerk.UserAttribute.password),
                    isOptional: attribute.isOptional,
                    obscureText: _isObscured,
                    onObscure: _onObscure,
                    onChanged: _change(clerk.UserAttribute.password),
                  ),
                  verticalMargin16,
                  ClerkTextFormField(
                    initial: _values[clerk.UserAttribute.passwordConfirmation],
                    label: attribute.title(l10ns),
                    isOptional: attribute.isOptional,
                    obscureText: _isObscured,
                    onObscure: _onObscure,
                    onChanged:
                        _change(clerk.UserAttribute.passwordConfirmation),
                  ),
                ] else
                  ClerkTextFormField(
                    initial: _values[attribute.attr],
                    label: attribute.title(l10ns),
                    isMissing: isMissing(attribute.attr),
                    isOptional: attribute.isOptional,
                    onChanged: _change(attribute.attr),
                  ),
                verticalMargin16,
              ],
            ],
          ),
        ),
        ClerkMaterialButton(
          onPressed: _continue,
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: Text(l10ns.cont)),
              horizontalMargin4,
              const Icon(Icons.arrow_right_sharp),
            ],
          ),
        ),
        verticalMargin32,
      ],
    );
  }
}

class _CodeInputBox extends StatefulWidget {
  const _CodeInputBox({
    required this.attribute,
    required this.onResend,
    required this.onSubmit,
    required this.closed,
    required this.value,
  });

  final clerk.UserAttribute attribute;

  final Future<bool> Function(String) onSubmit;

  final VoidCallback onResend;

  final bool closed;

  final String value;

  @override
  State<_CodeInputBox> createState() => _CodeInputBoxState();
}

class _CodeInputBoxState extends State<_CodeInputBox> {
  final _focus = FocusNode();

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = ClerkAuth.localizationsOf(context);

    return Closeable(
      closed: widget.closed,
      onEnd: (closed) {
        if (closed == false) {
          _focus.requestFocus();
        }
      },
      child: Padding(
        padding: verticalPadding8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClerkCodeInput(
              key: Key(widget.attribute.name),
              focusNode: _focus,
              title: switch (widget.attribute) {
                clerk.UserAttribute.emailAddress =>
                  localizations.verifyYourEmailAddress,
                clerk.UserAttribute.phoneNumber =>
                  localizations.verifyYourPhoneNumber,
                _ => widget.attribute.toString(),
              },
              subtitle: localizations.enterCodeSentTo(widget.value),
              onSubmit: widget.onSubmit,
            ),
            Padding(
              padding: topPadding8,
              child: SizedBox(
                width: 80,
                height: 20,
                child: ClerkMaterialButton(
                  style: ClerkMaterialButtonStyle.light,
                  onPressed: widget.onResend,
                  label: Text(localizations.resend),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Attribute {
  const _Attribute(this.attr, this.isRequired);

  factory _Attribute.fromMapEntry(
    MapEntry<clerk.UserAttribute, clerk.UserAttributeData> entry,
  ) =>
      _Attribute(entry.key, entry.value.isRequired);

  final clerk.UserAttribute attr;

  final bool isRequired;

  int get index => attr.index;

  bool get isPhoneNumber => attr == clerk.UserAttribute.phoneNumber;

  bool get isPassword => attr == clerk.UserAttribute.password;

  bool get isOptional => isRequired == false;

  String title(ClerkSdkLocalizations l10ns) =>
      l10ns.grammar.toSentence(attr.localizedMessage(l10ns));
}
