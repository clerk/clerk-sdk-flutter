import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// An abstract class that provides insight into parameters with which
/// an instance is created
///
abstract class TelemetricStatefulWidget extends StatefulWidget {
  /// Construct a [TelemetricStatefulWidget]
  const TelemetricStatefulWidget({super.key});

  /// Return a map of widget metadata
  Map<String, dynamic> toJson() => const {};

  Map<String, dynamic> _toJson() {
    return {
      'component': toString(),
      ...toJson(),
    };
  }
}

/// An abstract class overriding state which allows telemetry
/// events to be generated as widgets are mounted and disposed
///
abstract class TelemetricState<T extends TelemetricStatefulWidget>
    extends State<T> with TelemetryExtensions {
  late final clerk.Auth _telemetryAuth;

  @override
  void didChangeDependencies() {
    _telemetryAuth = ClerkAuth.of(context);
    super.didChangeDependencies();
    reportComponentMounted(_telemetryAuth, widget._toJson());
  }

  @override
  void dispose() {
    reportComponentDismounted(_telemetryAuth, widget._toJson());
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    super.didUpdateWidget(oldWidget);
    final json = widget._toJson();
    if (json.deepEqual(oldWidget.toJson()) == false) {
      reportComponentUpdated(_telemetryAuth, json);
    }
  }
}

/// An abstract class that allows the stateless widget to also
/// provide telemetry information (although technically no longer
/// stateless, of course)
///
abstract class TelemetricStatelessWidget extends TelemetricStatefulWidget {
  /// Construct a [TelemetricStatelessWidget]
  const TelemetricStatelessWidget({super.key});

  /// Build the widget tree
  Widget build(BuildContext context);

  @override
  State<TelemetricStatelessWidget> createState() =>
      _TelemetricStatelessWidgetState();
}

class _TelemetricStatelessWidgetState
    extends TelemetricState<TelemetricStatelessWidget> {
  @override
  Widget build(BuildContext context) => widget.build(context);
}

/// Mixin that provides the telemetry reporting function
mixin TelemetryExtensions {
  bool _mountingHasBeenReported = false;

  /// Report that a component has mounted
  Future<void> reportComponentMounted(
    clerk.Auth auth,
    Map<String, dynamic> payload,
  ) async {
    if (_mountingHasBeenReported == false) {
      await auth.sendTelemetry('COMPONENT MOUNTED', payload: payload);
      _mountingHasBeenReported = true; // only report mounting once
    }
  }

  /// Report that a component has dismounted
  Future<void> reportComponentDismounted(
    clerk.Auth auth,
    Map<String, dynamic> payload,
  ) async =>
      await auth.sendTelemetry('COMPONENT DISMOUNTED', payload: payload);

  /// Report that a component has been updated
  Future<void> reportComponentUpdated(
    clerk.Auth auth,
    Map<String, dynamic> payload,
  ) async =>
      await auth.sendTelemetry('COMPONENT UPDATED', payload: payload);

  /// Report that a component has been updated
  Future<void> reportTelemetricEvent(
    String event, {
    required clerk.Auth auth,
    Map<String, dynamic> payload = const {},
  }) async =>
      await auth.sendTelemetry(event, payload: payload);
}
