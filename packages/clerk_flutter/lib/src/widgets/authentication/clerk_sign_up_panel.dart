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
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:phone_input/phone_input_package.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
  const ClerkSignUpPanel({super.key});

  @override
  State<ClerkSignUpPanel> createState() => _ClerkSignUpPanelState();
}

class _ClerkSignUpPanelState extends State<ClerkSignUpPanel>
    with ClerkTelemetryStateMixin {
  static final _phoneNumberRE = RegExp(r'[^0-9+]');

  final _values = <clerk.UserAttribute, String?>{};
  bool _isObscured = true;
  bool _needsLegalAcceptance = true;
  bool _hasLegalAcceptance = false;

  static const _signUpAttributes = [
    clerk.UserAttribute.username,
    clerk.UserAttribute.emailAddress,
    clerk.UserAttribute.phoneNumber,
    clerk.UserAttribute.firstName,
    clerk.UserAttribute.lastName,
    clerk.UserAttribute.password,
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final authState = ClerkAuth.of(context, listen: false);

    _needsLegalAcceptance = authState.env.user.signUp.legalConsentEnabled;

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
      _values[attr]?.trim().orNullIfEmpty;

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
            legalAccepted:
                _needsLegalAcceptance && _hasLegalAcceptance ? true : null,
          );
        }
      },
    );
  }

  void _onObscure() => setState(() => _isObscured = !_isObscured);

  void _acceptTerms() => setState(() => _hasLegalAcceptance = true);

  _ValueChanger _change(clerk.UserAttribute attr) =>
      (String value) => _values[attr] = value;

  Widget _link(String label, String url) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => launchUrlString(url),
      child: Text(label, style: ClerkTextStyle.clickable),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    if (authState.isNotAvailable) {
      return emptyWidget;
    }

    final env = authState.env;
    final signUp = authState.signUp;
    final hasMissingFields = signUp?.missingFields.isNotEmpty == true;
    final unverifiedFields = signUp?.unverifiedFields ?? const [];
    final hasPassword =
        _values[clerk.UserAttribute.password]?.isNotEmpty == true;
    final l10ns = authState.localizationsOf(context);
    final attributes = [
      for (final attr in _signUpAttributes) //
        if (authState.env.user.attributes[attr]
            case clerk.UserAttributeData data when data.isEnabled) //
          _Attribute(attr, data),
    ];

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
                    label: l10ns.grammar.toSentence(l10ns.passwordConfirmation),
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
        Closeable(
          closed: _needsLegalAcceptance && _hasLegalAcceptance == false,
          child: ClerkMaterialButton(
            onPressed: _continue,
            label: Row(
              children: [
                horizontalMargin16,
                Expanded(child: Center(child: Text(l10ns.cont))),
                const SizedBox(
                  width: 16,
                  child: Icon(Icons.arrow_right_sharp),
                ),
              ],
            ),
          ),
        ),
        if (_needsLegalAcceptance) //
          Closeable(
            closed: _hasLegalAcceptance,
            child: Padding(
              padding: topPadding4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClerkMaterialButton(
                    onPressed: _acceptTerms,
                    label: Text(l10ns.acceptTerms),
                  ),
                  verticalMargin4,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (env.display.termsUrl case String termsUrl)
                        _link(l10ns.termsAndConditions, termsUrl),
                      if (env.display.privacyPolicyUrl case String privacyUrl)
                        _link(l10ns.privacyPolicy, privacyUrl),
                    ],
                  ),
                ],
              ),
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
  const _Attribute(this.attr, this.data);

  final clerk.UserAttribute attr;

  final clerk.UserAttributeData data;

  bool get isPhoneNumber => attr == clerk.UserAttribute.phoneNumber;

  bool get isPassword => attr == clerk.UserAttribute.password;

  bool get isOptional => data.isRequired == false;

  String title(ClerkSdkLocalizations l10ns) =>
      l10ns.grammar.toSentence(attr.localizedMessage(l10ns));
}
