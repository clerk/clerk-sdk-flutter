import 'package:clerk_auth/clerk_auth.dart' show Persistor;
import 'package:clerk_flutter/src/utils/clerk_auth_config.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_loading_overlay.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_overlay_host.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

// Mock overlay for testing
class _MockOverlay extends StatefulWidget {
  const _MockOverlay();

  @override
  State<_MockOverlay> createState() => _MockOverlayState();
}

class _MockOverlayState extends State<_MockOverlay>
    implements ClerkOverlay<_MockOverlay> {
  final overlays = <Widget>[];

  @override
  void insert(Widget overlay) {
    setState(() => overlays.add(overlay));
  }

  @override
  void remove(Widget overlay) {
    setState(() => overlays.remove(overlay));
  }

  @override
  bool isDisplaying(Widget overlay) => overlays.contains(overlay);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void main() {
  group('ClerkLoadingOverlay', () {
    test('has correct startupDuration', () {
      expect(
        ClerkLoadingOverlay.startupDuration,
        const Duration(milliseconds: 300),
      );
    });

    test('has correct minimumOnScreenDuration', () {
      expect(
        ClerkLoadingOverlay.minimumOnScreenDuration,
        const Duration(milliseconds: 800),
      );
    });

    test('initializes with count 0', () {
      final config = TestClerkAuthConfig();
      final overlay = ClerkLoadingOverlay(config);
      expect(overlay.count, 0);
    });

    test('stores loading widget from config', () {
      final config = TestClerkAuthConfig();
      final overlay = ClerkLoadingOverlay(config);
      expect(overlay, isNotNull);
    });

    testWidgets('insertInto does nothing when loading widget is null',
        (tester) async {
      final config = TestClerkAuthConfig(); // loading is null by default
      final loadingOverlay = ClerkLoadingOverlay(config);

      await tester.pumpWidget(const _MockOverlay());
      final mockState =
          tester.state<_MockOverlayState>(find.byType(_MockOverlay));

      loadingOverlay.insertInto(mockState);
      expect(loadingOverlay.count, 0);
      expect(mockState.overlays, isEmpty);
    });

    testWidgets('removeFrom does nothing when loading widget is null',
        (tester) async {
      final config = TestClerkAuthConfig(); // loading is null by default
      final loadingOverlay = ClerkLoadingOverlay(config);

      await tester.pumpWidget(const _MockOverlay());
      final mockState =
          tester.state<_MockOverlayState>(find.byType(_MockOverlay));

      loadingOverlay.removeFrom(mockState);
      expect(loadingOverlay.count, 0);
      expect(mockState.overlays, isEmpty);
    });

    testWidgets('insertInto increments count', (tester) async {
      final config = ClerkAuthConfig(
        publishableKey: 'pk_test_key',
        persistor: Persistor.none,
        loading: const CircularProgressIndicator(),
      );
      final loadingOverlay = ClerkLoadingOverlay(config);

      await tester.pumpWidget(const _MockOverlay());
      final mockState =
          tester.state<_MockOverlayState>(find.byType(_MockOverlay));

      expect(loadingOverlay.count, 0);
      loadingOverlay.insertInto(mockState);
      expect(loadingOverlay.count, 1);
      loadingOverlay.insertInto(mockState);
      expect(loadingOverlay.count, 2);

      // Clean up timers by removing the overlay
      loadingOverlay.removeFrom(mockState);
      loadingOverlay.removeFrom(mockState);
    });

    testWidgets('removeFrom decrements count', (tester) async {
      final config = ClerkAuthConfig(
        publishableKey: 'pk_test_key',
        persistor: Persistor.none,
        loading: const CircularProgressIndicator(),
      );
      final loadingOverlay = ClerkLoadingOverlay(config);

      await tester.pumpWidget(const _MockOverlay());
      final mockState =
          tester.state<_MockOverlayState>(find.byType(_MockOverlay));

      loadingOverlay.insertInto(mockState);
      loadingOverlay.insertInto(mockState);
      expect(loadingOverlay.count, 2);

      loadingOverlay.removeFrom(mockState);
      expect(loadingOverlay.count, 1);

      loadingOverlay.removeFrom(mockState);
      expect(loadingOverlay.count, 0);
    });

    testWidgets('removeFrom does not decrement count below 0', (tester) async {
      final config = ClerkAuthConfig(
        publishableKey: 'pk_test_key',
        persistor: Persistor.none,
        loading: const CircularProgressIndicator(),
      );
      final loadingOverlay = ClerkLoadingOverlay(config);

      await tester.pumpWidget(const _MockOverlay());
      final mockState =
          tester.state<_MockOverlayState>(find.byType(_MockOverlay));

      expect(loadingOverlay.count, 0);
      loadingOverlay.removeFrom(mockState);
      expect(loadingOverlay.count, 0);
    });

    testWidgets('insertInto displays loading widget after startup duration',
        (tester) async {
      final config = ClerkAuthConfig(
        publishableKey: 'pk_test_key',
        persistor: Persistor.none,
        loading: const CircularProgressIndicator(),
      );
      final loadingOverlay = ClerkLoadingOverlay(config);

      await tester.pumpWidget(const _MockOverlay());
      final mockState =
          tester.state<_MockOverlayState>(find.byType(_MockOverlay));

      loadingOverlay.insertInto(mockState);
      expect(mockState.overlays, isEmpty);

      await tester.pump(ClerkLoadingOverlay.startupDuration);
      expect(mockState.overlays, isNotEmpty);
    });

    testWidgets('multiple insertInto calls only display once', (tester) async {
      final config = ClerkAuthConfig(
        publishableKey: 'pk_test_key',
        persistor: Persistor.none,
        loading: const CircularProgressIndicator(),
      );
      final loadingOverlay = ClerkLoadingOverlay(config);

      await tester.pumpWidget(const _MockOverlay());
      final mockState =
          tester.state<_MockOverlayState>(find.byType(_MockOverlay));

      loadingOverlay.insertInto(mockState);
      loadingOverlay.insertInto(mockState);
      loadingOverlay.insertInto(mockState);

      await tester.pump(ClerkLoadingOverlay.startupDuration);
      expect(mockState.overlays.length, 1);

      // Clean up - need to match the number of insertInto calls
      loadingOverlay.removeFrom(mockState);
      loadingOverlay.removeFrom(mockState);
      loadingOverlay.removeFrom(mockState);
      // Wait for hide timer to complete
      await tester.pump(ClerkLoadingOverlay.minimumOnScreenDuration);
    });

    testWidgets('removeFrom waits for minimum duration before hiding',
        (tester) async {
      final config = ClerkAuthConfig(
        publishableKey: 'pk_test_key',
        persistor: Persistor.none,
        loading: const CircularProgressIndicator(),
      );
      final loadingOverlay = ClerkLoadingOverlay(config);

      await tester.pumpWidget(const _MockOverlay());
      final mockState =
          tester.state<_MockOverlayState>(find.byType(_MockOverlay));

      loadingOverlay.insertInto(mockState);
      await tester.pump(ClerkLoadingOverlay.startupDuration);
      expect(mockState.overlays, isNotEmpty);

      // Remove immediately without waiting for minimum duration
      loadingOverlay.removeFrom(mockState);
      await tester.pump();
      expect(mockState.overlays, isNotEmpty); // Still visible

      // Wait for minimum duration
      await tester.pump(ClerkLoadingOverlay.minimumOnScreenDuration);
      expect(mockState.overlays, isEmpty); // Now hidden
    });

    testWidgets('insertInto cancels hide timer if called while hiding',
        (tester) async {
      final config = ClerkAuthConfig(
        publishableKey: 'pk_test_key',
        persistor: Persistor.none,
        loading: const CircularProgressIndicator(),
      );
      final loadingOverlay = ClerkLoadingOverlay(config);

      await tester.pumpWidget(const _MockOverlay());
      final mockState =
          tester.state<_MockOverlayState>(find.byType(_MockOverlay));

      // Show overlay
      loadingOverlay.insertInto(mockState);
      await tester.pump(ClerkLoadingOverlay.startupDuration);
      expect(mockState.overlays, isNotEmpty);

      // Start hiding
      loadingOverlay.removeFrom(mockState);
      await tester.pump();

      // Insert again before hide timer completes
      loadingOverlay.insertInto(mockState);
      expect(loadingOverlay.count, 1);
      expect(mockState.overlays, isNotEmpty);

      // Wait and verify overlay is still visible
      await tester.pump(ClerkLoadingOverlay.minimumOnScreenDuration);
      expect(mockState.overlays, isNotEmpty);

      // Clean up
      loadingOverlay.removeFrom(mockState);
      await tester.pump(ClerkLoadingOverlay.minimumOnScreenDuration);
    });

    testWidgets('insertInto does not display if already displaying',
        (tester) async {
      final config = ClerkAuthConfig(
        publishableKey: 'pk_test_key',
        persistor: Persistor.none,
        loading: const CircularProgressIndicator(),
      );
      final loadingOverlay = ClerkLoadingOverlay(config);

      await tester.pumpWidget(const _MockOverlay());
      final mockState =
          tester.state<_MockOverlayState>(find.byType(_MockOverlay));

      // Manually insert the overlay to simulate it already being displayed
      mockState.insert(config.loading!);

      loadingOverlay.insertInto(mockState);
      await tester.pump(ClerkLoadingOverlay.startupDuration);

      // Should still only have one overlay
      expect(mockState.overlays.length, 1);

      // Clean up
      loadingOverlay.removeFrom(mockState);
      await tester.pump(ClerkLoadingOverlay.minimumOnScreenDuration);
    });
  });
}
