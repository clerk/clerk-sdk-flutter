import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/clerk_user_action.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_action_row.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkActionRow', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    testWidgets('renders action label', (tester) async {
      final action = ClerkUserAction(
        label: 'Test Action',
        callback: (context, authState) {},
      );

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkActionRow(action: action),
        ),
      );
      await tester.pump();

      expect(find.text('Test Action'), findsOneWidget);
    });

    testWidgets('renders icon when provided', (tester) async {
      final action = ClerkUserAction(
        label: 'Test Action',
        icon: Icons.settings,
        callback: (context, authState) {},
      );

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkActionRow(action: action),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.settings), findsOneWidget);
    });

    testWidgets('renders asset icon when provided', (tester) async {
      final action = ClerkUserAction(
        label: 'Test Action',
        asset: 'test_asset',
        callback: (context, authState) {},
      );

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkActionRow(action: action),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkIcon), findsOneWidget);
    });

    testWidgets('calls callback when tapped', (tester) async {
      var callbackCalled = false;
      final action = ClerkUserAction(
        label: 'Test Action',
        callback: (context, authState) {
          callbackCalled = true;
        },
      );

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkActionRow(action: action),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(callbackCalled, isTrue);
    });

    testWidgets('renders in Row layout', (tester) async {
      final action = ClerkUserAction(
        label: 'Test Action',
        callback: (context, authState) {},
      );

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkActionRow(action: action),
        ),
      );
      await tester.pump();

      expect(find.byType(Row), findsWidgets);
    });

    testWidgets('has padding', (tester) async {
      final action = ClerkUserAction(
        label: 'Test Action',
        callback: (context, authState) {},
      );

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkActionRow(action: action),
        ),
      );
      await tester.pump();

      expect(find.byType(Padding), findsWidgets);
    });

    testWidgets('uses GestureDetector for tap handling', (tester) async {
      final action = ClerkUserAction(
        label: 'Test Action',
        callback: (context, authState) {},
      );

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkActionRow(action: action),
        ),
      );
      await tester.pump();

      expect(find.byType(GestureDetector), findsOneWidget);
    });
  });
}

