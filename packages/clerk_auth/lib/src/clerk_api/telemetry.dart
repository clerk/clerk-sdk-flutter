import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clerk_auth/src/clerk_auth/http_service.dart';
import 'package:clerk_auth/src/clerk_auth/persistor.dart';
import 'package:clerk_auth/src/clerk_constants.dart';
import 'package:clerk_auth/src/models/enums.dart';
import 'package:clerk_auth/src/models/telemetry/telemetric_event.dart';
import 'package:clerk_auth/src/utils/logging.dart';

/// Telemetry
///
class Telemetry with Logging {
  Telemetry._(
    this._publishableKey,
    this._persistor,
    this._httpService,
    this._sendTelemetryData,
  );

  /// Create a [Telemetry] object
  factory Telemetry({
    required String publishableKey,
    required Persistor persistor,
    required HttpService httpService,
    required bool sendTelemetryData,
  }) {
    return Telemetry._(
      publishableKey,
      persistor,
      httpService,
      sendTelemetryData,
    );
  }

  final bool _sendTelemetryData;
  final String _publishableKey;
  final Persistor _persistor;
  final HttpService _httpService;
  late final InstanceType _instanceType;
  Timer? _timer;
  final _telemetricEventsQueue = <TelemetricEvent>[];

  static const _kTelemetricEventQueueKey = 'telemetricEventQueue';
  static const _telemetricEventsQueueMaxLength = 2000;
  static final _telemetryEndpoint =
      Uri.parse('https://clerk-telemetry.com/v1/event');
  static const _telemetryPeriod = Duration(seconds: 27);

  /// Are we telemetricising?
  bool get isEnabled => _sendTelemetryData && _instanceType.isDevelopment;

  /// Initialise telemetry
  Future<void> initialize({required InstanceType instanceType}) async {
    _instanceType = instanceType;
    if (isEnabled) {
      final data = await _persistor.read<String>(_kTelemetricEventQueueKey);
      if (data case String data) {
        final jsonList = json.decode(data) as List<dynamic>;
        final eventList = jsonList.map(
          (data) => TelemetricEvent.fromJson(data as Map<String, dynamic>),
        );
        _telemetricEventsQueue.addAll(eventList);
      }
      _timer = Timer.periodic(_telemetryPeriod, _sendTelemetry);
    }
  }

  /// [terminate] the telemetry object
  void terminate() {
    _timer?.cancel();
  }

  /// Send a telemetry event to the backend.
  ///
  Future<void> send(
    String event, {
    required Map<String, dynamic> payload,
  }) async {
    if (isEnabled) {
      final telemetricEvent = TelemetricEvent(
        event: event,
        payload: payload,
      );
      logInfo(telemetricEvent.toJson());
      _telemetricEventsQueue.add(telemetricEvent);
      _persist();
    }
  }

  void _persist() {
    final excess =
        _telemetricEventsQueue.length - _telemetricEventsQueueMaxLength;
    if (excess > 0) {
      _telemetricEventsQueue.removeRange(0, excess);
    }
    _persistor.write(
      _kTelemetricEventQueueKey,
      json.encode(_telemetricEventsQueue),
    );
  }

  Map<String, dynamic> _telemetryPayload(TelemetricEvent event) {
    return {
      'event': event.event,
      'it': _instanceType.toString(),
      'pk': _publishableKey,
      'cv': ClerkConstants.clerkApiVersion,
      'sdk': ClerkConstants.sdkName,
      'sdkv': ClerkConstants.flutterSdkVersion,
      'payload': {
        ...event.payload,
        'ts': event.timestamp.toIso8601String(),
      },
    };
  }

  Future<void> _sendTelemetry(Timer _) async {
    final events = [..._telemetricEventsQueue];
    if (events.isNotEmpty) {
      _telemetricEventsQueue.clear();
      final resp = await _httpService.send(
        HttpMethod.post,
        _telemetryEndpoint,
        body: json.encode({
          'events': [...events.map(_telemetryPayload)]
        }),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      if (resp.statusCode != 200) {
        _telemetricEventsQueue.insertAll(0, events);
      }
      _persist();
    }
  }
}
