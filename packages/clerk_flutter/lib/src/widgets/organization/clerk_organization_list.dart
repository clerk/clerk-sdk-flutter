import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/assets.dart';
import 'package:flutter/material.dart';

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
  late clerk.User _user = widget.initialUser;
  clerk.User? _nextUser;

  @override
  Map<String, dynamic> get telemetryPayload {
    final actions = widget.actions ?? _defaultActions();
    return {
      'actions': actions.map((a) => a.label).join(';'),
    };
  }

  List<ClerkUserAction> _defaultActions() {
    final authState = ClerkAuth.of(context);
    return [
      ClerkUserAction(
        asset: ClerkAssets.addIcon,
        label: authState.translator.translate('Create organization'),
        callback: _createOrganization,
      ),
    ];
  }

  Future<void> _createOrganization(
    BuildContext context,
    ClerkAuthState auth,
  ) async {
    final translator = auth.translator;

    String name = '';

    final submitted = await ClerkInputDialog.show(
      context,
      child: ClerkTextFormField(
        label: translator.translate(
          'What would you like to call your organization?',
        ),
        autofocus: true,
        onChanged: (text) => name = text,
        onSubmit: (_) => Navigator.of(context).pop(true),
      ),
    );

    if (submitted && name.isNotEmpty) {
      await auth.createOrganizationFor(_user, name: name);
    }
  }

  void _setNextUser(List<clerk.Session> sessions) {
    final idx = sessions.indexWhere((s) => s.user == _user);
    final user = sessions[(idx + 1) % sessions.length].user;
    setState(() => _nextUser = user);
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
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: ClerkColors.white,
        boxShadow: [BoxShadow(color: ClerkColors.mercury, blurRadius: 15)],
      ),
      child: ClerkAuthBuilder(
        builder: (context, auth) {
          final translator = auth.translator;
          final sessions = auth.client.sessions;
          _user = auth.client.sessionFor(_user)!.user; // ensure latest version
          final memberships = _user.organizationMemberships ?? [];

          final nextUserIsPending = _nextUser is clerk.User;

          final actions = widget.actions ?? _defaultActions();

          return ClerkVerticalCard(
            topPortion: ClerkPanelHeader(
              subtitle: translator.translate(
                'Select the account with which you wish to continue',
              ),
            ),
            middlePortion: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                narrowDivider,
                if (nextUserIsPending) //
                  Stack(
                    children: [
                      _UserRow(user: _user),
                      Align(
                        alignment: Alignment.topRight,
                        child: AnimatedCloseable(
                          closed: false,
                          axis: ClosingAxis.horizontal,
                          onEnd: (_) => _transitionUser(),
                          child: _UserRow(user: _nextUser!, bordered: true),
                        ),
                      ),
                    ],
                  )
                else //
                  _UserRow(
                    user: _user,
                    onChange: () => _setNextUser(sessions),
                    allowChange: sessions.length > 1,
                  ),
                narrowDivider,
                if (memberships.isNotEmpty) //
                  for (final membership in memberships) //
                    AnimatedCloseable(
                      closed: nextUserIsPending,
                      child: Column(
                        children: [
                          _MembershipRow(membership: membership),
                          narrowDivider,
                        ],
                      ),
                    ),
                for (final action in actions) ...[
                  ClerkActionRow(action: action),
                  narrowDivider,
                ]
              ],
            ),
          );
        },
      ),
    );
  }
}

class _UserRow extends StatelessWidget {
  const _UserRow({
    required this.user,
    this.onChange,
    this.bordered = false,
    this.allowChange = true,
  });

  final clerk.User user;

  final VoidCallback? onChange;

  final bool bordered;

  final bool allowChange;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ClerkColors.alabaster,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: bordered
              ? const Border(
                  left: BorderSide(width: 1, color: ClerkColors.dawnPink),
                )
              : null,
        ),
        child: Padding(
          padding: verticalPadding12 + horizontalPadding16,
          child: Row(
            children: [
              ClerkAvatar(
                user: user,
                borderRadius: BorderRadius.circular(4),
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
              if (allowChange) //
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onChange,
                  child: const ClerkIcon(
                    ClerkAssets.arrowRightIcon,
                    size: 8,
                  ),
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
    return Padding(
      padding: verticalPadding12 + horizontalPadding16,
      child: Row(
        children: [
          SizedBox.square(
            dimension: 32,
            child: org.logoUrl.isNotEmpty
                ? Image.network(org.logoUrl)
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
                membership.displayRole,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: ClerkTextStyle.buttonTitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
