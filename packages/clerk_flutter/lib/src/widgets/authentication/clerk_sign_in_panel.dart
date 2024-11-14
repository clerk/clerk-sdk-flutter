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

class ClerkSignInPanel extends StatefulWidget {
  const ClerkSignInPanel({super.key});

  @override
  State<ClerkSignInPanel> createState() => _ClerkSignInPanelState();
}

class _ClerkSignInPanelState extends State<ClerkSignInPanel> {
  clerk.Strategy _strategy = clerk.Strategy.password;
  String _identifier = '';
  String _password = '';
  String _code = '';

  bool get _hasIdentifier => _identifier.isNotEmpty;

  void _onError(clerk.AuthError _) {
    setState(() {
      _code = '';
      _strategy = clerk.Strategy.password;
    });
  }

  Future<void> _continue(ClerkAuthProvider auth, {clerk.Strategy? strategy, String? code}) async {
    if (_hasIdentifier) {
      final newStrategy = strategy ?? _strategy;
      final newCode = code ?? _code;
      if (_strategy != newStrategy || _code != newCode) {
        setState(() {
          _strategy = newStrategy;
          _code = newCode;
        });
      }

      await auth.call(
        context,
        () => auth.attemptSignIn(
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
    final auth = ClerkAuth.of(context);
    final translator = auth.translator;
    final env = auth.env;
    final otherStrategies = env.config.firstFactors.where((f) => f.isOtherStrategy);
    final hasPasswordStrategy = env.config.firstFactors.contains(clerk.Strategy.password);
    final identifiers =
        env.config.identificationStrategies.where((i) => i.isOauth == false).map((i) => i.title);
    final factor =
        auth.client.signIn?.supportedFirstFactors.firstWhereOrNull((f) => f.strategy == _strategy);
    final safeIdentifier = factor?.safeIdentifier;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const ClerkErrorMessage(),
        Padding(
          padding: horizontalPadding32 + bottomPadding8,
          child: ClerkTextFormField(
            key: const Key('identifier'),
            label: translator.alternatives(identifiers.toList()).capitalized,
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
          open: _strategy == clerk.Strategy.emailLink,
          child: Padding(
            padding: horizontalPadding32,
            child: Text(
              translator.translate(
                'Click on the link that‘s been sent to ### and then check back here',
                substitution: _identifier,
              ),
              maxLines: 2,
              style: ClerkTextStyle.inputLabel,
            ),
          ),
        ),
        ClerkCodeInput(
          key: const Key('code'),
          open: _strategy.requiresCode,
          title: translator.translate('Enter code sent to ###', substitution: safeIdentifier),
          onSubmit: (code) async {
            await _continue(auth, code: code, strategy: _strategy);
            return false;
          },
        ),
        Closeable(
          open: _strategy == clerk.Strategy.password && _hasIdentifier,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (hasPasswordStrategy)
                Padding(
                  padding: horizontalPadding32 + verticalPadding8,
                  child: ClerkTextFormField(
                    label: translator.translate('Password'),
                    obscureText: true,
                    onChanged: (password) => _password = password,
                    onSubmit: (_) => _continue(auth, strategy: clerk.Strategy.password),
                  ),
                ),
              if (otherStrategies.isNotEmpty) ...[
                if (hasPasswordStrategy)
                  const Padding(
                    padding: horizontalPadding32,
                    child: OrDivider(),
                  ),
                for (final strategy in otherStrategies)
                  if (StrategyButton.supports(strategy))
                    Padding(
                      padding: topPadding4 + horizontalPadding32,
                      child: StrategyButton(
                          key: ValueKey<clerk.Strategy>(strategy),
                          strategy: strategy,
                          onClick: () => _continue(auth, strategy: strategy)),
                    ),
                Padding(
                  padding: horizontalPadding32 + bottomPadding32 + topPadding16,
                  child: ClerkMaterialButton(
                    onPressed: () => _continue(auth),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(child: Text(translator.translate('Continue'))),
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
        const ClerkErrorMessage(),
        verticalMargin32,
      ],
    );
  }
}
