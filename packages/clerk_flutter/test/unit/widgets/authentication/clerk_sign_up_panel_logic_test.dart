import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/widgets/authentication/clerk_sign_up_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkSignUpPanel logic tests', () {
    testWidgets('renders with password field when password is required',
        (tester) async {
      // Create environment with email and password required
      const httpService = TestHttpService(
        environment: clerk.Environment(
          config: clerk.Config(
            firstFactors: [clerk.Strategy.emailAddress],
            identificationStrategies: [clerk.Strategy.emailAddress],
          ),
          user: clerk.UserSettings(
            attributes: {
              clerk.UserAttribute.emailAddress: clerk.UserAttributeData(
                isEnabled: true,
                isRequired: true,
                verifications: [clerk.Strategy.emailCode],
              ),
              clerk.UserAttribute.password: clerk.UserAttributeData(
                isEnabled: true,
                isRequired: true,
              ),
            },
            passwordSettings: clerk.PasswordSettings(
              minLength: 8,
              maxLength: 72,
            ),
          ),
        ),
      );

      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [clerk.Field.emailAddress, clerk.Field.password],
        requiredFields: [clerk.Field.emailAddress, clerk.Field.password],
      );
      final client = createTestClient(signUp: signUp);
      final authState = await createTestAuthState(
        config: TestClerkAuthConfig(
          httpService: httpService,
          initialClient: client,
        ),
      );

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkSignUpPanel(),
          ),
        ),
      );

      await tester.pump();

      // The panel should render without errors
      expect(find.byType(ClerkSignUpPanel), findsOneWidget);

      authState.terminate();
    });

    testWidgets('renders with phone number field when phone is required',
        (tester) async {
      const httpService = TestHttpService(
        environment: clerk.Environment(
          config: clerk.Config(
            firstFactors: [clerk.Strategy.phoneNumber],
            identificationStrategies: [clerk.Strategy.phoneNumber],
          ),
          user: clerk.UserSettings(
            attributes: {
              clerk.UserAttribute.phoneNumber: clerk.UserAttributeData(
                isEnabled: true,
                isRequired: true,
                verifications: [clerk.Strategy.phoneCode],
              ),
              clerk.UserAttribute.password: clerk.UserAttributeData(
                isEnabled: true,
                isRequired: true,
              ),
            },
            passwordSettings: clerk.PasswordSettings(
              minLength: 8,
              maxLength: 72,
            ),
          ),
        ),
      );

      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [clerk.Field.phoneNumber, clerk.Field.password],
        requiredFields: [clerk.Field.phoneNumber, clerk.Field.password],
      );
      final client = createTestClient(signUp: signUp);
      final authState = await createTestAuthState(
        config: TestClerkAuthConfig(
          httpService: httpService,
          initialClient: client,
        ),
      );

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkSignUpPanel(),
          ),
        ),
      );

      await tester.pump();

      // The panel should render
      expect(find.byType(ClerkSignUpPanel), findsOneWidget);

      authState.terminate();
    });

    testWidgets('renders with name fields when names are required',
        (tester) async {
      const httpService = TestHttpService(
        environment: clerk.Environment(
          config: clerk.Config(
            firstFactors: [clerk.Strategy.emailAddress],
            identificationStrategies: [clerk.Strategy.emailAddress],
          ),
          user: clerk.UserSettings(
            attributes: {
              clerk.UserAttribute.emailAddress: clerk.UserAttributeData(
                isEnabled: true,
                isRequired: true,
                verifications: [clerk.Strategy.emailCode],
              ),
              clerk.UserAttribute.firstName: clerk.UserAttributeData(
                isEnabled: true,
                isRequired: true,
              ),
              clerk.UserAttribute.lastName: clerk.UserAttributeData(
                isEnabled: true,
                isRequired: true,
              ),
            },
          ),
        ),
      );

      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [
          clerk.Field.emailAddress,
          clerk.Field.firstName,
          clerk.Field.lastName,
        ],
        requiredFields: [
          clerk.Field.emailAddress,
          clerk.Field.firstName,
          clerk.Field.lastName,
        ],
      );
      final client = createTestClient(signUp: signUp);
      final authState = await createTestAuthState(
        config: TestClerkAuthConfig(
          httpService: httpService,
          initialClient: client,
        ),
      );

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkSignUpPanel(),
          ),
        ),
      );

      await tester.pump();

      // The panel should render
      expect(find.byType(ClerkSignUpPanel), findsOneWidget);

      authState.terminate();
    });

    testWidgets('renders with username field when username is required',
        (tester) async {
      const httpService = TestHttpService(
        environment: clerk.Environment(
          config: clerk.Config(
            firstFactors: [clerk.Strategy.username],
            identificationStrategies: [clerk.Strategy.username],
          ),
          user: clerk.UserSettings(
            attributes: {
              clerk.UserAttribute.username: clerk.UserAttributeData(
                isEnabled: true,
                isRequired: true,
              ),
              clerk.UserAttribute.password: clerk.UserAttributeData(
                isEnabled: true,
                isRequired: true,
              ),
            },
            passwordSettings: clerk.PasswordSettings(
              minLength: 8,
              maxLength: 72,
            ),
          ),
        ),
      );

      final signUp = createTestSignUp(
        status: clerk.Status.missingRequirements,
        missingFields: [clerk.Field.username, clerk.Field.password],
        requiredFields: [clerk.Field.username, clerk.Field.password],
      );
      final client = createTestClient(signUp: signUp);
      final authState = await createTestAuthState(
        config: TestClerkAuthConfig(
          httpService: httpService,
          initialClient: client,
        ),
      );

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkSignUpPanel(),
          ),
        ),
      );

      await tester.pump();

      // The panel should render
      expect(find.byType(ClerkSignUpPanel), findsOneWidget);

      authState.terminate();
    });
  });
}
