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
}
