import '_version.dart';

/// constant values
sealed class ClerkConstants {
  /// value for the `clerk-api-version` header in API requests
  static const clerkApiVersion = '2024-10-01';

  /// value for the `x-flutter-sdk-version` header in API requests
  static const flutterSdkVersion = packageVersion;

  /// Name of the SDK
  static const sdkName = '@clerk/clerk-sdk-flutter';

  /// JsVersion of API
  static const jsVersion = '4.70.0';

  /// Native device ID
  static const nativeDeviceId = '';

  /// The default url catch oauth redirects
  static const oauthRedirect = String.fromEnvironment(
    'oauth_redirect',
    defaultValue: 'com.flutter.example://callback',
  );

  /// Are we in test mode?
  static const isTestMode =
      bool.fromEnvironment('test_mode', defaultValue: false);

  /// Is Telemetry enabled?
  static const isTelemetryEnabled =
      bool.fromEnvironment('telemetry', defaultValue: true);

  /// The endpoint to hit when sending telemetry data
  static const telemetryEndpoint = String.fromEnvironment(
    'telemetry_endpoint',
    defaultValue: 'https://clerk-telemetry.com/v1/event',
  );

  /// The duration between sends of telemtry data: about 30s, but not
  /// exactly on the button to avoid repeated clashes with other
  /// regular tasks
  static const telemetryPeriod =
      int.fromEnvironment('telemetry_period_ms', defaultValue: 29300);
}
