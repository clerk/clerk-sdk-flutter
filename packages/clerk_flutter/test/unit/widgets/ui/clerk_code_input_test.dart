import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_code_input.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_text_form_field.dart';
import 'package:clerk_flutter/src/widgets/ui/multi_digit_code_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkCodeInput', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    testWidgets('renders with title', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkCodeInput(
            title: 'Enter Code',
            onSubmit: (code) async => true,
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Enter Code'), findsOneWidget);
    });

    testWidgets('renders with subtitle', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkCodeInput(
            title: 'Title',
            subtitle: 'Subtitle text',
            onSubmit: (code) async => true,
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Subtitle text'), findsOneWidget);
    });

    testWidgets('renders MultiDigitCodeInput when not textual', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkCodeInput(
            isTextual: false,
            onSubmit: (code) async => true,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(MultiDigitCodeInput), findsOneWidget);
    });

    testWidgets('renders ClerkTextFormField when textual', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkCodeInput(
            isTextual: true,
            onSubmit: (code) async => true,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkTextFormField), findsOneWidget);
    });

    testWidgets('renders without title when null', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkCodeInput(
            onSubmit: (code) async => true,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(MultiDigitCodeInput), findsOneWidget);
    });

    testWidgets('renders without subtitle when null', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkCodeInput(
            title: 'Title',
            onSubmit: (code) async => true,
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Title'), findsOneWidget);
    });

    testWidgets('passes isSmall to MultiDigitCodeInput', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkCodeInput(
            isSmall: true,
            onSubmit: (code) async => true,
          ),
        ),
      );
      await tester.pump();

      final multiDigit = tester.widget<MultiDigitCodeInput>(
        find.byType(MultiDigitCodeInput),
      );
      expect(multiDigit.isSmall, isTrue);
    });

    testWidgets('passes code to MultiDigitCodeInput', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkCodeInput(
            code: '123456',
            onSubmit: (code) async => true,
          ),
        ),
      );
      await tester.pump();

      final multiDigit = tester.widget<MultiDigitCodeInput>(
        find.byType(MultiDigitCodeInput),
      );
      expect(multiDigit.code, '123456');
    });

    testWidgets('renders with Column layout', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkCodeInput(
            title: 'Title',
            onSubmit: (code) async => true,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkCodeInput), findsOneWidget);
    });
  });
}

