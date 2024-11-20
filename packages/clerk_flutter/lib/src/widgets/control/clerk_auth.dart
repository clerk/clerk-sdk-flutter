import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Control widget initialising Clerk Auth system
class ClerkAuth extends StatefulWidget {
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

  static ClerkAuthProvider of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<_ClerkAuthData>();
    assert(result != null, 'No Clerk `Auth` found in context');
    return result!.auth;
  }

  static clerk.User? userOf(BuildContext context) => of(context).user;

  static clerk.Session? sessionOf(BuildContext context) => of(context).session;

  static ClerkAuthProvider nonDependentOf(BuildContext context) {
    final result = context.findAncestorWidgetOfExactType<_ClerkAuthData>();
    assert(result != null, 'No Clerk `Auth` found in context');
    return result!.auth;
  }

  static ClerkTranslator translatorOf(BuildContext context) =>
      nonDependentOf(context).translator;

  static clerk.DisplayConfig displayConfigOf(BuildContext context) =>
      nonDependentOf(context).env.display;

  static Stream<clerk.AuthError> errorStreamOf(BuildContext context) =>
      nonDependentOf(context).errorStream;
}

class _ClerkAuthState extends State<ClerkAuth> {
  late ClerkAuthProvider _auth;
  late Future<ClerkAuthProvider> _authFuture;

  void _update() => setState(() {});

  @override
  void initState() {
    super.initState();
    if (widget.auth case ClerkAuthProvider auth) {
      _auth = auth;
      _authFuture = Future.value(_auth);
    } else {
      _auth = ClerkAuthProvider(
        publishableKey: widget.publishableKey!,
        publicKey: widget.publicKey!,
        persistor: widget.persistor,
        translator: widget.translator,
        loading: widget.loading,
      );
      _authFuture = _auth.init().then((_) => _auth);
    }
    _auth.addListener(_update);
  }

  @override
  void dispose() {
    if (widget.auth is ClerkAuthProvider) {
      _auth.removeListener(_update);
    } else {
      _auth.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _authFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _ClerkAuthData(
            auth: snapshot.data!,
            child: widget.child,
          );
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

class ClerkAuthProvider extends clerk.Auth with ChangeNotifier {
  ClerkAuthProvider({
    required super.publicKey,
    required super.publishableKey,
    this.translator = const DefaultClerkTranslator(),
    Widget? loading,
    super.persistor,
  }) : _loadingOverlay = OverlayEntry(
          builder: (context) => loading ?? defaultLoadingWidget,
        );

  final ClerkTranslator translator;
  final _errors = StreamController<clerk.AuthError>();
  late final errorStream = _errors.stream.asBroadcastStream();
  final OverlayEntry _loadingOverlay;
  OverlayEntry? _ssoOverlay;

  static const _kRotatingTokenNonce = 'rotating_token_nonce';

  @override
  void update() => notifyListeners();

  /// Performs SSO authentication according to the `strategy`
  Future<void> sso(
    BuildContext context,
    clerk.Strategy strategy, {
    void Function(clerk.AuthError)? onError,
  }) async {
    final auth = ClerkAuth.of(context);
    final overlay = Overlay.of(context);
    final client = await call(
      context,
      () => auth.oauthSignIn(strategy: strategy),
      onError: onError,
    );
    final url = client?.signIn?.firstFactorVerification?.providerUrl;
    if (url case String url) {
      _ssoOverlay = OverlayEntry(
        builder: (BuildContext context) {
          return _SsoWebViewHost(
            url: url,
            callback: _ssoCallback(
              strategy,
              onError: onError,
            ),
          );
        },
      );
      overlay.insert(_ssoOverlay!);
    }
  }

  Function(BuildContext, String) _ssoCallback(
    clerk.Strategy strategy, {
    void Function(clerk.AuthError)? onError,
  }) {
    return (BuildContext context, String redirectUrl) async {
      final auth = ClerkAuth.of(context);
      final uri = Uri.parse(redirectUrl);
      final token = uri.queryParameters[_kRotatingTokenNonce];
      if (token case String token) {
        await call(
          context,
          () => auth.attemptSignIn(strategy: strategy, token: token),
          onError: onError,
        );
      } else {
        await auth.refreshClient();
        if (context.mounted) {
          await call(
            context,
            () => auth.transfer(),
            onError: onError,
          );
        }
      }
      _ssoOverlay?.remove();
      _ssoOverlay = null;
    };
  }

  /// Convenience method to make an auth call to the backend via ClerkAuth
  /// with error handling
  Future<T?> call<T>(
    BuildContext context,
    Future<T> Function() fn, {
    void Function(clerk.AuthError)? onError,
  }) async {
    T? result;
    try {
      if (context.mounted) {
        Overlay.of(context).insert(_loadingOverlay);
      }
      result = await fn.call();
    } on clerk.AuthError catch (error) {
      _errors.add(error);
      onError?.call(error);
    } finally {
      _loadingOverlay.remove();
    }
    return result;
  }

  /// Returns a boolean regarding whether or not a password has been supplied,
  /// matches a confirmation string and meets the criteria required by `env`
  bool passwordIsValid(String? password, String? confirmation) {
    if (password case String password when password.isNotEmpty) {
      if (password != confirmation) return false;
      return env.user.passwordSettings.meetsRequiredCriteria(password);
    }

    return false;
  }

  /// Checks the password according to the criteria required by the `env`
  /// Note that password and confirmation must match, but that includes
  /// not having been supplied (i.e. null or empty). These are valid for parsing
  /// but may still not be acceptable to the back end
  String? checkPassword(String? password, String? confirmation) {
    if (password != confirmation) {
      return translator
          .translate('Password and password confirmation must match');
    }

    if (password case String password when password.isNotEmpty) {
      final criteria = env.user.passwordSettings;
      final missing = <String>[];

      if (criteria.meetsLowerCaseCriteria(password) == false) {
        missing.add('a LOWERCASE letter');
      }

      if (criteria.meetsUpperCaseCriteria(password) == false) {
        missing.add('an UPPERCASE letter');
      }

      if (criteria.meetsNumberCriteria(password) == false) {
        missing.add('a NUMBER');
      }

      if (criteria.meetsSpecialCharCriteria(password) == false) {
        missing.add('a SPECIAL CHARACTER (###)');
      }

      if (missing.isNotEmpty) {
        final value = translator.alternatives(missing,
            connector: 'and', prefix: 'Password requires');
        return value.replaceFirst('###', criteria.allowedSpecialCharacters);
      }
    }

    return null;
  }

  void addError(String message) =>
      _errors.add(clerk.AuthError(message: message));
}

class _SsoWebViewHost extends StatefulWidget {
  const _SsoWebViewHost({
    required this.url,
    required this.callback,
  });

  final String url;
  final Function(BuildContext context, String redirectUrl) callback;

  @override
  State<_SsoWebViewHost> createState() => _SsoWebViewHostState();
}

class _SsoWebViewHostState extends State<_SsoWebViewHost> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setUserAgent('Clerk Flutter SDK v${clerk.Auth.jsVersion}')
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) async {
            if (request.url.startsWith(clerk.Auth.oauthRedirect)) {
              widget.callback(context, request.url);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    controller.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
