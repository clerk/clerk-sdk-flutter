import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_support/test_support.dart';

void main() {
  group('ClerkAuthBuilder', () {
    group('when signed in', () {
      late ClerkAuthState authState;

      setUp(() async {
        authState = await createSignedInAuthState();
      });

      tearDown(() {
        authState.terminate();
      });

      testWidgets('calls signedInBuilder when user is present', (tester) async {
        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: ClerkAuthBuilder(
              signedInBuilder: (context, auth) => const Text('Signed In'),
              signedOutBuilder: (context, auth) => const Text('Signed Out'),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Signed In'), findsOneWidget);
        expect(find.text('Signed Out'), findsNothing);
      });

      testWidgets('provides authState to signedInBuilder', (tester) async {
        ClerkAuthState? capturedAuthState;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: ClerkAuthBuilder(
              signedInBuilder: (context, auth) {
                capturedAuthState = auth;
                return const Text('Signed In');
              },
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(capturedAuthState, isNotNull);
        expect(capturedAuthState!.user, isNotNull);
      });

      testWidgets('falls back to builder when signedInBuilder is null',
          (tester) async {
        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: ClerkAuthBuilder(
              builder: (context, auth) => const Text('Fallback Builder'),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Fallback Builder'), findsOneWidget);
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

      testWidgets('calls signedOutBuilder when user is not present',
          (tester) async {
        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: ClerkAuthBuilder(
              signedInBuilder: (context, auth) => const Text('Signed In'),
              signedOutBuilder: (context, auth) => const Text('Signed Out'),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Signed Out'), findsOneWidget);
        expect(find.text('Signed In'), findsNothing);
      });

      testWidgets('provides authState to signedOutBuilder', (tester) async {
        ClerkAuthState? capturedAuthState;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: ClerkAuthBuilder(
              signedOutBuilder: (context, auth) {
                capturedAuthState = auth;
                return const Text('Signed Out');
              },
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(capturedAuthState, isNotNull);
        expect(capturedAuthState!.user, isNull);
      });

      testWidgets('falls back to builder when signedOutBuilder is null',
          (tester) async {
        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: ClerkAuthBuilder(
              builder: (context, auth) => const Text('Fallback Builder'),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Fallback Builder'), findsOneWidget);
      });

      testWidgets('renders empty widget when no builders provided',
          (tester) async {
        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: const ClerkAuthBuilder(),
          ),
        );
        await tester.pumpAndSettle();

        // Should render an empty SizedBox
        expect(find.byType(SizedBox), findsWidgets);
      });
    });
  });
}

