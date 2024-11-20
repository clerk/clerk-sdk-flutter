import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

class ClerkSSOPanel extends StatefulWidget {
  const ClerkSSOPanel({super.key});

  @override
  State<ClerkSSOPanel> createState() => _ClerkSSOPanelState();
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
    return Column(
      children: [
        Padding(
          padding: horizontalPadding32 + bottomPadding24,
          child: Row(
            children: [
              for (final connection in socialConnections) //
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: SocialConnectionButton(
                      key: ValueKey<clerk.SocialConnection>(connection),
                      connection: connection,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const OrDivider(),
        verticalMargin24,
      ],
    );
  }
}
