import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/widgets/authentication/clerk_sign_in_panel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkSignInPanel comprehensive tests', () {
    testWidgets('renders when signed out', (tester) async {
      final authState = await createSignedOutAuthState();

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignInPanel(),
        ),
      );

      expect(find.byType(ClerkSignInPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with signIn state', (tester) async {
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

      expect(find.byType(ClerkSignInPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with email code factor', (tester) async {
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

      expect(find.byType(ClerkSignInPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with phone code factor', (tester) async {
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

      expect(find.byType(ClerkSignInPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with multiple factors', (tester) async {
      final signIn = createTestSignIn(
        status: clerk.Status.needsFirstFactor,
        supportedFirstFactors: [
          createTestFactor(strategy: clerk.Strategy.password),
          createTestFactor(strategy: clerk.Strategy.emailCode),
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

      expect(find.byType(ClerkSignInPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with second factor needed', (tester) async {
      final signIn = createTestSignIn(
        status: clerk.Status.needsSecondFactor,
        supportedSecondFactors: [
          createTestFactor(strategy: clerk.Strategy.totp),
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

      expect(find.byType(ClerkSignInPanel), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with backup code factor', (tester) async {
      final signIn = createTestSignIn(
        status: clerk.Status.needsSecondFactor,
        supportedSecondFactors: [
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

      expect(find.byType(ClerkSignInPanel), findsOneWidget);
      authState.terminate();
    });
  });
}
