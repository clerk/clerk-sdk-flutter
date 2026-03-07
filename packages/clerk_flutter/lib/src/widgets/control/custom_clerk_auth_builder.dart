import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

typedef HydrationCallback = void Function(HydrationEvent event);

class HydrationEvent {
  final bool isHydrated;
  final bool isClientReady;
  final bool isEnvReady;
  final int attempt;
  final HydrationSource? source;
  const HydrationEvent({
    required this.isHydrated,
    required this.isClientReady,
    required this.isEnvReady,
    required this.attempt,
    required this.source,
  });
}

/// A hydration-safe replacement for [ClerkAuthBuilder].
///
/// Guarantees no flicker and no premature signedOutBuilder calls by waiting
/// until [HydratedClerkAuthState.initialize] completes.
class CustomClerkAuthBuilder extends StatefulWidget {
  const CustomClerkAuthBuilder({
    super.key,
    required this.loadingBuilder,
    required this.signedInBuilder,
    required this.signedOutBuilder,
    this.onHydrationEvent,
  });

  final WidgetBuilder loadingBuilder;
  final AuthWidgetBuilder signedInBuilder;
  final AuthWidgetBuilder signedOutBuilder;
  final HydrationCallback? onHydrationEvent;

  @override
  State<CustomClerkAuthBuilder> createState() => _CustomClerkAuthBuilderState();
}

class _CustomClerkAuthBuilderState extends State<CustomClerkAuthBuilder> {
  ClerkAuthState? _auth;
  HydrationEvent? _lastEvent;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _auth = ClerkAuth.of(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool _isHydrated(ClerkAuthState auth) {
    if (auth is HydratedClerkAuthState) {
      return auth.isHydrated;
    }
    // If not using hydrated state, treat as already hydrated
    return true;
  }

  /// Emits hydration telemetry via [onHydrationEvent] and returns a loading
  /// widget when hydration is not complete. Returns null if hydration is done.
  Widget? _emitHydrationAndMaybeBuildLoading(
    BuildContext context,
    ClerkAuthState auth,
  ) {
    final bool hydrated = _isHydrated(auth);
    // Emit hydration event for external logging/observability
    final bool isClientReady = auth.client.isNotEmpty;
    final bool isEnvReady = auth.env.isNotEmpty;
    final int attempt = auth is HydratedClerkAuthState
        ? auth.hydrationAttempt
        : 0;
    final HydrationSource? source = auth is HydratedClerkAuthState
        ? auth.hydrationSource
        : null;
    final HydrationEvent event = HydrationEvent(
      isHydrated: hydrated,
      isClientReady: isClientReady,
      isEnvReady: isEnvReady,
      attempt: attempt,
      source: source,
    );
    if (widget.onHydrationEvent != null) {
      final bool changed =
          _lastEvent == null ||
          _lastEvent!.isHydrated != event.isHydrated ||
          _lastEvent!.isClientReady != event.isClientReady ||
          _lastEvent!.isEnvReady != event.isEnvReady ||
          _lastEvent!.attempt != event.attempt ||
          _lastEvent!.source != event.source;
      if (changed) {
        _lastEvent = event;
        widget.onHydrationEvent!(event);
      }
    }
    if (hydrated == false) {
      return widget.loadingBuilder(context);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final ClerkAuthState auth = _auth ?? ClerkAuth.of(context, listen: false);

    return ListenableBuilder(
      listenable: auth,
      builder: (BuildContext context, Widget? _) {
        final Widget? loading = _emitHydrationAndMaybeBuildLoading(
          context,
          auth,
        );
        if (loading != null) return loading;
        final clerk.User? user = auth.client.user;
        final bool isSignedIn = user != null;
        return isSignedIn
            ? widget.signedInBuilder(context, auth)
            : widget.signedOutBuilder(context, auth);
      },
    );
  }
}
