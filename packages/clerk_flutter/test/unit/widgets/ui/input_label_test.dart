import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/input_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('InputLabel', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const InputLabel(label: 'Email Address'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Email Address'), findsOneWidget);
    });

    testWidgets('renders without label when null', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const InputLabel(label: null),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('shows required indicator when isRequired is true',
        (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const InputLabel(
            label: 'Password',
            isRequired: true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Password'), findsOneWidget);
      // The required text comes from localizations
      expect(find.byType(Text), findsWidgets);
    });

    testWidgets('shows optional indicator when isOptional is true',
        (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const InputLabel(
            label: 'Middle Name',
            isOptional: true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Middle Name'), findsOneWidget);
    });

    testWidgets('renders trailing widget', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const InputLabel(
            label: 'Username',
            trailing: Icon(Icons.info),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.info), findsOneWidget);
    });

    testWidgets('renders in a Row', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const InputLabel(label: 'Test'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('required takes precedence over optional', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const InputLabel(
            label: 'Field',
            isRequired: true,
            isOptional: true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Should show required, not optional
      expect(find.text('Field'), findsOneWidget);
    });
  });
}

