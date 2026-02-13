import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_control_buttons.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkControlButtons', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    testWidgets('renders continue button when onContinue is provided',
        (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkControlButtons(
            onContinue: () {},
            onBack: null,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ClerkMaterialButton), findsOneWidget);
      expect(find.byIcon(Icons.arrow_right_sharp), findsOneWidget);
    });

    testWidgets('renders back button when onBack is provided', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkControlButtons(
            onContinue: null,
            onBack: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ClerkMaterialButton), findsOneWidget);
      expect(find.byIcon(Icons.arrow_left_sharp), findsOneWidget);
    });

    testWidgets('renders both buttons when both callbacks provided',
        (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkControlButtons(
            onContinue: () {},
            onBack: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ClerkMaterialButton), findsNWidgets(2));
      expect(find.byIcon(Icons.arrow_left_sharp), findsOneWidget);
      expect(find.byIcon(Icons.arrow_right_sharp), findsOneWidget);
    });

    testWidgets('renders no buttons when both callbacks are null',
        (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkControlButtons(
            onContinue: null,
            onBack: null,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ClerkMaterialButton), findsNothing);
    });

    testWidgets('calls onContinue when continue button tapped', (tester) async {
      var continueCalled = false;

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkControlButtons(
            onContinue: () => continueCalled = true,
            onBack: null,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.arrow_right_sharp));
      await tester.pumpAndSettle();

      expect(continueCalled, isTrue);
    });

    testWidgets('calls onBack when back button tapped', (tester) async {
      var backCalled = false;

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkControlButtons(
            onContinue: null,
            onBack: () => backCalled = true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.arrow_left_sharp));
      await tester.pumpAndSettle();

      expect(backCalled, isTrue);
    });

    testWidgets('renders in a Row', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkControlButtons(
            onContinue: () {},
            onBack: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Row), findsWidgets);
    });
  });
}

