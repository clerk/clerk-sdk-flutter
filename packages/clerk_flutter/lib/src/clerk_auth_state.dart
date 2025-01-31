import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// An extension of [clerk.Auth] with [ChangeNotifier] so that
/// updates to the auth state can be propagated out into the UI
///
class ClerkAuthState extends clerk.Auth with ChangeNotifier {
  /// Construct a [ClerkAuthState]
  ClerkAuthState._({
    required super.publishableKey,
    required super.persistor,
    required this.translator,
    super.pollMode,
    super.httpService,
    Widget? loading,
  }) : _loadingOverlay = OverlayEntry(
          builder: (context) => loading ?? defaultLoadingWidget,
        );

  /// Create an [ClerkAuthState] object using appropriate Clerk credentials
  static Future<ClerkAuthState> create({
    required String publishableKey,
    clerk.Persistor? persistor,
    ClerkTranslator translator = const DefaultClerkTranslator(),
    clerk.SessionTokenPollMode pollMode = clerk.SessionTokenPollMode.lazy,
    Widget? loading,
    clerk.HttpService httpService = const clerk.DefaultHttpService(),
  }) async {
    final provider = ClerkAuthState._(
      publishableKey: publishableKey,
      persistor: persistor ??
          await clerk.DefaultPersistor.create(
            storageDirectory: await getApplicationDocumentsDirectory(),
          ),
      translator: translator,
      pollMode: pollMode,
      loading: loading,
      httpService: httpService,
    );
    await provider.initialize();
    return provider;
  }

  /// The [ClerkTranslator] for auth UI
  final ClerkTranslator translator;

  /// The [clerk.AuthError] stream
  late final errorStream = _errors.stream;

  final _errors = StreamController<clerk.AuthError>.broadcast();
  final OverlayEntry _loadingOverlay;

  static const _kRotatingTokenNonce = 'rotating_token_nonce';

  static const _kSsoRouteName = 'clerk_sso_popup';

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
    final authState = ClerkAuth.of(context, listen: false);
    final client = await call(
      context,
      () => authState.oauthSignIn(strategy: strategy),
      onError: onError,
    );
    final url = client?.signIn?.firstFactorVerification?.providerUrl;
    if (url != null && context.mounted) {
      final redirectUrl = await showDialog<String>(
        context: context,
        useSafeArea: false,
        useRootNavigator: true,
        routeSettings: const RouteSettings(name: _kSsoRouteName),
        builder: (context) => _SsoWebViewOverlay(url: url),
      );
      if (redirectUrl != null && context.mounted) {
        final uri = Uri.parse(redirectUrl);
        final token = uri.queryParameters[_kRotatingTokenNonce];
        if (token case String token) {
          await call(
            context,
            () => authState.attemptSignIn(strategy: strategy, token: token),
            onError: onError,
          );
        } else {
          await authState.refreshClient();
          if (context.mounted) {
            await call(context, () => authState.transfer(), onError: onError);
          }
        }
        if (context.mounted) {
          Navigator.of(context).popUntil(
            (route) => route.settings.name != _kSsoRouteName,
          );
        }
      }
    }
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
      if (context.mounted && !_loadingOverlay.mounted) {
        Overlay.of(context).insert(_loadingOverlay);
      }
      result = await fn();
    } on clerk.AuthError catch (error) {
      _errors.add(error);
      onError?.call(error);
    } finally {
      if (_loadingOverlay.mounted) {
        _loadingOverlay.remove();
      }
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

class _SsoWebViewOverlay extends StatefulWidget {
  const _SsoWebViewOverlay({
    required this.url,
  });

  final String url;

  @override
  State<_SsoWebViewOverlay> createState() => _SsoWebViewOverlayState();
}

class _SsoWebViewOverlayState extends State<_SsoWebViewOverlay> {
  late final WebViewController controller;
  var _title = Future<String?>.value('Loading…');

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setUserAgent(
        'Clerk Flutter SDK v${clerk.ClerkConstants.flutterSdkVersion}',
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) => _updateTitle(),
          onNavigationRequest: (NavigationRequest request) async {
            if (request.url.startsWith(clerk.Auth.oauthRedirect)) {
              scheduleMicrotask(() {
                if (mounted) {
                  Navigator.of(context).pop(request.url);
                }
              });
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    controller.loadRequest(Uri.parse(widget.url));
  }

  void _updateTitle() {
    setState(() {
      _title = controller.getTitle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: FutureBuilder(
          future: _title,
          builder: (context, snapshot) {
            return Text(snapshot.data ?? '');
          },
        ),
        actions: const [CloseButton()],
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
