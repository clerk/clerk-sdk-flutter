import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/widgets/organization/clerk_organization_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkOrganizationProfile interaction tests', () {
    testWidgets('renders with admin permissions', (tester) async {
      final org = createTestOrganization();
      final membership = createTestOrganizationMembership(
        organization: org,
        role: 'org:admin',
        permissions: [
          clerk.Permission(name: 'org:sys_memberships:manage'),
          clerk.Permission(name: 'org:sys_profile:manage'),
        ],
      );
      final user = createTestUser(
        organizationMemberships: [membership],
      );
      final session = createTestSession(
        user: user,
        lastActiveOrganizationId: org.id,
      );
      final client = createTestClient(
        sessions: [session],
        lastActiveSessionId: session.id,
      );
      final authState = await createTestAuthState(client: client, user: user);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: ClerkOrganizationProfile(membership: membership),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with member permissions', (tester) async {
      final org = createTestOrganization();
      final membership = createTestOrganizationMembership(
        organization: org,
        role: 'org:member',
        permissions: [],
      );
      final user = createTestUser(
        organizationMemberships: [membership],
      );
      final session = createTestSession(
        user: user,
        lastActiveOrganizationId: org.id,
      );
      final client = createTestClient(
        sessions: [session],
        lastActiveSessionId: session.id,
      );
      final authState = await createTestAuthState(client: client, user: user);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: ClerkOrganizationProfile(membership: membership),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with custom role', (tester) async {
      final org = createTestOrganization();
      final membership = createTestOrganizationMembership(
        organization: org,
        role: 'org:custom_role',
        roleName: 'Custom Role',
        permissions: [clerk.Permission(name: 'org:custom:permission')],
      );
      final user = createTestUser(
        organizationMemberships: [membership],
      );
      final session = createTestSession(
        user: user,
        lastActiveOrganizationId: org.id,
      );
      final client = createTestClient(
        sessions: [session],
        lastActiveSessionId: session.id,
      );
      final authState = await createTestAuthState(client: client, user: user);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: ClerkOrganizationProfile(membership: membership),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with organization slug', (tester) async {
      final org = createTestOrganization();
      final membership = createTestOrganizationMembership(
        organization: org,
        role: 'org:member',
      );
      final user = createTestUser(
        organizationMemberships: [membership],
      );
      final session = createTestSession(
        user: user,
        lastActiveOrganizationId: org.id,
      );
      final client = createTestClient(
        sessions: [session],
        lastActiveSessionId: session.id,
      );
      final authState = await createTestAuthState(client: client, user: user);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: ClerkOrganizationProfile(membership: membership),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with multiple permissions', (tester) async {
      final org = createTestOrganization();
      final membership = createTestOrganizationMembership(
        organization: org,
        role: 'org:admin',
        permissions: [
          clerk.Permission(name: 'org:sys_memberships:manage'),
          clerk.Permission(name: 'org:sys_profile:manage'),
          clerk.Permission(name: 'org:sys_domains:manage'),
        ],
      );
      final user = createTestUser(
        organizationMemberships: [membership],
      );
      final session = createTestSession(
        user: user,
        lastActiveOrganizationId: org.id,
      );
      final client = createTestClient(
        sessions: [session],
        lastActiveSessionId: session.id,
      );
      final authState = await createTestAuthState(client: client, user: user);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: ClerkOrganizationProfile(membership: membership),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
      authState.terminate();
    });
  });
}

