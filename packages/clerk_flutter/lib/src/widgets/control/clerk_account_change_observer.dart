import 'package:clerk_auth/clerk_auth.dart';
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// An observer that updates its child when it observes a change to the
/// sessions/users/accounts held by the client
///
class ClerkAccountChangeObserver extends StatefulWidget {
  /// Create an [ClerkAccountChangeObserver]
  const ClerkAccountChangeObserver({
    super.key,
    required this.builder,
    required this.onChange,
  });

  /// the [builder] of any child widget tree
  final WidgetBuilder builder;

  /// The callback to use when a change is observed
  final VoidCallback onChange;

  @override
  State<ClerkAccountChangeObserver> createState() =>
      _ClerkAccountChangeObserverState();
}

class _ClerkAccountChangeObserverState
    extends State<ClerkAccountChangeObserver> {
  late ClerkAuthState authState;
  late Set<DateTime> userUpdatedTimes;

  @override
  void initState() {
    super.initState();
    authState = ClerkAuth.of(context, listen: false);
    userUpdatedTimes = _userUpdatedTimes();
    authState.addListener(_onAuthStateChanged);
  }

  Set<DateTime> _userUpdatedTimes() => authState.client.sessions
      .map((s) => s.user.updatedAt ?? DateTimeExt.epoch)
      .toSet();

  void _onAuthStateChanged() {
    // if we successfully logged in and got a new session, pop the screen
    final newUserUpdatedTimes = _userUpdatedTimes();
    if (newUserUpdatedTimes.difference(userUpdatedTimes).isNotEmpty) {
      widget.onChange();
    }
  }

  @override
  void dispose() {
    authState.removeListener(_onAuthStateChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context);
}
