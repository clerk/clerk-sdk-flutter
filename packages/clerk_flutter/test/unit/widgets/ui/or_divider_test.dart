import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('OrDivider', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    testWidgets('renders with "or" text', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const OrDivider(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('or'), findsOneWidget);
    });

    testWidgets('renders two dividers', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const OrDivider(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Divider), findsNWidgets(2));
    });

    testWidgets('renders in a Row', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const OrDivider(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Row), findsOneWidget);
    });
  });
}

