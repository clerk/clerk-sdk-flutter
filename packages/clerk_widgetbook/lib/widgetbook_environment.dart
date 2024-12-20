import 'dart:io';

/// Environment variables for the Widgetbook.
class WidgetbookEnvironment {
  /// Creates a new [WidgetbookEnvironment].
  factory WidgetbookEnvironment() {
    final pexelsApiKey = Platform.environment[_kPexelsApiKey];
    if (pexelsApiKey == null) {
      throw Exception('Environment variable $_kPexelsApiKey not set');
    }
    return WidgetbookEnvironment._(pexelsApiKey);
  }

  const WidgetbookEnvironment._(this.pexelsApiKey);

  static const _kPexelsApiKey = 'PEXELS_API_KEY';

  /// The Pexels API key.
  final String pexelsApiKey;
}
