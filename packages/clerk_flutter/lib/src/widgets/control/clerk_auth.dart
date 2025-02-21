import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/clerk_telemetry.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/material.dart';

/// Control widget initialising Clerk Auth system
class ClerkAuth extends StatefulWidget {
  /// Construct a [ClerkAuth]
  const ClerkAuth({
    super.key,
    this.publishableKey,
    this.pollMode = clerk.SessionTokenPollMode.lazy,
    this.authState,
    this.localizations = ClerkSdkLocalizations.delegate,
    this.persistor,
    this.loading,
    this.httpService,
    required this.child,
  });

  /// Constructor to use when using [MaterialApp] for your project.
  static TransitionBuilder materialAppBuilder({
    required String? publishableKey,
    clerk.SessionTokenPollMode? pollMode,
    LocalizationsDelegate<ClerkSdkLocalizations>? localizations,
    clerk.Persistor? persistor,
    Widget? loading,
    clerk.HttpService? httpService,
  }) {
    return (BuildContext context, Widget? child) {
      return ClerkAuth(
        publishableKey: publishableKey,
        pollMode: pollMode ?? clerk.SessionTokenPollMode.lazy,
        localizations: localizations ?? ClerkSdkLocalizations.delegate,
        persistor: persistor,
        loading: loading,
        httpService: httpService,
        child: ClerkErrorListener(child: child!),
      );
    };
  }

  /// Clerk publishable key from dashboard
  final String? publishableKey;

  /// Poll mode: should we regularly poll for session token?
  final clerk.SessionTokenPollMode pollMode;

  /// auth instance from elsewhere
  final ClerkAuthState? authState;

  /// Injectable translations for strings
  final LocalizationsDelegate<ClerkSdkLocalizations> localizations;

  /// Persistence service for caching tokens
  final clerk.Persistor? persistor;

  /// Loading widget
  final Widget? loading;

  /// The [HttpService]
  final clerk.HttpService? httpService;

  /// child widget tree
  final Widget child;

  @override
  State<ClerkAuth> createState() => _ClerkAuthState();

  /// Get the [context]'s nearest [ClerkAuthState]
  /// with rebuild on change
  static ClerkAuthState of(BuildContext context, {bool listen = true}) {
    final result = listen //
        ? context.dependOnInheritedWidgetOfExactType<_ClerkAuthData>()
        : context.findAncestorWidgetOfExactType<_ClerkAuthData>();
    assert(result != null, 'No `ClerkAuth` found in context');
    return result!.authState;
  }

  /// Get the most recent [clerk.User] object
  static clerk.User? userOf(BuildContext context) => of(context).user;

  /// Get the most recent [clerk.Session] object
  static clerk.Session? sessionOf(BuildContext context) => of(context).session;

  /// Get the [context]'s nearest [ClerkAuthState]
  /// without rebuild on change
  @Deprecated('Use .of() instead with listen = false')
  static ClerkAuthState above(BuildContext context) {
    final result = context.findAncestorWidgetOfExactType<_ClerkAuthData>();
    assert(result != null, 'No `ClerkAuth` found in context');
    return result!.authState;
  }

  /// Get the [ClerkTranslator]
  static ClerkSdkLocalizations localizationsOf(BuildContext context) =>
      ClerkSdkLocalizations.of(context)!;

  /// Get the [clerk.DisplayConfig]
  static clerk.DisplayConfig displayConfigOf(BuildContext context) =>
      of(context, listen: false).env.display;

  /// get the stream of [clerk.AuthError]
  static Stream<clerk.AuthError> errorStreamOf(BuildContext context) =>
      of(context, listen: false).errorStream;
}

class _ClerkAuthState extends State<ClerkAuth> with ClerkTelemetryStateMixin {
  ClerkAuthState? _clerkAuthState;

  ClerkAuthState? get effectiveAuthState => widget.authState ?? _clerkAuthState;

  @override
  clerk.Telemetry? get telemetry => effectiveAuthState?.telemetry;

  @override
  Map<String, dynamic> get telemetryPayload {
    return {
      'poll_mode': widget.pollMode.toString(),
      'primary_instance': widget.authState == null,
    };
  }

  @override
  void initState() {
    super.initState();
    if (widget.authState == null) {
      ClerkAuthState.create(
        publishableKey: widget.publishableKey!,
        persistor: widget.persistor,
        loading: widget.loading,
        pollMode: widget.pollMode,
        localesLookup: () {
          return [Localizations.localeOf(context).toLanguageTag()];
        },
      ).then((authState) {
        if (mounted) {
          setState(() => _clerkAuthState = authState);
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _clerkAuthState?.terminate();
  }

  @override
  Widget build(BuildContext context) {
    if (effectiveAuthState case ClerkAuthState authState) {
      final child = ListenableBuilder(
        listenable: authState,
        builder: (BuildContext context, Widget? child) {
          return _ClerkAuthData(
            authState: authState,
            child: widget.child,
          );
        },
      );

      // Return localized child

      final localizations =
          context.findAncestorWidgetOfExactType<Localizations>();
      // If we dont have parent Localizations, inject default English
      if (localizations == null) {
        return Localizations(
          locale: View.of(context).platformDispatcher.locale,
          delegates: [widget.localizations],
          child: child,
        );
      }
      // If [MaterialApp] does not contain [ClerkSdkLocalizations]
      else if (Localizations.of(context, ClerkSdkLocalizations) == null) {
        return Localizations.override(
          context: context,
          delegates: [widget.localizations],
          child: child,
        );
      }
      // [MaterialApp] contains overridden [ClerkSdkLocalizations]
      else {
        return child;
      }
    }
    return widget.loading ?? emptyWidget;
  }
}

/// Data class holding the auth object
class _ClerkAuthData extends InheritedWidget {
  _ClerkAuthData({
    required this.authState,
    required super.child,
  })  : client = authState.client,
        env = authState.env;

  /// Clerk auth object
  final ClerkAuthState authState;
  final clerk.Client client;
  final clerk.Environment env;

  @override
  bool updateShouldNotify(_ClerkAuthData old) {
    return old.client != client || old.env != env;
  }
}
