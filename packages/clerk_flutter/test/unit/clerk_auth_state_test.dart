import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_support/test_support.dart';

void main() {
  group('ClerkAuthState', () {
    group('create', () {
      test('creates an initialized ClerkAuthState', () async {
        final authState = await createSignedOutAuthState();
        expect(authState, isA<ClerkAuthState>());
        expect(authState.config, isA<ClerkAuthConfig>());
        authState.terminate();
      });

      test('creates signed-in state with user', () async {
        final authState = await createSignedInAuthState();
        expect(authState.user, isNotNull);
        authState.terminate();
      });

      test('creates signed-out state without user', () async {
        final authState = await createSignedOutAuthState();
        expect(authState.user, isNull);
        authState.terminate();
      });
    });

    group('handleError', () {
      test('adds error to stream when listener is present', () async {
        final authState = await createSignedOutAuthState();
        final errors = <clerk.ClerkError>[];
        final subscription = authState.errorStream.listen(errors.add);

        final error = clerk.ClerkError.clientAppError(message: 'Test error');
        authState.handleError(error);

        await Future.delayed(Duration.zero);
        expect(errors.length, 1);
        expect(errors.first.message, 'Test error');

        await subscription.cancel();
        authState.terminate();
      });
    });

    group('update', () {
      test('notifies listeners when unlocked', () async {
        final authState = await createSignedOutAuthState();
        var notified = false;
        authState.addListener(() => notified = true);

        authState.update();

        expect(notified, isTrue);
        authState.terminate();
      });
    });

    group('passwordIsValid', () {
      test('returns false when password is null', () async {
        final authState = await createSignedOutAuthState();
        expect(authState.passwordIsValid(null, null), isFalse);
        authState.terminate();
      });

      test('returns false when password is empty', () async {
        final authState = await createSignedOutAuthState();
        expect(authState.passwordIsValid('', ''), isFalse);
        authState.terminate();
      });

      test('returns false when password and confirmation do not match',
          () async {
        final authState = await createSignedOutAuthState();
        expect(authState.passwordIsValid('password1', 'password2'), isFalse);
        authState.terminate();
      });

      test('returns true when password matches confirmation and meets criteria',
          () async {
        final authState = await createSignedOutAuthState();
        // The test environment has minimal password requirements
        expect(authState.passwordIsValid('password', 'password'), isTrue);
        authState.terminate();
      });
    });

    group('localizationsOf', () {
      testWidgets('returns localizations for context', (tester) async {
        final authState = await createSignedOutAuthState();
        late ClerkSdkLocalizations localizations;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                localizations = authState.localizationsOf(context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(localizations, isA<ClerkSdkLocalizations>());
        authState.terminate();
      });
    });

    group('checkPassword', () {
      testWidgets('returns null for empty password', (tester) async {
        final authState = await createSignedOutAuthState();
        String? result;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                result = authState.checkPassword('', '', context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(result, isNull);
        authState.terminate();
      });

      testWidgets('returns error for mismatched passwords', (tester) async {
        final authState = await createSignedOutAuthState();
        String? result;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                result =
                    authState.checkPassword('password1', 'password2', context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(result, isNotNull);
        authState.terminate();
      });

      testWidgets('returns null for matching passwords', (tester) async {
        final authState = await createSignedOutAuthState();
        String? result;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                result =
                    authState.checkPassword('password', 'password', context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(result, isNull);
        authState.terminate();
      });
    });

    group('safelyCall', () {
      testWidgets('executes callback successfully', (tester) async {
        final authState = await createSignedOutAuthState();
        var executed = false;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                authState.safelyCall(context, () async {
                  executed = true;
                });
                return const SizedBox();
              },
            ),
          ),
        );
        await tester.pump();

        expect(executed, isTrue);
        authState.terminate();
      });

      testWidgets('handles errors from callback', (tester) async {
        final authState = await createSignedOutAuthState();
        final errors = <clerk.ClerkError>[];
        final subscription = authState.errorStream.listen(errors.add);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                authState.safelyCall(context, () async {
                  throw clerk.ClerkError.clientAppError(message: 'Test error');
                });
                return const SizedBox();
              },
            ),
          ),
        );
        await tester.pump();
        await tester.pump();

        expect(errors.length, greaterThan(0));

        await subscription.cancel();
        authState.terminate();
      });
    });

    group('config', () {
      test('returns ClerkAuthConfig', () async {
        final authState = await createSignedOutAuthState();
        expect(authState.config, isA<ClerkAuthConfig>());
        authState.terminate();
      });

      test('config has publishableKey', () async {
        final authState = await createSignedOutAuthState();
        expect(authState.config.publishableKey, isNotEmpty);
        authState.terminate();
      });
    });

    group('errorStream', () {
      test('is a broadcast stream', () async {
        final authState = await createSignedOutAuthState();
        expect(authState.errorStream.isBroadcast, isTrue);
        authState.terminate();
      });

      test('can have multiple listeners', () async {
        final authState = await createSignedOutAuthState();
        final errors1 = <clerk.ClerkError>[];
        final errors2 = <clerk.ClerkError>[];

        final sub1 = authState.errorStream.listen(errors1.add);
        final sub2 = authState.errorStream.listen(errors2.add);

        final error = clerk.ClerkError.clientAppError(message: 'Test error');
        authState.handleError(error);

        await Future.delayed(Duration.zero);
        expect(errors1.length, 1);
        expect(errors2.length, 1);

        await sub1.cancel();
        await sub2.cancel();
        authState.terminate();
      });
    });

    group('emailVerificationRedirectUri', () {
      testWidgets('returns null when email link not supported', (tester) async {
        final authState = await createSignedOutAuthState();
        Uri? result;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                result = authState.emailVerificationRedirectUri(context);
                return const SizedBox();
              },
            ),
          ),
        );

        // Default test environment doesn't support email link
        expect(result, isNull);
        authState.terminate();
      });
    });

    group('terminate', () {
      test('cleans up resources', () async {
        final authState = await createSignedOutAuthState();

        // Should not throw
        authState.terminate();
      });
    });

    group('signOut', () {
      test('signs out user', () async {
        final authState = await createSignedInAuthState();
        expect(authState.user, isNotNull);

        await authState.signOut();

        expect(authState.user, isNull);
        authState.terminate();
      });
    });
  });
}
