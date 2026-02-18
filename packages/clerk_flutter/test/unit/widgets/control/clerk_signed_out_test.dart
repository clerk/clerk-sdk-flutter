import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/control/clerk_signed_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkSignedOut', () {
    testWidgets('renders child when user is signed out', (tester) async {
      final client = createSignedOutClient();
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignedOut(
            child: Text('Signed Out Content'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Signed Out Content'), findsOneWidget);

      authState.terminate();
    });

    testWidgets('does not render child when user is signed in', (tester) async {
      final user = createTestUser();
      final client = createSignedInClient(user: user);
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignedOut(
            child: Text('Signed Out Content'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Signed Out Content'), findsNothing);

      authState.terminate();
    });

    testWidgets('creates state', (tester) async {
      final authState = await createTestAuthState();

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignedOut(
            child: Text('Test'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkSignedOut), findsOneWidget);

      authState.terminate();
    });

    testWidgets('updates when auth state changes', (tester) async {
      final user = createTestUser();
      final client = createSignedInClient(user: user);
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignedOut(
            child: Text('Signed Out Content'),
          ),
        ),
      );
      await tester.pump();

      // Initially signed in, should not show content
      expect(find.text('Signed Out Content'), findsNothing);

      authState.terminate();
    });
  });
}

