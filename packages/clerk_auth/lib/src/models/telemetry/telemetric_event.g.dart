// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telemetric_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TelemetricEvent _$TelemetricEventFromJson(Map<String, dynamic> json) =>
    TelemetricEvent(
      event: json['ev'] as String,
      payload: json['payload'] as Map<String, dynamic>,
      timestamp:
          json['ts'] == null ? null : DateTime.parse(json['ts'] as String),
    );

Map<String, dynamic> _$TelemetricEventToJson(TelemetricEvent instance) =>
    <String, dynamic>{
      'ev': instance.event,
      'ts': instance.timestamp.toIso8601String(),
      'payload': instance.payload,
    };
