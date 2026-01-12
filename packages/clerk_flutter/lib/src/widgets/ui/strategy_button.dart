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
  });

  /// The oAuth provider this button represents.
  final clerk.Strategy strategy;

  /// The function called when a button is tapped
  final VoidCallback onClick;

  /// details for strategies we support
  static const _icons = {
    clerk.Strategy.emailLink: Icons.email_outlined,
    clerk.Strategy.emailCode: Icons.email_outlined,
    clerk.Strategy.phoneCode: Icons.phone_android_outlined,
  };

  static bool _supports(clerk.Strategy strategy) =>
      _icons.containsKey(strategy);

  /// boolean to say whether the [Factor] can be displayed
  /// by this widget
  static bool supports(clerk.Factor factor) => _supports(factor.strategy);

  String _label(ClerkSdkLocalizations localizations) {
    switch (strategy) {
      case clerk.Strategy.emailLink:
        return localizations.signInByClickingALinkSentToYouByEmail;
      case clerk.Strategy.emailCode:
        return localizations.signInByEnteringACodeSentToYouByEmail;
      case clerk.Strategy.phoneCode:
        return localizations.signInByEnteringACodeSentToYouByTextMessage;
      case clerk.Strategy.enterpriseSSO:
        return localizations.signInUsingEnterpriseSSO;
      default:
        throw clerk.ClerkError(
          code: clerk.ClerkErrorCode.noAssociatedStrategy,
          message: localizations.noAssociatedCodeRetrievalMethod(
            strategy.toString(),
          ),
        );
    }
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
      padding: allPadding8,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius4,
        side: BorderSide(color: themeExtension.colors.borderSide),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(_icons[strategy], color: themeExtension.colors.lightweightText),
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
