import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// A screen to allow additional accounts to be signed into
/// after a user has already completed sign in with one account
///
class ConnectAccountPanel extends StatelessWidget {
  /// Create a [ConnectAccountPanel]
  const ConnectAccountPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final translator = ClerkAuth.translatorOf(context);
    return ClerkVerticalCard(
      topPortion: ClerkPanelHeader(
        subtitle: translator.translate('Please choose an account to connect'),
      ),
      middlePortion: ClerkAuthBuilder(
        builder: (context, auth) {
          return Padding(
            padding: horizontalPadding32 + bottomPadding32,
            child: ClerkSSOPanel(
              onStrategyChosen: (strategy) =>
                  auth.ssoConnect(context, strategy),
            ),
          );
        },
      ),
    );
  }
}
