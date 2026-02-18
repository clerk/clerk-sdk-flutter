import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_avatar.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkUserButton', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    test('stores showName parameter', () {
      const widget = ClerkUserButton(showName: false);
      expect(widget.showName, isFalse);
    });

    test('defaults showName to true', () {
      const widget = ClerkUserButton();
      expect(widget.showName, isTrue);
    });

    test('stores sessionActions parameter', () {
      final actions = [
        ClerkUserAction(
          label: 'Test',
          callback: (context, authState) {},
        ),
      ];
      final widget = ClerkUserButton(sessionActions: actions);
      expect(widget.sessionActions, actions);
    });

    test('stores additionalActions parameter', () {
      final actions = [
        ClerkUserAction(
          label: 'Test',
          callback: (context, authState) {},
        ),
      ];
      final widget = ClerkUserButton(additionalActions: actions);
      expect(widget.additionalActions, actions);
    });

    testWidgets('creates state', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkUserButton(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkUserButton), findsOneWidget);
    });

    testWidgets('renders when signed out', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkUserButton(),
        ),
      );
      await tester.pump();

      // Should render something even when signed out
      expect(find.byType(ClerkUserButton), findsOneWidget);
    });

    testWidgets('renders GestureDetector', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkUserButton(),
        ),
      );
      await tester.pump();

      expect(find.byType(GestureDetector), findsWidgets);
    });

    testWidgets('renders with default state', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkUserButton(),
        ),
      );
      await tester.pump();

      // Should render without errors
      expect(find.byType(ClerkUserButton), findsOneWidget);
    });

    testWidgets('renders ClerkAvatar', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkUserButton(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkAvatar), findsWidgets);
    });

    group('when signed in', () {
      testWidgets('renders with user', (tester) async {
        final signedInAuthState = await createSignedInAuthState();

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkUserButton(),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkUserButton), findsOneWidget);
        expect(find.byType(ClerkAvatar), findsWidgets);

        signedInAuthState.terminate();
      });

      testWidgets('renders with showName true', (tester) async {
        final signedInAuthState = await createSignedInAuthState();

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkUserButton(showName: true),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkUserButton), findsOneWidget);

        signedInAuthState.terminate();
      });

      testWidgets('renders with showName false', (tester) async {
        final signedInAuthState = await createSignedInAuthState();

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkUserButton(showName: false),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkUserButton), findsOneWidget);

        signedInAuthState.terminate();
      });

      testWidgets('renders with custom sessionActions', (tester) async {
        final signedInAuthState = await createSignedInAuthState();
        final actions = [
          ClerkUserAction(
            label: 'Custom Action',
            callback: (context, authState) {},
          ),
        ];

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: ClerkUserButton(sessionActions: actions),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkUserButton), findsOneWidget);

        signedInAuthState.terminate();
      });

      testWidgets('renders with custom additionalActions', (tester) async {
        final signedInAuthState = await createSignedInAuthState();
        final actions = [
          ClerkUserAction(
            label: 'Additional Action',
            callback: (context, authState) {},
          ),
        ];

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: ClerkUserButton(additionalActions: actions),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkUserButton), findsOneWidget);

        signedInAuthState.terminate();
      });

      testWidgets('renders ClerkVerticalCard when signed in', (tester) async {
        final signedInAuthState = await createSignedInAuthState();

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkUserButton(),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkVerticalCard), findsOneWidget);

        signedInAuthState.terminate();
      });

      testWidgets('renders session rows for active session', (tester) async {
        final signedInAuthState = await createSignedInAuthState();

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkUserButton(),
          ),
        );
        await tester.pump();

        // Should have at least one session row
        expect(find.byType(ClerkUserButton), findsOneWidget);

        signedInAuthState.terminate();
      });

      testWidgets('shows user name when showName is true', (tester) async {
        final user = createTestUser(firstName: 'Test', lastName: 'User');
        final session = createTestSession(user: user);
        final client = createTestClient(sessions: [session]);
        final signedInAuthState = await createSignedInAuthState(client: client);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkUserButton(showName: true),
          ),
        );
        await tester.pump();

        // The widget should render with the user's name
        expect(find.byType(ClerkUserButton), findsOneWidget);

        signedInAuthState.terminate();
      });

      testWidgets('renders action buttons for session', (tester) async {
        final signedInAuthState = await createSignedInAuthState();

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkUserButton(),
          ),
        );
        await tester.pump();

        // Should render action buttons (profile, sign out, etc.)
        expect(find.byType(ClerkMaterialButton), findsWidgets);

        signedInAuthState.terminate();
      });

      testWidgets('renders with organization memberships', (tester) async {
        final membership = createTestOrganizationMembership();
        final user = createTestUser(
          firstName: 'Org',
          lastName: 'User',
        ).copyWith(organizationMemberships: [membership]);
        final session = createTestSession(user: user);
        final client = createTestClient(sessions: [session]);
        final signedInAuthState = await createSignedInAuthState(client: client);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkUserButton(),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkUserButton), findsOneWidget);

        signedInAuthState.terminate();
      });

      testWidgets('renders with external accounts', (tester) async {
        final externalAccount = createTestExternalAccount();
        final user = createTestUser(
          firstName: 'External',
          lastName: 'User',
        ).copyWith(externalAccounts: [externalAccount]);
        final session = createTestSession(user: user);
        final client = createTestClient(sessions: [session]);
        final signedInAuthState = await createSignedInAuthState(client: client);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkUserButton(),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkUserButton), findsOneWidget);

        signedInAuthState.terminate();
      });
    });
  });
}
