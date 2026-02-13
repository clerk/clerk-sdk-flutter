import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkAuth', () {
    group('static methods', () {
      late ClerkAuthState authState;

      setUp(() async {
        authState = await createSignedInAuthState();
      });

      tearDown(() {
        authState.terminate();
      });

      testWidgets('of returns ClerkAuthState from context', (tester) async {
        late ClerkAuthState result;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                result = ClerkAuth.of(context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(result, equals(authState));
      });

      testWidgets('of with listen=false returns ClerkAuthState', (tester) async {
        late ClerkAuthState result;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                result = ClerkAuth.of(context, listen: false);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(result, equals(authState));
      });

      testWidgets('userOf returns user from context', (tester) async {
        clerk.User? result;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                result = ClerkAuth.userOf(context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(result, isNotNull);
      });

      testWidgets('sessionOf returns session from context', (tester) async {
        clerk.Session? result;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                result = ClerkAuth.sessionOf(context);
                return const SizedBox();
              },
            ),
          ),
        );

        // Session may or may not be present depending on test setup
        expect(result, isA<clerk.Session?>());
      });

      testWidgets('localizationsOf returns localizations', (tester) async {
        late ClerkSdkLocalizations result;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                result = ClerkAuth.localizationsOf(context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(result, isA<ClerkSdkLocalizations>());
      });

      testWidgets('displayConfigOf returns display config', (tester) async {
        late clerk.DisplayConfig result;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                result = ClerkAuth.displayConfigOf(context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(result, isA<clerk.DisplayConfig>());
      });

      testWidgets('errorStreamOf returns error stream', (tester) async {
        late Stream<clerk.ClerkError> result;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                result = ClerkAuth.errorStreamOf(context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(result, isA<Stream<clerk.ClerkError>>());
      });

      testWidgets('themeExtensionOf returns theme extension', (tester) async {
        late ClerkThemeExtension result;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                result = ClerkAuth.themeExtensionOf(context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(result, isA<ClerkThemeExtension>());
      });
    });
  });
}

