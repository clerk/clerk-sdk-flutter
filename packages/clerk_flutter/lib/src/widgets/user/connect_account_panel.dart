import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/control/clerk_change_observer.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_panel_header.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_vertical_card.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/material.dart';

/// A screen to allow additional accounts to be signed into
/// after a user has already completed sign in with one account
///
class ConnectAccountPanel extends StatelessWidget {
  /// Create a [ConnectAccountPanel]
  const ConnectAccountPanel({super.key, this.onDone});

  /// The function to call when completed
  final ValueChanged<BuildContext>? onDone;

  @override
  Widget build(BuildContext context) {
    final translator = ClerkAuth.translatorOf(context);
    return ClerkVerticalCard(
      topPortion: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClerkPanelHeader(
            subtitle:
                translator.translate('Please choose an account to connect'),
          ),
          ClerkAuthBuilder(
            builder: (context, auth) {
              return Padding(
                padding: horizontalPadding32 + bottomPadding32,
                child: ClerkChangeObserver<DateTime>(
                  onChange: onDone,
                  accumulateData: () =>
                      auth.client.user?.externalAccounts?.map(
                        (o) => o.updatedAt,
                      ) ??
                      const [],
                  builder: (context) => ClerkSSOPanel(
                    onStrategyChosen: (strategy) =>
                        auth.ssoConnect(context, strategy),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
