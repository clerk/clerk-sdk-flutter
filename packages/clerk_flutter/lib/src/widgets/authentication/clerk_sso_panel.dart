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

Widget _buttonFor(clerk.SocialConnection connection) {
  return SocialConnectionButton(
    key: ValueKey<clerk.SocialConnection>(connection),
    connection: connection,
  );
}

class _ClerkSSOPanelState extends State<ClerkSSOPanel> {
  @override
  Widget build(BuildContext context) {
    final auth = ClerkAuth.of(context);
    final env = auth.env;
    final oauthStrategies =
        env.config.identificationStrategies.where((i) => i.isOauth);
    final socialConnections = env.user.socialSettings.values.where(
      (s) => oauthStrategies.contains(s.strategy),
    );

    if (socialConnections.isEmpty) {
      return emptyWidget;
    }

    return Row(
      children: [
        Expanded(child: _buttonFor(socialConnections.first)),
        for (final connection in socialConnections.skip(1)) //
          Expanded(
            child: Padding(
              padding: leftPadding8,
              child: _buttonFor(connection),
            ),
          ),
      ],
    );
  }
}
