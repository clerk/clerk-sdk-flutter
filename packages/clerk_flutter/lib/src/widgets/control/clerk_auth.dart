import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// Control widget initialising Clerk Auth system
class ClerkAuth extends StatefulWidget {
  /// Construct a [ClerkAuth]
  const ClerkAuth({
    super.key,
    this.publicKey,
    this.publishableKey,
    this.auth,
    this.translator = const DefaultClerkTranslator(),
    this.persistor,
    this.loading,
    required this.child,
  })  : assert(
          (publicKey is String) != (auth is ClerkAuthProvider),
          'Either publicKey or an auth instance must be provided, but not both',
        ),
        assert(
          (publicKey is String) == (publishableKey is String),
          'Both publicKey and publishableKey must be provided, or neither',
        );

  /// Clerk public key from dashboard
  final String? publicKey;

  /// Clerk publishable key from dashboard
  final String? publishableKey;

  /// auth instance from elsewhere
  final ClerkAuthProvider? auth;

  /// Persistence service for caching tokens
  final clerk.Persistor? persistor;

  /// Injectable translations for strings
  final ClerkTranslator translator;

  /// Loading widget
  final Widget? loading;

  /// child widget tree
  final Widget child;

  @override
  State<ClerkAuth> createState() => _ClerkAuthState();

  /// Get the [context]'s nearest [ClerkAuthProvider]
  /// with rebuild on change
  static ClerkAuthProvider of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<_ClerkAuthData>();
    assert(result != null, 'No `ClerkAuthProvider` found in context');
    return result!.auth;
  }

  /// Get the most recent [clerk.User] object
  static clerk.User? userOf(BuildContext context) => of(context).user;

  /// Get the most recent [clerk.Session] object
  static clerk.Session? sessionOf(BuildContext context) => of(context).session;

  /// Get the [context]'s nearest [ClerkAuthProvider]
  /// without rebuild on change
  static ClerkAuthProvider above(BuildContext context) {
    final result = context.findAncestorWidgetOfExactType<_ClerkAuthData>();
    assert(result != null, 'No `ClerkAuthProvider` found in context');
    return result!.auth;
  }

  /// Get the [ClerkTranslator]
  static ClerkTranslator translatorOf(BuildContext context) =>
      above(context).translator;

  /// Get the [clerk.DisplayConfig]
  static clerk.DisplayConfig displayConfigOf(BuildContext context) =>
      above(context).env.display;

  /// get the stream of [clerk.AuthError]
  static Stream<clerk.AuthError> errorStreamOf(BuildContext context) =>
      above(context).errorStream;
}

class _ClerkAuthState extends State<ClerkAuth> {
  late final ClerkAuthProvider _auth;
  late final Future<ClerkAuthProvider> _authFuture;

  void _update() => setState(() {});

  @override
  void initState() {
    super.initState();
    if (widget.auth case ClerkAuthProvider auth) {
      _auth = auth;
      _authFuture = Future.value(auth);
    } else {
      _auth = ClerkAuthProvider(
        publishableKey: widget.publishableKey!,
        publicKey: widget.publicKey!,
        persistor: widget.persistor,
        translator: widget.translator,
        loading: widget.loading,
      );
      _authFuture = _auth.initialize().then((_) => _auth);
    }
    _auth.addListener(_update);
  }

  @override
  void dispose() {
    if (widget.auth is ClerkAuthProvider) {
      _auth.removeListener(_update);
    } else {
      _auth.terminate();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _authFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _ClerkAuthData(auth: snapshot.data!, child: widget.child);
        }
        return widget.loading ?? emptyWidget;
      },
    );
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
