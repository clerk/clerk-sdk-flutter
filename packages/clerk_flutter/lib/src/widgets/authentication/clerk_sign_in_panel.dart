import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/clerk_telemetry.dart';
import 'package:clerk_flutter/src/utils/identifier.dart';
import 'package:clerk_flutter/src/widgets/authentication/clerk_forgotten_password_panel.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_code_input.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_identifier_input.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
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
  clerk.Strategy _strategy = clerk.Strategy.password;
  Identifier _identifier = const Identifier('');
  String _password = '';
  String _code = '';

  void _onError(clerk.ClerkError _) {
    setState(() {
      _password = _code = '';
      _strategy = clerk.Strategy.password;
    });
  }

  Future<void> _reset() async {
    final authState = ClerkAuth.of(context, listen: false);
    _password = _code = '';
    _strategy = clerk.Strategy.password;
    await authState.resetClient();
  }

  Future<void> _continue(
    ClerkAuthState authState, {
    clerk.Strategy? strategy,
    String? code,
  }) async {
    strategy ??= _strategy;
    code ??= _code;

    if (_strategy != strategy || _code != code) {
      setState(() {
        _strategy = strategy!;
        _code = code!;
      });
    }

    final redirectUri = strategy == clerk.Strategy.emailLink
        ? authState.emailVerificationRedirectUri(context)
        : null;

    await authState.safelyCall(
      context,
      () async {
        await authState.attemptSignIn(
          strategy: strategy!,
          identifier: _identifier.identifier.orNullIfEmpty,
          password: _password.orNullIfEmpty,
          code: code?.orNullIfEmpty,
          redirectUrl: redirectUri?.toString(),
        );

        if (authState.client.signIn case clerk.SignIn signIn when mounted) {
          final factors = signIn.factors;
          if (factors.any((f) => f.strategy.isEnterpriseSSO)) {
            await authState.ssoSignIn(
              context,
              clerk.Strategy.enterpriseSSO,
            );
          } else if (signIn.needsSecondFactor && factors.length == 1) {
            await authState.attemptSignIn(strategy: factors.first.strategy);
          }
        }
      },
      onError: _onError,
    );
  }

  Future<void> _openPasswordResetFlow() async {
    await ClerkForgottenPasswordPanel.show(context);
  }

  bool _requiresBack(clerk.SignIn signIn) => signIn.status.isUnknown == false;

  bool _requiresContinue(clerk.SignIn signIn) =>
      signIn.status.isUnknown ||
      _strategy.mightAccept(_code) ||
      (signIn.verification == null &&
          signIn.canUsePassword &&
          _strategy != clerk.Strategy.emailLink);

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    final env = authState.env;
    if (authState.isNotAvailable || env.hasIdentificationStrategies == false) {
      return emptyWidget;
    }

    final signIn = authState.signIn ?? clerk.SignIn.empty;
    final l10ns = authState.localizationsOf(context);
    final canResetPassword =
        env.config.firstFactors.any((f) => f.isPasswordResetter);
    final firstFactors = signIn.factorsFor(clerk.Stage.first);
    final secondFactors = signIn.factorsFor(clerk.Stage.second);

    if (signIn.needsSecondFactor && secondFactors.length == 1) {
      _strategy = secondFactors.first.strategy;
    }

    _strategy = signIn.verification?.strategy ?? _strategy;

    final themeExtension = ClerkAuth.themeExtensionOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Identifier input
        Openable(
          open: signIn.status.isUnknown,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClerkIdentifierInput(
                initialValue: _identifier,
                strategies: env.identificationStrategies.toList(),
                onChanged: (identifier) => _identifier = identifier,
                onSubmit: (_) => _continue(authState),
              ),
              if (canResetPassword) ...[
                verticalMargin8,
                ClerkMaterialButton(
                  label: Padding(
                    padding: horizontalPadding8,
                    child: Text(l10ns.forgottenPassword),
                  ),
                  style: ClerkMaterialButtonStyle.light,
                  onPressed: _openPasswordResetFlow,
                ),
              ],
            ],
          ),
        ),

        // Identifier
        Openable(
          open: signIn.status.needsFactor,
          child: Text(
            signIn.needsSecondFactor ? l10ns.twoStepVerification : _identifier,
            style: themeExtension.styles.heading,
          ),
        ),
        verticalMargin8,

        // Email link message
        Openable(
          key: const Key('emailLinkMessage'),
          open:
              _strategy == clerk.Strategy.emailLink && signIn.needsFirstFactor,
          child: Column(
            children: [
              Text(
                l10ns.clickOnTheLinkThatsBeenSentTo(
                  _identifier.prettyIdentifier,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
                style: themeExtension.styles.subheading,
              ),
              verticalMargin16,
              defaultLoadingWidget,
              verticalMargin16,
            ],
          ),
        ),

        // Code input
        Openable(
          key: const Key('code'),
          open: _strategy.requiresCode,
          child: Padding(
            padding: verticalPadding8,
            child: ClerkCodeInput(
              title: switch (_strategy) {
                clerk.Strategy.emailCode ||
                clerk.Strategy.resetPasswordEmailCode =>
                  l10ns.enterTheCodeSentToYouByEmail,
                clerk.Strategy.phoneCode ||
                clerk.Strategy.resetPasswordPhoneCode =>
                  l10ns.enterTheCodeSentToYouByTextMessage,
                clerk.Strategy.backupCode => l10ns.enterOneOfYourBackupCodes,
                clerk.Strategy.totp =>
                  l10ns.enterTheCodeFromYourAuthenticatorApp,
                _ => null,
              },
              onChanged: (code) => setState(() => _code = code),
              onSubmit: (code) async {
                await _continue(authState, code: code);
                _strategy = clerk.Strategy.unknown;
                return false;
              },
              isTextual: _strategy.requiresTextualCode,
            ),
          ),
        ),

        // First factors
        if (firstFactors.isNotEmpty) //
          Openable(
            key: const ValueKey<clerk.Stage>(clerk.Stage.first),
            open: signIn.needsFirstFactor && _strategy.isPassword,
            child: Column(
              children: [
                _FactorList(
                  factors: firstFactors,
                  onPasswordChanged: (password) => _password = password,
                  onSubmit: (strategy) =>
                      _continue(authState, strategy: strategy),
                ),
                verticalMargin16,
              ],
            ),
          ),

        // Second factors
        if (secondFactors.length > 1) //
          Openable(
            key: const ValueKey<clerk.Stage>(clerk.Stage.second),
            open: signIn.needsSecondFactor && _strategy.requiresCode == false,
            child: Column(
              children: [
                _FactorList(
                  factors: secondFactors,
                  stage: clerk.Stage.second,
                  onSubmit: (strategy) =>
                      _continue(authState, strategy: strategy),
                ),
                verticalMargin16,
              ],
            ),
          ),

        verticalMargin8,

        // Buttons
        Row(
          children: [
            if (_requiresBack(signIn)) //
              Expanded(
                child: ClerkMaterialButton(
                  onPressed: _reset,
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(Icons.arrow_left_sharp),
                      horizontalMargin4,
                      Center(child: Text(l10ns.back)),
                    ],
                  ),
                ),
              ),
            if (_requiresContinue(signIn)) ...[
              if (_requiresBack(signIn)) //
                horizontalMargin8,
              Expanded(
                child: ClerkMaterialButton(
                  onPressed: () => _continue(authState),
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
              ),
            ],
          ],
        ),
        verticalMargin32,
      ],
    );
  }
}

class _FactorList extends StatelessWidget {
  const _FactorList({
    required this.factors,
    this.onPasswordChanged,
    required this.onSubmit,
    this.stage = clerk.Stage.first,
  });

  final List<clerk.Factor> factors;

  final ValueChanged<String>? onPasswordChanged;

  final ValueChanged<clerk.Strategy> onSubmit;

  final clerk.Stage stage;

  @override
  Widget build(BuildContext context) {
    final l10ns = ClerkAuth.localizationsOf(context);
    final hasPassword = factors.any((f) => f.strategy.isPassword);
    final otherFactors = factors.where(StrategyButton.supports).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (onPasswordChanged case final onPasswordChanged? when hasPassword) //
          Padding(
            padding: topPadding8 + bottomPadding2,
            child: ClerkTextFormField(
              label: l10ns.password,
              obscureText: true,
              onChanged: onPasswordChanged,
              onSubmit: (_) => onSubmit(clerk.Strategy.password),
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
                stage: stage,
                onClick: () => onSubmit(factor.strategy),
              ),
            ),
        ],
        verticalMargin8,
      ],
    );
  }
}
