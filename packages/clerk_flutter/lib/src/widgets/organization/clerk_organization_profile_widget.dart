import 'package:clerk_flutter/src/assets.dart';
import 'package:clerk_flutter/src/widgets/common.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_icon.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_profile_nav_tile.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_two_panel_view.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/material.dart';

/// The [OrganizationProfile] component is used to render a beautiful, full-featured
/// organization management UI that allows users to manage their organization profile and
/// security settings.
///
@Deprecated('Not ready for use')
@immutable
class ClerkOrganizationProfileWidget extends StatelessWidget {
  /// Constructs a const [ClerkOrganizationProfileWidget].
  const ClerkOrganizationProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClerkTwoPanelView(
      firstChild: _FirstChild(),
      secondChild: _SecondChild(),
    );
  }
}

@immutable
class _FirstChild extends StatelessWidget {
  const _FirstChild();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalMargin32,
          Padding(
            padding: horizontalPadding24,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Organization',
                textAlign: TextAlign.center,
                maxLines: 1,
                style: ClerkTextStyle.title,
              ),
            ),
          ),
          Padding(
            padding: horizontalPadding24,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Manage your organization',
                textAlign: TextAlign.center,
                maxLines: 1,
                style: ClerkTextStyle.subtitle,
              ),
            ),
          ),
          verticalMargin24,
          Padding(
            padding: horizontalPadding24,
            child: ProfileNavTile(
              icon: ClerkIcon(ClerkAssets.generalIconSelected),
              title: 'General',
              selected: true,
            ),
          ),
          Padding(
            padding: horizontalPadding24,
            child: ProfileNavTile(
              icon: ClerkIcon(ClerkAssets.membersIcon),
              title: 'Members',
              selected: false,
            ),
          ),
        ],
      ),
    );
  }
}

@immutable
class _SecondChild extends StatelessWidget {
  const _SecondChild();

  @override
  Widget build(BuildContext context) {
    const paddedDivider = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        verticalMargin20,
        Padding(
          padding: horizontalPadding32,
          child: divider,
        ),
        verticalMargin20,
      ],
    );
    return DefaultTextStyle(
      style: ClerkTextStyle.subtitleDark.copyWith(height: 1.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          verticalMargin32,
          Padding(
            padding: horizontalPadding32,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Organization profile',
                maxLines: 1,
                style: ClerkTextStyle.title,
              ),
            ),
          ),
          paddedDivider,
          Padding(
            padding: horizontalPadding32,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: firstColumnWidth,
                  child: Text('Profile', maxLines: 1),
                ),
                // FIXME(drexel-ue): replace wth real data.
                SizedBox(
                  width: secondColumnWidth,
                  child: Row(
                    children: [
                      ClerkIcon(
                        ClerkAssets.clerkSampleAppIcon,
                        size: 48.0,
                      ),
                      horizontalMargin16,
                      Text('Clerk Sample App', maxLines: 1),
                    ],
                  ),
                ),
                spacer,
                Text(
                  'Edit Profile',
                  maxLines: 1,
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ),
          paddedDivider,
          Padding(
            padding: horizontalPadding32,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: firstColumnWidth,
                  child: Text('Verified domains', maxLines: 1),
                ),
                SizedBox(
                  width: secondColumnWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          ClerkIcon(ClerkAssets.addIconSimpleLight, size: 10.0),
                          horizontalMargin12,
                          Text('Add domain', maxLines: 1),
                        ],
                      ),
                      verticalMargin10,
                      Text(
                        'Allow users to join the organization automatically or request to join '
                        'based on a verified email domain.',
                        style: TextStyle(color: ClerkColors.mountainMist),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          paddedDivider,
          Padding(
            padding: horizontalPadding32,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: firstColumnWidth,
                  child: Text('Leave organization', maxLines: 1),
                ),
                Text(
                  'Leave',
                  maxLines: 1,
                  style: TextStyle(color: ClerkColors.carminePink),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
