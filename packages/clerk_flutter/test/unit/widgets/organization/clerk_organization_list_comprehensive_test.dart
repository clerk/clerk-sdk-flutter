import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkOrganizationList - Comprehensive Tests', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    group('Organization Management', () {
      testWidgets('renders current organization with edit arrow',
          (tester) async {
        final org = createTestOrganization(
          id: 'org_current',
          name: 'Current Org',
        );
        final membership = createTestOrganizationMembership(
          id: 'mem_1',
          organization: org,
          roleName: 'Admin',
        );
        final user = createTestUser(
          organizationMemberships: [membership],
        );
        final session = createTestSession(
          user: user,
          lastActiveOrganizationId: org.id,
        );
        final client = createTestClient(sessions: [session]);

        final signedInAuthState = await createTestAuthState(
          config: TestClerkAuthConfig(initialClient: client),
        );
        addTearDown(signedInAuthState.terminate);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkOrganizationList(),
          ),
        );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 600));

        expect(find.byType(ClerkOrganizationList), findsOneWidget);
        expect(find.text('Current Org'), findsOneWidget);
      });

      testWidgets('renders multiple organizations', (tester) async {
        final org1 = createTestOrganization(
          id: 'org_1',
          name: 'Organization One',
        );
        final org2 = createTestOrganization(
          id: 'org_2',
          name: 'Organization Two',
        );
        final membership1 = createTestOrganizationMembership(
          id: 'mem_1',
          organization: org1,
        );
        final membership2 = createTestOrganizationMembership(
          id: 'mem_2',
          organization: org2,
        );
        final user = createTestUser(
          organizationMemberships: [membership1, membership2],
        );
        final session = createTestSession(
          user: user,
          lastActiveOrganizationId: org1.id,
        );
        final client = createTestClient(sessions: [session]);

        final signedInAuthState = await createTestAuthState(
          config: TestClerkAuthConfig(initialClient: client),
        );
        addTearDown(signedInAuthState.terminate);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkOrganizationList(),
          ),
        );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 600));

        expect(find.byType(ClerkOrganizationList), findsOneWidget);
      });

      testWidgets('renders organization with image', (tester) async {
        final org = createTestOrganization(
          id: 'org_with_image',
          name: 'Org With Image',
          imageUrl: 'https://example.com/image.png',
          hasImage: true,
        );
        final membership = createTestOrganizationMembership(
          id: 'mem_1',
          organization: org,
        );
        final user = createTestUser(
          organizationMemberships: [membership],
        );
        final session = createTestSession(
          user: user,
          lastActiveOrganizationId: org.id,
        );
        final client = createTestClient(sessions: [session]);

        final signedInAuthState = await createTestAuthState(
          config: TestClerkAuthConfig(initialClient: client),
        );
        addTearDown(signedInAuthState.terminate);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkOrganizationList(),
          ),
        );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 600));

        expect(find.byType(ClerkOrganizationList), findsOneWidget);
        expect(find.text('Org With Image'), findsOneWidget);
      });

      testWidgets('renders organization without image', (tester) async {
        final org = createTestOrganization(
          id: 'org_no_image',
          name: 'Org Without Image',
          hasImage: false,
        );
        final membership = createTestOrganizationMembership(
          id: 'mem_1',
          organization: org,
        );
        final user = createTestUser(
          organizationMemberships: [membership],
        );
        final session = createTestSession(
          user: user,
          lastActiveOrganizationId: org.id,
        );
        final client = createTestClient(sessions: [session]);

        final signedInAuthState = await createTestAuthState(
          config: TestClerkAuthConfig(initialClient: client),
        );
        addTearDown(signedInAuthState.terminate);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkOrganizationList(),
          ),
        );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 600));

        expect(find.byType(ClerkOrganizationList), findsOneWidget);
        expect(find.text('Org Without Image'), findsOneWidget);
      });

      testWidgets('renders organization with role name', (tester) async {
        final org = createTestOrganization(
          id: 'org_with_role',
          name: 'Org With Role',
        );
        final membership = createTestOrganizationMembership(
          id: 'mem_1',
          organization: org,
          roleName: 'Administrator',
        );
        final user = createTestUser(
          organizationMemberships: [membership],
        );
        final session = createTestSession(
          user: user,
          lastActiveOrganizationId: org.id,
        );
        final client = createTestClient(sessions: [session]);

        final signedInAuthState = await createTestAuthState(
          config: TestClerkAuthConfig(initialClient: client),
        );
        addTearDown(signedInAuthState.terminate);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkOrganizationList(),
          ),
        );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 600));

        expect(find.byType(ClerkOrganizationList), findsOneWidget);
        expect(find.text('Org With Role'), findsOneWidget);
      });
    });

    group('Custom Actions', () {
      testWidgets('renders with custom actions', (tester) async {
        final user = createTestUser(createOrganizationEnabled: true);
        final session = createTestSession(user: user);
        final client = createTestClient(sessions: [session]);

        final signedInAuthState = await createTestAuthState(
          config: TestClerkAuthConfig(initialClient: client),
        );
        addTearDown(signedInAuthState.terminate);

        bool actionCalled = false;
        final actions = [
          ClerkUserAction(
            label: 'Custom Action',
            callback: (context, authState) {
              actionCalled = true;
            },
          ),
        ];

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: ClerkOrganizationList(actions: actions),
          ),
        );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 600));

        expect(find.byType(ClerkOrganizationList), findsOneWidget);
        expect(find.text('Custom Action'), findsOneWidget);

        // Tap the custom action
        await tester.tap(find.text('Custom Action'));
        await tester.pump();

        expect(actionCalled, isTrue);
      });

      testWidgets('renders default create organization action when enabled',
          (tester) async {
        final user = createTestUser(createOrganizationEnabled: true);
        final session = createTestSession(user: user);
        final client = createTestClient(sessions: [session]);

        final signedInAuthState = await createTestAuthState(
          config: TestClerkAuthConfig(initialClient: client),
        );
        addTearDown(signedInAuthState.terminate);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkOrganizationList(),
          ),
        );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 600));

        expect(find.byType(ClerkOrganizationList), findsOneWidget);
      });

      testWidgets('does not render create organization action when disabled',
          (tester) async {
        final user = createTestUser(createOrganizationEnabled: false);
        final session = createTestSession(user: user);
        final client = createTestClient(sessions: [session]);

        final signedInAuthState = await createTestAuthState(
          config: TestClerkAuthConfig(initialClient: client),
        );
        addTearDown(signedInAuthState.terminate);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkOrganizationList(),
          ),
        );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 600));

        expect(find.byType(ClerkOrganizationList), findsOneWidget);
      });
    });

    group('Organization Row', () {
      testWidgets('renders organization row with name', (tester) async {
        final org = createTestOrganization(
          id: 'org_row_test',
          name: 'Row Test Org',
        );
        final membership = createTestOrganizationMembership(
          id: 'mem_1',
          organization: org,
        );
        final user = createTestUser(
          organizationMemberships: [membership],
        );
        final session = createTestSession(
          user: user,
          lastActiveOrganizationId: org.id,
        );
        final client = createTestClient(sessions: [session]);

        final signedInAuthState = await createTestAuthState(
          config: TestClerkAuthConfig(initialClient: client),
        );
        addTearDown(signedInAuthState.terminate);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkOrganizationList(),
          ),
        );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 600));

        expect(find.text('Row Test Org'), findsOneWidget);
      });
    });
  });
}
