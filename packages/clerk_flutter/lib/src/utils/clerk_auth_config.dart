import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/generated/clerk_sdk_localizations_en.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart'
    show defaultLoadingWidget;
import 'package:flutter/material.dart';

/// A map of [Locale] strings to [ClerkSdkLocalizations] instances
///
typedef ClerkSdkLocalizationsCollection = Map<String, ClerkSdkLocalizations>;

/// A function that generates a redirect url for a given strategy
///
typedef ClerkRedirectUriGenerator = Uri? Function(clerk.Strategy);

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
    ClerkSdkLocalizationsCollection? localizations,
    ClerkSdkLocalizations? fallbackLocalization,
    this.loading = defaultLoadingWidget,
    this.redirectionGenerator,
  })  : localizations = localizations ?? {'en': _englishLocalizations},
        fallbackLocalization = fallbackLocalization ?? _englishLocalizations;

  static final _englishLocalizations = ClerkSdkLocalizationsEn();

  /// [ClerkSdkLocalizationsCollection] for translation within the UI
  final ClerkSdkLocalizationsCollection localizations;

  /// [ClerkSdkLocalizations] for when a locale cannot be found
  final ClerkSdkLocalizations fallbackLocalization;

  /// A function to generate a [Uri] for deep link redirection
  /// back into the host app following oauth authentication
  final ClerkRedirectUriGenerator? redirectionGenerator;

  /// The [Widget] to display while loading data, override with null
  /// to disable the loading overlay or use your own widget.
  final Widget? loading;

  /// Retrieves the localization for the specified local falling back
  /// to the [fallbackLocalization]
  ClerkSdkLocalizations localizationsForLocale(Locale locale) {
    return localizations[locale.toLanguageTag()] ?? // full tag e.g. en_GB
        localizations[locale.languageCode] ?? // just the language e.g. en
        fallbackLocalization;
  }

  @override
  clerk.LocalesLookup get localesLookup {
    return () => {...localizations.keys, 'en'}.toList(growable: false);
  }
}
