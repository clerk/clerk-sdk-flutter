import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/generated/clerk_sdk_localizations_en.dart';
import 'package:clerk_flutter/src/utils/clerk_file_cache.dart';
import 'package:clerk_flutter/src/utils/clerk_sdk_grammar.dart';
import 'package:clerk_flutter/src/utils/default_caching_persistor.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart'
    show defaultLoadingWidget;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

/// A map of [Locale] strings to [ClerkSdkLocalizations] instances
///
typedef ClerkSdkLocalizationsCollection = Map<String, ClerkSdkLocalizations>;

/// A map of [Locale] strings to [ClerkSdkGrammar] instances
///
typedef ClerkSdkGrammarCollection = Map<String, ClerkSdkGrammar>;

/// A function that generates a redirect url for a given strategy
///
typedef ClerkRedirectUriGenerator = Uri? Function(BuildContext, clerk.Strategy);

/// An extended [clerk.AuthConfig] to allow the addition of:
///
/// [localizations] for l10n needs
/// [loading] widget
///
@immutable
class ClerkAuthConfig extends clerk.AuthConfig {
  /// Construct a [ClerkAuthConfig]
  ClerkAuthConfig({
    required super.publishableKey,
    super.sessionTokenPollMode,
    super.isTestMode,
    super.telemetryEndpoint,
    super.telemetryPeriod,
    super.clientRefreshPeriod,
    super.httpService,
    super.httpConnectionTimeout,
    this.loading = defaultLoadingWidget,
    this.redirectionGenerator,
    this.deepLinkStream,
    ClerkFileCache? fileCache,
    ClerkSdkLocalizationsCollection? localizations,
    ClerkSdkLocalizations? fallbackLocalization,
    ClerkSdkGrammarCollection? grammars,
    ClerkSdkGrammar? fallbackGrammar,
    clerk.Persistor? persistor,
    ClerkSdkFlags flags = const ClerkSdkFlags(),
  })  : localizations = localizations ?? {'en': _englishLocalizations},
        fallbackLocalization = fallbackLocalization ?? _englishLocalizations,
        grammars = grammars ?? {'en': _englishGrammar},
        fallbackGrammar = fallbackGrammar ?? _englishGrammar,
        fileCache = fileCache ?? _defaultPersistor,
        super(flags: flags, persistor: persistor ?? _defaultPersistor);

  static ClerkSdkLocalizations? _englishLocalizationsInstance;
  static ClerkSdkGrammar? _englishGrammarInstance;
  static DefaultCachingPersistor? _defaultPersistorInstance;

  static get _englishLocalizations =>
      _englishLocalizationsInstance ??= ClerkSdkLocalizationsEn();

  static get _englishGrammar =>
      _englishGrammarInstance ??= const ClerkSdkGrammarEn();

  static get _defaultPersistor =>
      _defaultPersistorInstance ??= DefaultCachingPersistor(
        getCacheDirectory: getApplicationDocumentsDirectory,
      );

  /// [ClerkSdkLocalizationsCollection] for translation within the UI
  final ClerkSdkLocalizationsCollection localizations;

  /// [ClerkSdkLocalizations] for when a locale cannot be found
  final ClerkSdkLocalizations fallbackLocalization;

  /// [ClerkSdkGrammarCollection] for translation within the UI
  final ClerkSdkGrammarCollection grammars;

  /// [ClerkSdkGrammar] for when a locale cannot be found
  final ClerkSdkGrammar fallbackGrammar;

  /// A function to generate a [Uri] for deep link redirection
  /// back into the host app following oauth authentication
  final ClerkRedirectUriGenerator? redirectionGenerator;

  /// A stream of deep links that the host app thinks the Clerk
  /// SDK might be interested in
  final Stream<ClerkDeepLink?>? deepLinkStream;

  /// The [Widget] to display while loading data, override with null
  /// to disable the loading overlay or use your own widget.
  final Widget? loading;

  /// Flags used to affect behaviour
  @override
  ClerkSdkFlags get flags => super.flags as ClerkSdkFlags;

  /// Retrieves the localization for the specified local falling back
  /// to the [fallbackLocalization]
  ClerkSdkLocalizations localizationsForLocale(Locale locale) {
    return localizations[locale.toLanguageTag()] ?? // full tag e.g. en-GB
        localizations[locale.languageCode] ?? // just the language e.g. en
        fallbackLocalization;
  }

  /// An object that will provide access to files from a remote [Uri]
  final ClerkFileCache fileCache;

  @override
  Future<void> initialize() async {
    await super.initialize();
    await fileCache.initialize();
    ClerkSdkGrammar.initialise(grammars, fallbackGrammar);
  }

  @override
  void terminate() {
    fileCache.terminate();
    super.terminate();
  }

  @override
  clerk.LocalesLookup get localesLookup {
    return () => {...localizations.keys, 'en'}.toList(growable: false);
  }
}
