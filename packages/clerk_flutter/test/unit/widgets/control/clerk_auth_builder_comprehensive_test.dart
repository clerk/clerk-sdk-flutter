import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkAuthBuilder comprehensive tests', () {
    testWidgets('renders signed in builder when user is signed in', (tester) async {
      final user = createTestUser();
      final authState = await createSignedInAuthState(user: user);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkAuthBuilder(
            signedInBuilder: (context, authState) => const Text('Signed In'),
            signedOutBuilder: (context, authState) => const Text('Signed Out'),
          ),
        ),
      );

      await tester.pump();

      expect(find.text('Signed In'), findsOneWidget);
      expect(find.text('Signed Out'), findsNothing);
      authState.terminate();
    });

    testWidgets('renders signed out builder when user is signed out', (tester) async {
      final authState = await createSignedOutAuthState();

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkAuthBuilder(
            signedInBuilder: (context, authState) => const Text('Signed In'),
            signedOutBuilder: (context, authState) => const Text('Signed Out'),
          ),
        ),
      );

      await tester.pump();

      expect(find.text('Signed Out'), findsOneWidget);
      expect(find.text('Signed In'), findsNothing);
      authState.terminate();
    });

    testWidgets('provides authState to signed in builder', (tester) async {
      final user = createTestUser(firstName: 'John');
      final authState = await createSignedInAuthState(user: user);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkAuthBuilder(
            signedInBuilder: (context, state) => Text(state.user?.firstName ?? ''),
            signedOutBuilder: (context, authState) => const Text('Signed Out'),
          ),
        ),
      );

      await tester.pump();

      expect(find.text('John'), findsOneWidget);
      authState.terminate();
    });

    testWidgets('provides authState to signed out builder', (tester) async {
      final authState = await createSignedOutAuthState();

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkAuthBuilder(
            signedInBuilder: (context, authState) => const Text('Signed In'),
            signedOutBuilder: (context, state) => Text(state.user == null ? 'No User' : 'Has User'),
          ),
        ),
      );

      await tester.pump();

      expect(find.text('No User'), findsOneWidget);
      authState.terminate();
    });

    testWidgets('rebuilds when auth state changes', (tester) async {
      final authState = await createSignedOutAuthState();

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkAuthBuilder(
            signedInBuilder: (context, authState) => const Text('Signed In'),
            signedOutBuilder: (context, authState) => const Text('Signed Out'),
          ),
        ),
      );

      await tester.pump();
      expect(find.text('Signed Out'), findsOneWidget);

      authState.terminate();
    });

    testWidgets('renders with complex signed in widget', (tester) async {
      final user = createTestUser(firstName: 'Jane', lastName: 'Doe');
      final authState = await createSignedInAuthState(user: user);

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkAuthBuilder(
            signedInBuilder: (context, state) => Column(
              children: [
                Text(state.user?.firstName ?? ''),
                Text(state.user?.lastName ?? ''),
              ],
            ),
            signedOutBuilder: (context, authState) => const Text('Signed Out'),
          ),
        ),
      );

      await tester.pump();

      expect(find.text('Jane'), findsOneWidget);
      expect(find.text('Doe'), findsOneWidget);
      authState.terminate();
    });

    testWidgets('renders with complex signed out widget', (tester) async {
      final authState = await createSignedOutAuthState();

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkAuthBuilder(
            signedInBuilder: (context, authState) => const Text('Signed In'),
            signedOutBuilder: (context, state) => const Column(
              children: [
                Text('Please Sign In'),
                Text('Welcome'),
              ],
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.text('Please Sign In'), findsOneWidget);
      expect(find.text('Welcome'), findsOneWidget);
      authState.terminate();
    });
  });
}

