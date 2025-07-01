import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/clerk_file_cache.dart';
import 'package:clerk_flutter/src/utils/clerk_telemetry.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_overlay_host.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/material.dart';

/// A class to transport [Uri]s from deep links into the app into the Clerk
/// SDK, potentially with a [clerk.Strategy] imposed by the host app
class ClerkDeepLink {
  /// construct a [ClerkDeepLink]
  const ClerkDeepLink({required this.uri, this.strategy});

  /// The [Uri]
  final Uri uri;

  /// The [clerk.Strategy]
  final clerk.Strategy? strategy;
}

/// Control widget initialising Clerk Auth system
class ClerkAuth extends StatefulWidget {
  /// Construct a [ClerkAuth]
  const ClerkAuth({
    super.key,
    required this.child,
    ClerkAuthConfig? config,
    this.persistor,
    this.httpService,
    this.authState,
    this.deepLinkStream,
  })  : assert(
          (config == null) != (authState == null),
          'Requires one and only one of `authState` or `config`',
        ),
        _config = config;

  /// Constructor to use when using [MaterialApp] for your project.
  static TransitionBuilder materialAppBuilder({
    required ClerkAuthConfig config,
    Stream<ClerkDeepLink>? deepLinkStream,
  }) {
    return (BuildContext context, Widget? child) {
      return ClerkAuth(
        config: config,
        deepLinkStream: deepLinkStream,
        child: ClerkErrorListener(child: child!),
      );
    };
  }

  /// The [ClerkAuthConfig] object
  ClerkAuthConfig get config => _config ?? authState!.config;

  final ClerkAuthConfig? _config;

  /// auth instance from elsewhere
  final ClerkAuthState? authState;

  /// A stream of deep links that the host app thinks the Clerk
  /// SDK might be interested in
  final Stream<ClerkDeepLink?>? deepLinkStream;

  /// An override for the default [clerk.Persistor]
  final clerk.Persistor? persistor;

  /// An override for the default [clerk.HttpService]
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

  /// Get the [ClerkTranslator]
  static ClerkSdkLocalizations localizationsOf(BuildContext context) =>
      of(context, listen: false).localizationsOf(context);

  /// Get the [clerk.DisplayConfig]
  static clerk.DisplayConfig displayConfigOf(BuildContext context) =>
      of(context, listen: false).env.display;

  /// get the stream of [clerk.AuthError]
  static Stream<clerk.AuthError> errorStreamOf(BuildContext context) =>
      of(context, listen: false).errorStream;

  /// get the [ClerkFileCache] of the [ClerkAuthConfig]
  static ClerkFileCache fileCacheOf(BuildContext context) =>
      of(context, listen: false).config.fileCache;
}

class _ClerkAuthState extends State<ClerkAuth> with ClerkTelemetryStateMixin {
  ClerkAuthState? _clerkAuthState;

  ClerkAuthState? get effectiveAuthState => widget.authState ?? _clerkAuthState;

  StreamSubscription<ClerkDeepLink?>? _deepLinkSub;

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
    _deepLinkSub = widget.deepLinkStream?.listen(_processDeepLink);
  }

  @override
  void dispose() {
    super.dispose();
    _deepLinkSub?.cancel();
    _clerkAuthState?.terminate();
  }

  @override
  void didUpdateWidget(covariant ClerkAuth oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.deepLinkStream != oldWidget.deepLinkStream) {
      _deepLinkSub?.cancel();
      _deepLinkSub = widget.deepLinkStream?.listen(_processDeepLink);
    }
  }

  void _processDeepLink(ClerkDeepLink? link) {
    if (link case ClerkDeepLink link) {
      effectiveAuthState?.parseDeepLink(link);
    }
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
