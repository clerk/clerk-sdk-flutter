import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/clerk_telemetry.dart';
import 'package:clerk_flutter/src/widgets/authentication/clerk_forgotten_password_panel.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_code_input.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_identifier_input.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_text_form_field.dart';
import 'package:clerk_flutter/src/widgets/ui/closeable.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/or_divider.dart';
import 'package:clerk_flutter/src/widgets/ui/strategy_button.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:collection/collection.dart';
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
  String _identifier = '';
  String _password = '';
  String _code = '';
  bool _isObscured = true;

  bool get _hasIdent => _identifier.isNotEmpty;

  void _onError(clerk.AuthError _) {
    setState(() {
      _code = '';
      _strategy = clerk.Strategy.password;
    });
  }

  Future<void> _continue(
    ClerkAuthState authState, {
    clerk.Strategy? strategy,
    String? code,
  }) async {
    if (_hasIdent) {
      final newStrategy = strategy ?? _strategy;
      final newCode = code ?? _code;
      if (_strategy != newStrategy || _code != newCode) {
        setState(() {
          _strategy = newStrategy;
          _code = newCode;
        });
      }

      final redirectUri = strategy == clerk.Strategy.emailLink
          ? authState.emailVerificationRedirectUri(context)
          : null;

      await authState.safelyCall(
        context,
        () => authState.attemptSignIn(
          strategy: newStrategy,
          identifier: _identifier,
          password: _password.orNullIfEmpty,
          code: newCode.orNullIfEmpty,
          redirectUrl: redirectUri?.toString(),
        ),
        onError: _onError,
      );
    }
  }

  Future<void> _openPasswordResetFlow(BuildContext context) async {
    await ClerkForgottenPasswordPanel.show(context);
  }

  void _onObscure() => setState(() => _isObscured = !_isObscured);

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    final env = authState.env;
    if (authState.isNotAvailable || env.hasIdentificationStrategies == false) {
      return emptyWidget;
    }

    final localizations = authState.localizationsOf(context);
    final factor = authState.client.signIn?.supportedFirstFactors
        .firstWhereOrNull((f) => f.strategy == _strategy);
    final safeIdentifier = factor?.safeIdentifier;
    final otherStrategies =
        env.config.firstFactors.where(StrategyButton.supports);
    final canResetPassword =
        env.config.firstFactors.any((f) => f.isPasswordResetter);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClerkIdentifierInput(
          strategies: env.identificationStrategies.toList(),
          onChanged: (text) {
            if (text.isEmpty != _identifier.isEmpty) {
              // only rebuild if we need the password box to animate
              // i.e. when going from '' -> '<a character>' or vice versa
              setState(() => _identifier = text);
            } else {
              _identifier = text;
            }
          },
        ),
        if (canResetPassword) //
          Padding(
            padding: topPadding8,
            child: ClerkMaterialButton(
              label: Padding(
                padding: horizontalPadding8,
                child: Text(localizations.forgottenPassword),
              ),
              style: ClerkMaterialButtonStyle.light,
              onPressed: () => _openPasswordResetFlow(context),
            ),
          ),
        verticalMargin8,
        Closeable(
          key: const Key('emailLinkMessage'),
          closed: _strategy != clerk.Strategy.emailLink,
          child: Text(
            localizations.clickOnTheLinkThatSBeenSentToAndThenCheckBackHere(
              _identifier,
            ),
            maxLines: 2,
            style: ClerkTextStyle.inputText,
          ),
        ),
        Closeable(
          closed: _strategy.requiresCode == false,
          child: Padding(
            padding: verticalPadding8,
            child: ClerkCodeInput(
              key: const Key('code'),
              title: safeIdentifier is String
                  ? localizations.enterTheCodeSentTo(safeIdentifier)
                  : localizations.enterTheCodeSentToYou,
              onSubmit: (code) async {
                await _continue(authState, code: code, strategy: _strategy);
                return false;
              },
            ),
          ),
        ),
        Closeable(
          closed: _strategy != clerk.Strategy.password || _hasIdent == false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (env.hasPasswordStrategy)
                Padding(
                  padding: verticalPadding8,
                  child: ClerkTextFormField(
                    label: localizations.password,
                    obscureText: _isObscured,
                    onObscure: _onObscure,
                    onChanged: (password) => _password = password,
                    onSubmit: (_) =>
                        _continue(authState, strategy: clerk.Strategy.password),
                  ),
                ),
              if (otherStrategies.isNotEmpty) ...[
                if (env.hasPasswordStrategy) //
                  const OrDivider(),
                for (final strategy in otherStrategies)
                  Padding(
                    padding: topPadding4,
                    child: StrategyButton(
                      key: ValueKey<clerk.Strategy>(strategy),
                      strategy: strategy,
                      onClick: () => _continue(authState, strategy: strategy),
                    ),
                  ),
              ],
              Padding(
                padding: horizontalPadding32 + bottomPadding32 + topPadding16,
                child: ClerkMaterialButton(
                  onPressed: () => _continue(authState),
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(localizations.cont),
                      ),
                      horizontalMargin4,
                      const Icon(Icons.arrow_right_sharp),
                    ],
                  ),
                ),
              ),
              verticalMargin8,
            ],
          ),
        ),
        verticalMargin32,
      ],
    );
  }
}
