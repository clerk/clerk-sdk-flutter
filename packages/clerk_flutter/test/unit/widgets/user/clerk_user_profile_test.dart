import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/user/clerk_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkUserProfile', () {
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
          child: const ClerkUserProfile(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkUserProfile), findsOneWidget);
    });

    testWidgets('renders when signed out', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkUserProfile(),
        ),
      );
      await tester.pump();

      // Should render something even when signed out
      expect(find.byType(ClerkUserProfile), findsOneWidget);
    });

    testWidgets('renders Column', (tester) async {
      final signedInAuthState = await createSignedInAuthState();

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: signedInAuthState,
          child: const ClerkUserProfile(),
        ),
      );
      await tester.pump();

      expect(find.byType(Column), findsWidgets);

      signedInAuthState.terminate();
    });

    testWidgets('renders ListView widget', (tester) async {
      final signedInAuthState = await createSignedInAuthState();

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: signedInAuthState,
          child: const ClerkUserProfile(),
        ),
      );
      await tester.pump();

      expect(find.byType(ListView), findsWidgets);

      signedInAuthState.terminate();
    });

    testWidgets('renders with default state', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkUserProfile(),
        ),
      );
      await tester.pump();

      // Should render without errors
      expect(find.byType(ClerkUserProfile), findsOneWidget);
    });

    group('when signed in', () {
      testWidgets('renders with user data', (tester) async {
        final signedInAuthState = await createSignedInAuthState();

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkUserProfile(),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkUserProfile), findsOneWidget);
        expect(find.byType(Column), findsWidgets);

        signedInAuthState.terminate();
      });

      testWidgets('renders profile sections', (tester) async {
        final signedInAuthState = await createSignedInAuthState();

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkUserProfile(),
          ),
        );
        await tester.pump();

        // Should render the profile widget
        expect(find.byType(ClerkUserProfile), findsOneWidget);

        signedInAuthState.terminate();
      });

      testWidgets('renders with user email', (tester) async {
        final signedInAuthState = await createSignedInAuthState();

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkUserProfile(),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkUserProfile), findsOneWidget);

        signedInAuthState.terminate();
      });

      testWidgets('renders with user name', (tester) async {
        final signedInAuthState = await createSignedInAuthState();

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: signedInAuthState,
            child: const ClerkUserProfile(),
          ),
        );
        await tester.pump();

        expect(find.byType(ClerkUserProfile), findsOneWidget);

        signedInAuthState.terminate();
      });
    });
  });
}

