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
  const ClerkOAuthPanel({super.key, this.onStrategyChosen});

  /// Function to call when a strategy is chosen
  final ValueChanged<clerk.Strategy>? onStrategyChosen;

  @override
  State<ClerkOAuthPanel> createState() => _ClerkOAuthPanelState();
}

class _ClerkOAuthPanelState extends State<ClerkOAuthPanel>
    with ClerkTelemetryStateMixin {
  clerk.SocialConnection? _connection;

  Future<void> _onStrategyChosen(
    ClerkAuthState authState,
    clerk.SocialConnection connection,
  ) async {
    setState(() => _connection = connection);
    if (widget.onStrategyChosen case final onStrategyChosen?) {
      onStrategyChosen(connection.strategy);
    } else {
      await authState.ssoSignIn(context, connection.strategy);
    }
    setState(() => _connection = null);
  }

  @override
  Widget build(BuildContext context) {
    return ClerkAuthBuilder(
      builder: (context, authState) {
        if (authState.isNotAvailable) {
          return emptyWidget;
        }

        final socialConnections = authState.env.socialConnections;
        if (socialConnections.isEmpty) {
          return emptyWidget;
        }

        return Wrap(
          spacing: 8,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            for (final (connection) in socialConnections) //
              SocialConnectionButton(
                key: ValueKey<clerk.SocialConnection>(connection),
                connection: connection,
                onPressed: _connection == null || _connection == connection
                    ? () => _onStrategyChosen(authState, connection)
                    : null,
              ),
          ],
        );
      },
    );
  }
}
