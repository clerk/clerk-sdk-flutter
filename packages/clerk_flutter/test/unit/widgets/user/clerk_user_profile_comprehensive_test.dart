import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/widgets/user/clerk_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkUserProfile comprehensive tests', () {
    testWidgets('renders when signed in', (tester) async {
      final user = createTestUser(
        firstName: 'John',
        lastName: 'Doe',
        username: 'johndoe',
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

      expect(find.byType(ClerkUserProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with email addresses', (tester) async {
      final email = createTestEmail(
        id: 'email_1',
        emailAddress: 'john@example.com',
      );
      final user = createTestUser(
        emailAddresses: [email],
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

      expect(find.byType(ClerkUserProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with phone numbers', (tester) async {
      final phone = createTestPhoneNumber(
        id: 'phone_1',
        phoneNumber: '+1234567890',
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

      expect(find.byType(ClerkUserProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with external accounts', (tester) async {
      final externalAccount = createTestExternalAccount(
        provider: 'google',
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

      expect(find.byType(ClerkUserProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with multiple email addresses', (tester) async {
      final email1 = createTestEmail(
        id: 'email_1',
        emailAddress: 'john@example.com',
      );
      final email2 = createTestEmail(
        id: 'email_2',
        emailAddress: 'john.doe@example.com',
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

      expect(find.byType(ClerkUserProfile), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with verified and unverified emails', (tester) async {
      final verifiedEmail = createTestEmail(
        id: 'email_1',
        emailAddress: 'verified@example.com',
        verification: createTestVerification(
          status: clerk.Status.verified,
        ),
      );
      final unverifiedEmail = createTestEmail(
        id: 'email_2',
        emailAddress: 'unverified@example.com',
        verification: createTestVerification(
          status: clerk.Status.unverified,
        ),
      );
      final user = createTestUser(
        emailAddresses: [verifiedEmail, unverifiedEmail],
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

      expect(find.byType(ClerkUserProfile), findsOneWidget);
      authState.terminate();
    });
  });
}

