import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// Control widget initialising Clerk Auth system
class ClerkAuth extends StatefulWidget {
  /// Construct a [ClerkAuth]
  const ClerkAuth({
    super.key,
    this.publishableKey,
    this.pollMode = clerk.SessionTokenPollMode.onDemand,
    this.auth,
    this.translator = const DefaultClerkTranslator(),
    this.persistor,
    this.loading,
    required this.child,
  }) : assert(
          (publishableKey is String) != (auth is ClerkAuthProvider),
          'Either publishableKey or an auth instance must '
          'be provided, but not both',
        );

  /// Clerk publishable key from dashboard
  final String? publishableKey;

  /// auth instance from elsewhere
  final ClerkAuthProvider? auth;

  /// Persistence service for caching tokens
  final clerk.Persistor? persistor;

  /// Injectable translations for strings
  final ClerkTranslator translator;

  /// Poll mode: should we regularly poll for session token?
  final clerk.SessionTokenPollMode pollMode;

  /// Loading widget
  final Widget? loading;

  /// child widget tree
  final Widget child;

  @override
  State<ClerkAuth> createState() => _ClerkAuthState();

  /// Get the [context]'s nearest [ClerkAuthProvider]
  /// with rebuild on change
  static ClerkAuthProvider of(BuildContext context, {bool listen = true}) {
    final result = listen //
        ? context.dependOnInheritedWidgetOfExactType<_ClerkAuthData>()
        : context.findAncestorWidgetOfExactType<_ClerkAuthData>();
    assert(result != null, 'No `ClerkAuthProvider` found in context');
    return result!.auth;
  }

  /// Get the most recent [clerk.User] object
  static clerk.User? userOf(BuildContext context) => of(context).user;

  /// Get the most recent [clerk.Session] object
  static clerk.Session? sessionOf(BuildContext context) => of(context).session;

  /// Get the [context]'s nearest [ClerkAuthProvider]
  /// without rebuild on change
  @Deprecated('Use .of() instead with listen = false')
  static ClerkAuthProvider above(BuildContext context) {
    final result = context.findAncestorWidgetOfExactType<_ClerkAuthData>();
    assert(result != null, 'No `ClerkAuthProvider` found in context');
    return result!.auth;
  }

  /// Get the [ClerkTranslator]
  static ClerkTranslator translatorOf(BuildContext context) =>
      of(context, listen: false).translator;

  /// Get the [clerk.DisplayConfig]
  static clerk.DisplayConfig displayConfigOf(BuildContext context) =>
      of(context, listen: false).env.display;

  /// get the stream of [ClerkAuthProviderError]
  static Stream<clerk.AuthError> errorStreamOf(BuildContext context) =>
      of(context, listen: false).errorStream;
}

class _ClerkAuthState extends State<ClerkAuth> with ClerkTelemetryStateMixin {
  ClerkAuthProvider? _clerkAuth;

  ClerkAuthProvider? get effectiveAuth => widget.auth ?? _clerkAuth;

  @override
  Map<String, dynamic> get telemetryPayload {
    return {
      'poll_mode': widget.pollMode.toString(),
      'primary_instance': widget.auth == null,
    };
  }

  @override
  void initState() {
    super.initState();
    if (widget.auth == null) {
      ClerkAuthProvider.create(
        publishableKey: widget.publishableKey!,
        persistor: widget.persistor,
        translator: widget.translator,
        loading: widget.loading,
        pollMode: widget.pollMode,
      ).then((auth) {
        if (mounted) {
          setState(() => _clerkAuth = auth);
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _clerkAuth?.terminate();
  }

  @override
  Widget build(BuildContext context) {
    if (effectiveAuth case ClerkAuthProvider auth) {
      return ListenableBuilder(
        listenable: auth,
        builder: (BuildContext context, Widget? child) {
          return _ClerkAuthData(
            auth: auth,
            child: widget.child,
          );
        },
      );
    }

    return widget.loading ?? emptyWidget;
  }
}

/// Data class holding the auth object
class _ClerkAuthData extends InheritedWidget {
  _ClerkAuthData({
    required this.auth,
    required super.child,
  })  : client = auth.client,
        env = auth.env;

  /// Clerk auth object
  final ClerkAuthProvider auth;
  final clerk.Client client;
  final clerk.Environment env;

  @override
  bool updateShouldNotify(_ClerkAuthData old) {
    return old.client != client || old.env != env;
  }
}
