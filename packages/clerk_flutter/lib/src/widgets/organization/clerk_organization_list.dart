import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/assets.dart';
import 'package:clerk_flutter/src/utils/clerk_telemetry.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_action_row.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_avatar.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_icon.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_panel_header.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_vertical_card.dart';
import 'package:clerk_flutter/src/widgets/ui/closeable.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
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
    required this.initialUser,
  });

  /// Actions to be taken around organizations
  final List<ClerkUserAction>? actions;

  /// The initial user whose orgs will be listed
  final clerk.User initialUser;

  @override
  State<ClerkOrganizationList> createState() => _ClerkOrganizationListState();
}

class _ClerkOrganizationListState extends State<ClerkOrganizationList>
    with ClerkTelemetryStateMixin {
  ClerkAuthState? _authState;
  ClerkSdkLocalizations? _localizations;
  late clerk.User _user = widget.initialUser;
  clerk.User? _nextUser;

  bool get _nextUserIsPending => _nextUser is clerk.User;

  @override
  Map<String, dynamic> get telemetryPayload {
    final actions = widget.actions ?? _defaultActions();
    return {
      'actions': actions.map((a) => a.label).join(';'),
    };
  }

  List<ClerkUserAction> _defaultActions() {
    _authState ??= ClerkAuth.of(context);
    _localizations ??= ClerkAuth.localizationsOf(context);
    return [
      if (_authState!.user?.createOrganizationEnabled == true) //
        ClerkUserAction(
          asset: ClerkAssets.addIcon,
          label: _localizations!.createOrganization,
          callback: _createOrganization,
        ),
    ];
  }

  Future<void> _createOrganization(
    BuildContext context,
    ClerkAuthState authState,
  ) async {
    final orgData = await CreateOrganizationPanel.show(context);
    if (orgData case OrganizationData orgData) {
      await authState.createOrganizationFor(
        _user,
        name: orgData.name,
        slug: orgData.slug,
        image: orgData.image,
      );
    }
  }

  void _setNextUser(List<clerk.Session> sessions) {
    if (_nextUserIsPending == false) {
      final idx = sessions.indexWhere((s) => s.user == _user);
      final user = sessions[(idx + 1) % sessions.length].user;
      setState(() => _nextUser = user);
    }
  }

  void _transitionUser() {
    if (_nextUser case clerk.User nextUser) {
      setState(() {
        _user = nextUser;
        _nextUser = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = ClerkAuth.localizationsOf(context);
    return ClerkAuthBuilder(
      builder: (context, authState) {
        final sessions = authState.client.sessions;

        _user = authState.client.refreshUser(_user); // ensure latest version

        final memberships = _user.organizationMemberships ?? [];

        final actions = widget.actions ?? _defaultActions();

        return ClerkVerticalCard(
          topPortion: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClerkPanelHeader(subtitle: localizations.selectAccount),
              if (_nextUserIsPending) //
                Stack(
                  children: [
                    _UserRow(
                      key: Key(_user.id),
                      user: _user,
                      onChange: () => _setNextUser(sessions),
                    ),
                    if (_nextUserIsPending) //
                      Align(
                        alignment: Alignment.topRight,
                          child: Closeable(
                          closed: false,
                          animateToFirstPosition: true,
                          axis: ClosingAxis.horizontal,
                          onEnd: (_) => _transitionUser(),
                          child: _UserRow(user: _nextUser!, bordered: true),
                        ),
                      ),
                  ],
                )
              else
                _UserRow(
                  key: Key(_user.id),
                  user: _user,
                  onChange: () => _setNextUser(sessions),
                  onChangeEnabled: sessions.length > 1,
                ),
              for (final membership in memberships) //
                  Closeable(
                  key: Key(membership.id),
                  closed: _nextUserIsPending,
                  animateToFirstPosition: true,
                  child: _MembershipRow(membership: membership),
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

class _UserRow extends StatelessWidget {
  const _UserRow({
    super.key,
    required this.user,
    this.onChange,
    this.bordered = false,
    this.onChangeEnabled = true,
  });

  final clerk.User user;

  final VoidCallback? onChange;

  final bool bordered;

  final bool onChangeEnabled;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ClerkColors.alabaster,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            left: bordered ? _borderSide : BorderSide.none,
            bottom: _borderSide,
            top: _borderSide,
          ),
        ),
        child: Padding(
          padding: verticalPadding12 + horizontalPadding16,
          child: Row(
            children: [
              ClerkAvatar(
                user: user,
                borderRadius: BorderRadius.circular(6),
              ),
              horizontalMargin16,
              Expanded(
                child: Text(
                  user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: ClerkTextStyle.buttonTitleDark,
                ),
              ),
              if (onChangeEnabled) //
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onChange,
                  child: const ClerkIcon(ClerkAssets.arrowRightIcon, size: 8),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MembershipRow extends StatelessWidget {
  const _MembershipRow({required this.membership});

  final clerk.OrganizationMembership membership;

  clerk.Organization get org => membership.organization;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(bottom: _borderSide),
      ),
      child: Padding(
        padding: verticalPadding12 + horizontalPadding16,
        child: Row(
          children: [
            SizedBox.square(
              dimension: 32,
              child: org.logoUrl.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(org.logoUrl, fit: BoxFit.cover),
                    )
                  : defaultOrgLogo,
            ),
            horizontalMargin16,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  org.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: ClerkTextStyle.buttonTitleDark,
                ),
                Text(
                  membership.roleName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: ClerkTextStyle.buttonTitle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
