// ignore_for_file: prefer_const_constructors

import 'package:clerk_flutter/src/assets.dart';
import 'package:clerk_flutter/src/widgets/common.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_icon.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_vertical_card.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// The [ClerkOrganizationSwitcherWidget] component allows a user to switch between their
/// account types - their personal account and their joined organizations. This component
/// is useful for applications that have a multi-tenant architecture, where users can be
/// part of multiple organizations.
///
@Deprecated('Not ready for use')
@immutable
class ClerkOrganizationSwitcherWidget extends StatelessWidget {
  /// Constructs a const [ClerkOrganizationSwitcherWidget].
  const ClerkOrganizationSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final width = screenWidth < 400.0 ? screenWidth : 380.0;
    return Align(
      alignment: Alignment.topLeft,
      child: MenuAnchor(
        alignmentOffset: const Offset(0.0, 8.0),
        style: MenuStyle(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
        ),
        menuChildren: [
          SizedBox(
            width: width,
            child: ClerkVerticalCard(
              topPortion: _TopPortion(),
            ),
          ),
        ],
        builder:
            (BuildContext context, MenuController controller, Widget? child) {
          return GestureDetector(
            onTap: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            child: child,
          );
        },
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200.0),
          child: Material(
            borderRadius: borderRadius8,
            clipBehavior: Clip.antiAlias,
            color: ClerkColors.whiteSmoke,
            child: Padding(
              padding: verticalPadding4 + horizontalPadding8,
              child: Row(
                children: [
                  SvgPicture.asset(
                    ClerkAssets.clerkSampleAppIcon,
                    height: 16.0,
                    width: 14.0,
                    package: 'clerk_flutter',
                  ),
                  horizontalMargin8,
                  const Expanded(
                    child: Text(
                      'Clerk Sample Apps',
                      maxLines: 1,
                      style: ClerkTextStyle.subtitle,
                    ),
                  ),
                  horizontalMargin8,
                  const ClerkIcon(
                    ClerkAssets.chevronDownIcon,
                    size: 8.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

typedef _OrganizationData = ({String name, Widget icon, bool member});

@immutable
class _TopPortion extends StatelessWidget {
  const _TopPortion();

  static final _organizations = [
    (
      name: 'Test org',
      icon: SizedBox.square(
        dimension: 36.0,
        child: Material(
          borderRadius: borderRadius8,
          color: ClerkColors.softPeach,
          child: Center(
            child: ClerkIcon(
              ClerkAssets.generalIcon,
              size: 18.0,
            ),
          ),
        ),
      ),
      member: true,
    ),
    (
      name: 'Personal Account',
      icon: SizedBox.square(
        dimension: 36.0,
        child: Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: borderRadius8,
          color: ClerkColors.softPeach,
          child: SvgPicture.network(
            'https://api.dicebear.com/9.x/dylan/svg?seed=personal_account',
          ),
        ),
      ),
      member: false,
    ),
    (
      name: 'Test',
      icon: SizedBox.square(
        dimension: 36.0,
        child: ClerkIcon(
          ClerkAssets.clerkSampleAppIcon,
          size: 36.0,
        ),
      ),
      member: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final organization in _organizations) ...[
            _OrganizationTile(organization: organization),
            divider
          ],
          Padding(
            padding: verticalPadding16 + horizontalPadding20,
            child: Row(
              children: const [
                ClerkIcon(ClerkAssets.addIcon, size: 24.0),
                horizontalMargin8,
                Text('Create organization', maxLines: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

@immutable
class _OrganizationTile extends StatefulWidget {
  const _OrganizationTile({required this.organization});

  final _OrganizationData organization;

  @override
  State<_OrganizationTile> createState() => _OrganizationTileState();
}

class _OrganizationTileState extends State<_OrganizationTile> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Material(
        color: _hovering ? ClerkColors.alabaster : null,
        child: Padding(
          padding: verticalPadding16 + horizontalPadding20,
          child: Row(
            children: [
              widget.organization.icon,
              horizontalMargin12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.organization.name,
                      style: ClerkTextStyle.subtitleDark,
                      maxLines: 1,
                    ),
                    if (widget.organization.member)
                      Text(
                        'Member',
                        style: ClerkTextStyle.subtitle,
                        maxLines: 1,
                      ),
                  ],
                ),
              ),
              if (widget.organization.member) ...[
                horizontalMargin12,
                ClerkMaterialButton(
                  style: ClerkMaterialButtonStyle.light,
                  label: ClerkIcon(ClerkAssets.gearIcon, size: 12.0),
                  square: true,
                ),
              ] else if (_hovering) ...[
                horizontalMargin12,
                ClerkIcon(ClerkAssets.arrowRightIcon, size: 10.0),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
