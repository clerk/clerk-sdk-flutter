import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/social_connection_button.dart';
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
class ClerkSSOPanel extends StatelessWidget {
  /// Construct a new [ClerkSSOPanel]
  const ClerkSSOPanel({super.key, required this.onStrategyChosen});

  /// Function to call when a strategy is chosen
  final ValueChanged<clerk.Strategy> onStrategyChosen;

  Widget _connection(clerk.SocialConnection connection) => Expanded(
        child: SocialConnectionButton(
          key: ValueKey<clerk.SocialConnection>(connection),
          connection: connection,
          onPressed: () => onStrategyChosen(connection.strategy),
        ),
      );

  Iterable<Widget> _connections(
    List<clerk.SocialConnection> connections,
  ) sync* {
    if (connections.isNotEmpty) {
      yield _connection(connections.first);
      for (final connection in connections.skip(1)) {
        yield horizontalMargin8;
        yield _connection(connection);
      }
    }
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

        return Row(children: _connections(socialConnections).toList());
      },
    );
  }
}
