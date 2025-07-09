import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/assets.dart';
import 'package:clerk_flutter/src/utils/clerk_telemetry.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_avatar.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_icon.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_page.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_vertical_card.dart';
import 'package:clerk_flutter/src/widgets/ui/closeable.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/platform_styled_dialog.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:clerk_flutter/src/widgets/user/add_account_panel.dart';
import 'package:clerk_flutter/src/widgets/user/clerk_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:phone_input/phone_input_package.dart';

/// The [ClerkUserButton] renders a list of all users from
/// [clerk.Session]s currently signed in, plus controls to sign
/// out of all sessions
///
class ClerkUserButton extends StatefulWidget {
  /// Construct a [ClerkUserButton]
  const ClerkUserButton({
    super.key,
    this.showName = true,
    this.sessionActions,
    this.additionalActions,
  });

  /// Whether to show the user's name or not
  final bool showName;

  /// Actions to be added as buttons to the session row
  final List<ClerkUserAction>? sessionActions;

  /// Actions to be added as rows to the user panel
  final List<ClerkUserAction>? additionalActions;

  @override
  State<ClerkUserButton> createState() => _ClerkUserButtonState();
}

class _ClerkUserButtonState extends State<ClerkUserButton>
    with ClerkTelemetryStateMixin {
  final _sessions = <clerk.Session>[];

  late final _authState = ClerkAuth.of(context);
  late final _localizations = ClerkAuth.localizationsOf(context);

  @override
  Map<String, dynamic> get telemetryPayload {
    final sessionActions = widget.sessionActions ?? _defaultSessionActions();
    final additionalActions =
        widget.additionalActions ?? _defaultAdditionalActions();
    return {
      'show_name': widget.showName,
      'session_actions': sessionActions.map((a) => a.label).join(';'),
      'additional_actions': additionalActions.map((a) => a.label).join(';'),
    };
  }

  List<ClerkUserAction> _defaultSessionActions() {
    return [
      ClerkUserAction(
        asset: ClerkAssets.gearIcon,
        label: _localizations.profile,
        callback: _manageAccount,
      ),
      ClerkUserAction(
        asset: ClerkAssets.signOutIcon,
        label: _localizations.signOut,
        callback: _signOut,
      ),
      if (_authState.env.organization.isEnabled) //
        ClerkUserAction(
          icon: Icons.group,
          label: _localizations.organizations,
          callback: _listOrganizations,
        ),
    ];
  }

  List<ClerkUserAction> _defaultAdditionalActions() {
    return [
      if (_authState.env.config.singleSessionMode == false)
        ClerkUserAction(
          asset: ClerkAssets.addIcon,
          label: _localizations.addAccount,
          callback: _addAccount,
        ),
    ];
  }

  Future<void> _addAccount(BuildContext context, ClerkAuthState authState) =>
      ClerkPage.show(
        context,
        builder: (context) => AddAccountPanel(
          onDone: (context) => Navigator.of(context).pop(),
        ),
      );

  Future<void> _manageAccount(BuildContext context, ClerkAuthState authState) =>
      ClerkPage.show(
        context,
        builder: (context) => const ClerkUserProfile(),
      );

  Future<void> _listOrganizations(
    BuildContext context,
    ClerkAuthState authState,
  ) =>
      ClerkPage.show(
        context,
        builder: (context) => const ClerkOrganizationList(),
      );

  Future<void> _signOut<T>(
    BuildContext context,
    ClerkAuthState authState,
  ) async {
    final user = authState.user!;
    final result = await PlatformStyledDialog.show(
      context: context,
      title: _localizations.signOutIdentifier(user.name),
      content: _localizations.areYouSure,
      defaultAction: DialogChoice.ok,
      actions: {
        DialogChoice.cancel: _localizations.cancel,
        DialogChoice.ok: _localizations.ok,
      },
    );
    if (result == DialogChoice.ok && context.mounted) {
      if (authState.client.sessions.length == 1) {
        await authState.safelyCall(context, () => authState.signOut());
      } else {
        await authState.safelyCall(
          context,
          () => authState.signOutOf(authState.client.activeSession!),
        );
      }
    }
  }

  Future<void> _signOutOfAllAccounts() async {
    final result = await PlatformStyledDialog.show(
      context: context,
      title: _localizations.signOutOfAllAccounts,
      content: _localizations.areYouSure,
      defaultAction: DialogChoice.cancel,
      actions: {
        DialogChoice.cancel: _localizations.cancel,
        DialogChoice.ok: _localizations.ok,
      },
    );
    if (result == DialogChoice.ok && context.mounted) {
      await _authState.safelyCall(context, () => _authState.signOut());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClerkAuthBuilder(
      builder: (context, authState) {
        final localizations = authState.localizationsOf(context);
        final sessions = authState.client.sessions;

        _sessions.addOrReplaceAll(sessions, by: (s) => s.id);
        final displaySessions = List<clerk.Session>.from(_sessions);

        final sessionActions =
            widget.sessionActions ?? _defaultSessionActions();
        final additionalActions =
            widget.additionalActions ?? _defaultAdditionalActions();

        return ClerkVerticalCard(
          topPortion: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final session in displaySessions)
                _SessionRow(
                  key: Key(session.id),
                  session: session,
                  closed: sessions.contains(session) == false,
                  selected: session == authState.client.activeSession,
                  showName: widget.showName,
                  actions: sessionActions,
                  onTap: () => authState.safelyCall(
                    context,
                    () => authState.activate(session),
                  ),
                  onEnd: (closed) {
                    if (closed) _sessions.remove(session);
                  },
                ),
              for (final action in additionalActions)
                Padding(
                  padding: allPadding16,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => action.callback(context, authState),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _Icon(action: action, size: 16),
                        horizontalMargin32,
                        Text(
                          action.label,
                          style: ClerkTextStyle.buttonTitleDark,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          bottomPortion: Closeable(
            closed: sessions.length <= 1,
            child: Padding(
              padding: horizontalPadding16 + verticalPadding12,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _signOutOfAllAccounts,
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      color: ClerkColors.grey,
                      size: 16,
                    ),
                    horizontalMargin8,
                    Text(
                      localizations.signOutOfAllAccounts,
                      style: ClerkTextStyle.buttonTitle,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon({required this.action, required this.size});

  final ClerkUserAction action;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (action.asset case String asset) {
      return ClerkIcon(asset, size: size);
    }
    if (action.icon case IconData icon) {
      return Icon(icon, size: size + 4);
    }
    return emptyWidget;
  }
}

class _SessionRow extends StatelessWidget {
  const _SessionRow({
    super.key,
    required this.session,
    required this.closed,
    required this.onTap,
    required this.onEnd,
    required this.actions,
    this.selected = false,
    this.showName = true,
  });

  final clerk.Session session;
  final bool closed;
  final bool selected;
  final bool showName;
  final List<ClerkUserAction> actions;
  final VoidCallback onTap;
  final ValueChanged<bool> onEnd;

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    final user = session.user;
    return Closeable(
      closed: closed,
      onEnd: onEnd,
      child: Padding(
        padding: topPadding8,
        child: Column(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onTap,
              child: Padding(
                padding: horizontalPadding16 + bottomPadding8,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClerkAvatar(name: user.name, imageUrl: user.imageUrl),
                    horizontalMargin16,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (showName && user.hasName)
                          Text(
                            user.name,
                            style: ClerkTextStyle.buttonTitleDark,
                          ),
                        if (user.email is String || user.phoneNumber is String)
                          Text(
                            user.email ??
                                PhoneNumber.parse(user.phoneNumber!)
                                    .intlFormattedNsn,
                            style: ClerkTextStyle.buttonTitle,
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            if (actions.isNotEmpty) //
              Closeable(
                closed: selected == false,
                child: Padding(
                  padding: horizontalPadding12 + leftPadding48 + bottomPadding8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      for (final action in actions)
                        Expanded(
                          child: Padding(
                            padding: horizontalPadding4,
                            child: ClerkMaterialButton(
                              onPressed: () =>
                                  action.callback(context, authState),
                              label: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _Icon(action: action, size: 10),
                                  horizontalMargin4,
                                  Padding(
                                    padding: topPadding2,
                                    child: Text(
                                      action.label,
                                      style: ClerkTextStyle.buttonTitleDark
                                          .copyWith(fontSize: 8),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              style: ClerkMaterialButtonStyle.light,
                              height: 16,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            const Divider(height: 1, color: ClerkColors.dawnPink),
          ],
        ),
      ),
    );
  }
}
