import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkMaterialButtonStyle', () {
    test('has light value', () {
      expect(ClerkMaterialButtonStyle.light, isNotNull);
    });

    test('has dark value', () {
      expect(ClerkMaterialButtonStyle.dark, isNotNull);
    });
  });

  group('ClerkMaterialButton', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    testWidgets('renders with label', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkMaterialButton(
            label: Text('Test Button'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var pressed = false;

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkMaterialButton(
            onPressed: () => pressed = true,
            label: const Text('Tap Me'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Tap Me'));
      await tester.pumpAndSettle();

      expect(pressed, isTrue);
    });

    testWidgets('renders with dark style by default', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkMaterialButton(
            label: Text('Dark Button'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(FilledButton), findsOneWidget);
    });

    testWidgets('renders with light style', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkMaterialButton(
            style: ClerkMaterialButtonStyle.light,
            label: Text('Light Button'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(FilledButton), findsOneWidget);
    });

    testWidgets('renders with custom elevation', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkMaterialButton(
            elevation: 4.0,
            label: Text('Elevated'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Elevated'), findsOneWidget);
    });

    testWidgets('renders square button when square is true', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkMaterialButton(
            square: true,
            height: 40,
            label: Icon(Icons.add),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.width, 40);
      expect(sizedBox.height, 40);
    });

    testWidgets('renders with custom height', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkMaterialButton(
            height: 48,
            label: Text('Tall Button'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.height, 48);
    });
  });
}

