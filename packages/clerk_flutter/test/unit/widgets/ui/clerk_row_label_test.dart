import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_row_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkRowLabel', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    testWidgets('renders label text in uppercase', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkRowLabel(label: 'primary'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('PRIMARY'), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkRowLabel(
            label: 'clickable',
            onTap: () => tapped = true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('CLICKABLE'));
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('renders with custom color', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkRowLabel(
            label: 'colored',
            color: Colors.red,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('COLORED'), findsOneWidget);
    });

    testWidgets('wraps in GestureDetector', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkRowLabel(label: 'test'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GestureDetector), findsWidgets);
    });

    testWidgets('wraps in DecoratedBox with border', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkRowLabel(label: 'bordered'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(DecoratedBox), findsWidgets);
    });
  });
}

