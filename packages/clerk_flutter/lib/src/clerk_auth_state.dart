import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Function type used to report [clerk.AuthError]s
///
typedef ClerkErrorCallback = void Function(clerk.AuthError);

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
    clerk.HttpService httpService = const clerk.DefaultHttpService(),
    clerk.SessionTokenPollMode pollMode = clerk.SessionTokenPollMode.lazy,
    Widget? loading,
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

  /// Performs SSO account connection according to the [strategy]
  Future<void> ssoConnect(
    BuildContext context,
    clerk.Strategy strategy, {
    ClerkErrorCallback? onError,
  }) async {
    await safelyCall(
      context,
      () => oauthConnect(strategy: strategy),
      onError: onError,
    );
    final accounts = client.user?.externalAccounts?.toSet() ?? {};
    final acc = accounts.firstWhereOrNull(
      (m) => m.verification.strategy == strategy && m.isVerified == false,
    );
    if (acc?.verification.externalVerificationRedirectUrl case String url) {
      if (context.mounted) {
        final responseUrl = await showDialog<String>(
          context: context,
          useSafeArea: false,
          useRootNavigator: true,
          routeSettings: const RouteSettings(name: _kSsoRouteName),
          builder: (context) => _SsoWebViewOverlay(
            url: url,
            onError: (error) => _onError(error, onError),
          ),
        );
        if (responseUrl == clerk.ClerkConstants.oauthRedirect) {
          await refreshClient();

          final newAccounts = client.user?.externalAccounts?.toSet() ?? {};

          if (newAccounts.difference(accounts).isNotEmpty && context.mounted) {
            Navigator.of(context).popUntil(
              (route) => route.settings.name != _kSsoRouteName,
            );
          }
        }
      }
    }
  }

  /// Performs SSO sign in according to the [strategy]
  Future<void> ssoSignIn(
    BuildContext context,
    clerk.Strategy strategy, {
    ClerkErrorCallback? onError,
  }) async {
    await safelyCall(
      context,
      () => oauthSignIn(strategy: strategy),
      onError: onError,
    );
    final url =
        client.signIn?.firstFactorVerification?.externalVerificationRedirectUrl;
    if (url != null && context.mounted) {
      final redirectUrl = await showDialog<String>(
        context: context,
        useSafeArea: false,
        useRootNavigator: true,
        routeSettings: const RouteSettings(name: _kSsoRouteName),
        builder: (context) => _SsoWebViewOverlay(
          url: url,
          onError: (error) => _onError(error, onError),
        ),
      );
      if (redirectUrl != null && context.mounted) {
        final uri = Uri.parse(redirectUrl);
        final token = uri.queryParameters[_kRotatingTokenNonce];
        if (token case String token) {
          await safelyCall(
            context,
            () => attemptSignIn(strategy: strategy, token: token),
            onError: onError,
          );
        } else {
          await refreshClient();
          if (context.mounted) {
            await safelyCall(context, () => transfer(), onError: onError);
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
  Future<T?> safelyCall<T>(
    BuildContext context,
    Future<T> Function() fn, {
    ClerkErrorCallback? onError,
  }) async {
    T? result;

    bool showLoading = true;
    scheduleMicrotask(
      () {
        if (showLoading && context.mounted && !_loadingOverlay.mounted) {
          Overlay.of(context).insert(_loadingOverlay);
        }
      },
    );

    try {
      result = await fn();
    } on clerk.AuthError catch (error) {
      _onError(error, onError);
    } finally {
      showLoading = false;
      if (_loadingOverlay.mounted) {
        _loadingOverlay.remove();
      }
    }
    return result;
  }

  void _onError(clerk.AuthError error, ClerkErrorCallback? onError) {
    _errors.add(error);
    onError?.call(error);
  }

  /// Returns a boolean regarding whether or not a password has been supplied,
  /// matches a confirmation string and meets the criteria required by `env`
  bool passwordIsValid(String? password, String? confirmation) =>
      password == confirmation &&
      password?.isNotEmpty == true &&
      env.user.passwordSettings.meetsRequiredCriteria(password!);

  /// Checks the password according to the criteria required by the `env`
  String? checkPassword(String? password, String? confirmation) {
    if (password?.isNotEmpty != true) {
      return translator.translate('A password must be supplied');
    }

    if (password != confirmation) {
      return translator.translate(
        'Password and password confirmation must match',
      );
    }

    if (password case String password when password.isNotEmpty) {
      final criteria = env.user.passwordSettings;
      final missing = <String>[];

      if (criteria.meetsLengthCriteria(password) == false) {
        if (criteria.maxLength > 0) {
          missing.add(
            translator.translate(
              'a length of between ### and #2#',
              substitutions: [criteria.minLength, criteria.maxLength],
            ),
          );
        } else {
          missing.add(
            translator.translate(
              'a length of ### or greater',
              substitution: criteria.minLength,
            ),
          );
        }
      }

      if (criteria.meetsLowerCaseCriteria(password) == false) {
        missing.add(translator.translate('a LOWERCASE letter'));
      }

      if (criteria.meetsUpperCaseCriteria(password) == false) {
        missing.add(translator.translate('an UPPERCASE letter'));
      }

      if (criteria.meetsNumberCriteria(password) == false) {
        missing.add(translator.translate('a NUMBER'));
      }

      if (criteria.meetsSpecialCharCriteria(password) == false) {
        missing.add(
          translator.translate(
            'a SPECIAL CHARACTER (###)',
            substitution: criteria.allowedSpecialCharacters,
          ),
        );
      }

      if (missing.isNotEmpty) {
        return translator.alternatives(
          missing,
          connector: translator.translate('and'),
          prefix: translator.translate('Password requires'),
        );
      }
    }

    return null;
  }

  /// Add an [clerk.AuthError] for [message] to the [errorStream]
  void addError(String message) {
    _errors.add(clerk.AuthError(message: message));
  }
}

class _SsoWebViewOverlay extends StatefulWidget {
  const _SsoWebViewOverlay({
    required this.url,
    required this.onError,
  });

  final String url;

  final ClerkErrorCallback onError;

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
          onWebResourceError: (e) => widget.onError(
            clerk.AuthError(message: e.toString()),
          ),
          onNavigationRequest: (NavigationRequest request) async {
            try {
              if (request.url.startsWith(clerk.ClerkConstants.oauthRedirect)) {
                scheduleMicrotask(() {
                  if (mounted) {
                    Navigator.of(context).pop(request.url);
                  }
                });
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            } on clerk.AuthError catch (error) {
              widget.onError(error);
              return NavigationDecision.navigate;
            }
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
