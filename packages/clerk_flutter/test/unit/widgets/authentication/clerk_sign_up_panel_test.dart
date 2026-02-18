import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/authentication/clerk_sign_up_panel.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_control_buttons.dart';
import 'package:clerk_flutter/src/widgets/ui/closeable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkSignUpPanel', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    testWidgets('creates state', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignUpPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
    });

    testWidgets('renders Column', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignUpPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('renders when environment is available', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignUpPanel(),
        ),
      );
      await tester.pump();

      // Should render the panel
      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
    });

    testWidgets('renders Closeable widget', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignUpPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(Closeable), findsWidgets);
    });

    testWidgets('renders when signed out', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignUpPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
    });

    testWidgets('renders with default state', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignUpPanel(),
        ),
      );
      await tester.pump();

      // Should render without errors
      expect(find.byType(ClerkSignUpPanel), findsOneWidget);
    });

    testWidgets('renders control buttons', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignUpPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkControlButtons), findsOneWidget);
    });

    group('with SignUp state', () {
      testWidgets('renders with missing fields', (tester) async {
        final signUp = createTestSignUp(
          status: clerk.Status.missingRequirements,
          requiredFields: [clerk.Field.emailAddress, clerk.Field.password],
          missingFields: [clerk.Field.emailAddress, clerk.Field.password],
        );
        final client = createTestClient(signUp: signUp);
        final authStateWithSignUp = await createTestAuthState(client: client);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authStateWithSignUp,
            child: const ClerkSignUpPanel(),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkSignUpPanel), findsOneWidget);
        expect(find.byType(ClerkControlButtons), findsOneWidget);

        authStateWithSignUp.terminate();
      });

      testWidgets('renders with unverified email', (tester) async {
        final signUp = createTestSignUp(
          status: clerk.Status.missingRequirements,
          emailAddress: 'test@example.com',
          unverifiedFields: [clerk.Field.emailAddress],
          verifications: {
            clerk.Field.emailAddress: createTestVerification(
              status: clerk.Status.unverified,
              strategy: clerk.Strategy.emailCode,
            ),
          },
        );
        final client = createTestClient(signUp: signUp);
        final authStateWithSignUp = await createTestAuthState(client: client);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authStateWithSignUp,
            child: const ClerkSignUpPanel(),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkSignUpPanel), findsOneWidget);

        authStateWithSignUp.terminate();
      });

      testWidgets('renders with phone number', (tester) async {
        final signUp = createTestSignUp(
          status: clerk.Status.missingRequirements,
          phoneNumber: '+1234567890',
          unverifiedFields: [clerk.Field.phoneNumber],
        );
        final client = createTestClient(signUp: signUp);
        final authStateWithSignUp = await createTestAuthState(client: client);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authStateWithSignUp,
            child: const ClerkSignUpPanel(),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkSignUpPanel), findsOneWidget);

        authStateWithSignUp.terminate();
      });

      testWidgets('renders with user data', (tester) async {
        final signUp = createTestSignUp(
          status: clerk.Status.missingRequirements,
          firstName: 'John',
          lastName: 'Doe',
          emailAddress: 'john@example.com',
          missingFields: [clerk.Field.password],
        );
        final client = createTestClient(signUp: signUp);
        final authStateWithSignUp = await createTestAuthState(client: client);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authStateWithSignUp,
            child: const ClerkSignUpPanel(),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkSignUpPanel), findsOneWidget);

        authStateWithSignUp.terminate();
      });
    });
  });
}
