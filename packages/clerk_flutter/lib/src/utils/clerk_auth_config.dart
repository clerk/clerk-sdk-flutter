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
  const ClerkAuthConfig({
    required super.publishableKey,
    super.sessionTokenPollMode,
    super.isTestMode,
    super.telemetryEndpoint,
    super.telemetryPeriod,
    super.clientRefreshPeriod,
    ClerkSdkLocalizationsCollection? localizations,
    this.loading = defaultLoadingWidget,
  }) : _localizations = localizations;

  static ClerkSdkLocalizationsCollection get _defaultLocalizations =>
      {'en': ClerkSdkLocalizationsEn()};

  /// [localizations] for translation within the UI
  ClerkSdkLocalizationsCollection get localizations =>
      _localizations ?? _defaultLocalizations;
  final ClerkSdkLocalizationsCollection? _localizations;

  /// The [Widget] to display while loading data, override with null
  /// to disable the loading overlay or use your own widget.
  final Widget? loading;

  @override
  clerk.LocalesLookup get localesLookup =>
      () => localizations.keys.toList(growable: false);
}
