import 'dart:async';
import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/assets.dart';
import 'package:clerk_flutter/src/utils/clerk_telemetry.dart';
import 'package:clerk_flutter/src/utils/localization_extensions.dart';
import 'package:clerk_flutter/src/widgets/organization/clerk_organization_profile.dart';
import 'package:clerk_flutter/src/widgets/organization/create_organization_panel.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_action_row.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_cached_image.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_icon.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_page.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_panel_header.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_row_label.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_vertical_card.dart';
import 'package:clerk_flutter/src/widgets/ui/closeable.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

const _borderSide = BorderSide(width: 0.5, color: ClerkColors.dawnPink);

/// The [ClerkOrganizationList] renders a list of all users from
/// [clerk.Session]s currently signed in, plus controls to sign
/// out of all sessions
///
class ClerkOrganizationList extends StatefulWidget {
  /// Construct a [ClerkOrganizationList]
  const ClerkOrganizationList({
    super.key,
    this.actions,
  });

  /// Actions to be taken around organizations
  final List<ClerkUserAction>? actions;

  @override
  State<ClerkOrganizationList> createState() => _ClerkOrganizationListState();
}

class _ClerkOrganizationListState extends State<ClerkOrganizationList>
    with ClerkTelemetryStateMixin {
  late final ClerkAuthState _authState = ClerkAuth.of(context, listen: false);
  late final ClerkSdkLocalizations _localizations =
      ClerkAuth.localizationsOf(context);

  final _organizations = <_Organization>[];
  final _invitations = <clerk.OrganizationInvitation>[];
  _Organization? _currentOrg;
  _Organization? _previousOrg;
  _Organization? _currentlyAccepting;
  Timer? _invitationsRefreshTimer;
  bool _isFirstBuild = true;

  static const _editArrow = Padding(
    padding: allPadding8,
    child: ClerkIcon(ClerkAssets.arrowRightIcon, size: 10.0),
  );

  @override
  Map<String, dynamic> get telemetryPayload {
    final actions = widget.actions ?? _defaultActions();
    return {
      'actions': actions.map((a) => a.label).join(';'),
    };
  }

  bool get _isAfterFirstBuild {
    if (_isFirstBuild) {
      _isFirstBuild = false; // for next time
      return false;
    }

    return true;
  }

  List<ClerkUserAction> _defaultActions() {
    return [
      if (_authState.user?.createOrganizationEnabled == true) //
        ClerkUserAction(
          asset: ClerkAssets.addIcon,
          label: _localizations.createOrganization,
          callback: _createOrganization,
        ),
    ];
  }

  Future<void> _createOrganization(
    BuildContext context,
    ClerkAuthState authState,
  ) async {
    await ClerkPage.show(
      context,
      builder: (context) => ClerkVerticalCard(
        topPortion: CreateOrganizationPanel(
          onSubmit: (String name, String slug, File? image) async {
            await authState.safelyCall(
              context,
              () => authState.createOrganization(
                name: name,
                slug: slug,
                logo: image,
              ),
            );
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
  }

  Future<void> _editCurrentOrg(_Organization organization) async {
    final membership = _authState.user!.organizationMemberships!.firstWhere(
      (o) => o.id == organization.id,
    );
    await ClerkPage.show(
      context,
      builder: (context) => ClerkOrganizationProfile(membership: membership),
    );
  }

  Future<void> _selectOrg(_Organization org) async {
    if (org != _currentOrg) {
      final authState = ClerkAuth.of(context, listen: false);
      await authState.safelyCall(
        context,
        () => authState.setActiveOrganization(org.organization),
      );
      _previousOrg = _currentOrg;
    }
  }

  bool get _shouldRefreshInvitation =>
      _authState.config.clientRefreshPeriod.isNotZero;

  Future<void> _fetchInvitations() async {
    _invitationsRefreshTimer?.cancel();
    if (_shouldRefreshInvitation) {
      final invitations = await _authState.fetchOrganizationInvitations();
      _invitations.addOrReplaceAll(invitations, by: (i) => i.id);
      setState(() {});
      _invitationsRefreshTimer =
          Timer(_authState.config.clientRefreshPeriod, _fetchInvitations);
    }
  }

  Future<void> _acceptInvitation(_Organization org) async {
    final invitation = _invitations.firstWhereOrNull((i) => i.id == org.id);
    if (invitation case clerk.OrganizationInvitation invitation) {
      setState(() => _currentlyAccepting = org);
      await _authState.acceptOrganizationInvitation(invitation);
    }
  }

  _Organization _invToOrg(clerk.OrganizationInvitation inv) =>
      _Organization.fromInvitation(inv, _localizations);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_shouldRefreshInvitation && _invitationsRefreshTimer == null) {
      _fetchInvitations();
    }
  }

  @override
  void dispose() {
    _invitationsRefreshTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClerkAuthBuilder(
      builder: (_, __) => emptyWidget,
      signedInBuilder: (context, authState) {
        final user = authState.user!;
        final orgs = user.organizationMemberships
                ?.map(_Organization.fromMembership)
                .toList() ??
            const [];
        final currentOrgId = authState.session?.lastActiveOrganizationId;
        _currentOrg = orgs.firstWhereOrNull((o) => o.orgId == currentOrgId);

        _organizations.addOrReplaceAll(orgs, by: (m) => m.orgId);
        _organizations.sortBy((a) => a.name);

        final actions = widget.actions ?? _defaultActions();

        /// Tidy up once all the widgets have closed
        Future.delayed(
          Closeable.defaultDuration,
          () => _organizations.removeWhere(orgs.doesNotContain),
        );

        return ClerkVerticalCard(
          topPortion: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClerkPanelHeader(subtitle: _localizations.selectAccount),
              narrowDivider,
              if (_currentOrg case _Organization current) //
                Closeable(
                  key: Key('current:${current.orgId}'),
                  closed: false,
                  startsClosed: _isAfterFirstBuild,
                  child: _OrganizationRow(
                    organization: current,
                    onTap: _editCurrentOrg,
                    trailing: _editArrow,
                  ),
                ),
              if (_previousOrg case _Organization previous) //
                Closeable(
                  key: Key('previous:${previous.orgId}'),
                  closed: true,
                  startsClosed: false,
                  child: _OrganizationRow(organization: previous),
                ),
              if (authState.env.organization.allowsPersonalOrgs) //
                _OrganizationRow(
                  key: const Key('personal'),
                  organization: const _Organization(
                    organization: clerk.Organization.personal,
                  ),
                  onTap: _selectOrg,
                ),
              for (final org in _organizations) //
                Closeable(
                  key: Key(org.id),
                  closed: org == _currentOrg || orgs.doesNotContain(org),
                  child: _OrganizationRow(
                    key: Key(org.orgId),
                    organization: org,
                    onTap: _selectOrg,
                  ),
                ),
              for (final invitation in _invitations.map(_invToOrg)) //
                Closeable(
                  key: Key(invitation.id),
                  closed: invitation == _currentlyAccepting ||
                      invitation.status != clerk.Status.pending ||
                      orgs.contains(invitation),
                  startsClosed: true,
                  child: _OrganizationRow(
                    key: Key(invitation.orgId),
                    organization: invitation,
                    trailing: ClerkRowLabel(
                      label: _localizations.join,
                      onTap: () => _acceptInvitation(invitation),
                    ),
                  ),
                ),
              for (final action in actions) ...[
                ClerkActionRow(action: action),
                narrowDivider,
              ],
            ],
          ),
        );
      },
    );
  }
}

class _OrganizationRow extends StatelessWidget {
  const _OrganizationRow({
    super.key,
    required this.organization,
    this.onTap,
    this.trailing,
  });

  final _Organization organization;
  final ValueChanged<_Organization>? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context, listen: false);
    final imageUrl = organization.isPersonal
        ? authState.user?.imageUrl
        : organization.imageUrl;
    final name = organization.isPersonal
        ? authState.localizationsOf(context).personalAccount
        : organization.name;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap?.call(organization),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(bottom: _borderSide),
        ),
        child: Padding(
          padding: verticalPadding12 + horizontalPadding16,
          child: Row(
            children: [
              SizedBox.square(
                dimension: 32,
                child: imageUrl?.isNotEmpty == true
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: ClerkCachedImage(
                          imageUrl!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : defaultOrgLogo,
              ),
              horizontalMargin16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: ClerkTextStyle.buttonTitleDark,
                    ),
                    if (organization.roleName case String roleName) //
                      Text(
                        roleName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ClerkTextStyle.buttonTitle,
                      ),
                  ],
                ),
              ),
              if (trailing case Widget trailing) //
                trailing,
            ],
          ),
        ),
      ),
    );
  }
}

class _Organization {
  const _Organization({
    required this.organization,
    this.status = clerk.Status.complete,
    this.id = '',
    this.roleName,
  });

  final String id;
  final String? roleName;
  final clerk.Organization organization;
  final clerk.Status status;

  String get name => organization.name;

  String get orgId => organization.id;

  String? get imageUrl => organization.hasImage ? organization.imageUrl : null;

  bool get isPersonal => organization.isPersonal;

  static _Organization fromMembership(
    clerk.OrganizationMembership membership,
  ) =>
      _Organization(
        id: membership.id,
        organization: membership.organization,
        roleName: membership.roleName,
      );

  static _Organization fromInvitation(
    clerk.OrganizationInvitation invitation,
    ClerkSdkLocalizations localizations,
  ) =>
      _Organization(
        id: invitation.id,
        organization: invitation.organization,
        roleName:
            '${invitation.roleName} (${invitation.status.localizedMessage(localizations)})',
        status: invitation.status,
      );

  @override
  int get hashCode => organization.hashCode;

  @override
  operator ==(Object other) =>
      other is _Organization && organization == other.organization;
}
