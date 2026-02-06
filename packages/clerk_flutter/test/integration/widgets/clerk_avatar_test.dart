import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_support/test_support.dart';

void main() {
  group('ClerkAvatar', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createTestAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    testWidgets('renders with default diameter', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAvatar(),
        ),
      );
      await tester.pumpAndSettle();

      final decoratedBox = tester.widget<DecoratedBox>(find.byType(DecoratedBox).first);
      expect(decoratedBox, isNotNull);
    });

    testWidgets('renders with custom diameter', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAvatar(diameter: 64),
        ),
      );
      await tester.pumpAndSettle();

      // The avatar should have a SizedBox with the custom diameter
      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.width, 64);
      expect(sizedBox.height, 64);
    });

    testWidgets('displays initials when name is provided', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAvatar(name: 'John Doe'),
        ),
      );
      await tester.pumpAndSettle();

      // Should display initials "JD"
      expect(find.text('JD'), findsOneWidget);
    });

    testWidgets('displays single initial for single name', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAvatar(name: 'John'),
        ),
      );
      await tester.pumpAndSettle();

      // Should display initial "J"
      expect(find.text('J'), findsOneWidget);
    });

    testWidgets('displays nothing when name is empty', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAvatar(name: ''),
        ),
      );
      await tester.pumpAndSettle();

      // Should not display any text
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('applies custom border radius', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAvatar(
            name: 'Test',
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final decoratedBox = tester.widget<DecoratedBox>(find.byType(DecoratedBox).first);
      final decoration = decoratedBox.decoration as BoxDecoration;
      expect(decoration.borderRadius, const BorderRadius.all(Radius.circular(8)));
    });

    testWidgets('uses circular border radius by default', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAvatar(
            name: 'Test',
            diameter: 32,
          ),
        ),
      );
      await tester.pumpAndSettle();

      final decoratedBox = tester.widget<DecoratedBox>(find.byType(DecoratedBox).first);
      final decoration = decoratedBox.decoration as BoxDecoration;
      // Default border radius should be diameter / 2 = 16
      expect(decoration.borderRadius, BorderRadius.circular(16));
    });

    testWidgets('uses theme colors for background', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          themeExtension: ClerkThemeExtension.light,
          child: const ClerkAvatar(name: 'Test'),
        ),
      );
      await tester.pumpAndSettle();

      final decoratedBox = tester.widget<DecoratedBox>(find.byType(DecoratedBox).first);
      final decoration = decoratedBox.decoration as BoxDecoration;
      expect(decoration.color, ClerkThemeExtension.light.colors.text);
    });

    testWidgets('uses dark theme colors when specified', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          themeExtension: ClerkThemeExtension.dark,
          child: const ClerkAvatar(name: 'Test'),
        ),
      );
      await tester.pumpAndSettle();

      final decoratedBox = tester.widget<DecoratedBox>(find.byType(DecoratedBox).first);
      final decoration = decoratedBox.decoration as BoxDecoration;
      expect(decoration.color, ClerkThemeExtension.dark.colors.text);
    });
  });
}

