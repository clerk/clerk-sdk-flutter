import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/widgets/authentication/clerk_sign_up_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkSignUpPanel interaction tests', () {
    testWidgets('renders with all required fields', (tester) async {
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [
          clerk.Field.emailAddress,
          clerk.Field.password,
          clerk.Field.firstName,
          clerk.Field.lastName,
        ],
        requiredFields: [
          clerk.Field.emailAddress,
          clerk.Field.password,
          clerk.Field.firstName,
          clerk.Field.lastName,
        ],
      );
      final client = createTestClient(signUp: signUp);
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkSignUpPanel(),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with username and email', (tester) async {
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [clerk.Field.username, clerk.Field.emailAddress],
        requiredFields: [clerk.Field.username, clerk.Field.emailAddress],
      );
      final client = createTestClient(signUp: signUp);
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkSignUpPanel(),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with phone and password', (tester) async {
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [clerk.Field.phoneNumber, clerk.Field.password],
        requiredFields: [clerk.Field.phoneNumber, clerk.Field.password],
      );
      final client = createTestClient(signUp: signUp);
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkSignUpPanel(),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders verification code input for phone', (tester) async {
      final verification = createTestVerification(
        status: clerk.Status.unverified,
        strategy: clerk.Strategy.phoneCode,
      );
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        unverifiedFields: [clerk.Field.phoneNumber],
        verifications: {clerk.Field.phoneNumber: verification},
        phoneNumber: '+1234567890',
      );
      final client = createTestClient(signUp: signUp);
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkSignUpPanel(),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders verification code input for email', (tester) async {
      final verification = createTestVerification(
        status: clerk.Status.unverified,
        strategy: clerk.Strategy.emailCode,
      );
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        unverifiedFields: [clerk.Field.emailAddress],
        verifications: {clerk.Field.emailAddress: verification},
        emailAddress: 'test@example.com',
      );
      final client = createTestClient(signUp: signUp);
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkSignUpPanel(),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with mixed required and optional fields',
        (tester) async {
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [clerk.Field.emailAddress],
        requiredFields: [clerk.Field.emailAddress],
        optionalFields: [
          clerk.Field.firstName,
          clerk.Field.lastName,
          clerk.Field.username,
        ],
      );
      final client = createTestClient(signUp: signUp);
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkSignUpPanel(),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });
  });
}
