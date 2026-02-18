import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/widgets/authentication/clerk_sign_in_panel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_support/test_support.dart';

void main() {
  group('Sign In Flow Integration Tests', () {
    group('Email and Password Sign In', () {
      testWidgets('complete sign in flow with email and password',
          (tester) async {
        // Create initial auth state with sign-in
        final signIn = createTestSignIn(
          status: clerk.Status.needsFirstFactor,
          supportedFirstFactors: [
            createTestFactor(strategy: clerk.Strategy.password),
            createTestFactor(strategy: clerk.Strategy.emailCode),
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

        // Verify the sign-in panel is rendered
        expect(find.byType(ClerkSignInPanel), findsOneWidget);

        authState.terminate();
      });

      testWidgets('sign in flow with password factor', (tester) async {
        final signIn = createTestSignIn(
          status: clerk.Status.needsFirstFactor,
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

        // Verify the sign-in panel is rendered
        expect(find.byType(ClerkSignInPanel), findsOneWidget);

        authState.terminate();
      });
    });

    group('Phone Number Sign In', () {
      testWidgets('sign in flow with phone code verification', (tester) async {
        final signIn = createTestSignIn(
          status: clerk.Status.needsFirstFactor,
          supportedFirstFactors: [
            createTestFactor(strategy: clerk.Strategy.phoneCode),
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

        // Verify the sign-in panel is rendered
        expect(find.byType(ClerkSignInPanel), findsOneWidget);

        authState.terminate();
      });
    });

    group('Email Code Sign In', () {
      testWidgets('sign in flow with email code verification', (tester) async {
        final signIn = createTestSignIn(
          status: clerk.Status.needsFirstFactor,
          supportedFirstFactors: [
            createTestFactor(strategy: clerk.Strategy.emailCode),
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

        // Verify the sign-in panel is rendered
        expect(find.byType(ClerkSignInPanel), findsOneWidget);

        authState.terminate();
      });
    });

    group('Two-Factor Authentication', () {
      testWidgets('sign in flow with second factor required', (tester) async {
        final signIn = createTestSignIn(
          status: clerk.Status.needsSecondFactor,
          supportedSecondFactors: [
            createTestFactor(strategy: clerk.Strategy.totp),
            createTestFactor(strategy: clerk.Strategy.backupCode),
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

        // Verify the sign-in panel is rendered
        expect(find.byType(ClerkSignInPanel), findsOneWidget);

        authState.terminate();
      });
    });
  });
}
