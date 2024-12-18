import 'dart:math' as math;

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// The [ClerkUserButton] renders a list of all users from
/// [clerk.Session]s currently signed in, plus controls to sign
/// out of all sessions
///
class ClerkUserButton extends StatefulWidget {
  /// Construct a [ClerkUserButton]
  const ClerkUserButton({super.key, this.showName = true});

  /// Whether to show the user's name or not
  final bool showName;

  @override
  State<ClerkUserButton> createState() => _ClerkUserButtonState();
}

class _ClerkUserButtonState extends State<ClerkUserButton> {
  static const _closeDelay = Duration(milliseconds: 250);

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
                    onTap: () =>
                        auth.call(context, () => auth.activate(session)),
                    onEnd: (closed) {
                      if (closed) _sessions.remove(session);
                    },
                  ),
                if (auth.env.config.singleSessionMode == false)
                  Padding(
                    padding: allPadding16 + leftPadding4,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => _AddAccountScreen.show(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const _CircleIcon(
                            icon: Icons.add,
                            backgroundColor: ClerkColors.dawnPink,
                            borderColor: ClerkColors.nobel,
                            dashed: true,
                          ),
                          horizontalMargin24,
                          Text(
                            translator.translate('Add account'),
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
                      const Icon(Icons.logout,
                          color: ClerkColors.grey, size: 16),
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

class _AddAccountScreen extends StatefulWidget {
  const _AddAccountScreen._({
    required this.auth,
  });

  final ClerkAuthProvider auth;

  static const routeName = 'clerk_add_account';

  static Future<void> show(BuildContext context) async {
    final auth = ClerkAuth.of(context);
    await Navigator.of(context).push(
      MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return _AddAccountScreen._(auth: auth);
        },
      ),
    );
  }

  @override
  State<_AddAccountScreen> createState() => _AddAccountScreenState();
}

class _AddAccountScreenState extends State<_AddAccountScreen> {
  late Set<String> sessions;

  @override
  void initState() {
    super.initState();
    sessions = widget.auth.client.sessionIds;
    widget.auth.addListener(_onAuthStateChanged);
  }

  void _onAuthStateChanged() {
    // if we successfully logged in and got a new session, pop the screen
    if (widget.auth.client.sessionIds.difference(sessions).isNotEmpty) {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    widget.auth.removeListener(_onAuthStateChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClerkAuth(
      auth: widget.auth,
      child: Scaffold(
        backgroundColor: ClerkColors.whiteSmoke,
        appBar: AppBar(
          forceMaterialTransparency: true,
        ),
        body: const Padding(
          padding: horizontalPadding32,
          child: ClerkAuthenticationWidget(),
        ),
      ),
    );
  }
}

class _CircleIcon extends StatelessWidget {
  const _CircleIcon({
    required this.icon,
    this.backgroundColor = Colors.transparent,
    this.borderColor,
    this.dashed = false,
  });

  final IconData icon;
  final Color backgroundColor;
  final Color? borderColor;
  final bool dashed;

  static const color = ClerkColors.stormGrey;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 24,
      child: CustomPaint(
        painter: _DottedBorderPainter(
          color: borderColor ?? color,
          backgroundColor: backgroundColor,
          dashLength: 2,
          gapLength: dashed ? 2 : 0,
        ),
        child: Icon(icon, size: 16, color: color),
      ),
    );
  }
}

class _DottedBorderPainter extends CustomPainter {
  _DottedBorderPainter({
    required Color color,
    required Color backgroundColor,
    this.dashLength = 0,
    this.gapLength = 0,
  })  : assert(
          dashLength > 0 || gapLength == 0,
          'dashLength cannot be 0 or less unless gapLength is 0',
        ),
        _paint = Paint()
          ..style = PaintingStyle.stroke
          ..color = color,
        _backgroundPaint = Paint()
          ..style = PaintingStyle.fill
          ..color = backgroundColor;

  final double dashLength;
  final double gapLength; // actually, minimum gap length

  final Paint _paint;
  final Paint _backgroundPaint;

  static const _twoPi = 2 * math.pi;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final radius = rect.width / 2;
    canvas.drawCircle(rect.center, radius, _backgroundPaint);
    if (gapLength == 0) {
      canvas.drawCircle(rect.center, radius, _paint);
    } else {
      final dotDash = dashLength + gapLength;
      final circumference = _twoPi * radius;
      final numDotDashes = circumference ~/ dotDash;
      final dotDashArc = _twoPi / numDotDashes;
      final dashArc = dashLength / radius;
      for (int i = 0; i < numDotDashes; ++i) {
        canvas.drawArc(rect, i * dotDashArc, dashArc, false, _paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SessionRow extends StatelessWidget {
  const _SessionRow({
    super.key,
    required this.session,
    required this.closed,
    required this.onTap,
    required this.onEnd,
    this.selected = false,
    this.showName = true,
  });

  final clerk.Session session;
  final bool closed;
  final bool selected;
  final bool showName;
  final VoidCallback onTap;
  final ValueChanged<bool> onEnd;

  @override
  Widget build(BuildContext context) {
    final translator = ClerkAuth.translatorOf(context);
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
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: ClerkColors.mountainMist,
                      child: user.imageUrl is String
                          ? ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              child: Image.network(
                                user.imageUrl!,
                                width: 32,
                                height: 32,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Text(user.name.initials,
                              style: ClerkTextStyle.subtitleDark),
                    ),
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
                padding: horizontalPadding16 + leftPadding48 + bottomPadding8,
                child: Builder(
                  builder: (context) {
                    final auth = ClerkAuth.above(context);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Expanded(
                        //   child: ClerkMaterialButton(
                        //     onPressed: () => auth.call(context, () => auth.signOut()),
                        //     label: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       crossAxisAlignment: CrossAxisAlignment.end,
                        //       children: [
                        //         const Icon(Icons.settings, color: ClerkColors.charcoalGrey, size: 11),
                        //         horizontalMargin8,
                        //         Text(
                        //           translator.translate('Manage account'),
                        //           style: ClerkTextStyle.buttonSubtitle.copyWith(
                        //             fontSize: 8,
                        //             color: ClerkColors.charcoalGrey,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //     style: ClerkMaterialButtonStyle.light,
                        //     height: 16,
                        //   ),
                        // ),
                        // horizontalMargin8,
                        Expanded(
                          child: ClerkMaterialButton(
                            onPressed: () {
                              if (auth.client.sessions.length == 1) {
                                auth.call(context, () => auth.signOut());
                              } else {
                                auth.call(
                                  context,
                                  () => auth.signOutOf(session),
                                );
                              }
                            },
                            label: Padding(
                              padding: verticalPadding4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.logout,
                                    color: ClerkColors.charcoalGrey,
                                    size: 20,
                                  ),
                                  horizontalMargin8,
                                  Text(
                                    translator.translate('Sign Out'),
                                    style:
                                        ClerkTextStyle.buttonSubtitle.copyWith(
                                      fontSize: 12,
                                      color: ClerkColors.charcoalGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            style: ClerkMaterialButtonStyle.light,
                          ),
                        ),
                      ],
                    );
                  },
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
