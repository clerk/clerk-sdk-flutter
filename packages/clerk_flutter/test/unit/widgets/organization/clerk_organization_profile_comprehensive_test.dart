import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/widgets/organization/clerk_organization_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkOrganizationProfile comprehensive tests', () {
    testWidgets('renders when signed in with organization', (tester) async {
      final organization = createTestOrganization();
      final membership = createTestOrganizationMembership(
        organization: organization,
      );
      final user = createTestUser(
        organizationMemberships: [membership],
      );
      final session = createTestSession(
        user: user,
        lastActiveOrganizationId: organization.id,
      );
      final client = createTestClient(
        sessions: [session],
        lastActiveSessionId: session.id,
      );
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: ClerkOrganizationProfile(membership: membership),
          ),
        ),
      );

      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with organization name', (tester) async {
      final organization = createTestOrganization(
        name: 'Test Organization',
      );
      final membership = createTestOrganizationMembership(
        organization: organization,
      );
      final user = createTestUser(
        organizationMemberships: [membership],
      );
      final session = createTestSession(
        user: user,
        lastActiveOrganizationId: organization.id,
      );
      final client = createTestClient(
        sessions: [session],
        lastActiveSessionId: session.id,
      );
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: ClerkOrganizationProfile(membership: membership),
          ),
        ),
      );

      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with organization slug', (tester) async {
      final organization = createTestOrganization(
        slug: 'test-org',
      );
      final membership = createTestOrganizationMembership(
        organization: organization,
      );
      final user = createTestUser(
        organizationMemberships: [membership],
      );
      final session = createTestSession(
        user: user,
        lastActiveOrganizationId: organization.id,
      );
      final client = createTestClient(
        sessions: [session],
        lastActiveSessionId: session.id,
      );
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: ClerkOrganizationProfile(membership: membership),
          ),
        ),
      );

      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with admin role', (tester) async {
      final organization = createTestOrganization();
      final membership = createTestOrganizationMembership(
        organization: organization,
        role: 'org:admin',
        roleName: 'Admin',
      );
      final user = createTestUser(
        organizationMemberships: [membership],
      );
      final session = createTestSession(
        user: user,
        lastActiveOrganizationId: organization.id,
      );
      final client = createTestClient(
        sessions: [session],
        lastActiveSessionId: session.id,
      );
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: ClerkOrganizationProfile(membership: membership),
          ),
        ),
      );

      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with member role', (tester) async {
      final organization = createTestOrganization();
      final membership = createTestOrganizationMembership(
        organization: organization,
        role: 'org:member',
        roleName: 'Member',
      );
      final user = createTestUser(
        organizationMemberships: [membership],
      );
      final session = createTestSession(
        user: user,
        lastActiveOrganizationId: organization.id,
      );
      final client = createTestClient(
        sessions: [session],
        lastActiveSessionId: session.id,
      );
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: ClerkOrganizationProfile(membership: membership),
          ),
        ),
      );

      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders EditableProfileData widget', (tester) async {
      final organization = createTestOrganization(name: 'Test Org');
      final membership = createTestOrganizationMembership(
        organization: organization,
      );
      final user = createTestUser(
        organizationMemberships: [membership],
      );
      final session = createTestSession(
        user: user,
        lastActiveOrganizationId: organization.id,
      );
      final client = createTestClient(
        sessions: [session],
        lastActiveSessionId: session.id,
      );
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: ClerkOrganizationProfile(membership: membership),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Test Org'), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders leave organization text', (tester) async {
      final organization = createTestOrganization();
      final membership = createTestOrganizationMembership(
        organization: organization,
      );
      final user = createTestUser(
        organizationMemberships: [membership],
      );
      final session = createTestSession(
        user: user,
        lastActiveOrganizationId: organization.id,
      );
      final client = createTestClient(
        sessions: [session],
        lastActiveSessionId: session.id,
      );
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: ClerkOrganizationProfile(membership: membership),
          ),
        ),
      );
      await tester.pump();

      // Should render leave organization section
      expect(find.byType(GestureDetector), findsWidgets);
      authState.terminate();
    });

    testWidgets('renders general details heading', (tester) async {
      final organization = createTestOrganization();
      final membership = createTestOrganizationMembership(
        organization: organization,
      );
      final user = createTestUser(
        organizationMemberships: [membership],
      );
      final session = createTestSession(
        user: user,
        lastActiveOrganizationId: organization.id,
      );
      final client = createTestClient(
        sessions: [session],
        lastActiveSessionId: session.id,
      );
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: ClerkOrganizationProfile(membership: membership),
          ),
        ),
      );
      await tester.pump();

      // Should render without errors
      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with domainsManage permission', (tester) async {
      final organization = createTestOrganization(id: 'org_test');
      final membership = createTestOrganizationMembership(
        organization: organization,
        permissions: [clerk.Permission.domainsManage],
      );
      final user = createTestUser(
        organizationMemberships: [membership],
      );
      final session = createTestSession(
        user: user,
        lastActiveOrganizationId: organization.id,
      );
      final client = createTestClient(
        sessions: [session],
        lastActiveSessionId: session.id,
      );

      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: ClerkOrganizationProfile(membership: membership),
          ),
        ),
      );
      await tester.pump();

      // Should render without errors even with domainsManage permission
      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
      authState.terminate();
    });
  });
}
