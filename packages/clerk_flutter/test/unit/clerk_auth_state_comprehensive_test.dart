import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_support/test_support.dart';

void main() {
  group('ClerkAuthState comprehensive tests', () {
    group('error handling', () {
      testWidgets('handleError adds error to stream when has listeners',
          (tester) async {
        final authState = await createSignedOutAuthState();
        clerk.ClerkError? capturedError;

        authState.errorStream.listen((error) {
          capturedError = error;
        });

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: const SizedBox(),
          ),
        );

        const testError = clerk.ClerkError(
          message: 'Test error',
          code: clerk.ClerkErrorCode.clientAppError,
        );

        authState.handleError(testError);

        await tester.pump();

        expect(capturedError, isNotNull);
        expect(capturedError?.message, 'Test error');

        authState.terminate();
      });

      testWidgets('handleError throws when no listeners', (tester) async {
        final authState = await createSignedOutAuthState();

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: const SizedBox(),
          ),
        );

        const testError = clerk.ClerkError(
          message: 'Test error',
          code: clerk.ClerkErrorCode.clientAppError,
        );

        expect(() => authState.handleError(testError),
            throwsA(isA<clerk.ClerkError>()));

        authState.terminate();
      });
    });

    group('localizationsOf', () {
      testWidgets('returns localizations for current locale', (tester) async {
        final authState = await createSignedOutAuthState();

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                final l10ns = authState.localizationsOf(context);
                expect(l10ns, isNotNull);
                return const SizedBox();
              },
            ),
          ),
        );

        authState.terminate();
      });
    });

    group('update', () {
      test('notifies listeners when update is called', () async {
        final authState = await createSignedOutAuthState();
        var notified = false;

        authState.addListener(() {
          notified = true;
        });

        authState.update();

        expect(notified, isTrue);

        authState.terminate();
      });
    });

    group('signOut', () {
      testWidgets('calls super.signOut', (tester) async {
        final user = createTestUser();
        final session = createTestSession(user: user);
        final client = createSignedInClient(user: user, sessionId: session.id);
        final authState = await createTestAuthState(client: client);

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: const SizedBox(),
          ),
        );

        expect(authState.isSignedIn, isTrue);

        await authState.signOut();

        expect(authState.isSignedIn, isFalse);

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

      test('returns false when passwords do not match', () async {
        final authState = await createSignedOutAuthState();
        expect(authState.passwordIsValid('password1', 'password2'), isFalse);
        authState.terminate();
      });

      test('returns true when passwords match and meet criteria', () async {
        final authState = await createSignedOutAuthState();
        expect(authState.passwordIsValid('password', 'password'), isTrue);
        authState.terminate();
      });
    });

    group('checkPassword', () {
      testWidgets('returns null for null password', (tester) async {
        final authState = await createSignedOutAuthState();
        String? result;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                result = authState.checkPassword(null, null, context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(result, isNull);
        authState.terminate();
      });

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
        expect(result, contains('match'));
        authState.terminate();
      });

      testWidgets('returns null for valid matching passwords', (tester) async {
        final authState = await createSignedOutAuthState();
        String? result;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                result = authState.checkPassword(
                    'ValidPass123!', 'ValidPass123!', context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(result, isNull);
        authState.terminate();
      });

      testWidgets('returns error for password too short', (tester) async {
        // Create environment with password settings requiring min length of 8
        const environment = clerk.Environment(
          user: clerk.UserSettings(
            passwordSettings: clerk.PasswordSettings(minLength: 8),
          ),
        );

        final authState = await createTestAuthState(
          config: TestClerkAuthConfig(
            initialEnvironment: environment,
          ),
        );
        String? result;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                // Password 'a' is too short (min length is 8)
                result = authState.checkPassword('a', 'a', context);
                return const SizedBox();
              },
            ),
          ),
        );

        // Short passwords should return an error message
        expect(result, isNotNull);
        expect(result, contains('length'));
        authState.terminate();
      });

      testWidgets('validates password with all criteria', (tester) async {
        final authState = await createSignedOutAuthState();
        String? result;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                // Test with a password that should meet all criteria
                result = authState.checkPassword(
                    'Password123!', 'Password123!', context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(result, isNull);
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

        // Default test environment doesn't support email links
        expect(result, isNull);
        authState.terminate();
      });
    });

    group('safelyCall', () {
      testWidgets('executes function successfully', (tester) async {
        final authState = await createSignedOutAuthState();
        var executed = false;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () async {
                    await authState.safelyCall(context, () async {
                      executed = true;
                    });
                  },
                  child: const Text('Test'),
                );
              },
            ),
          ),
        );

        await tester.tap(find.text('Test'));
        await tester.pump();

        expect(executed, isTrue);
        authState.terminate();
      });

      testWidgets('handles errors with onError callback', (tester) async {
        final authState = await createSignedOutAuthState();
        clerk.ClerkError? capturedError;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () async {
                    // When onError is provided, the error is captured by the callback
                    // and NOT thrown (error is handled gracefully)
                    await authState.safelyCall(
                      context,
                      () async {
                        throw const clerk.ClerkError(
                          message: 'Test error',
                          code: clerk.ClerkErrorCode.clientAppError,
                        );
                      },
                      onError: (error) {
                        capturedError = error;
                      },
                    );
                  },
                  child: const Text('Test'),
                );
              },
            ),
          ),
        );

        await tester.tap(find.text('Test'));
        await tester.pump();

        // Verify the onError callback was called
        expect(capturedError, isNotNull);
        expect(capturedError?.message, 'Test error');

        authState.terminate();
      });

      testWidgets('returns result from function', (tester) async {
        final authState = await createSignedOutAuthState();
        String? result;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () async {
                    result = await authState.safelyCall(context, () async {
                      return 'success';
                    });
                  },
                  child: const Text('Test'),
                );
              },
            ),
          ),
        );

        await tester.tap(find.text('Test'));
        await tester.pump();

        expect(result, 'success');
        authState.terminate();
      });
    });

    group('parseDeepLink', () {
      test('returns true for valid deep link', () async {
        final authState = await createSignedOutAuthState();
        final uri = Uri.parse('https://example.com/verify');

        final result = await authState.parseDeepLink(uri);

        expect(result, isTrue);
        authState.terminate();
      });

      test('handles deep link with rotating token', () async {
        final user = createTestUser();
        final session = createTestSession(user: user);
        final signIn = createTestSignIn(
          status: clerk.Status.needsFirstFactor,
        );
        final client = createTestClient(
          sessions: [session],
          signIn: signIn,
        );
        final authState = await createTestAuthState(client: client);

        final uri = Uri.parse(
            'https://example.com/verify?rotating_token_nonce=token123');

        final result = await authState.parseDeepLink(uri);

        expect(result, isTrue);
        authState.terminate();
      });
    });
  });
}
