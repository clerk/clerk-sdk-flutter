import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/widgets/authentication/clerk_sign_up_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkSignUpPanel comprehensive tests', () {
    testWidgets('renders with missing fields', (tester) async {
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [clerk.Field.emailAddress, clerk.Field.password],
        requiredFields: [clerk.Field.emailAddress, clerk.Field.password],
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

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with username field', (tester) async {
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [clerk.Field.username],
        requiredFields: [clerk.Field.username],
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

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with phone number field', (tester) async {
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [clerk.Field.phoneNumber],
        requiredFields: [clerk.Field.phoneNumber],
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

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with first and last name fields', (tester) async {
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [clerk.Field.firstName, clerk.Field.lastName],
        requiredFields: [clerk.Field.firstName, clerk.Field.lastName],
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

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders awaiting phone code verification', (tester) async {
      final verification = createTestVerification(
        status: clerk.Status.unverified,
        strategy: clerk.Strategy.phoneCode,
      );
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        unverifiedFields: [clerk.Field.phoneNumber],
        verifications: {clerk.Field.phoneNumber: verification},
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

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders awaiting email code verification', (tester) async {
      final verification = createTestVerification(
        status: clerk.Status.unverified,
        strategy: clerk.Strategy.emailCode,
      );
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        unverifiedFields: [clerk.Field.emailAddress],
        verifications: {clerk.Field.emailAddress: verification},
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

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders awaiting email link verification', (tester) async {
      final verification = createTestVerification(
        status: clerk.Status.unverified,
        strategy: clerk.Strategy.emailLink,
      );
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        unverifiedFields: [clerk.Field.emailAddress],
        verifications: {clerk.Field.emailAddress: verification},
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

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with legal consent enabled', (tester) async {
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [clerk.Field.emailAddress, clerk.Field.legalAccepted],
        requiredFields: [clerk.Field.emailAddress, clerk.Field.legalAccepted],
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

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with password enabled', (tester) async {
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [clerk.Field.password],
        requiredFields: [clerk.Field.password],
        passwordEnabled: true,
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

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with optional fields', (tester) async {
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [clerk.Field.emailAddress],
        requiredFields: [clerk.Field.emailAddress],
        optionalFields: [clerk.Field.firstName, clerk.Field.lastName],
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

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with pre-filled username', (tester) async {
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [clerk.Field.password],
        requiredFields: [clerk.Field.username, clerk.Field.password],
        username: 'testuser',
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

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with pre-filled email', (tester) async {
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [clerk.Field.password],
        requiredFields: [clerk.Field.emailAddress, clerk.Field.password],
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

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with pre-filled phone number', (tester) async {
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [clerk.Field.password],
        requiredFields: [clerk.Field.phoneNumber, clerk.Field.password],
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

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });
  });
}
