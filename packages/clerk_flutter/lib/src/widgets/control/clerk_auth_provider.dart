import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_auth/clerk_auth.dart';
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// An extension of [clerk.Auth] with [ChangeNotifier] so that
/// updates to the auth state can be propagated out into the UI
///
class ClerkAuthProvider extends clerk.Auth with ChangeNotifier {
  /// Construct a [ClerkAuthProvider]
  ClerkAuthProvider._({
    required super.publishableKey,
    required super.persistor,
    required this.translator,
    super.pollMode,
    Widget? loading,
  }) : _loadingOverlay = OverlayEntry(
          builder: (context) => loading ?? defaultLoadingWidget,
        );

  /// Create an [ClerkAuthProvider] object using appropriate Clerk credentials
  static Future<ClerkAuthProvider> create({
    required String publishableKey,
    Persistor persistor = Persistor.none,
    ClerkTranslator translator = const DefaultClerkTranslator(),
    SessionTokenPollMode pollMode = SessionTokenPollMode.onDemand,
    Widget? loading,
  }) async {
    final provider = ClerkAuthProvider._(
      publishableKey: publishableKey,
      persistor: persistor,
      translator: translator,
      pollMode: pollMode,
      loading: loading,
    );
    await provider.initialize();
    return provider;
  }

  /// The [ClerkTranslator] for auth UI
  final ClerkTranslator translator;

  /// The [clerk.AuthError] stream
  late final errorStream = _errors.stream.asBroadcastStream();

  final _errors = StreamController<clerk.AuthError>();
  final OverlayEntry _loadingOverlay;
  OverlayEntry? _ssoOverlay;

  static const _kRotatingTokenNonce = 'rotating_token_nonce';

  @override
  void update() => notifyListeners();

  @override
  void terminate() {
    super.terminate();
    dispose();
  }

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
              auth: auth,
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
    required ClerkAuthProvider auth,
  }) {
    return (BuildContext context, String redirectUrl) async {
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
          await call(context, () => auth.transfer(), onError: onError);
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

  /// Add an [clerk.AuthError] for [message] to the [errorStream]
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
