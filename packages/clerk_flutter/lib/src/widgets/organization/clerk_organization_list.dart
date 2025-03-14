import 'dart:async';
import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/assets.dart';
import 'package:clerk_flutter/src/utils/clerk_telemetry.dart';
import 'package:clerk_flutter/src/utils/localization_extensions.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_action_row.dart';
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
  late final ClerkAuthState _authState = ClerkAuth.of(context);
  late final ClerkSdkLocalizations _localizations =
      ClerkAuth.localizationsOf(context);

  final _organizations = <_Organization>[];
  final _invitations = <clerk.OrganizationInvitation>[];
  _Organization? _currentOrg;
  _Organization? _previousOrg;
  _Organization? _currentlyAccepting;
  Timer? _invitationsRefreshTimer;

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
      builder: (context) => CreateOrganizationPanel(
        onSubmit: (String name, String? slug, File? image) async {
          await authState.safelyCall(
            context,
            () => authState.createOrganization(
              name: name,
              slug: slug,
              logo: image,
            ),
          );
        },
      ),
    );
  }

  Future<void> _editCurrentOrg() async {
    final membership = _authState.user!.organizationMemberships!.firstWhere(
      (o) => o.id == _currentOrg?.id,
    );
    await ClerkPage.show(
      context,
      builder: (context) => ClerkOrganizationProfile(membership: membership),
    );
  }

  void _selectOrg([_Organization? org]) {
    setState(() {
      _previousOrg = _currentOrg;
      _currentOrg = org;
    });
  }

  bool get _shouldRefreshInvitation =>
      _authState.config.clientRefreshPeriod.isNotZero;

  Future<void> _fetchInvitations() async {
    _invitationsRefreshTimer?.cancel();
    if (_shouldRefreshInvitation) {
      final invitations = await _authState.fetchOrganizationInvitations();
      _invitations.addOrReplaceAll(invitations, by: (i) => i.id);
      setState(() {});
      _invitationsRefreshTimer = Timer(
        _authState.config.clientRefreshPeriod,
        _fetchInvitations,
      );
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
            [];
        _currentOrg = _currentOrg is _Organization
            ? orgs.firstWhereOrNull((o) => o.id == _currentOrg?.id)
            : null;
        final currentIsPersonal = _currentOrg == null;

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
                  startsClosed: true,
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
              _OrganizationRow(
                key: const Key('personal'),
                organization: _Organization(
                  name: _localizations.personalAccount,
                  imageUrl: user.imageUrl,
                ),
                onTap: currentIsPersonal ? null : _selectOrg,
              ),
              for (final org in _organizations) //
                Closeable(
                  key: Key(org.id),
                  closed: org == _currentOrg || orgs.doesNotContain(org),
                  child: _OrganizationRow(
                    key: Key(org.orgId),
                    organization: org,
                    onTap: () => _selectOrg(org),
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
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
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
                child: organization.imageUrl?.isNotEmpty == true
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          organization.imageUrl!,
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
                      organization.name,
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
    required this.name,
    this.status = clerk.Status.complete,
    this.id = '',
    this.orgId = '',
    this.imageUrl,
    this.roleName,
  });

  final String id;
  final String orgId;
  final String name;
  final String? imageUrl;
  final String? roleName;
  final clerk.Status status;

  static _Organization fromMembership(
    clerk.OrganizationMembership membership,
  ) =>
      _Organization(
        id: membership.id,
        orgId: membership.organization.id,
        name: membership.organization.name,
        roleName: membership.roleName,
        imageUrl: membership.organization.imageUrl,
      );

  static _Organization fromInvitation(
    clerk.OrganizationInvitation invitation,
    ClerkSdkLocalizations localizations,
  ) =>
      _Organization(
        id: invitation.id,
        orgId: invitation.orgId,
        name: invitation.name,
        roleName:
            '${invitation.roleName} (${invitation.status.localizedMessage(localizations)})',
        imageUrl: invitation.hasImage ? invitation.imageUrl : null,
        status: invitation.status,
      );

  @override
  int get hashCode => orgId.hashCode;

  @override
  operator ==(dynamic other) => other is _Organization && orgId == other.orgId;
}
