import 'package:clerk_auth/clerk_auth.dart';

/// A [TelemetricEvent] to be sent to the backend
///
class TelemetricEvent {
  /// Create a [TelemetricEvent]
  TelemetricEvent({
    required this.event,
    required this.it,
    required this.pk,
    required this.payload,
  }) : timestamp = DateTime.timestamp();

  /// The event identifier
  final String event;

  /// instance type
  final String it;

  /// publishable key
  final String pk;

  /// payload
  final Map<String, dynamic> payload;

  /// timestamp
  final DateTime timestamp;

  /// Convert the event to a usable form
  Map<String, dynamic> toJson() {
    return {
      'event': event,
      'cv': ClerkConstants.clerkApiVersion,
      'it': it,
      'sdk': ClerkConstants.sdkName,
      'sdkv': ClerkConstants.flutterSdkVersion,
      'pk': pk,
      'payload': {
        ...payload,
        'timestamp': timestamp.toIso8601String(),
      },
    };
  }
}
