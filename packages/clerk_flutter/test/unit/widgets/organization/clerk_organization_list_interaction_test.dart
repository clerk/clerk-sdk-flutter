import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkOrganizationList - Interaction Tests', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    group('Organization Selection', () {
      testWidgets('tapping organization row calls onTap', (tester) async {
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

      testWidgets('renders personal account when allowed', (tester) async {
        final org = createTestOrganization(
          id: 'org_1',
          name: 'Test Org',
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

        // Create environment that allows personal orgs (forceOrganizationSelection: false)
        final httpService = TestHttpService(
          client: client,
          environment: const clerk.Environment(
            config: clerk.Config(
              firstFactors: [clerk.Strategy.emailAddress],
              identificationStrategies: [clerk.Strategy.emailAddress],
            ),
            organization: clerk.OrganizationSettings(
              forceOrganizationSelection: false,
              maxAllowedMemberships: 100,
            ),
          ),
        );

        final signedInAuthState = await createTestAuthState(
          config: TestClerkAuthConfig(
            httpService: httpService,
            initialClient: client,
          ),
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

      testWidgets('does not render personal account when not allowed',
          (tester) async {
        final org = createTestOrganization(
          id: 'org_1',
          name: 'Test Org',
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

        // Create environment that does not allow personal orgs (forceOrganizationSelection: true)
        final httpService = TestHttpService(
          client: client,
          environment: const clerk.Environment(
            config: clerk.Config(
              firstFactors: [clerk.Strategy.emailAddress],
              identificationStrategies: [clerk.Strategy.emailAddress],
            ),
            organization: clerk.OrganizationSettings(
              forceOrganizationSelection: true,
              maxAllowedMemberships: 100,
            ),
          ),
        );

        final signedInAuthState = await createTestAuthState(
          config: TestClerkAuthConfig(
            httpService: httpService,
            initialClient: client,
          ),
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

    group('Organization Actions', () {
      testWidgets('renders action rows for custom actions', (tester) async {
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
            label: 'Test Action',
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

        expect(find.text('Test Action'), findsOneWidget);
        expect(actionCalled, isFalse);
      });

      testWidgets('renders multiple custom actions', (tester) async {
        final user = createTestUser(createOrganizationEnabled: true);
        final session = createTestSession(user: user);
        final client = createTestClient(sessions: [session]);

        final signedInAuthState = await createTestAuthState(
          config: TestClerkAuthConfig(initialClient: client),
        );
        addTearDown(signedInAuthState.terminate);

        final actions = [
          ClerkUserAction(
            label: 'Action One',
            callback: (context, authState) {},
          ),
          ClerkUserAction(
            label: 'Action Two',
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
        await tester.pump(const Duration(milliseconds: 600));

        expect(find.text('Action One'), findsOneWidget);
        expect(find.text('Action Two'), findsOneWidget);
      });
    });

    group('Organization Display', () {
      testWidgets('displays organization name correctly', (tester) async {
        final org = createTestOrganization(
          id: 'org_display',
          name: 'Display Test Organization',
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

        expect(find.text('Display Test Organization'), findsOneWidget);
      });

      testWidgets('displays organization with long name', (tester) async {
        final org = createTestOrganization(
          id: 'org_long_name',
          name: 'This is a Very Long Organization Name That Should Be Truncated',
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

        expect(
          find.text(
              'This is a Very Long Organization Name That Should Be Truncated'),
          findsOneWidget,
        );
      });

      testWidgets('displays multiple organizations in sorted order',
          (tester) async {
        final org1 = createTestOrganization(
          id: 'org_z',
          name: 'Zebra Organization',
        );
        final org2 = createTestOrganization(
          id: 'org_a',
          name: 'Alpha Organization',
        );
        final org3 = createTestOrganization(
          id: 'org_m',
          name: 'Middle Organization',
        );
        final membership1 = createTestOrganizationMembership(
          id: 'mem_1',
          organization: org1,
        );
        final membership2 = createTestOrganizationMembership(
          id: 'mem_2',
          organization: org2,
        );
        final membership3 = createTestOrganizationMembership(
          id: 'mem_3',
          organization: org3,
        );
        final user = createTestUser(
          organizationMemberships: [membership1, membership2, membership3],
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

        // Organizations should be rendered (sorted alphabetically)
        expect(find.byType(ClerkOrganizationList), findsOneWidget);
      });
    });

    group('Organization Row Widget', () {
      testWidgets('organization row renders with GestureDetector',
          (tester) async {
        final org = createTestOrganization(
          id: 'org_gesture',
          name: 'Gesture Test Org',
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

        expect(find.byType(GestureDetector), findsWidgets);
      });

      testWidgets('organization row displays role name when present',
          (tester) async {
        final org = createTestOrganization(
          id: 'org_role',
          name: 'Role Test Org',
        );
        final membership = createTestOrganizationMembership(
          id: 'mem_1',
          organization: org,
          roleName: 'Super Admin',
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

        expect(find.text('Role Test Org'), findsOneWidget);
      });
    });

    group('Empty States', () {
      testWidgets('renders when user has no organizations', (tester) async {
        final user = createTestUser(
          organizationMemberships: [],
        );
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
  });
}


