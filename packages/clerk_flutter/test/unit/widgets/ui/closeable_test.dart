import 'package:clerk_flutter/src/widgets/ui/closeable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ClosingAxis', () {
    test('both isVertical returns true', () {
      expect(ClosingAxis.both.isVertical, isTrue);
    });

    test('both isHorizontal returns true', () {
      expect(ClosingAxis.both.isHorizontal, isTrue);
    });

    test('horizontal isVertical returns false', () {
      expect(ClosingAxis.horizontal.isVertical, isFalse);
    });

    test('horizontal isHorizontal returns true', () {
      expect(ClosingAxis.horizontal.isHorizontal, isTrue);
    });

    test('vertical isVertical returns true', () {
      expect(ClosingAxis.vertical.isVertical, isTrue);
    });

    test('vertical isHorizontal returns false', () {
      expect(ClosingAxis.vertical.isHorizontal, isFalse);
    });
  });

  group('Closeable', () {
    testWidgets('renders child when not closed', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Closeable(
            closed: false,
            child: Text('Visible'),
          ),
        ),
      );

      expect(find.text('Visible'), findsOneWidget);
    });

    testWidgets('hides child when closed', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Closeable(
            closed: true,
            child: Text('Hidden'),
          ),
        ),
      );

      // Child should not be rendered when closed
      expect(find.text('Hidden'), findsNothing);
    });

    testWidgets('animates from open to closed', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Closeable(
            closed: false,
            child: Text('Content'),
          ),
        ),
      );

      expect(find.text('Content'), findsOneWidget);

      await tester.pumpWidget(
        const MaterialApp(
          home: Closeable(
            closed: true,
            child: Text('Content'),
          ),
        ),
      );

      // During animation, content should still be visible
      expect(find.text('Content'), findsOneWidget);

      // After animation completes
      await tester.pumpAndSettle();
      expect(find.text('Content'), findsNothing);
    });

    testWidgets('keeps child alive when keepAlive is true', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Closeable(
            closed: true,
            keepAlive: true,
            startsClosed: false,
            child: Text('Kept Alive'),
          ),
        ),
      );

      await tester.pumpAndSettle();
      // Child should still be in the tree even when closed
      expect(find.text('Kept Alive'), findsOneWidget);
    });

    testWidgets('uses custom duration', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Closeable(
            closed: false,
            duration: Duration(seconds: 1),
            child: Text('Custom Duration'),
          ),
        ),
      );

      expect(find.text('Custom Duration'), findsOneWidget);
    });

    testWidgets('uses custom axis', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Closeable(
            closed: false,
            axis: ClosingAxis.horizontal,
            child: Text('Horizontal'),
          ),
        ),
      );

      expect(find.text('Horizontal'), findsOneWidget);
    });
  });

  group('Openable', () {
    testWidgets('renders child when open', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Openable(
            open: true,
            child: Text('Open Content'),
          ),
        ),
      );

      expect(find.text('Open Content'), findsOneWidget);
    });

    testWidgets('hides child when not open', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Openable(
            open: false,
            child: Text('Closed Content'),
          ),
        ),
      );

      expect(find.text('Closed Content'), findsNothing);
    });
  });
}

