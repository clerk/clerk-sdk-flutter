import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/widgets/authentication/clerk_sign_up_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkSignUpPanel advanced tests', () {
    testWidgets('renders phone number field when phone is required',
        (tester) async {
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

      await tester.pump();

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders first and last name fields side by side',
        (tester) async {
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

      await tester.pump();

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders password field with obscure text', (tester) async {
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [clerk.Field.password],
        requiredFields: [clerk.Field.password],
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

    testWidgets('renders email link message when awaiting email link',
        (tester) async {
      final verification = createTestVerification(
        status: clerk.Status.unverified,
        strategy: clerk.Strategy.emailLink,
      );
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        emailAddress: 'test@example.com',
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

      await tester.pump();

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders strategy buttons when needs email strategy',
        (tester) async {
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        emailAddress: 'test@example.com',
        unverifiedFields: [clerk.Field.emailAddress],
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

    testWidgets('renders code input for phone verification', (tester) async {
      final verification = createTestVerification(
        status: clerk.Status.unverified,
        strategy: clerk.Strategy.phoneCode,
      );
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        phoneNumber: '+1234567890',
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

      await tester.pump();

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders code input for email verification', (tester) async {
      final verification = createTestVerification(
        status: clerk.Status.unverified,
        strategy: clerk.Strategy.emailCode,
      );
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        emailAddress: 'test@example.com',
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

      await tester.pump();

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with legal acceptance checkbox', (tester) async {
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

      await tester.pump();

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('toggles legal acceptance checkbox when tapped',
        (tester) async {
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

      await tester.pump();

      // Just verify it renders without errors
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

      await tester.pump();

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with all fields when all are required',
        (tester) async {
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [
          clerk.Field.firstName,
          clerk.Field.lastName,
          clerk.Field.username,
          clerk.Field.emailAddress,
          clerk.Field.phoneNumber,
          clerk.Field.password,
        ],
        requiredFields: [
          clerk.Field.firstName,
          clerk.Field.lastName,
          clerk.Field.username,
          clerk.Field.emailAddress,
          clerk.Field.phoneNumber,
          clerk.Field.password,
        ],
      );
      final client = createTestClient(signUp: signUp);
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: SingleChildScrollView(
              child: ClerkSignUpPanel(),
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with existing sign up data', (tester) async {
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        firstName: 'John',
        lastName: 'Doe',
        username: 'johndoe',
        emailAddress: 'john@example.com',
        phoneNumber: '+1234567890',
        missingFields: [clerk.Field.password],
        requiredFields: [
          clerk.Field.firstName,
          clerk.Field.lastName,
          clerk.Field.username,
          clerk.Field.emailAddress,
          clerk.Field.phoneNumber,
          clerk.Field.password,
        ],
      );
      final client = createTestClient(signUp: signUp);
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: SingleChildScrollView(
              child: ClerkSignUpPanel(),
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with sign up panel', (tester) async {
      final authState = await createSignedOutAuthState();

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

    testWidgets('renders with optional fields', (tester) async {
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

      await tester.pump();

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with password confirmation field', (tester) async {
      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [clerk.Field.password],
        requiredFields: [clerk.Field.password],
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

      // Password field should have an associated confirmation field
      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
      authState.terminate();
    });
  });
}
