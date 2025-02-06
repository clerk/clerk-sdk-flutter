import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// A screen to allow additional accounts to be signed into
/// after a user has already completed sign in with one account
///
class AddAccountScreen extends StatefulWidget {
  const AddAccountScreen._({
    required this.authState,
  });

  /// An injected [ClerkAuthState]
  final ClerkAuthState authState;

  /// The name of the route to this screen
  static const routeName = 'clerk_add_account';

  /// static method to show an [AddAccountScreen]
  static Future<void> show(BuildContext context) async {
    final authState = ClerkAuth.of(context, listen: false);
    await Navigator.of(context).push(
      MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return AddAccountScreen._(authState: authState);
        },
      ),
    );
  }

  @override
  State<AddAccountScreen> createState() => _AddAccountScreenState();
}

class _AddAccountScreenState extends State<AddAccountScreen> {
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
        body: const Padding(
          padding: horizontalPadding32,
          child: ClerkAuthenticationWidget(),
        ),
      ),
    );
  }
}
