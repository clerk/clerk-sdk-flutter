import 'package:clerk_auth/clerk_auth.dart';
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/organization/clerk_organization_profile.dart';
import 'package:clerk_flutter/src/widgets/ui/closeable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkOrganizationProfile', () {
    late ClerkAuthState signedOutAuthState;
    late ClerkAuthState signedInAuthState;
    late OrganizationMembership membership;

    setUp(() async {
      signedOutAuthState = await createSignedOutAuthState();
      membership = createTestOrganizationMembership();

      // Create a user with the organization membership
      final user = createTestUser(
        organizationMemberships: [membership],
      );
      signedInAuthState = await createSignedInAuthState(user: user);
    });

    tearDown(() {
      signedOutAuthState.terminate();
      signedInAuthState.terminate();
    });

    testWidgets('creates state', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: signedOutAuthState,
          child: ClerkOrganizationProfile(membership: membership),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
    });

    testWidgets('renders when signed out', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: signedOutAuthState,
          child: ClerkOrganizationProfile(membership: membership),
        ),
      );
      await tester.pump();

      // Should render something even when signed out
      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
    });

    testWidgets('renders Column when signed in', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: signedInAuthState,
          child: ClerkOrganizationProfile(membership: membership),
        ),
      );
      await tester.pump();

      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('does not render Closeable widget by default', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: signedInAuthState,
          child: ClerkOrganizationProfile(membership: membership),
        ),
      );
      await tester.pump();

      // Closeable widgets only appear when there are domains to show
      // By default, there are no domains, so no Closeable widgets
      expect(find.byType(Closeable), findsNothing);
    });

    testWidgets('renders with default state', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: signedInAuthState,
          child: ClerkOrganizationProfile(membership: membership),
        ),
      );
      await tester.pump();

      // Should render without errors
      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
    });
  });
}
