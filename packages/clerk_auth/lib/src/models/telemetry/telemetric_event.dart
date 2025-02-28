import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'telemetric_event.g.dart';

/// A [TelemetricEvent] to be sent to the backend
///
@immutable
@JsonSerializable()
class TelemetricEvent with InformativeToStringMixin {
  /// Create a [TelemetricEvent]
  TelemetricEvent({
    required this.event,
    required this.payload,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.timestamp();

  /// The event identifier
  @JsonKey(name: 'ev')
  final String event;

  /// timestamp
  @JsonKey(name: 'ts')
  final DateTime timestamp;

  /// payload
  final Map<String, dynamic> payload;

  /// fromJson
  static TelemetricEvent fromJson(Map<String, dynamic> json) =>
      _$TelemetricEventFromJson(json);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$TelemetricEventToJson(this);
}
