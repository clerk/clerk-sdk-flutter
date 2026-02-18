import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/closeable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkOrganizationList', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    test('stores actions parameter', () {
      final actions = [
        ClerkUserAction(
          label: 'Test',
          callback: (context, authState) {},
        ),
      ];
      final widget = ClerkOrganizationList(actions: actions);
      expect(widget.actions, actions);
    });

    testWidgets('creates state', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkOrganizationList(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkOrganizationList), findsOneWidget);
    });

    testWidgets('renders when signed out', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkOrganizationList(),
        ),
      );
      await tester.pump();

      // Should render something even when signed out
      expect(find.byType(ClerkOrganizationList), findsOneWidget);
    });

    testWidgets('renders Column when signed in', (tester) async {
      final signedInAuthState = await createSignedInAuthState();
      addTearDown(signedInAuthState.terminate);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: signedInAuthState,
          child: const ClerkOrganizationList(),
        ),
      );
      await tester.pump();

      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('renders Closeable widget when signed in', (tester) async {
      final signedInAuthState = await createSignedInAuthState();
      addTearDown(signedInAuthState.terminate);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: signedInAuthState,
          child: const ClerkOrganizationList(),
        ),
      );
      await tester.pump();

      expect(find.byType(Closeable), findsWidgets);
    });

    testWidgets('renders with default state', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkOrganizationList(),
        ),
      );
      await tester.pump();

      // Should render without errors
      expect(find.byType(ClerkOrganizationList), findsOneWidget);
    });

    group('when signed in', () {
      testWidgets('renders with user', (tester) async {
        final signedInAuthState = await createSignedInAuthState();
        addTearDown(signedInAuthState.terminate);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkOrganizationList(),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkOrganizationList), findsOneWidget);
      });

      testWidgets('renders with custom actions', (tester) async {
        final signedInAuthState = await createSignedInAuthState();
        addTearDown(signedInAuthState.terminate);

        final actions = [
          ClerkUserAction(
            label: 'Custom Action',
            callback: (context, authState) {},
          ),
        ];

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: ClerkOrganizationList(actions: actions),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkOrganizationList), findsOneWidget);
      });

      testWidgets('renders organization list', (tester) async {
        final signedInAuthState = await createSignedInAuthState();
        addTearDown(signedInAuthState.terminate);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkOrganizationList(),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkOrganizationList), findsOneWidget);
        expect(find.byType(Column), findsWidgets);
      });

      testWidgets('renders without actions', (tester) async {
        final signedInAuthState = await createSignedInAuthState();
        addTearDown(signedInAuthState.terminate);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkOrganizationList(),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkOrganizationList), findsOneWidget);
      });
    });
  });
}
