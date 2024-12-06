import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// Class to hold details of user actions available
/// from the UI
///
class ClerkUserAction {
  /// Construct a [ClerkUserAction]
  ClerkUserAction({
    required this.icon,
    required this.label,
    required this.callback,
  });

  /// The icon for this action
  final IconData icon;

  /// The label for this action
  final String label;

  /// The callback to be invoked when tapped
  final FutureOr<void> Function(BuildContext, ClerkAuthProvider) callback;
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
    this.sessionActions = const [],
    this.additionalActions = const [],
  });

  /// Whether to show the user's name or not
  final bool showName;

  /// Actions to be added as buttons to the session row
  final List<ClerkUserAction> sessionActions;

  /// Actions to be added as rows to the user panel
  final List<ClerkUserAction> additionalActions;

  @override
  State<ClerkUserButton> createState() => _ClerkUserButtonState();
}

class _ClerkUserButtonState extends State<ClerkUserButton> {
  final _sessions = <clerk.Session>[];

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
                    actions: widget.sessionActions,
                    onTap: () => auth(context, () => auth.activate(session)),
                    onEnd: (closed) {
                      if (closed) _sessions.remove(session);
                    },
                  ),
                for (final action in widget.additionalActions)
                  Padding(
                    padding: allPadding16 + leftPadding4,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => action.callback(context, auth),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClerkCircleIcon(
                            icon: action.icon,
                            backgroundColor: ClerkColors.dawnPink,
                            borderColor: ClerkColors.nobel,
                            dashLength: 2,
                          ),
                          horizontalMargin24,
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
                  onTap: () => auth.call(context, () => auth.signOut()),
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
    final auth = ClerkAuth.of(context);
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
                            onPressed: () => action.callback(context, auth),
                            label: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  action.icon,
                                  color: ClerkColors.charcoalGrey,
                                  size: 11,
                                ),
                                horizontalMargin8,
                                Text(
                                  action.label,
                                  style: ClerkTextStyle.buttonSubtitle.copyWith(
                                    fontSize: 8,
                                    color: ClerkColors.charcoalGrey,
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
