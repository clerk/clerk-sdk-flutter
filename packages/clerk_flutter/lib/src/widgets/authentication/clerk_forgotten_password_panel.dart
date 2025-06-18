import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/localization_extensions.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_code_input.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_panel_header.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_text_form_field.dart';
import 'package:clerk_flutter/src/widgets/ui/closeable.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/material.dart';

enum _ResetFlowState {
  unstarted,
  awaitingCode,
  awaitingReset;

  bool get isUnstarted => this == unstarted;

  bool get isAwaitingCode => this == awaitingCode;

  bool get isAwaitingReset => this == awaitingReset;
}

/// The [ClerkForgottenPasswordPanel] renders UI for the forgotten password
/// flow.
///
/// Initially the email address for the missing account is requested,
/// followed by a code and new password entry boxes
///
class ClerkForgottenPasswordPanel extends StatefulWidget {
  /// Constructor
  const ClerkForgottenPasswordPanel({super.key});

  /// Open the panel
  static Future<bool?> show(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => const ClerkForgottenPasswordPanel(),
    );
  }

  @override
  State<ClerkForgottenPasswordPanel> createState() =>
      _ClerkForgottenPasswordPanelState();
}

class _ClerkForgottenPasswordPanelState
    extends State<ClerkForgottenPasswordPanel> {
  _ResetFlowState _flowState = _ResetFlowState.unstarted;
  bool _obscured = true;
  String _code = '';
  String _identifier = '';
  String _password = '';
  String _confirmation = '';

  Future<void> _initiatePasswordReset(ClerkAuthState authState) async {
    setState(() => _flowState = _ResetFlowState.awaitingCode);
    _code = '';
    await authState.initiatePasswordReset(
      identifier: _identifier,
      strategy: clerk.Strategy.resetPasswordEmailCode,
    );
  }

  Future<bool> _setCode(String code) async {
    setState(() => _code = code);
    return true;
  }

  void _toggleObscurePassword() => setState(() => _obscured = !_obscured);

  void _restartFlow() => setState(() => _flowState = _ResetFlowState.unstarted);

  Future<void> _submit(
    ClerkAuthState authState,
    ClerkSdkLocalizations localizations,
  ) async {
    if (authState.checkPassword(_password, _confirmation, localizations)
        case String errorMessage) {
      authState.addError(
        clerk.AuthError(
          code: clerk.AuthErrorCode.invalidPassword,
          message: errorMessage,
        ),
      );
    } else {
      final code = _code;
      setState(() => _flowState = _ResetFlowState.awaitingReset);
      await authState.attemptSignIn(
        strategy: clerk.Strategy.resetPasswordEmailCode,
        identifier: _identifier,
        password: _password,
        code: code,
      );
      if (context.mounted) {
        if (authState.isSignedIn) {
          Navigator.of(context).pop(true);
        } else {
          authState.addError(
            clerk.AuthError(
              message: localizations.resetFailed,
              code: null,
            ),
          );
          await _initiatePasswordReset(authState);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    final l10ns = ClerkAuth.localizationsOf(context);

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClerkPanelHeader(
            title: l10ns.forgottenPassword,
            padding: EdgeInsets.zero,
          ),
          Closeable(
            closed: _flowState.isUnstarted == false,
            child: Column(
              children: [
                ClerkTextFormField(
                  key: const Key('email'),
                  label: l10ns.emailAddress.capitalized,
                  onChanged: (identifier) => _identifier = identifier,
                  onSubmit: (_) => _initiatePasswordReset(authState),
                ),
                verticalMargin8,
                _ActionButton(
                  onPressed: () => _initiatePasswordReset(authState),
                  label: l10ns.requestPasswordResetCode,
                  isProcessing: _flowState.isAwaitingReset,
                ),
              ],
            ),
          ),
          Closeable(
            closed: _flowState.isUnstarted,
            child: Column(
              children: [
                ClerkCodeInput(
                  key: const Key('code'),
                  code: _code,
                  subtitle: l10ns.enterCodeSentTo(_identifier),
                  onSubmit: _setCode,
                ),
                verticalMargin8,
                Align(
                  alignment: Alignment.centerLeft,
                  child: ClerkMaterialButton(
                    label: Text(l10ns.didntReceiveCode),
                    style: ClerkMaterialButtonStyle.light,
                    onPressed: _restartFlow,
                  ),
                ),
                Closeable(
                  closed: _code.length != 6,
                  child: Column(
                    children: [
                      verticalMargin16,
                      ClerkTextFormField(
                        label: l10ns.password.capitalized,
                        obscureText: _obscured,
                        onObscure: _toggleObscurePassword,
                        onChanged: (password) => _password = password,
                        onSubmit: (_) => _submit(authState, l10ns),
                      ),
                      verticalMargin8,
                      ClerkTextFormField(
                        label: l10ns.passwordConfirmation.capitalized,
                        obscureText: _obscured,
                        onObscure: _toggleObscurePassword,
                        onChanged: (conf) => _confirmation = conf,
                        onSubmit: (_) => _submit(authState, l10ns),
                      ),
                      verticalMargin8,
                      _ActionButton(
                        onPressed: () => _submit(authState, l10ns),
                        label: l10ns.resetPassword,
                        isProcessing:
                            _flowState.isAwaitingReset, // hack by-product
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.onPressed,
    required this.label,
    required this.isProcessing,
  });

  final VoidCallback onPressed;
  final String label;
  final bool isProcessing;

  @override
  Widget build(BuildContext context) {
    if (isProcessing) {
      return const Padding(
        padding: allPadding4,
        child: SizedBox.square(
          dimension: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return ClerkMaterialButton(
      style: ClerkMaterialButtonStyle.light,
      onPressed: onPressed,
      label: Padding(
        padding: horizontalPadding8,
        child: Text(label),
      ),
    );
  }
}
