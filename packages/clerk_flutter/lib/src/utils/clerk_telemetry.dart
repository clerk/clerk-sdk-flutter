import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

/// An abstract class overriding state which allows telemetry
/// events to be generated as widgets are mounted and disposed
///
mixin ClerkTelemetryStateMixin<T extends StatefulWidget> on State<T> {
  static const _equalityChecker = DeepCollectionEquality();

  Map<String, dynamic>? _telemetryData;

  /// The [clerk.Auth] object being used for telemetry
  late clerk.Auth telemetryAuth = ClerkAuth.of(context, listen: false);

  /// Get the [ClerkAuthState] with which to make the telemetry report
  /// to the back end. (Needs to be nullable because of the override
  /// in ClerkAuth which cannot be guaranteed populated)
  late clerk.Telemetry? telemetry = telemetryAuth.telemetry;

  /// The payload of widget metadata that will be sent to telemetry
  Map<String, dynamic> get telemetryPayload => const {};

  Map<String, dynamic> _generateTelemetryPayload() {
    return {
      'component': widget.toString(),
      ...telemetryPayload,
    };
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (telemetry case final telemetry? when telemetry.isEnabled) {
      // this is an update or a rebuild
      if (_telemetryData is Map<String, dynamic>) {
        final data = _generateTelemetryPayload();
        if (_equalityChecker.equals(data, _telemetryData) == false) {
          _telemetryData = data;
          telemetry.sendComponentUpdated(data);
        }
      }
      // this is the first widget build
      else {
        _telemetryData = _generateTelemetryPayload();
        telemetry.sendComponentMounted(_telemetryData!);
      }
    }
  }

  @override
  void dispose() {
    if (telemetry case final telemetry? when telemetry.isEnabled) {
      telemetry.sendComponentDismounted(_generateTelemetryPayload());
    }
    super.dispose();
  }
}

extension on clerk.Telemetry {
  static const _componentMounted = 'COMPONENT MOUNTED';
  static const _componentUpdated = 'COMPONENT UPDATED';
  static const _componentDismounted = 'COMPONENT DISMOUNTED';

  Future<void> sendComponentMounted(Map<String, dynamic> payload) async {
    await send(_componentMounted, payload: payload);
  }

  Future<void> sendComponentUpdated(Map<String, dynamic> payload) async {
    await send(_componentUpdated, payload: payload);
  }

  Future<void> sendComponentDismounted(Map<String, dynamic> payload) async {
    await send(_componentDismounted, payload: payload);
  }
}
