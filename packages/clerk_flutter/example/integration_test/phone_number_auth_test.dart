// Integration test: phone-number-only identification regression
//
// Regression introduced in clerk_flutter 0.0.14-beta:
//
//   When the Clerk Dashboard is configured with ONLY the "Phone Number"
//   identification strategy, `ClerkAuthentication` renders an empty
//   identifier section instead of a phone input field.
//
// Root cause:
//   `ClerkIdentifierInput._ClerkIdentifierInputState.initState()` always
//   initialises `identifierType` to `IdentifierType.emailAddress`, even when
//   no e-mail strategies exist.  The phone field is therefore wrapped in
//   `Closeable(closed: true)`, whose `_renderChild` starts as `false`, so
//   `ClerkPhoneNumberFormField` is never inserted into the widget tree.
//
// What this test guards:
//   1. `ClerkPhoneNumberFormField` (key: `phoneIdentifier`) is present in the
//      widget tree when phone_number is the sole identification strategy.
//   2. That field has a non-zero rendered height (not collapsed by Closeable).
//   3. No e-mail/text `ClerkTextFormField` (key: `identifier`) appears when
//      there are no e-mail strategies.

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_phone_number_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../test/test_support/test_support.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Phone-number-only environment — the configuration that triggers the bug.
  const phoneOnlyEnvironment = clerk.Environment(
    config: clerk.Config(
      identificationStrategies: [clerk.Strategy.phoneNumber],
      allowsPhoneNumber: true,
    ),
  );

  Future<ClerkAuthState> buildAuthState() => ClerkAuthState.create(
        config: TestClerkAuthConfig(
          initialEnvironment: phoneOnlyEnvironment,
          initialClient: createSignedOutClient(),
        ),
      );

  group(
    'ClerkAuthentication: Phone-only configuration',
        () {
      // -----------------------------------------------------------------------
      // Primary regression guard
      // -----------------------------------------------------------------------
      testWidgets(
        'should show the phone input field and hide email fields',
            (tester) async {
          final authState = await buildAuthState();

          await tester.pumpWidget(
            TestClerkAuthWrapper(
              authState: authState,
              child: const ClerkAuthentication(),
            ),
          );
          // Allow the ListenableBuilder in ClerkAuth to process any
          // post-initialisation rebuild triggered by the auth-state notifier.
          await tester.pumpAndSettle();

          // ------------------------------------------------------------------
          // Assert 1 — phone field is in the widget tree
          //
          // BUG path:
          //   `ClerkIdentifierInput.initState()` defaults `identifierType` to
          //   `emailAddress`. With zero email strategies, the phone field
          //   is wrapped in `Closeable(closed: true)` → `_renderChild = false`
          //   → widget never built → `findsNothing` → test fails.
          //
          // Fixed path:
          //   `identifierType` is coerced to `phoneNumber` when no email
          //   strategies exist → `Closeable(closed: false)` →
          //   `_renderChild = true` → `findsOneWidget` → test passes.
          // ------------------------------------------------------------------
          expect(
            find.byKey(const Key('phoneIdentifier')),
            findsOneWidget,
            reason:
                'A phone number input (key: phoneIdentifier) must be present '
                'when phone_number is the sole identification strategy. '
                'Regression in v0.0.14-beta: the field was absent because '
                'ClerkIdentifierInput defaulted identifierType to emailAddress, '
                'wrapping the phone field in Closeable(closed: true).',
          );

          // ------------------------------------------------------------------
          // Assert 2 — phone field has a non-zero rendered height
          //
          // Guards against the Closeable animation collapsing the field to
          // 0 px even if the widget IS in the tree.
          // ------------------------------------------------------------------
          final phoneFieldRect = tester.getRect(
            find.byKey(const Key('phoneIdentifier')),
          );
          expect(
            phoneFieldRect.height,
            greaterThan(0),
            reason:
                'Phone input field height must be > 0. '
                'A Closeable(closed: true) sets heightFactor to 0, making '
                'the identifier section appear completely empty.',
          );

          // ------------------------------------------------------------------
          // Assert 3 — no spurious email/text field in a phone-only config
          // ------------------------------------------------------------------
          expect(
            find.byKey(const Key('identifier')),
            findsNothing,
            reason:
                'No email/text identifier field (key: identifier) should be '
                'present when the only configured strategy is phone_number.',
          );

          authState.terminate();
        },
      );

      // -----------------------------------------------------------------------
      // Complementary type-level assertion
      // -----------------------------------------------------------------------
      testWidgets(
        'should use ClerkPhoneNumberFormField',
            (tester) async {
          final authState = await buildAuthState();

          await tester.pumpWidget(
            TestClerkAuthWrapper(
              authState: authState,
              child: const ClerkAuthentication(),
            ),
          );
          await tester.pumpAndSettle();

          // Confirms the concrete widget class, independently of its key.
          expect(
            find.byType(ClerkPhoneNumberFormField),
            findsOneWidget,
            reason: 'ClerkPhoneNumberFormField must be rendered — not merely '
                'instantiated inside a closed Closeable — when phone_number '
                'is the sole identification strategy.',
          );

          authState.terminate();
        },
      );
    },
  );
}
