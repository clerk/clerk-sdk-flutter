import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/widgets/authentication/clerk_sign_in_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkSignInPanel interaction tests', () {
    testWidgets('renders identifier input when signed out', (tester) async {
      final authState = await createSignedOutAuthState();

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkSignInPanel(),
          ),
        ),
      );

      await tester.pump();

      // Should render the panel
      expect(find.byType(ClerkSignInPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with first factor selection', (tester) async {
      final factor1 = createTestFactor(strategy: clerk.Strategy.emailCode);
      final factor2 = createTestFactor(strategy: clerk.Strategy.phoneCode);
      final signIn = createTestSignIn(
        status: clerk.Status.needsFirstFactor,
        supportedFirstFactors: [factor1, factor2],
      );
      final client = createTestClient(signIn: signIn);
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkSignInPanel(),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkSignInPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with second factor needed', (tester) async {
      final factor = createTestFactor(strategy: clerk.Strategy.totp);
      final signIn = createTestSignIn(
        status: clerk.Status.needsSecondFactor,
        supportedSecondFactors: [factor],
      );
      final client = createTestClient(signIn: signIn);
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkSignInPanel(),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkSignInPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with backup code factor', (tester) async {
      final factor = createTestFactor(strategy: clerk.Strategy.backupCode);
      final signIn = createTestSignIn(
        status: clerk.Status.needsSecondFactor,
        supportedSecondFactors: [factor],
      );
      final client = createTestClient(signIn: signIn);
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkSignInPanel(),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkSignInPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with multiple identifiers', (tester) async {
      final signIn = createTestSignIn(
        status: clerk.Status.needsIdentifier,
        supportedIdentifiers: [
          'email_address',
          'phone_number',
          'username',
        ],
      );
      final client = createTestClient(signIn: signIn);
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkSignInPanel(),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkSignInPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with password factor', (tester) async {
      final factor = createTestFactor(strategy: clerk.Strategy.password);
      final signIn = createTestSignIn(
        status: clerk.Status.needsFirstFactor,
        supportedFirstFactors: [factor],
      );
      final client = createTestClient(signIn: signIn);
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkSignInPanel(),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ClerkSignInPanel), findsOneWidget);
      authState.terminate();
    });
  });
}
