import 'package:clerk_flutter/src/assets.dart';
import 'package:clerk_flutter/src/widgets/common.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_icon.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_profile_nav_tile.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_two_panel_view.dart';
import 'package:clerk_flutter/src/widgets/ui/random_avatar.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/material.dart';

/// The [ClerkUserProfileWidget] component is used to render a beautiful, full-featured
/// account management UI that allows users to manage their profile and security settings.
///
@immutable
class ClerkUserProfileWidget extends StatelessWidget {
  /// Constructs a const [ClerkUserProfileWidget].
  const ClerkUserProfileWidget({super.key});

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
                'Account',
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
                'Manage your account info.',
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
              icon: ClerkIcon(ClerkAssets.profileIcon),
              title: 'Profile',
              selected: true,
            ),
          ),
          Padding(
            padding: horizontalPadding24,
            child: ProfileNavTile(
              icon: ClerkIcon(ClerkAssets.securityIconLight),
              title: 'Security',
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
    final primaryTag = DecoratedBox(
      decoration: insetBoxShadowDecoration.copyWith(
        color: ClerkColors.desertStorm,
        borderRadius: borderRadius4,
      ),
      child: Padding(
        padding: verticalPadding4 + horizontalPadding8,
        child: const Text(
          'Primary',
          maxLines: 1,
          style: TextStyle(color: ClerkColors.mountainMist),
        ),
      ),
    );
    return DefaultTextStyle(
      style: ClerkTextStyle.subtitleDark.copyWith(height: 1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          verticalMargin32,
          const Padding(
            padding: horizontalPadding32,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Profile details',
                maxLines: 1,
                style: ClerkTextStyle.title,
              ),
            ),
          ),
          paddedDivider,
          const Padding(
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
                      RandomAvatar(
                        seed: 'Jason Dias',
                        size: 48.0,
                      ),
                      horizontalMargin16,
                      Text('Jason Dias', maxLines: 1),
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
                const SizedBox(
                  width: firstColumnWidth,
                  child: Text('Email addresses', maxLines: 1),
                ),
                SizedBox(
                  width: secondColumnWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          const Text('example@clerk.dev', maxLines: 1),
                          horizontalMargin8,
                          primaryTag,
                        ],
                      ),
                      verticalMargin20,
                      const Text('example@personal.com', maxLines: 1),
                      verticalMargin20,
                      const Text('example@work.com', maxLines: 1),
                      verticalMargin20,
                      const Row(
                        children: [
                          ClerkIcon(ClerkAssets.addIconSimpleLight, size: 10.0),
                          horizontalMargin12,
                          Text('Add email address', maxLines: 1),
                        ],
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
                const SizedBox(
                  width: firstColumnWidth,
                  child: Text('Phone numbers', maxLines: 1),
                ),
                SizedBox(
                  width: secondColumnWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          const Text('+1 (555) 123-4567', maxLines: 1),
                          horizontalMargin8,
                          primaryTag,
                        ],
                      ),
                      verticalMargin20,
                      const Row(
                        children: [
                          ClerkIcon(ClerkAssets.addIconSimpleLight, size: 10.0),
                          horizontalMargin12,
                          Text('Add phone number', maxLines: 1),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          paddedDivider,
          const Padding(
            padding: horizontalPadding32,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: firstColumnWidth,
                  child: Text('Connected accounts', maxLines: 1),
                ),
                SizedBox(
                  width: secondColumnWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClerkIcon(ClerkAssets.googleLogoColor, size: 14.0),
                          horizontalMargin4,
                          Text('Google', maxLines: 1),
                          horizontalMargin8,
                          ClerkIcon(ClerkAssets.dotIcon, size: 4.0),
                          horizontalMargin8,
                          Text(
                            'example@email.com',
                            maxLines: 1,
                            style: TextStyle(color: ClerkColors.mountainMist),
                          ),
                        ],
                      ),
                      verticalMargin20,
                      Row(
                        children: [
                          ClerkIcon(ClerkAssets.addIconSimpleLight, size: 10.0),
                          horizontalMargin12,
                          Text('Connect account', maxLines: 1),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
