import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/material.dart';

/// The [StrategyButton] is to be used with the authentication flow when working with
/// a an non-oAuth strategy
@immutable
class StrategyButton extends StatelessWidget {
  /// Constructs a new [StrategyButton].
  const StrategyButton({
    super.key,
    required this.strategy,
    required this.onClick,
    this.safeIdentifier,
  });

  /// The oAuth provider this button represents.
  final clerk.Strategy strategy;

  /// The function called when a button is tapped
  final VoidCallback onClick;

  /// The safe identifier for the strategy
  final String? safeIdentifier;

  /// details for strategies we support
  static const _icons = {
    clerk.Strategy.totp: Icons.lock_clock,
    clerk.Strategy.backupCode: Icons.reorder_sharp,
    clerk.Strategy.emailLink: Icons.link_sharp,
    clerk.Strategy.emailCode: Icons.email,
    clerk.Strategy.phoneCode: Icons.textsms,
  };

  static bool _supports(clerk.Strategy strategy) =>
      _icons.containsKey(strategy);

  /// boolean to say whether the [Factor] can be displayed
  /// by this widget
  static bool supports(clerk.Factor factor) => _supports(factor.strategy);

  String _label(ClerkSdkLocalizations l10ns) {
    switch (strategy) {
      case clerk.Strategy.totp:
        return l10ns.signInUsingYourAuthenticatorApp;
      case clerk.Strategy.backupCode:
        return l10ns.signInWithOneOfYourBackupCodes;
      case clerk.Strategy.emailLink:
        if (safeIdentifier case String safeIdentifier) {
          return l10ns.signInByEmailLink(safeIdentifier);
        }
        return l10ns.signInByLinkSentToYourEmail;
      case clerk.Strategy.emailCode:
        if (safeIdentifier case String safeIdentifier) {
          return l10ns.signInByEmailCode(safeIdentifier);
        }
        return l10ns.signInByCodeSentToYourEmail;
      case clerk.Strategy.phoneCode:
        if (safeIdentifier case String safeIdentifier) {
          return l10ns.signInBySMSCode(safeIdentifier);
        }
        return l10ns.signInBySMSCodeToYourPhone;
    }

    throw clerk.ClerkError.clientAppError(
      message: l10ns.noAssociatedCodeRetrievalMethod(strategy.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_supports(strategy) == false) {
      return emptyWidget;
    }

    final localizations = ClerkAuth.localizationsOf(context);
    final themeExtension = ClerkAuth.themeExtensionOf(context);
    return MaterialButton(
      onPressed: onClick,
      elevation: 2.0,
      padding: horizontalPadding16 + verticalPadding8,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius4,
        side: BorderSide(color: themeExtension.colors.borderSide),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(_icons[strategy], color: themeExtension.colors.icon),
          horizontalMargin8,
          Flexible(
            child: Text(
              _label(localizations),
              maxLines: 2,
              style: themeExtension.styles.subheading,
            ),
          ),
        ],
      ),
    );
  }
}
