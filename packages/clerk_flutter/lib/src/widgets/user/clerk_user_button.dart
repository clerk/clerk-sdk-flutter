import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/assets.dart';
import 'package:flutter/material.dart';

/// Class to hold details of user actions available
/// from the UI
///
class ClerkUserAction {
  /// Construct a [ClerkUserAction]
  const ClerkUserAction({
    required this.asset,
    required this.label,
    required this.callback,
  });

  /// The icon for this action
  final String asset;

  /// The label for this action
  final String label;

  /// The callback to be invoked when tapped
  final FutureOr<void> Function(BuildContext, ClerkAuthState) callback;
}

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
    final translator = ClerkAuth.translatorOf(context);
    return [
      ClerkUserAction(
        asset: ClerkAssets.gearIcon,
        label: translator.translate('Manage account'),
        callback: _manageAccount,
      ),
      ClerkUserAction(
        asset: ClerkAssets.signOutIcon,
        label: translator.translate('Sign out'),
        callback: _signOut,
      ),
    ];
  }

  List<ClerkUserAction> _defaultAdditionalActions() {
    final authState = ClerkAuth.of(context);
    return [
      if (authState.env.config.singleSessionMode == false)
        ClerkUserAction(
          asset: ClerkAssets.addIcon,
          label: authState.translator.translate('Add account'),
          callback: _addAccount,
        ),
    ];
  }

  Future<void> _addAccount(BuildContext context, ClerkAuthState auth) =>
      AddAccountScreen.show(context);

  Future<void> _manageAccount(BuildContext context, ClerkAuthState auth) =>
      ManageAccountScreen.show(context);

  Future<void> _signOut<T>(BuildContext context, ClerkAuthState auth) async {
    if (auth.client.sessions.length == 1) {
      await auth(context, () => auth.signOut());
    } else {
      await auth(context, () => auth.signOutOf(auth.client.activeSession!));
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
                    selected: session == auth.client.activeSession,
                    showName: widget.showName,
                    actions: sessionActions,
                    onTap: () => auth(context, () => auth.activate(session)),
                    onEnd: (closed) {
                      if (closed) _sessions.remove(session);
                    },
                  ),
                for (final action in additionalActions)
                  Padding(
                    padding: allPadding16,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => action.callback(context, auth),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClerkIcon(action.asset, size: 16),
                          horizontalMargin32,
                          Text(
                            action.label,
                            style: ClerkTextStyle.buttonTitle.copyWith(
                              color: ClerkColors.almostBlack,
                            ),
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
                  onTap: () => auth(context, () => auth.signOut()),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout,
                        color: ClerkColors.grey,
                        size: 16,
                      ),
                      horizontalMargin8,
                      Text(
                        translator.translate('Sign out of all accounts'),
                        style: ClerkTextStyle.buttonTitle,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
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
                  children: [
                    ClerkAvatar(user: user),
                    horizontalMargin16,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (showName)
                          Text(
                            user.name,
                            style: ClerkTextStyle.buttonTitle.copyWith(
                              color: ClerkColors.almostBlack,
                            ),
                          ),
                        if (user.email is String)
                          Text(user.email!, style: ClerkTextStyle.buttonTitle),
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
                              label: FittedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClerkIcon(action.asset, size: 10),
                                    horizontalMargin8,
                                    Text(
                                      action.label,
                                      style: ClerkTextStyle.buttonSubtitle
                                          .copyWith(
                                        fontSize: 7,
                                        color: ClerkColors.charcoalGrey,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
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
