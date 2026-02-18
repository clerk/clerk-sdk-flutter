import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkVerticalCard', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    testWidgets('renders topPortion', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkVerticalCard(
            topPortion: Text('Top Content'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Top Content'), findsOneWidget);
    });

    testWidgets('renders bottomPortion when provided', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkVerticalCard(
            topPortion: Text('Top'),
            bottomPortion: Text('Bottom Content'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Top'), findsOneWidget);
      expect(find.text('Bottom Content'), findsOneWidget);
    });

    testWidgets('renders DecoratedBox', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkVerticalCard(
            topPortion: Text('Content'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(DecoratedBox), findsWidgets);
    });

    testWidgets('renders Material widgets', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkVerticalCard(
            topPortion: Text('Content'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Material), findsWidgets);
    });

    testWidgets('renders SingleChildScrollView', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkVerticalCard(
            topPortion: Text('Content'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('renders Column', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkVerticalCard(
            topPortion: Text('Content'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('renders with branded display config', (tester) async {
      // Create auth state with branded display config
      final config = TestClerkAuthConfig(
        initialEnvironment: const clerk.Environment(
          config: clerk.Config(
            singleSessionMode: true,
          ),
          display: clerk.DisplayConfig(
            branded: true,
            showDevmodeWarning: false,
          ),
        ),
      );
      final brandedAuthState = await createTestAuthState(config: config);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: brandedAuthState,
          child: const ClerkVerticalCard(
            topPortion: Text('Content'),
          ),
        ),
      );
      await tester.pump();

      // Just verify the widget renders without error
      expect(find.text('Content'), findsOneWidget);

      brandedAuthState.terminate();
    });

    testWidgets('renders with non-branded display config', (tester) async {
      // Default auth state has branded = false
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkVerticalCard(
            topPortion: Text('Content'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Content'), findsOneWidget);
    });
  });
}
