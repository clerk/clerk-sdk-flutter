import 'package:clerk_flutter/src/widgets/ui/clerk_overlay_host.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ClerkOverlayHost', () {
    test('stores child widget', () {
      const child = Text('Test');
      const widget = ClerkOverlayHost(child: child);
      expect(widget.child, child);
    });

    testWidgets('creates state', (tester) async {
      const widget = ClerkOverlayHost(child: Text('Test'));
      final state = widget.createState();
      expect(state, isNotNull);
    });

    testWidgets('renders Stack', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ClerkOverlayHost(
            child: Text('Test'),
          ),
        ),
      );

      expect(find.byType(Stack), findsOneWidget);
    });

    testWidgets('renders IgnorePointer', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ClerkOverlayHost(
            child: Text('Test'),
          ),
        ),
      );

      expect(find.byType(IgnorePointer), findsWidgets);
    });

    testWidgets('renders child widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ClerkOverlayHost(
            child: Text('Test Content'),
          ),
        ),
      );

      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('can insert overlay', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ClerkOverlayHost(
            child: Builder(
              builder: (context) {
                return const Text('Test');
              },
            ),
          ),
        ),
      );

      final overlay = ClerkOverlay.of(
        tester.element(find.text('Test')),
      );

      const overlayWidget = Text('Overlay');
      overlay.insert(overlayWidget);
      await tester.pump();

      expect(find.text('Overlay'), findsOneWidget);
    });

    testWidgets('can remove overlay', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ClerkOverlayHost(
            child: Builder(
              builder: (context) {
                return const Text('Test');
              },
            ),
          ),
        ),
      );

      final overlay = ClerkOverlay.of(
        tester.element(find.text('Test')),
      );

      const overlayWidget = Text('Overlay');
      overlay.insert(overlayWidget);
      await tester.pump();
      expect(find.text('Overlay'), findsOneWidget);

      overlay.remove(overlayWidget);
      await tester.pump();
      expect(find.text('Overlay'), findsNothing);
    });

    testWidgets('isDisplaying returns true when overlay is shown', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ClerkOverlayHost(
            child: Builder(
              builder: (context) {
                return const Text('Test');
              },
            ),
          ),
        ),
      );

      final overlay = ClerkOverlay.of(
        tester.element(find.text('Test')),
      );

      const overlayWidget = Text('Overlay');
      overlay.insert(overlayWidget);
      await tester.pump();

      expect(overlay.isDisplaying(overlayWidget), isTrue);
    });

    testWidgets('isDisplaying returns false when overlay is not shown', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ClerkOverlayHost(
            child: Builder(
              builder: (context) {
                return const Text('Test');
              },
            ),
          ),
        ),
      );

      final overlay = ClerkOverlay.of(
        tester.element(find.text('Test')),
      );

      const overlayWidget = Text('Overlay');
      expect(overlay.isDisplaying(overlayWidget), isFalse);
    });
  });
}

