import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_support/test_support.dart';

void main() {
  group('ClerkSignedIn', () {
    group('when signed in', () {
      late ClerkAuthState authState;

      setUp(() async {
        authState = await createSignedInAuthState();
      });

      tearDown(() {
        authState.terminate();
      });

      testWidgets('renders child when user is present', (tester) async {
        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: const ClerkSignedIn(
              child: Text('Signed In Content'),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Signed In Content'), findsOneWidget);
      });

      testWidgets('renders complex child widget', (tester) async {
        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: ClerkSignedIn(
              child: Column(
                children: const [
                  Text('Welcome'),
                  Text('User'),
                ],
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Welcome'), findsOneWidget);
        expect(find.text('User'), findsOneWidget);
      });
    });

    group('when signed out', () {
      late ClerkAuthState authState;

      setUp(() async {
        authState = await createSignedOutAuthState();
      });

      tearDown(() {
        authState.terminate();
      });

      testWidgets('does not render child when user is not present',
          (tester) async {
        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: const ClerkSignedIn(
              child: Text('Signed In Content'),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Signed In Content'), findsNothing);
      });
    });
  });

  group('ClerkSignedOut', () {
    group('when signed out', () {
      late ClerkAuthState authState;

      setUp(() async {
        authState = await createSignedOutAuthState();
      });

      tearDown(() {
        authState.terminate();
      });

      testWidgets('renders child when user is not present', (tester) async {
        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: const ClerkSignedOut(
              child: Text('Signed Out Content'),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Signed Out Content'), findsOneWidget);
      });

      testWidgets('renders complex child widget', (tester) async {
        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: ClerkSignedOut(
              child: Column(
                children: const [
                  Text('Please'),
                  Text('Sign In'),
                ],
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Please'), findsOneWidget);
        expect(find.text('Sign In'), findsOneWidget);
      });
    });

    group('when signed in', () {
      late ClerkAuthState authState;

      setUp(() async {
        authState = await createSignedInAuthState();
      });

      tearDown(() {
        authState.terminate();
      });

      testWidgets('does not render child when user is present',
          (tester) async {
        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: const ClerkSignedOut(
              child: Text('Signed Out Content'),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Signed Out Content'), findsNothing);
      });
    });
  });
}

