import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A screen to allow additional accounts to be signed into
/// after a user has already completed sign in with one account
///
class ConnectAccountScreen extends StatefulWidget {
  const ConnectAccountScreen._({
    required this.authState,
  });

  /// An injected [ClerkAuthState]
  final ClerkAuthState authState;

  /// The name of the route to this screen
  static const routeName = 'clerk_add_account';

  /// static method to show an [ConnectAccountScreen]
  static Future<void> show(BuildContext context) async {
    final authState = ClerkAuth.of(context, listen: false);
    await Navigator.of(context).push(
      MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return ConnectAccountScreen._(authState: authState);
        },
      ),
    );
  }

  @override
  State<ConnectAccountScreen> createState() => _ConnectAccountScreenState();
}

class _ConnectAccountScreenState extends State<ConnectAccountScreen> {
  late Set<DateTime> userUpdatedTimes;

  @override
  void initState() {
    super.initState();
    userUpdatedTimes = _userUpdatedTimes();
    widget.authState.addListener(_onAuthStateChanged);
  }

  Set<DateTime> _userUpdatedTimes() =>
      widget.authState.client.sessions.map((s) => s.user.updatedAt).toSet();

  void _onAuthStateChanged() {
    // if we successfully logged in and got a new session, pop the screen
    final newUserUpdatedTimes = _userUpdatedTimes();
    if (newUserUpdatedTimes.difference(userUpdatedTimes).isNotEmpty) {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    widget.authState.removeListener(_onAuthStateChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClerkAuth(
      authState: widget.authState,
      child: Scaffold(
        backgroundColor: ClerkColors.whiteSmoke,
        appBar: AppBar(
          forceMaterialTransparency: true,
        ),
        body: Padding(
          padding: horizontalPadding32,
          child: ClerkVerticalCard(
            topPortion: const _TopPortion(),
            middlePortion: ClerkAuthBuilder(
              builder: (context, auth) {
                return Padding(
                  padding: horizontalPadding32 + bottomPadding32,
                  child: ClerkSSOPanel(
                    onStrategyChosen: (strategy) =>
                        auth.connect(context, strategy),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

@immutable
class _TopPortion extends StatelessWidget {
  const _TopPortion();

  @override
  Widget build(BuildContext context) {
    final display = ClerkAuth.displayConfigOf(context);
    final translator = ClerkAuth.translatorOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: verticalPadding32,
          child: Center(
            child: SizedBox.square(
              dimension: 32.0,
              child: display.logoUrl?.isNotEmpty == true
                  ? Image.network(display.logoUrl!)
                  : SvgPicture.asset(
                      ClerkAssets.defaultOrganizationLogo,
                      package: 'clerk_flutter',
                    ),
            ),
          ),
        ),
        Padding(
          padding: horizontalPadding32,
          child: Text(
            display.applicationName,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: ClerkTextStyle.title,
          ),
        ),
        Padding(
          padding: horizontalPadding32 + bottomPadding24,
          child: Text(
            translator.translate('Please choose an account to connect'),
            textAlign: TextAlign.center,
            maxLines: 2,
            style: ClerkTextStyle.subtitle,
          ),
        ),
      ],
    );
  }
}
