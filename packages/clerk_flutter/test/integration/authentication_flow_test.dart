import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/widgets/authentication/clerk_sign_in_panel.dart';
import 'package:clerk_flutter/src/widgets/authentication/clerk_sign_up_panel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_support/test_support.dart';

void main() {
  group('Authentication Flow Integration Tests', () {
    group('Sign Up Flow', () {
      testWidgets('complete sign up flow with email and password',
          (tester) async {
        // Create initial auth state with sign-up
        final signUp = createTestSignUp(
          status: clerk.Status.missingRequirements,
          requiredFields: [clerk.Field.emailAddress, clerk.Field.password],
          missingFields: [clerk.Field.emailAddress, clerk.Field.password],
        );
        final client = createTestClient(signUp: signUp);
        final authState = await createTestAuthState(client: client);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: const ClerkSignUpPanel(),
          ),
        );
        await tester.pump();

        // Verify the sign-up panel is rendered
        expect(find.byType(ClerkSignUpPanel), findsOneWidget);

        authState.terminate();
      });

      testWidgets('sign up flow with phone number verification',
          (tester) async {
        final signUp = createTestSignUp(
          status: clerk.Status.missingRequirements,
          requiredFields: [clerk.Field.phoneNumber],
          missingFields: [clerk.Field.phoneNumber],
        );
        final client = createTestClient(signUp: signUp);
        final authState = await createTestAuthState(client: client);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: const ClerkSignUpPanel(),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkSignUpPanel), findsOneWidget);

        authState.terminate();
      });

      testWidgets('sign up flow with optional fields', (tester) async {
        final signUp = createTestSignUp(
          status: clerk.Status.missingRequirements,
          requiredFields: [clerk.Field.emailAddress],
          optionalFields: [clerk.Field.firstName, clerk.Field.lastName],
          missingFields: [clerk.Field.emailAddress],
        );
        final client = createTestClient(signUp: signUp);
        final authState = await createTestAuthState(client: client);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: const ClerkSignUpPanel(),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkSignUpPanel), findsOneWidget);

        authState.terminate();
      });

      testWidgets('sign up with email verification required', (tester) async {
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
            child: const ClerkSignUpPanel(),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkSignUpPanel), findsOneWidget);

        authState.terminate();
      });
    });

    group('Sign In Flow', () {
      testWidgets('complete sign in flow with email and password',
          (tester) async {
        final signIn = createTestSignIn(
          status: clerk.Status.needsFirstFactor,
          identifier: 'test@example.com',
          supportedFirstFactors: [
            createTestFactor(strategy: clerk.Strategy.password),
          ],
        );
        final client = createTestClient(signIn: signIn);
        final authState = await createTestAuthState(client: client);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: const ClerkSignInPanel(),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkSignInPanel), findsOneWidget);

        authState.terminate();
      });

      testWidgets('sign in with email code verification', (tester) async {
        final signIn = createTestSignIn(
          status: clerk.Status.needsFirstFactor,
          identifier: 'test@example.com',
          firstFactorVerification: createTestVerification(
            status: clerk.Status.unverified,
            strategy: clerk.Strategy.emailCode,
          ),
        );
        final client = createTestClient(signIn: signIn);
        final authState = await createTestAuthState(client: client);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: const ClerkSignInPanel(),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkSignInPanel), findsOneWidget);

        authState.terminate();
      });
    });
  });
}
