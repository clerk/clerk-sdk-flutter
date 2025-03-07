import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/clerk_telemetry.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_panel.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/editable_profile_data.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/material.dart';

/// [ClerkOrganizationProfile] displays user details
/// and allows their editing
///
class ClerkOrganizationProfile extends StatefulWidget {
  /// Construct a [ClerkOrganizationProfile]
  const ClerkOrganizationProfile({super.key, required this.membership});

  /// The membership for the current user
  final clerk.OrganizationMembership membership;

  @override
  State<ClerkOrganizationProfile> createState() =>
      _ClerkOrganizationProfileState();
}

class _ClerkOrganizationProfileState extends State<ClerkOrganizationProfile>
    with ClerkTelemetryStateMixin {
  late clerk.OrganizationMembership _membership;
  clerk.Organization get _org => _membership.organization;

  Future<void> _update(String name, File? logo) async {
    final authState = ClerkAuth.of(context, listen: false);
    await authState.safelyCall(context, () async {
      await authState.updateOrganization(org: _org, name: name, logo: logo);
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = ClerkAuth.localizationsOf(context);

    return ClerkPanel(
      padding: horizontalPadding24,
      child: ClerkAuthBuilder(
        builder: (_, __) => emptyWidget,
        signedInBuilder: (context, authState) {
          _membership = authState.user!.organizationMemberships!
              .firstWhere((o) => o.id == widget.membership.id);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalMargin32,
              Text(
                localizations.generalDetails,
                maxLines: 1,
                style: ClerkTextStyle.title,
              ),
              const Padding(padding: topPadding16, child: divider),
              Expanded(
                child: ListView(
                  children: [
                    _ProfileRow(
                      title: localizations.organizationProfile,
                      child: EditableProfileData(
                        name: _org.name,
                        imageUrl: _org.imageUrl,
                        avatarBorderRadius: borderRadius4,
                        editable: _membership.hasPermission(
                          clerk.Permission.profileManage,
                        ),
                        onSubmit: _update,
                      ),
                    ),
                  ],
                ),
              ),
              verticalMargin20,
            ],
          );
        },
      ),
    );
  }
}

class _ProfileRow extends StatelessWidget {
  const _ProfileRow({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: topPadding16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 96,
            child: Text(title, maxLines: 2),
          ),
          horizontalMargin8,
          Expanded(child: child),
        ],
      ),
    );
  }
}
