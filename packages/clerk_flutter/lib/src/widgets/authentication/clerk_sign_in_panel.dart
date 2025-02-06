import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
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

  bool get _hasIdent => _identifier.isNotEmpty;

  void _onError(clerk.AuthError _) {
    setState(() {
      _code = '';
      _strategy = clerk.Strategy.password;
    });
  }

  Future<void> _continue(ClerkAuthState authState,
      {clerk.Strategy? strategy, String? code}) async {
    if (_hasIdent) {
      final newStrategy = strategy ?? _strategy;
      final newCode = code ?? _code;
      if (_strategy != newStrategy || _code != newCode) {
        setState(() {
          _strategy = newStrategy;
          _code = newCode;
        });
      }

      await authState(
        context,
        () => authState.attemptSignIn(
          strategy: newStrategy,
          identifier: _identifier,
          password: _password.orNullIfEmpty,
          code: newCode.orNullIfEmpty,
        ),
        onError: _onError,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    final translator = authState.translator;
    final env = authState.env;
    final identifiers = env.identificationStrategies
        .map((i) => i.toString().replaceAll('_', ' '));
    final factor = authState.client.signIn?.supportedFirstFactors
        .firstWhereOrNull((f) => f.strategy == _strategy);
    final safeIdentifier = factor?.safeIdentifier;

    if (identifiers.isEmpty) {
      return emptyWidget;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: bottomPadding8,
          child: ClerkTextFormField(
            key: const Key('identifier'),
            label: translator
                .alternatives(identifiers.map(translator.translate).toList())
                .capitalized,
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
        ),
        Closeable(
          key: const Key('emailLinkMessage'),
          closed: _strategy != clerk.Strategy.emailLink,
          child: Text(
            translator.translate(
              'Click on the link that‘s been sent to ### and then check back here',
              substitution: _identifier,
            ),
            maxLines: 2,
            style: ClerkTextStyle.inputLabel,
          ),
        ),
        Closeable(
          closed: _strategy.requiresCode == false,
          child: Padding(
            padding: verticalPadding8,
            child: ClerkCodeInput(
              key: const Key('code'),
              title: safeIdentifier is String
                  ? translator.translate(
                      'Enter the code sent to ###',
                      substitution: safeIdentifier,
                    )
                  : translator.translate('Enter the code sent to you'),
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
                    label: translator.translate('Password'),
                    obscureText: true,
                    onChanged: (password) => _password = password,
                    onSubmit: (_) =>
                        _continue(authState, strategy: clerk.Strategy.password),
                  ),
                ),
              if (env.hasOtherStrategies) ...[
                if (env.hasPasswordStrategy) //
                  const OrDivider(),
                for (final strategy in env.otherStrategies)
                  if (StrategyButton.supports(strategy))
                    Padding(
                      padding: topPadding4,
                      child: StrategyButton(
                        key: ValueKey<clerk.Strategy>(strategy),
                        strategy: strategy,
                        onClick: () => _continue(authState, strategy: strategy),
                      ),
                    ),
                Padding(
                  padding: horizontalPadding32 + bottomPadding32 + topPadding16,
                  child: ClerkMaterialButton(
                    onPressed: () => _continue(authState),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Text(translator.translate('Continue')),
                        ),
                        horizontalMargin4,
                        const Icon(Icons.arrow_right_sharp),
                      ],
                    ),
                  ),
                ),
              ],
              verticalMargin8,
            ],
          ),
        ),
        verticalMargin32,
      ],
    );
  }
}
