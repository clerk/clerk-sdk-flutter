import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/generated/clerk_sdk_localizations_en.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart'
    show defaultLoadingWidget;
import 'package:flutter/material.dart';

/// A map of [Locale] strings to [ClerkSdkLocalizations] instances
///
typedef ClerkSdkLocalizationsCollection = Map<String, ClerkSdkLocalizations>;

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
  })  : _localizations = localizations ?? {'en': _englishLocalizations},
        _fallbackLocalization = fallbackLocalization ?? _englishLocalizations;

  static final _englishLocalizations = ClerkSdkLocalizationsEn();

  /// [ClerkSdkLocalizationsCollection] for translation within the UI
  final ClerkSdkLocalizationsCollection _localizations;

  /// [ClerkSdkLocalizations] for when a locale cannot be found
  final ClerkSdkLocalizations _fallbackLocalization;

  /// The [Widget] to display while loading data, override with null
  /// to disable the loading overlay or use your own widget.
  final Widget? loading;

  /// Retrieves the localization for the specified local falling back
  /// to the [fallbackLocalization]
  ClerkSdkLocalizations localizationsForLocale(Locale locale) {
    return _localizations[locale.toLanguageTag()] ?? // full tag e.g. en_GB
        _localizations[locale.languageCode] ?? // just the language e.g. en
        _fallbackLocalization;
  }

  @override
  clerk.LocalesLookup get localesLookup {
    return () => {..._localizations.keys, 'en'}.toList(growable: false);
  }
}
