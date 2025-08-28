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

enum _SignUpPanelState {
  input,
  waiting;

  bool get isInput => this == input;

  bool get isWaiting => this == waiting;
}

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

  _SignUpPanelState _state = _SignUpPanelState.input;
  final Map<clerk.UserAttribute, String?> _values = {};
  bool _isObscured = true;
  bool _needsLegalAcceptance = true;
  bool _hasLegalAcceptance = false;
  bool _highlightMissing = false;

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
    }
  }

  String? _valueOrNull(clerk.UserAttribute attr) =>
      _values[attr]?.trim().orNullIfEmpty;

  Future<void> _sendCode({
    required String code,
    required clerk.Strategy strategy,
  }) async {
    final authState = ClerkAuth.of(context, listen: false);
    await authState.safelyCall(context, () async {
      await authState.attemptSignUp(strategy: strategy, code: code);
    });
  }

  Future<void> _continue(List<_Attribute> attributes) async {
    final authState = ClerkAuth.of(context, listen: false);

    final password = _valueOrNull(clerk.UserAttribute.password);
    final passwordConfirmation =
        _valueOrNull(clerk.UserAttribute.passwordConfirmation);

    if (authState.signUp?.requires(clerk.Field.password) == true &&
        password?.isNotEmpty != true) {
      final l10ns = ClerkAuth.localizationsOf(context);
      authState.addError(
        clerk.AuthError(
          code: clerk.AuthErrorCode.invalidPassword,
          message: l10ns.passwordMustBeSupplied,
        ),
      );
      return;
    }

    if (authState.checkPassword(password, passwordConfirmation, context)
        case String errorMessage) {
      authState.addError(
        clerk.AuthError(
          code: clerk.AuthErrorCode.invalidPassword,
          message: errorMessage,
        ),
      );
      return;
    }

    if (attributes.any((a) => a.isRequired && _valueOrNull(a.attr) == null)) {
      final l10ns = ClerkAuth.localizationsOf(context);
      authState.addError(
        clerk.AuthError(
          code: clerk.AuthErrorCode.requiredFieldsAreMissing,
          message: l10ns.pleaseAddRequiredInformation,
        ),
      );
      setState(() => _highlightMissing = true);
      return;
    }

    final redirectUri = authState.emailVerificationRedirectUri(context);

    await authState.safelyCall(
      context,
      () async {
        await authState.attemptSignUp(
          strategy: clerk.Strategy.password,
          firstName: _valueOrNull(clerk.UserAttribute.firstName),
          lastName: _valueOrNull(clerk.UserAttribute.lastName),
          username: _valueOrNull(clerk.UserAttribute.username),
          emailAddress: _valueOrNull(clerk.UserAttribute.emailAddress),
          phoneNumber: _valueOrNull(clerk.UserAttribute.phoneNumber)
              ?.replaceAll(_phoneNumberRE, '')
              .orNullIfEmpty,
          password: password,
          passwordConfirmation: passwordConfirmation,
          redirectUrl: redirectUri?.toString(),
          legalAccepted: _needsLegalAcceptance ? _hasLegalAcceptance : null,
        );
      },
    );

    setState(() {
      _state = _SignUpPanelState.waiting;
      _highlightMissing = true;
    });
  }

  void _onObscure() => setState(() => _isObscured = !_isObscured);

  void _acceptTerms() => setState(() => _hasLegalAcceptance = true);

  void _reset() => setState(() => _state = _SignUpPanelState.input);

  _ValueChanger _change(clerk.UserAttribute attr) => (String value) {
        _values[attr] = value;
      };

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
    final l10ns = authState.localizationsOf(context);
    final attributes = [
      for (final attr in _signUpAttributes) //
        if (authState.env.user.attributes[attr]
            case clerk.UserAttributeData data when data.isEnabled) //
          _Attribute(attr, data),
    ];
    final isAwaitingCode = (env.supportsEmailCode &&
            signUp?.unverified(clerk.Field.emailAddress) == true) ||
        (env.supportsPhoneCode &&
            signUp?.unverified(clerk.Field.phoneNumber) == true);

    bool isMissing(_Attribute attribute) =>
        signUp?.missing(clerk.Field.forUserAttribute(attribute.attr)) == true ||
        (_highlightMissing &&
            attribute.isRequired &&
            _valueOrNull(attribute.attr) == null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final attr in [
          if (env.supportsPhoneCode) //
            clerk.UserAttribute.phoneNumber,
          if (env.supportsEmailCode) //
            clerk.UserAttribute.emailAddress,
        ]) //
          _CodeInputBox(
            attribute: attr,
            value: _values[attr] ?? '',
            closed: _state.isInput ||
                signUp?.unverified(clerk.Field.forUserAttribute(attr)) != true,
            onSubmit: (code) async {
              await _sendCode(
                strategy: clerk.Strategy.forUserAttribute(attr),
                code: code,
              );
              return false;
            },
            onResend: _reset,
          ),
        Closeable(
          closed: _state.isInput || isAwaitingCode,
          child: Column(
            children: [
              if (env.supportsEmailLink &&
                  signUp?.unverified(clerk.Field.emailAddress) == true) ...[
                Text(
                  l10ns.clickOnTheLinkThatsBeenSentTo(
                    _values[clerk.UserAttribute.emailAddress]!,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: ClerkTextStyle.subtitle,
                ),
                verticalMargin16,
              ],
              defaultLoadingWidget,
            ],
          ),
        ),
        Closeable(
          closed: _state.isWaiting,
          child: Column(
            children: [
              for (final attribute in attributes) ...[
                if (attribute.isPhoneNumber) //
                  ClerkPhoneNumberFormField(
                    initial: _values[clerk.UserAttribute.phoneNumber],
                    label: attribute.title(l10ns),
                    isMissing: isMissing(attribute),
                    isOptional: attribute.isOptional,
                    onChanged: _change(clerk.UserAttribute.phoneNumber),
                  )
                else if (attribute.isPassword) ...[
                  ClerkTextFormField(
                    initial: _values[clerk.UserAttribute.password],
                    label: attribute.title(l10ns),
                    isMissing: isMissing(attribute),
                    isOptional: attribute.isOptional,
                    obscureText: _isObscured,
                    onObscure: _onObscure,
                    onChanged: _change(clerk.UserAttribute.password),
                  ),
                  verticalMargin16,
                  ClerkTextFormField(
                    initial: _values[clerk.UserAttribute.passwordConfirmation],
                    label: l10ns.grammar.toSentence(l10ns.passwordConfirmation),
                    isMissing: isMissing(attribute),
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
                    isMissing: isMissing(attribute),
                    isOptional: attribute.isOptional,
                    onChanged: _change(attribute.attr),
                  ),
                verticalMargin16,
              ],
            ],
          ),
        ),
        Closeable(
          closed: (_state.isWaiting && isAwaitingCode == false) ||
              (_needsLegalAcceptance && _hasLegalAcceptance == false),
          child: ClerkMaterialButton(
            onPressed: () => _continue(attributes),
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
              subtitle: localizations.enterTheCodeSentTo(widget.value),
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

  bool get isRequired => data.isRequired;

  bool get isOptional => isRequired == false;

  String title(ClerkSdkLocalizations l10ns) =>
      l10ns.grammar.toSentence(attr.localizedMessage(l10ns));
}
