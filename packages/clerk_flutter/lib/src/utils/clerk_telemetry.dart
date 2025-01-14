import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

/// An abstract class overriding state which allows telemetry
/// events to be generated as widgets are mounted and disposed
///
abstract class TelemetricState<T extends StatefulWidget> extends State<T> {
  static const _equalityChecker = DeepCollectionEquality();

  bool _hasReportedMounted = false;
  Map<String, dynamic> _telemetryData = {};
  ClerkAuthProvider? _telemetryAuth;

  /// The payload of widget metadata that will be sent to telemetry
  Map<String, dynamic> telemetryPayload(ClerkAuthProvider auth, T widget) => {};

  Map<String, dynamic> _telemetryPayload(ClerkAuthProvider auth, T widget) {
    return {
      'component': widget.toString(),
      ...telemetryPayload(auth, widget),
    };
  }

  /// Make the telemetry report to the back end
  void reportTelemetry(void Function(ClerkAuthProvider) callback) {
    _telemetryAuth ??= ClerkAuth.of(context, listen: false);
    callback(_telemetryAuth!);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_hasReportedMounted) {
      // this is an update or a rebuild
      reportTelemetry((auth) async {
        final data = _telemetryPayload(auth, widget);
        if (_equalityChecker.equals(data, _telemetryData) == false) {
          _telemetryData = data;
          await auth.telemetry.sendComponentUpdated(payload: data);
        }
      });
    } else {
      _hasReportedMounted = true;
      // this is the first widget build
      reportTelemetry((auth) async {
        _telemetryData = _telemetryPayload(auth, widget);
        await auth.telemetry.sendComponentMounted(payload: _telemetryData);
      });
    }
  }

  @override
  void dispose() {
    reportTelemetry((auth) async {
      _telemetryData = _telemetryPayload(auth, widget);
      await auth.telemetry.sendComponentDismounted(payload: _telemetryData);
    });
    super.dispose();
  }
}

extension on clerk.Telemetry {
  static const _componentMounted = 'COMPONENT MOUNTED';
  static const _componentUpdated = 'COMPONENT UPDATED';
  static const _componentDismounted = 'COMPONENT DISMOUNTED';

  Future<void> sendComponentMounted({
    required Map<String, dynamic> payload,
  }) async {
    await send(_componentMounted, payload: payload);
  }

  Future<void> sendComponentUpdated({
    required Map<String, dynamic> payload,
  }) async {
    await send(_componentUpdated, payload: payload);
  }

  Future<void> sendComponentDismounted({
    required Map<String, dynamic> payload,
  }) async {
    await send(_componentDismounted, payload: payload);
  }
}
