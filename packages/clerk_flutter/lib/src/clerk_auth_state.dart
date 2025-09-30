import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/clerk_sdk_localization_ext.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_loading_overlay.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_overlay_host.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Function type used to report [clerk.AuthError]s
///
typedef ClerkErrorCallback = void Function(clerk.AuthError);

/// An extension of [clerk.Auth] with [ChangeNotifier] so that
/// updates to the auth state can be propagated out into the UI
///
class ClerkAuthState extends clerk.Auth with ChangeNotifier {
  /// Construct a [ClerkAuthState]
  ClerkAuthState._(this._config)
      : _loadingOverlay = ClerkLoadingOverlay(_config),
        super(config: _config);

  /// Create an [ClerkAuthState] object using appropriate Clerk credentials
  static Future<ClerkAuthState> create({
    required ClerkAuthConfig config,
  }) async {
    final authState = ClerkAuthState._(config);
    await authState.initialize();
    return authState;
  }

  /// The [ClerkAuthConfig] object
  @override
  ClerkAuthConfig get config => _config;
  final ClerkAuthConfig _config;

  StreamSubscription<ClerkDeepLink?>? _deepLinkSub;

  @override
  Future<void> initialize() async {
    await super.initialize();
    _deepLinkSub ??= config.deepLinkStream?.listen(_processDeepLink);
  }

  @override
  void terminate() {
    _deepLinkSub?.cancel();
    _deepLinkSub = null;
    dispose();
    super.terminate();
  }

  void _processDeepLink(ClerkDeepLink? link) {
    if (link case ClerkDeepLink link) {
      parseDeepLink(link);
    }
  }

  /// Localizations for the current [ClerkAuthState] and [Locale]
  ClerkSdkLocalizations localizationsOf(BuildContext context) {
    final locale = View.of(context).platformDispatcher.locale;
    return config.localizationsForLocale(locale);
  }

  final ClerkLoadingOverlay _loadingOverlay;

  static const _kRotatingTokenNonce = 'rotating_token_nonce';
  static const _kSsoRouteName = 'clerk_sso_popup';

  @override
  void update() {
    super.update();
    notifyListeners();
  }

  @override
  Future<void> signOut() async {
    if (config.flags.clearCookiesOnSignOut) {
      await WebViewCookieManager().clearCookies();
    }
    await super.signOut();
  }

  /// Performs SSO account connection according to the [strategy]
  Future<void> ssoConnect(
    BuildContext context,
    clerk.Strategy strategy, {
    ClerkErrorCallback? onError,
  }) async {
    final redirect = config.redirectionGenerator?.call(context, strategy);
    await safelyCall(
      context,
      () => oauthConnect(strategy: strategy, redirect: redirect),
      onError: onError,
    );
    final accounts = client.user?.externalAccounts?.toSet() ?? {};
    final acc = accounts.firstWhereOrNull(
      (m) => m.verification.strategy == strategy && m.isVerified == false,
    );
    final url = acc?.verification.externalVerificationRedirectUrl;
    if (url is String && context.mounted) {
      final uri = Uri.parse(url);
      if (redirect == null) {
        // The default redirect: we handle this in-app
        final responseUrl = await showDialog<String>(
          context: context,
          useSafeArea: false,
          useRootNavigator: true,
          routeSettings: const RouteSettings(name: _kSsoRouteName),
          builder: (BuildContext context) {
            return _SsoWebViewOverlay(
              strategy: strategy,
              uri: uri,
              onError: (error) => _onError(error, onError),
            );
          },
        );
        if (responseUrl?.startsWith(clerk.ClerkConstants.oauthRedirect) ==
            true) {
          await refreshClient();

          final newAccounts = client.user?.externalAccounts?.toSet() ?? {};

          if (newAccounts.difference(accounts).isNotEmpty && context.mounted) {
            Navigator.of(context).popUntil(
              (route) => route.settings.name != _kSsoRouteName,
            );
          }
        }
      } else {
        // a bespoke redirect: we handle externally, and assume a deep link
        // will complete sign-in
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  /// Performs SSO sign in according to the [strategy]
  Future<void> ssoSignIn(
    BuildContext context,
    clerk.Strategy strategy, {
    String? identifier,
    ClerkErrorCallback? onError,
  }) async {
    final redirect = config.redirectionGenerator?.call(context, strategy);
    await safelyCall(
      context,
      () => oauthSignIn(
        strategy: strategy,
        identifier: identifier,
        redirect: redirect,
      ),
      onError: onError,
    );
    final url =
        client.signIn?.firstFactorVerification?.externalVerificationRedirectUrl;
    if (url is String && context.mounted) {
      final uri = Uri.parse(url);
      if (redirect == null) {
        // The default redirect: we handle this in-app
        final redirectUrl = await showDialog<String>(
          context: context,
          useSafeArea: false,
          useRootNavigator: true,
          routeSettings: const RouteSettings(name: _kSsoRouteName),
          builder: (context) => _SsoWebViewOverlay(
            strategy: strategy,
            uri: uri,
            onError: (error) => _onError(error, onError),
          ),
        );
        if (redirectUrl != null && context.mounted) {
          final uri = Uri.parse(redirectUrl);
          await safelyCall(
            context,
            () => parseDeepLink(ClerkDeepLink(strategy: strategy, uri: uri)),
            onError: onError,
          );
          if (context.mounted) {
            Navigator.of(context).popUntil(
              (route) => route.settings.name != _kSsoRouteName,
            );
          }
        }
      } else {
        // a bespoke redirect: we handle externally, and assume a deep link
        // will complete sign-in
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  /// Performs SSO sign in according to the [strategy]
  Future<void> ssoSignUp(
    BuildContext context,
    clerk.Strategy strategy, {
    ClerkErrorCallback? onError,
  }) async {
    final redirect = config.redirectionGenerator?.call(context, strategy) ??
        Uri.parse(clerk.ClerkConstants.oauthRedirect);
    final redirectUrl = redirect.toString();
    await safelyCall(
      context,
      () => attemptSignUp(strategy: strategy, redirectUrl: redirectUrl),
      onError: onError,
    );
    if (context.mounted == false) {
      return;
    }

    final url = client.signUp?.verifications.values
        .map((v) => v.externalVerificationRedirectUrl)
        .nonNulls
        .firstOrNull;

    if (url case String url) {
      final uri = Uri.parse(url);
      if (redirectUrl.startsWith(clerk.ClerkConstants.oauthRedirect)) {
        // The default redirect: we handle this in-app
        final redirectUrl = await showDialog<String>(
          context: context,
          useSafeArea: false,
          useRootNavigator: true,
          routeSettings: const RouteSettings(name: _kSsoRouteName),
          builder: (context) => _SsoWebViewOverlay(
            strategy: strategy,
            uri: uri,
            onError: (error) => _onError(error, onError),
          ),
        );
        if (redirectUrl != null && context.mounted) {
          await safelyCall(
            context,
            () => parseDeepLink(
              ClerkDeepLink(strategy: strategy, uri: Uri.parse(redirectUrl)),
            ),
            onError: onError,
          );
          if (context.mounted) {
            Navigator.of(context).popUntil(
              (route) => route.settings.name != _kSsoRouteName,
            );
          }
        }
      } else {
        // a bespoke redirect: we handle externally, and assume a deep link
        // will complete sign-in
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  /// Return a redirect url for email verification, or null if
  /// not appropriate
  Uri? emailVerificationRedirectUri(BuildContext context) {
    if (env.supportsEmailLink) {
      return config.redirectionGenerator
          ?.call(context, clerk.Strategy.emailLink);
    }
    return null;
  }

  /// Parse a [Uri] played into the app by a deep link, and complete
  /// sign in accordingly. Returns [true] if parsing was successful,
  /// else [false]
  ///
  /// If the link contains no known [clerk.Strategy], it is assumed that the
  /// final element of the [uri.path] will be the name of the strategy to use
  Future<bool> parseDeepLink(ClerkDeepLink link) async {
    final strategy = switch (link.strategy) {
      clerk.Strategy strategy when strategy.isKnown => strategy,
      _ => clerk.Strategy.fromJson(link.uri.pathSegments.last),
    };

    if (strategy.isUnknown) {
      return false;
    } else if (strategy == clerk.Strategy.emailLink) {
      await refreshClient();
    } else if (link.uri.queryParameters[_kRotatingTokenNonce] case String token
        when strategy.isSSO) {
      await completeOAuthSignIn(strategy: strategy, token: token);
    } else {
      await refreshClient();
      await transfer();
    }

    return true;
  }

  /// Convenience method to make an auth call to the backend via ClerkAuth
  /// with error handling
  Future<T?> safelyCall<T>(
    BuildContext context,
    Future<T> Function() fn, {
    ClerkErrorCallback? onError,
  }) async {
    T? result;
    final overlay = ClerkOverlay.of(context);
    _loadingOverlay.insertInto(overlay);
    try {
      result = await fn();
    } on clerk.AuthError catch (error) {
      _onError(error, onError);
    } finally {
      _loadingOverlay.removeFrom(overlay);
    }
    return result;
  }

  void _onError(clerk.AuthError error, ClerkErrorCallback? onError) {
    addError(error);
    onError?.call(error);
  }

  /// Returns a boolean regarding whether or not a password has been supplied,
  /// matches a confirmation string and meets the criteria required by `env`
  bool passwordIsValid(String? password, String? confirmation) =>
      password == confirmation &&
      password?.isNotEmpty == true &&
      env.user.passwordSettings.meetsRequiredCriteria(password!);

  /// Checks the password according to the criteria required by the `env`
  String? checkPassword(
    String? password,
    String? confirmation,
    BuildContext context,
  ) {
    final l10ns = ClerkAuth.localizationsOf(context);

    if (password?.isNotEmpty != true) {
      return null;
    }

    if (password?.orNullIfEmpty != confirmation?.orNullIfEmpty) {
      return l10ns.passwordAndPasswordConfirmationMustMatch;
    }

    if (password case String password when password.isNotEmpty) {
      final criteria = env.user.passwordSettings;
      final missing = <String>[];

      if (criteria.meetsLengthCriteria(password) == false) {
        if (criteria.maxLength > 0) {
          missing.add(
            l10ns.aLengthOfBetweenMINAndMAX(
              criteria.minLength,
              criteria.maxLength,
            ),
          );
        } else {
          missing.add(
            l10ns.aLengthOfMINOrGreater(criteria.minLength),
          );
        }
      }

      if (criteria.meetsLowerCaseCriteria(password) == false) {
        missing.add(l10ns.aLowercaseLetter);
      }

      if (criteria.meetsUpperCaseCriteria(password) == false) {
        missing.add(l10ns.anUppercaseLetter);
      }

      if (criteria.meetsNumberCriteria(password) == false) {
        missing.add(l10ns.aNumber);
      }

      if (criteria.meetsSpecialCharCriteria(password) == false) {
        missing.add(
          l10ns.aSpecialCharacter(criteria.allowedSpecialCharacters),
        );
      }

      if (missing.isNotEmpty) {
        return l10ns.grammar.toLitany(
          missing,
          context: context,
          inclusive: true,
          note: l10ns.passwordRequires,
        );
      }
    }

    return null;
  }
}

class _SsoWebViewOverlay extends StatefulWidget {
  const _SsoWebViewOverlay({
    required this.strategy,
    required this.uri,
    required this.onError,
  });

  final clerk.Strategy strategy;
  final Uri uri;
  final ClerkErrorCallback onError;

  @override
  State<_SsoWebViewOverlay> createState() => _SsoWebViewOverlayState();
}

class _SsoWebViewOverlayState extends State<_SsoWebViewOverlay> {
  late final WebViewController controller;
  Future<String?>? _title;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) => _updateTitle(),
          onWebResourceError: (e) => widget.onError(
            clerk.AuthError(
              code: clerk.AuthErrorCode.webviewErrorResponse,
              message: e.description,
            ),
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

    // For google authentication we use a custom user-agent
    if (widget.strategy.provider == clerk.Strategy.oauthGoogle.provider) {
      controller.setUserAgent(clerk.ClerkConstants.userAgent);
      controller.loadRequest(widget.uri);
    } else {
      controller.getUserAgent().then((String? userAgent) {
        if (mounted) {
          if (userAgent != null) {
            controller.setUserAgent(
              '$userAgent ${clerk.ClerkConstants.userAgent}',
            );
          }
          controller.loadRequest(widget.uri);
        }
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _title ??= Future<String?>.value(
      ClerkAuth.localizationsOf(context).loading,
    );
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
          future: _title!,
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
