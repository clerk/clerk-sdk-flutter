import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/widgets/user/clerk_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkUserProfile interaction tests', () {
    testWidgets('renders with multiple email addresses', (tester) async {
      final email1 = createTestEmail(
        id: 'email_1',
        emailAddress: 'test1@example.com',
        verification: createTestVerification(status: clerk.Status.verified),
      );
      final email2 = createTestEmail(
        id: 'email_2',
        emailAddress: 'test2@example.com',
        verification: createTestVerification(status: clerk.Status.unverified),
      );
      final user = createTestUser(
        emailAddresses: [email1, email2],
      );
      final authState = await createSignedInAuthState(user: user);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkUserProfile(),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkUserProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with phone numbers', (tester) async {
      final phone = createTestPhoneNumber(
        id: 'phone_1',
        phoneNumber: '+1234567890',
        verification: createTestVerification(status: clerk.Status.verified),
      );
      final user = createTestUser(
        phoneNumbers: [phone],
      );
      final authState = await createSignedInAuthState(user: user);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkUserProfile(),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkUserProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with external accounts', (tester) async {
      final externalAccount = createTestExternalAccount(
        provider: 'google',
        verification: createTestVerification(status: clerk.Status.verified),
      );
      final user = createTestUser(
        externalAccounts: [externalAccount],
      );
      final authState = await createSignedInAuthState(user: user);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkUserProfile(),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkUserProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with organization memberships', (tester) async {
      final org = createTestOrganization();
      final membership = createTestOrganizationMembership(
        organization: org,
        role: 'org:member',
      );
      final user = createTestUser(
        organizationMemberships: [membership],
      );
      final authState = await createSignedInAuthState(user: user);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkUserProfile(),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkUserProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with username', (tester) async {
      final user = createTestUser(
        username: 'testuser',
      );
      final authState = await createSignedInAuthState(user: user);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkUserProfile(),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkUserProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with first and last name', (tester) async {
      final user = createTestUser(
        firstName: 'John',
        lastName: 'Doe',
      );
      final authState = await createSignedInAuthState(user: user);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkUserProfile(),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkUserProfile), findsOneWidget);
      authState.terminate();
    });
  });
}

