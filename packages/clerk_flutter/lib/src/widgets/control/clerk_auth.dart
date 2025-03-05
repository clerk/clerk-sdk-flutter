import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/clerk_telemetry.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_overlay_host.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/material.dart';

/// Control widget initialising Clerk Auth system
class ClerkAuth extends StatefulWidget {
  /// Construct a [ClerkAuth]
  const ClerkAuth({
    super.key,
    required this.child,
    ClerkAuthConfig? config,
    this.authState,
  })  : assert(
          (config == null) != (authState == null),
          'Requires one and only one of `authState` or `config`',
        ),
        _config = config;

  /// Constructor to use when using [MaterialApp] for your project.
  static TransitionBuilder materialAppBuilder({
    required ClerkAuthConfig config,
  }) {
    return (BuildContext context, Widget? child) {
      return ClerkAuth(
        config: config,
        child: ClerkErrorListener(child: child!),
      );
    };
  }

  /// The [ClerkAuthConfig] object
  ClerkAuthConfig get config => _config ?? authState!.config;

  final ClerkAuthConfig? _config;

  /// auth instance from elsewhere
  final ClerkAuthState? authState;

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
      of(context, listen: false).localizationsOf(context);

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
      'poll_mode': widget.config.sessionTokenPollMode.toString(),
      'primary_instance': widget.authState == null,
    };
  }

  @override
  void initState() {
    super.initState();
    if (widget.authState == null) {
      if (widget.config.loading == null) {
        WidgetsBinding.instance.deferFirstFrame();
      }
      ClerkAuthState.create(config: widget.config).then((authState) {
        if (mounted) {
          setState(() => _clerkAuthState = authState);
        }
        if (widget.config.loading == null) {
          WidgetsBinding.instance.allowFirstFrame();
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
      return ListenableBuilder(
        listenable: authState,
        builder: (BuildContext context, Widget? child) {
          return _ClerkAuthData(
            authState: authState,
            child: ClerkOverlayHost(
              child: widget.child,
            ),
          );
        },
      );
    }
    return widget.config.loading ?? emptyWidget;
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
