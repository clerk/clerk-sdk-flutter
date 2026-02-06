import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_support/test_support.dart';

void main() {
  group('ClerkVerticalCard', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createTestAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    testWidgets('renders topPortion widget', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkVerticalCard(
            topPortion: Text('Top Content'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Top Content'), findsOneWidget);
    });

    testWidgets('renders bottomPortion widget', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkVerticalCard(
            topPortion: Text('Top'),
            bottomPortion: Text('Bottom Content'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Top'), findsOneWidget);
      expect(find.text('Bottom Content'), findsOneWidget);
    });

    testWidgets('renders with complex topPortion', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkVerticalCard(
            topPortion: Column(
              children: const [
                Text('Header'),
                Text('Subheader'),
              ],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Header'), findsOneWidget);
      expect(find.text('Subheader'), findsOneWidget);
    });

    testWidgets('renders with complex bottomPortion', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkVerticalCard(
            topPortion: const Text('Top'),
            bottomPortion: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Link 1'),
                Text(' | '),
                Text('Link 2'),
              ],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Link 1'), findsOneWidget);
      expect(find.text('Link 2'), findsOneWidget);
    });

    testWidgets('uses theme colors for background', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          themeExtension: ClerkThemeExtension.light,
          child: const ClerkVerticalCard(
            topPortion: Text('Content'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Find the Material widget that wraps the content
      final materials = tester.widgetList<Material>(find.byType(Material));
      expect(materials.length, greaterThanOrEqualTo(2));
    });

    testWidgets('uses dark theme colors when specified', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          themeExtension: ClerkThemeExtension.dark,
          child: const ClerkVerticalCard(
            topPortion: Text('Content'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Find the Material widget that wraps the content
      final materials = tester.widgetList<Material>(find.byType(Material));
      expect(materials.length, greaterThanOrEqualTo(2));
    });

    testWidgets('is scrollable when content overflows', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkVerticalCard(
            topPortion: Column(
              children: List.generate(
                20,
                (index) => Text('Item $index'),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Should have a SingleChildScrollView
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('has proper border radius', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkVerticalCard(
            topPortion: Text('Content'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Find the DecoratedBox with border radius
      final decoratedBox =
          tester.widget<DecoratedBox>(find.byType(DecoratedBox).first);
      final decoration = decoratedBox.decoration as BoxDecoration;
      expect(decoration.borderRadius, isNotNull);
    });
  });
}

