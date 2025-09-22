import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/clerk_sdk_localization_ext.dart';
import 'package:clerk_flutter/src/utils/clerk_telemetry.dart';
import 'package:clerk_flutter/src/utils/localization_extensions.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_code_input.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_continue_button.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_phone_number_form_field.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_text_form_field.dart';
import 'package:clerk_flutter/src/widgets/ui/closeable.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/gestures.dart';
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
  final Map<clerk.UserAttribute, String?> _values = {};
  _SignUpPanelState _state = _SignUpPanelState.input;
  String _passwordConfirmation = '';
  bool _isObscured = true;
  bool _needsLegalAcceptance = true;
  bool _hasLegalAcceptance = false;
  bool _highlightMissing = false;

  static const _signUpAttributes = [
    clerk.UserAttribute.firstName,
    clerk.UserAttribute.lastName,
    clerk.UserAttribute.username,
    clerk.UserAttribute.emailAddress,
    clerk.UserAttribute.phoneNumber,
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

    final conf = _passwordConfirmation.trim();
    if (authState.checkPassword(password, conf, context) case String error) {
      authState.addError(
        clerk.AuthError(
          code: clerk.AuthErrorCode.invalidPassword,
          message: error,
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

    final username = _valueOrNull(clerk.UserAttribute.username);
    final emailAddress = _valueOrNull(clerk.UserAttribute.emailAddress);
    final phoneNumber = _valueOrNull(clerk.UserAttribute.phoneNumber)
        ?.replaceAll(_phoneNumberRE, '')
        .orNullIfEmpty;
    await authState.safelyCall(
      context,
      () async {
        await authState.attemptSignUp(
          strategy: clerk.Strategy.password,
          firstName: _valueOrNull(clerk.UserAttribute.firstName),
          lastName: _valueOrNull(clerk.UserAttribute.lastName),
          username: username,
          emailAddress: emailAddress,
          phoneNumber: phoneNumber,
          password: password,
          passwordConfirmation: _passwordConfirmation.orNullIfEmpty,
          legalAccepted: _needsLegalAcceptance ? _hasLegalAcceptance : null,
        );
      },
    );

    if (authState.signUp case clerk.SignUp signUp
        when signUp.requiresEnterpriseSSOSignUp && mounted) {
      await authState.ssoSignUp(context, clerk.Strategy.enterpriseSSO);
    }

    setState(() {
      _state = _SignUpPanelState.waiting;
      _highlightMissing = true;
    });
  }

  void _onObscure() => setState(() => _isObscured = !_isObscured);

  void _acceptTerms() =>
      setState(() => _hasLegalAcceptance = !_hasLegalAcceptance);

  Future<void> _reset() async {
    final authState = ClerkAuth.of(context, listen: false);
    await authState.resetClient();
    _state = _SignUpPanelState.input;
  }

  _ValueChanger _change(clerk.UserAttribute attr) => (String value) {
        _values[attr] = value;
      };

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    if (authState.isNotAvailable) {
      return emptyWidget;
    }

    final env = authState.env;
    final signUp = authState.signUp;
    final l10ns = authState.localizationsOf(context);
    final userAttrs = authState.env.user.attributes;
    final attributes = [
      for (final attr in _signUpAttributes) //
        if (userAttrs[attr] case clerk.UserAttributeData data
            when data.isEnabled) //
          _Attribute(attr, data),
    ];
    final lastNameAttr = attributes.any((a) => a.isFirstName)
        ? attributes.removeFirstOrNull((a) => a.isLastName)
        : null;
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
                else if (attribute.isFirstName) //
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ClerkTextFormField(
                          initial: _values[attribute.attr],
                          label: attribute.title(l10ns),
                          isMissing: isMissing(attribute),
                          isOptional: attribute.isOptional,
                          onChanged: _change(attribute.attr),
                        ),
                      ),
                      if (lastNameAttr case final lastNameAttr?) ...[
                        horizontalMargin16,
                        Expanded(
                          child: ClerkTextFormField(
                            initial: _values[lastNameAttr.attr],
                            label: lastNameAttr.title(l10ns),
                            isMissing: isMissing(lastNameAttr),
                            isOptional: lastNameAttr.isOptional,
                            onChanged: _change(lastNameAttr.attr),
                          ),
                        ),
                      ],
                    ],
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
                    initial: _passwordConfirmation,
                    label: l10ns.grammar.toSentence(l10ns.passwordConfirmation),
                    isMissing: isMissing(attribute),
                    isOptional: attribute.isOptional,
                    obscureText: _isObscured,
                    onObscure: _onObscure,
                    onChanged: (conf) => _passwordConfirmation = conf,
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
          child: ClerkContinueButton(onPressed: () => _continue(attributes)),
        ),
        if (_needsLegalAcceptance) //
          Closeable(
            closed: _hasLegalAcceptance,
            child: Padding(
              padding: topPadding4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
        ),
        if (_needsLegalAcceptance) //
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _acceptTerms,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 8, 8),
                  child: Icon(
                    _hasLegalAcceptance
                        ? Icons.check_box_outlined
                        : Icons.check_box_outline_blank,
                  ),
                ),
              ),
              const Expanded(child: _LegalAcceptanceConfirmation()),
            ],
          ),
        verticalMargin32,
      ],
    );
  }
}

class _LegalAcceptanceConfirmation extends StatelessWidget {
  const _LegalAcceptanceConfirmation();

  List<TextSpan> _subSpans(String text, String target, String? url) {
    if (url case String url) {
      final segments = text.split(target);
      final spans = <TextSpan>[TextSpan(text: segments.first)];

      for (final segmentText in segments.skip(1)) {
        spans.add(
          TextSpan(
            text: target,
            style: const TextStyle(color: ClerkColors.azure),
            recognizer: TapGestureRecognizer()
              ..onTap = () => launchUrlString(url),
          ),
        );
        spans.add(TextSpan(text: segmentText));
      }

      return spans;
    }

    return [TextSpan(text: text)];
  }

  List<InlineSpan> _spans(BuildContext context) {
    final authState = ClerkAuth.of(context, listen: false);
    final display = authState.env.display;
    final l10ns = authState.localizationsOf(context);
    final spans =
        _subSpans(l10ns.acceptTerms, l10ns.termsOfService, display.termsUrl);

    return [
      for (final span in spans) //
        if (span.text case String text when span.recognizer == null) //
          ..._subSpans(text, l10ns.privacyPolicy, display.privacyPolicyUrl)
        else //
          span,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: _spans(context)),
      maxLines: 2,
      style: ClerkTextStyle.subtitleDark,
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

  bool get isFirstName => attr == clerk.UserAttribute.firstName;

  bool get isLastName => attr == clerk.UserAttribute.lastName;

  bool get isRequired => data.isRequired;

  bool get isOptional => isRequired == false;

  String title(ClerkSdkLocalizations l10ns) =>
      l10ns.grammar.toSentence(attr.localizedMessage(l10ns));
}
