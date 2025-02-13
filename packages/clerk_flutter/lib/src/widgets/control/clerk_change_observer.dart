import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// An observer that updates its child when it observes a change to the
/// sessions/users/accounts held by the client
///
class ClerkChangeObserver<T> extends StatefulWidget {
  /// Create an [ClerkChangeObserver]
  const ClerkChangeObserver({
    super.key,
    required this.builder,
    required this.onChange,
    required this.accumulateData,
  });

  /// the [builder] of any child widget tree
  final WidgetBuilder builder;

  /// The callback to use when a change is observed
  final ValueChanged<BuildContext>? onChange;

  /// The function that returns a set of arbitrary indicators
  /// that change has occurred e.g. the updated times of users or
  /// external accounts
  final Iterable<T> Function() accumulateData;

  @override
  State<ClerkChangeObserver> createState() => _ClerkChangeObserverState<T>();
}

class _ClerkChangeObserverState<T> extends State<ClerkChangeObserver<T>> {
  late ClerkAuthState authState;
  late Set<T> originalData;

  @override
  void initState() {
    super.initState();
    authState = ClerkAuth.of(context, listen: false);
    originalData = widget.accumulateData().toSet();
    authState.addListener(_onAuthStateChanged);
  }

  void _onAuthStateChanged() {
    // if we successfully logged in and got a new session, pop the screen
    final newData = widget.accumulateData().toSet();
    if (newData.difference(originalData).isNotEmpty) {
      widget.onChange?.call(context);
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
