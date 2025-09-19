import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/clerk_telemetry.dart';
import 'package:clerk_flutter/src/widgets/authentication/clerk_forgotten_password_panel.dart';
import 'package:clerk_flutter/src/widgets/authentication/clerk_sso_panel.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_code_input.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_identifier_input.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_text_form_field.dart';
import 'package:clerk_flutter/src/widgets/ui/closeable.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/or_divider.dart';
import 'package:clerk_flutter/src/widgets/ui/strategy_button.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
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
  final _completer = Completer<void>();
  clerk.Strategy _strategy = clerk.Strategy.password;
  String _identifier = '';
  String _password = '';
  String _code = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _reset();
      _completer.complete();
    });
  }

  void _onError(clerk.AuthError _) {
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

    if (strategy.isSSO) {
      final identifier = strategy == clerk.Strategy.enterpriseSSO
          ? _identifier.orNullIfEmpty
          : null;
      await authState.ssoSignIn(context, strategy, identifier: identifier);
    } else {
      final redirectUri = strategy == clerk.Strategy.emailLink
          ? authState.emailVerificationRedirectUri(context)
          : null;

      await authState.safelyCall(
        context,
        () => authState.attemptSignIn(
          strategy: strategy!,
          identifier: _identifier.orNullIfEmpty,
          password: _password.orNullIfEmpty,
          code: code?.orNullIfEmpty,
          redirectUrl: redirectUri?.toString(),
        ),
        onError: _onError,
      );
    }
  }

  Future<void> _openPasswordResetFlow() async {
    await ClerkForgottenPasswordPanel.show(context);
  }

  bool _requiresBack(clerk.SignIn signIn) => signIn.status.isUnknown == false;

  bool _requiresContinue(clerk.SignIn signIn) =>
      signIn.status.isUnknown ||
      (signIn.verification == null && signIn.canUsePassword);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _completer.future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Padding(
            padding: bottomPadding8,
            child: defaultLoadingWidget,
          );
        }

        final authState = ClerkAuth.of(context);
        final env = authState.env;
        if (authState.isNotAvailable ||
            env.hasIdentificationStrategies == false) {
          return emptyWidget;
        }

        final signIn = authState.signIn ?? clerk.SignIn.empty;
        final l10ns = authState.localizationsOf(context);
        final canResetPassword =
            env.config.firstFactors.any((f) => f.isPasswordResetter);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Openable(
              open: signIn.status.isUnknown,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClerkSSOPanel(
                    onStrategyChosen: (strategy) =>
                        _continue(authState, strategy: strategy),
                  ),
                  const Padding(padding: verticalPadding24, child: OrDivider()),
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
            Openable(
              open: signIn.status.needsFactor,
              child: Text(_identifier, style: ClerkTextStyle.title),
            ),
            verticalMargin8,
            Openable(
              key: const Key('emailLinkMessage'),
              open: _strategy == clerk.Strategy.emailLink,
              child: Text(
                l10ns.clickOnTheLinkThatsBeenSentTo(_identifier),
                maxLines: 3,
                style: ClerkTextStyle.inputText,
              ),
            ),
            Openable(
              open: signIn.verification?.strategy.requiresCode == true,
              child: Padding(
                padding: verticalPadding8,
                child: ClerkCodeInput(
                  key: const Key('code'),
                  title: _identifier.isNotEmpty
                      ? l10ns.enterTheCodeSentTo(_identifier)
                      : l10ns.enterTheCodeSentToYou,
                  onSubmit: (code) async {
                    await _continue(
                      authState,
                      code: code,
                      strategy: signIn.verification!.strategy,
                    );
                    return false;
                  },
                ),
              ),
            ),
            for (final stage in clerk.Stage.values) //
              if (signIn.factorsFor(stage) case final factors
                  when factors.isNotEmpty) //
                Openable(
                  key: ValueKey<clerk.Stage>(stage),
                  open: signIn.hasVerification == false &&
                      _strategy != clerk.Strategy.emailLink &&
                      signIn.status.needsFactorFor(stage),
                  child: _FactorList(
                    factors: factors,
                    onPasswordChanged: (password) => _password = password,
                    onSubmit: (strategy) =>
                        _continue(authState, strategy: strategy),
                  ),
                ),
            verticalMargin16,
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
      },
    );
  }
}

class _FactorList extends StatelessWidget {
  const _FactorList({
    required this.factors,
    required this.onPasswordChanged,
    required this.onSubmit,
  });

  final List<clerk.Factor> factors;

  final ValueChanged<String> onPasswordChanged;

  final ValueChanged<clerk.Strategy> onSubmit;

  @override
  Widget build(BuildContext context) {
    final l10ns = ClerkAuth.localizationsOf(context);
    final hasPassword = factors.any((f) => f.strategy.isPassword);
    final otherFactors = factors.where(StrategyButton.supports).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasPassword) //
          Padding(
            padding: verticalPadding8,
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
                onClick: () => onSubmit(factor.strategy),
              ),
            ),
        ],
        verticalMargin8,
      ],
    );
  }
}
