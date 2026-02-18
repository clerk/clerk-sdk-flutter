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
      final mockState = tester.state<_MockOverlayState>(find.byType(_MockOverlay));

      loadingOverlay.insertInto(mockState);
      expect(loadingOverlay.count, 0);
      expect(mockState.overlays, isEmpty);
    });

    testWidgets('removeFrom does nothing when loading widget is null',
        (tester) async {
      final config = TestClerkAuthConfig(); // loading is null by default
      final loadingOverlay = ClerkLoadingOverlay(config);

      await tester.pumpWidget(const _MockOverlay());
      final mockState = tester.state<_MockOverlayState>(find.byType(_MockOverlay));

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
      final mockState = tester.state<_MockOverlayState>(find.byType(_MockOverlay));

      expect(loadingOverlay.count, 0);
      loadingOverlay.insertInto(mockState);
      expect(loadingOverlay.count, 1);
      loadingOverlay.insertInto(mockState);
      expect(loadingOverlay.count, 2);

      // Clean up timers
      await tester.pumpAndSettle();
    });

    testWidgets('removeFrom decrements count', (tester) async {
      final config = ClerkAuthConfig(
        publishableKey: 'pk_test_key',
        persistor: Persistor.none,
        loading: const CircularProgressIndicator(),
      );
      final loadingOverlay = ClerkLoadingOverlay(config);

      await tester.pumpWidget(const _MockOverlay());
      final mockState = tester.state<_MockOverlayState>(find.byType(_MockOverlay));

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
      final mockState = tester.state<_MockOverlayState>(find.byType(_MockOverlay));

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
      final mockState = tester.state<_MockOverlayState>(find.byType(_MockOverlay));

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
      final mockState = tester.state<_MockOverlayState>(find.byType(_MockOverlay));

      loadingOverlay.insertInto(mockState);
      loadingOverlay.insertInto(mockState);
      loadingOverlay.insertInto(mockState);

      await tester.pump(ClerkLoadingOverlay.startupDuration);
      expect(mockState.overlays.length, 1);
    });
  });
}

