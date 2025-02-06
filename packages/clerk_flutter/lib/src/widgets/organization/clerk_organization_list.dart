import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// The [ClerkOrganizationList] renders a list of all users from
/// [clerk.Session]s currently signed in, plus controls to sign
/// out of all sessions
///
class ClerkOrganizationList extends StatefulWidget {
  /// Construct a [ClerkOrganizationList]
  const ClerkOrganizationList({super.key});

  @override
  State<ClerkOrganizationList> createState() => _ClerkOrganizationListState();
}

class _ClerkOrganizationListState extends State<ClerkOrganizationList>
    with ClerkTelemetryStateMixin {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: ClerkColors.white,
        boxShadow: [BoxShadow(color: ClerkColors.mercury, blurRadius: 15)],
      ),
      child: ClerkAuthBuilder(
        builder: (context, auth) {
          final memberships = auth.user?.organizationMemberships ?? [];

          return ClerkVerticalCard(
            topPortion: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final membership in memberships)
                  Text(membership.organization.name),
              ],
            ),
          );
        },
      ),
    );
  }
}
