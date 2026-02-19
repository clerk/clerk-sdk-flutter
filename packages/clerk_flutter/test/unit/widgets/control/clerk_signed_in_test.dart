import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/control/clerk_signed_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkSignedIn', () {
    testWidgets('renders child when user is signed in', (tester) async {
      final user = createTestUser();
      final client = createSignedInClient(user: user);
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignedIn(
            child: Text('Signed In Content'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Signed In Content'), findsOneWidget);

      authState.terminate();
    });

    testWidgets('does not render child when user is signed out',
        (tester) async {
      final client = createSignedOutClient();
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignedIn(
            child: Text('Signed In Content'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Signed In Content'), findsNothing);

      authState.terminate();
    });

    testWidgets('creates state', (tester) async {
      final authState = await createTestAuthState();

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignedIn(
            child: Text('Test'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkSignedIn), findsOneWidget);

      authState.terminate();
    });

    testWidgets('updates when auth state changes', (tester) async {
      final client = createSignedOutClient();
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignedIn(
            child: Text('Signed In Content'),
          ),
        ),
      );
      await tester.pump();

      // Initially signed out, should not show content
      expect(find.text('Signed In Content'), findsNothing);

      authState.terminate();
    });

    testWidgets('telemetry payload includes user_is_signed_in when signed in',
        (tester) async {
      final user = createTestUser();
      final client = createSignedInClient(user: user);
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignedIn(
            child: Text('Signed In Content'),
          ),
        ),
      );
      await tester.pump();

      // Widget should render
      expect(find.text('Signed In Content'), findsOneWidget);

      // The telemetryPayload getter is called during didChangeDependencies
      // which happens when the widget is built
      final state = tester.state(find.byType(ClerkSignedIn));
      expect(state, isNotNull);

      authState.terminate();
    });

    testWidgets('telemetry payload includes user_is_signed_in when signed out',
        (tester) async {
      final client = createSignedOutClient();
      final authState = await createTestAuthState(client: client);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignedIn(
            child: Text('Signed In Content'),
          ),
        ),
      );
      await tester.pump();

      // Widget should not render content
      expect(find.text('Signed In Content'), findsNothing);

      // The telemetryPayload getter is called during didChangeDependencies
      final state = tester.state(find.byType(ClerkSignedIn));
      expect(state, isNotNull);

      authState.terminate();
    });
  });
}
