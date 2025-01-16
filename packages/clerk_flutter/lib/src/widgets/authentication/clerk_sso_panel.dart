import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// The [ClerkSSOPanel] renders a UI for signing up via configured
/// oAuth providers.
///
/// The functionality of the [ClerkSSOPanel] is controlled by the instance settings
/// you specify in your Clerk Dashboard, such as sign-in and social connections. You can
/// further customize your [ClerkSSOPanel] by passing additional properties.
///
/// https://clerk.com/docs/components/authentication/sign-up
///
///
class ClerkSSOPanel extends StatefulWidget {
  /// Construct a new [ClerkSSOPanel]
  const ClerkSSOPanel({super.key});

  @override
  State<ClerkSSOPanel> createState() => _ClerkSSOPanelState();
}

class _ClerkSSOPanelState extends State<ClerkSSOPanel>
    with ClerkTelemetryStateMixin {
  @override
  Widget build(BuildContext context) {
    final auth = ClerkAuth.of(context);
    final oauthStrategies = auth.env.config.identificationStrategies //
        .where((i) => i.isOauth)
        .toList();
    final socialConnections = auth.env.user.socialSettings.values //
        .where((s) => oauthStrategies.contains(s.strategy))
        .toList();

    if (socialConnections.isEmpty) {
      return emptyWidget;
    }

    return Row(
      children: [
        for (final (index, connection) in socialConnections.indexed) ...[
          Expanded(
            child: SocialConnectionButton(
              key: ValueKey<clerk.SocialConnection>(connection),
              connection: connection,
            ),
          ),
          if (index < socialConnections.length - 1) //
            horizontalMargin8,
        ],
      ],
    );
  }
}
