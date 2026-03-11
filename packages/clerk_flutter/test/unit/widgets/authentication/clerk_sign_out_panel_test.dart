import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/authentication/clerk_sign_out_panel.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkSignOutPanel', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    test('creates state', () {
      const widget = ClerkSignOutPanel();
      expect(widget.createState(), isA<State<ClerkSignOutPanel>>());
    });

    testWidgets('renders Padding', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignOutPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(Padding), findsWidgets);
    });

    testWidgets('renders ClerkMaterialButton', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignOutPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkMaterialButton), findsOneWidget);
    });

    testWidgets('renders Text widget', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignOutPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(Text), findsWidgets);
    });

    testWidgets('calls signOut when button is pressed', (tester) async {
      final signedInAuthState = await createTestAuthState(
        config: TestClerkAuthConfig(
          initialClient: createTestClient(
            sessions: [createTestSession(user: createTestUser())],
          ),
        ),
      );
      addTearDown(signedInAuthState.terminate);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: signedInAuthState,
          child: const ClerkSignOutPanel(),
        ),
      );
      await tester.pump();

      // Verify user is signed in
      expect(signedInAuthState.user, isNotNull);

      // Tap the sign out button
      await tester.tap(find.byType(ClerkMaterialButton));
      await tester.pump();

      // Wait for the timer to complete
      await tester.pump(const Duration(milliseconds: 600));

      // Verify user is signed out
      expect(signedInAuthState.user, isNull);
    });
  });
}
