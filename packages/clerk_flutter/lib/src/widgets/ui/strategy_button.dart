import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
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

  /// boolean to say whether the [strategy] can be displayed
  /// by this widget
  static bool supports(clerk.Strategy strategy) => _icons.containsKey(strategy);

  @override
  Widget build(BuildContext context) {
    if (supports(strategy) == false) {
      return emptyWidget;
    }

    final localizations = ClerkAuth.localizationsOf(context);

    return Row(
      children: [
        SizedBox(
          width: 60,
          child: MaterialButton(
            onPressed: onClick,
            elevation: 2.0,
            shape: const RoundedRectangleBorder(
              borderRadius: borderRadius4,
              side: BorderSide(color: ClerkColors.dawnPink),
            ),
            child: Padding(
              padding: verticalPadding4,
              child: Icon(_icons[strategy], color: ClerkColors.midGrey),
            ),
          ),
        ),
        horizontalMargin8,
        Expanded(
          child: Text(
            switch (strategy) {
              clerk.Strategy.emailLink =>
                localizations.signInByClickingALinkSentToYouByEmail,
              clerk.Strategy.emailCode =>
                localizations.signInByEnteringACodeSentToYouByEmail,
              clerk.Strategy.phoneCode =>
                localizations.signInByEnteringACodeSentToYouByTextMessage,
              _ => throw clerk.AuthError(
                  code: clerk.AuthErrorCode.noAssociatedStrategy,
                  message: localizations.noAssociatedCodeRetrievalMethod(
                    strategy.toString(),
                  ),
                ),
            },
            maxLines: 1,
            style: ClerkTextStyle.buttonTitle,
          ),
        )
      ],
    );
  }
}
