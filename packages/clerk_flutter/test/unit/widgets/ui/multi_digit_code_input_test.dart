import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/multi_digit_code_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('MultiDigitCodeInput', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    test('stores onSubmit callback', () {
      Future<bool> onSubmit(String code) async => true;
      final widget = MultiDigitCodeInput(onSubmit: onSubmit);

      expect(widget.onSubmit, onSubmit);
    });

    test('stores length parameter', () {
      final widget = MultiDigitCodeInput(
        onSubmit: (code) async => true,
        length: 8,
      );

      expect(widget.length, 8);
    });

    test('uses default length of 6', () {
      final widget = MultiDigitCodeInput(
        onSubmit: (code) async => true,
      );

      expect(widget.length, 6);
    });

    test('stores isSmall parameter', () {
      final widget = MultiDigitCodeInput(
        onSubmit: (code) async => true,
        isSmall: true,
      );

      expect(widget.isSmall, isTrue);
    });

    test('stores focusNode parameter', () {
      final focusNode = FocusNode();
      final widget = MultiDigitCodeInput(
        onSubmit: (code) async => true,
        focusNode: focusNode,
      );

      expect(widget.focusNode, focusNode);
      focusNode.dispose();
    });

    test('stores code parameter', () {
      final widget = MultiDigitCodeInput(
        onSubmit: (code) async => true,
        code: '123456',
      );

      expect(widget.code, '123456');
    });

    test('uses empty string as default code', () {
      final widget = MultiDigitCodeInput(
        onSubmit: (code) async => true,
      );

      expect(widget.code, '');
    });

    testWidgets('renders Focus widget', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: MultiDigitCodeInput(
            onSubmit: (code) async => true,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Focus), findsOneWidget);
    });

    testWidgets('renders GestureDetector', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: MultiDigitCodeInput(
            onSubmit: (code) async => true,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets('renders Row', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: MultiDigitCodeInput(
            onSubmit: (code) async => true,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Row), findsWidgets);
    });

    testWidgets('renders correct number of digits', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: MultiDigitCodeInput(
            onSubmit: (code) async => true,
            length: 4,
          ),
        ),
      );
      await tester.pump();

      // Each digit is rendered as a DecoratedBox
      expect(find.byType(DecoratedBox), findsNWidgets(4));
    });

    testWidgets('renders 6 digits by default', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: MultiDigitCodeInput(
            onSubmit: (code) async => true,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(DecoratedBox), findsNWidgets(6));
    });

    testWidgets('creates state', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: MultiDigitCodeInput(
            onSubmit: (code) async => true,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(MultiDigitCodeInput), findsOneWidget);
    });

    testWidgets('renders with custom length', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: MultiDigitCodeInput(
            onSubmit: (code) async => true,
            length: 8,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(DecoratedBox), findsNWidgets(8));
    });
  });
}

