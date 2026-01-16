import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/clerk_telemetry.dart';
import 'package:clerk_flutter/src/utils/identifier.dart';
import 'package:clerk_flutter/src/widgets/authentication/clerk_forgotten_password_panel.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_code_input.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_control_buttons.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_identifier_input.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_text_form_field.dart';
import 'package:clerk_flutter/src/widgets/ui/closeable.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/or_divider.dart';
import 'package:clerk_flutter/src/widgets/ui/strategy_button.dart';
import 'package:flutter/material.dart';

/// The [ClerkSignInPanel] renders a UI for signing in users.
///
/// The functionality of the [ClerkSignInPanel] is controlled by the instance settings you
/// specify in your Clerk Dashboard, such as sign-in and sign-ip options and social
/// connections. You can further customize you [ClerkSignInPanel] by passing additional
/// properties.
///
class ClerkSignInPanel extends StatefulWidget {
  /// Constructs a new [ClerkSignInPanel].
  const ClerkSignInPanel({super.key});

  @override
  State<ClerkSignInPanel> createState() => _ClerkSignInPanelState();
}

class _ClerkSignInPanelState extends State<ClerkSignInPanel>
    with ClerkTelemetryStateMixin {
  clerk.Strategy _strategy = clerk.Strategy.unknown;
  Identifier _identifier = const Identifier('');
  String _password = '';
  String _code = '';

  void _onError(clerk.ClerkError _) {
    setState(() {
      _password = _code = '';
      _strategy = clerk.Strategy.unknown;
    });
  }

  Future<void> _reset(ClerkAuthState authState) async {
    _password = _code = '';
    _strategy = clerk.Strategy.unknown;
    await authState.resetClient();
  }

  Future<void> _continue(
    ClerkAuthState authState, {
    clerk.Strategy? strategy,
    String? code,
  }) async {
    if (_strategy.isUnknown) {
      // By this stage, if we don't know a strategy assume password
      _strategy = clerk.Strategy.password;
    }

    strategy ??= _strategy;
    code ??= _code;

    if (_strategy != strategy || _code != code) {
      setState(() {
        _strategy = strategy!;
        _code = code!;
      });
    }

    if (_strategy.isKnown) {
      final redirectUri = _strategy.isEmailLink
          ? authState.emailVerificationRedirectUri(context)
          : null;

      await authState.safelyCall(
        context,
        () async {
          await authState.attemptSignIn(
            strategy: strategy!,
            identifier: _identifier.identifier.orNullIfEmpty,
            password: _password.orNullIfEmpty,
            code: _code.orNullIfEmpty,
            redirectUrl: redirectUri?.toString(),
          );

          if (authState.client.signIn case clerk.SignIn signIn when mounted) {
            final factors = signIn.factors;
            if (factors.any((f) => f.strategy.isEnterpriseSSO)) {
              await authState.ssoSignIn(context, clerk.Strategy.enterpriseSSO);
            } else if (signIn.needsFactor && factors.length == 1) {
              await authState.attemptSignIn(strategy: factors.first.strategy);
            }
            if (signIn.needsFactor && signIn.factors.length == 1) {
              _strategy = signIn.factors.first.strategy;
            }
          }
        },
        onError: _onError,
      );
    }
  }

  bool _needsBack(clerk.SignIn signIn) => signIn.status.isUnknown == false;

  bool _needsCont(clerk.SignIn signIn) =>
      signIn.status.isUnknown ||
      (_strategy.isPassword && _password.isNotEmpty) ||
      _strategy.mightAccept(_code);

  bool _externalActionFactorChosen(List<clerk.Factor> factors) =>
      _strategy.requiresExternalAction
          ? factors.any((f) => f.strategy == _strategy)
          : false;

  void _checkForRebuild(String newValue, String oldValue) {
    if (newValue.isEmpty != oldValue.isEmpty) {
      setState(() {});
    }
  }

  void _updatePassword(String password) {
    _checkForRebuild(password, _password);
    _password = password;
  }

  void _updateCode(String code) {
    _checkForRebuild(code, _code);
    _code = code;
  }

  Future<bool> _submitCode(String code, ClerkAuthState authState) async {
    await _continue(authState, code: code);
    _strategy = clerk.Strategy.unknown;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    final env = authState.env;
    if (authState.isNotAvailable || env.hasIdentificationStrategies == false) {
      return emptyWidget;
    }

    final l10ns = authState.localizationsOf(context);
    final themeExtension = ClerkAuth.themeExtensionOf(context);

    final signIn = authState.signIn ?? clerk.SignIn.empty;
    final safeIdentifier = signIn.factorFor(_strategy)?.safeIdentifier ??
        _identifier.prettyIdentifier.orNullIfEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Identifier input
        Openable(
          key: const Key('identifierInput'),
          open: signIn.status.isUnknown,
          child: ClerkIdentifierInput(
            initialValue: _identifier,
            strategies: env.identificationStrategies.toList(),
            onChanged: (identifier) => _identifier = identifier,
            onSubmit: (_) => _continue(authState),
          ),
        ),

        // Identifier
        Openable(
          key: const Key('heading'),
          open: signIn.status.needsFactor,
          child: Text(
            signIn.needsSecondFactor
                ? l10ns.twoStepVerification
                : _identifier.identifier,
            style: themeExtension.styles.heading,
          ),
        ),

        verticalMargin8,

        // Email link message
        _EmailLinkMessage(
          key: const Key('emailLinkMessage'),
          open: signIn.needsFirstFactor && _strategy.isEmailLink,
          identifier: safeIdentifier,
        ),

        // Code input
        _CodeInput(
          key: const Key('codeInput'),
          strategy: _strategy,
          identifier: safeIdentifier,
          onChanged: _updateCode,
          onSubmit: (code) => _submitCode(code, authState),
        ),

        // Factors for each stage
        for (final stage in clerk.Stage.values) //
          if (signIn.factorsFor(stage) case final factors
              when factors.isNotEmpty) //
            _FactorList(
              key: ValueKey<clerk.Stage>(stage),
              open: signIn.needsFactorsFor(stage) &&
                  _externalActionFactorChosen(factors) == false,
              factors: factors,
              onPasswordChanged: _updatePassword,
              onSubmit: (strategy) => _continue(authState, strategy: strategy),
            ),

        verticalMargin8,

        // Buttons
        ClerkControlButtons(
          onContinue: _needsCont(signIn) ? () => _continue(authState) : null,
          onBack: _needsBack(signIn) ? () => _reset(authState) : null,
        ),

        verticalMargin32,
      ],
    );
  }
}

class _EmailLinkMessage extends StatelessWidget {
  const _EmailLinkMessage({
    super.key,
    required this.identifier,
    required this.open,
  });

  final bool open;
  final String? identifier;

  @override
  Widget build(BuildContext context) {
    final l10ns = ClerkAuth.localizationsOf(context);
    final themeExtension = ClerkAuth.themeExtensionOf(context);
    return Openable(
      open: open,
      child: Column(
        children: [
          Text(
            identifier is String
                ? l10ns.clickOnTheLinkThatsBeenSentTo(identifier!)
                : l10ns.clickOnTheLinkThatsBeenSentToYou,
            textAlign: TextAlign.center,
            maxLines: 3,
            style: themeExtension.styles.subheading,
          ),
          verticalMargin16,
          defaultLoadingWidget,
          verticalMargin16,
        ],
      ),
    );
  }
}

class _CodeInput extends StatelessWidget {
  const _CodeInput({
    super.key,
    required this.strategy,
    required this.identifier,
    required this.onChanged,
    required this.onSubmit,
  });

  final clerk.Strategy strategy;

  final String? identifier;

  final ValueChanged<String> onChanged;

  final Future<bool> Function(String) onSubmit;

  @override
  Widget build(BuildContext context) {
    final l10ns = ClerkAuth.localizationsOf(context);
    return Openable(
      open: strategy.requiresCode,
      child: Padding(
        padding: verticalPadding8,
        child: ClerkCodeInput(
          title: switch (strategy) {
            clerk.Strategy.emailCode ||
            clerk.Strategy.resetPasswordEmailCode =>
              identifier is String
                  ? l10ns.enterTheCodeSentTo(identifier!)
                  : l10ns.enterTheCodeSentToYouByEmail,
            clerk.Strategy.phoneCode ||
            clerk.Strategy.resetPasswordPhoneCode =>
              identifier is String
                  ? l10ns.enterTheCodeSentTo(identifier!)
                  : l10ns.enterTheCodeSentToYouByTextMessage,
            clerk.Strategy.backupCode => l10ns.enterOneOfYourBackupCodes,
            clerk.Strategy.totp => l10ns.enterTheCodeFromYourAuthenticatorApp,
            _ => null,
          },
          isTextual: strategy.requiresTextualCode,
          onChanged: onChanged,
          onSubmit: onSubmit,
        ),
      ),
    );
  }
}

class _FactorList extends StatelessWidget {
  const _FactorList({
    super.key,
    required this.factors,
    required this.onSubmit,
    required this.open,
    this.onPasswordChanged,
  });

  final List<clerk.Factor> factors;

  final bool open;

  final ValueChanged<clerk.Strategy> onSubmit;

  final ValueChanged<String>? onPasswordChanged;

  Future<void> _openPasswordResetFlow(BuildContext context) async {
    await ClerkForgottenPasswordPanel.show(context);
  }

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context, listen: false);
    final themeExtension = ClerkAuth.themeExtensionOf(context);
    final l10ns = authState.localizationsOf(context);
    final hasPassword = factors.any((f) => f.strategy.isPassword);
    final otherFactors = factors.where(StrategyButton.supports).toList();
    final canResetPassword =
        authState.env.config.firstFactors.any((s) => s.isPasswordResetter);

    return Openable(
      open: open,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (onPasswordChanged case final onPasswordChanged?
              when hasPassword) //
            Padding(
              padding: topPadding8 + bottomPadding2,
              child: ClerkTextFormField(
                label: l10ns.password,
                hint: l10ns.enterYourPassword,
                obscureText: true,
                onChanged: onPasswordChanged,
                onSubmit: (_) => onSubmit(clerk.Strategy.password),
                trailing: canResetPassword
                    ? GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => _openPasswordResetFlow(context),
                        child: Text(
                          l10ns.forgottenPassword,
                          style: themeExtension.styles.clickableText,
                        ),
                      )
                    : null,
              ),
            ),
          if (otherFactors.isNotEmpty) ...[
            if (hasPassword) //
              const OrDivider(),
            for (final factor in otherFactors)
              Padding(
                padding: topPadding4,
                child: StrategyButton(
                  key: ValueKey<clerk.Factor>(factor),
                  strategy: factor.strategy,
                  safeIdentifier: factor.safeIdentifier,
                  onClick: () => onSubmit(factor.strategy),
                ),
              ),
          ],
          verticalMargin24,
        ],
      ),
    );
  }
}
