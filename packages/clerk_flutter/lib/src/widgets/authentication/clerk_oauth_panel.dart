import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/clerk_telemetry.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/social_connection_button.dart';
import 'package:flutter/material.dart';

/// The [ClerkOAuthPanel] renders a UI for signing up via configured
/// oAuth providers.
///
/// The functionality of the [ClerkOAuthPanel] is controlled by the instance settings
/// you specify in your Clerk Dashboard, such as sign-in and social connections. You can
/// further customize your [ClerkOAuthPanel] by passing additional properties.
///
/// https://clerk.com/docs/components/authentication/sign-up
///
///
class ClerkOAuthPanel extends StatefulWidget {
  /// Construct a new [ClerkOAuthPanel]
  const ClerkOAuthPanel({super.key, required this.onStrategyChosen});

  /// Function to call when a strategy is chosen
  final ValueChanged<clerk.Strategy> onStrategyChosen;

  @override
  State<ClerkOAuthPanel> createState() => _ClerkOAuthPanelState();
}

class _ClerkOAuthPanelState extends State<ClerkOAuthPanel>
    with ClerkTelemetryStateMixin {
  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    if (authState.isNotAvailable) {
      return emptyWidget;
    }

    final oauthStrategies = authState.env.config.identificationStrategies //
        .where((i) => i.isOauth)
        .toList();
    final socialConnections = authState.env.user.socialSettings.values //
        .where((s) => oauthStrategies.contains(s.strategy))
        .toList();

    if (socialConnections.isEmpty) {
      return emptyWidget;
    }

    return Row(
      children: [
        for (final (index, connection) in socialConnections.indexed) ...[
          if (index > 0) //
            horizontalMargin8,
          Expanded(
            child: SocialConnectionButton(
              key: ValueKey<clerk.SocialConnection>(connection),
              connection: connection,
              onPressed: () => widget.onStrategyChosen(connection.strategy),
            ),
          ),
        ],
      ],
    );
  }
}
