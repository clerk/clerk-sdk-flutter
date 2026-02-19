import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/organization/clerk_organization_profile.dart';
import 'package:clerk_flutter/src/widgets/ui/editable_profile_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_support/test_support.dart';

void main() {
  group('ClerkOrganizationProfile Integration Tests', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedInAuthState(
        user: createTestUser(
          organizationMemberships: [
            createTestOrganizationMembership(
              id: 'mem_123',
              organization: createTestOrganization(
                id: 'org_123',
                name: 'Test Organization',
                slug: 'test-org',
              ),
              role: 'org:admin',
              roleName: 'Admin',
            ),
          ],
        ),
      );
    });

    tearDown(() {
      authState.terminate();
    });

    testWidgets('renders organization profile with name', (tester) async {
      final membership = authState.user!.organizationMemberships!.first;

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkOrganizationProfile(membership: membership),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Test Organization'), findsOneWidget);
      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
    });

    testWidgets('renders EditableProfileData widget', (tester) async {
      final membership = authState.user!.organizationMemberships!.first;

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkOrganizationProfile(membership: membership),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(EditableProfileData), findsOneWidget);
    });

    testWidgets('renders leave organization option', (tester) async {
      final membership = authState.user!.organizationMemberships!.first;

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkOrganizationProfile(membership: membership),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Leave organization'), findsOneWidget);
    });

    testWidgets('renders without errors when scrolling', (tester) async {
      final membership = authState.user!.organizationMemberships!.first;

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkOrganizationProfile(membership: membership),
        ),
      );
      await tester.pumpAndSettle();

      // Verify the widget renders
      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);

      // Try scrolling
      await tester.drag(find.byType(ListView), const Offset(0, -100));
      await tester.pumpAndSettle();

      // Verify still renders after scrolling
      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
    });

    testWidgets('renders with admin role', (tester) async {
      final membership = authState.user!.organizationMemberships!.first;

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkOrganizationProfile(membership: membership),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Test Organization'), findsOneWidget);
      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
    });
  });
}
