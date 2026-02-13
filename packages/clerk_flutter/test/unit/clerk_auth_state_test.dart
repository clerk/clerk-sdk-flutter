import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_support/test_support.dart';

void main() {
  group('ClerkAuthState', () {
    group('create', () {
      late ClerkAuthState authState;

      tearDown(() {
        authState.terminate();
      });

      test('creates an initialized ClerkAuthState', () async {
        authState = await createSignedOutAuthState();
        expect(authState, isA<ClerkAuthState>());
        expect(authState.config, isA<ClerkAuthConfig>());
      });

      test('creates signed-in state with user', () async {
        authState = await createSignedInAuthState();
        expect(authState.user, isNotNull);
      });

      test('creates signed-out state without user', () async {
        authState = await createSignedOutAuthState();
        expect(authState.user, isNull);
      });
    });

    group('handleError', () {
      late ClerkAuthState authState;

      setUp(() async {
        authState = await createSignedOutAuthState();
      });

      tearDown(() {
        authState.terminate();
      });

      test('adds error to stream when listener is present', () async {
        final errors = <clerk.ClerkError>[];
        final subscription = authState.errorStream.listen(errors.add);

        final error = clerk.ClerkError.clientAppError(message: 'Test error');
        authState.handleError(error);

        await Future.delayed(Duration.zero);
        expect(errors.length, 1);
        expect(errors.first.message, 'Test error');

        await subscription.cancel();
      });
    });

    group('update', () {
      late ClerkAuthState authState;

      setUp(() async {
        authState = await createSignedOutAuthState();
      });

      tearDown(() {
        authState.terminate();
      });

      test('notifies listeners when unlocked', () async {
        var notified = false;
        authState.addListener(() => notified = true);

        authState.update();

        expect(notified, isTrue);
      });
    });

    group('passwordIsValid', () {
      late ClerkAuthState authState;

      setUp(() async {
        authState = await createSignedOutAuthState();
      });

      tearDown(() {
        authState.terminate();
      });

      test('returns false when password is null', () {
        expect(authState.passwordIsValid(null, null), isFalse);
      });

      test('returns false when password is empty', () {
        expect(authState.passwordIsValid('', ''), isFalse);
      });

      test('returns false when password and confirmation do not match', () {
        expect(authState.passwordIsValid('password1', 'password2'), isFalse);
      });
    });

    group('localizationsOf', () {
      late ClerkAuthState authState;

      setUp(() async {
        authState = await createSignedOutAuthState();
      });

      tearDown(() {
        authState.terminate();
      });

      testWidgets('returns localizations for context', (tester) async {
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
      });
    });

    group('checkPassword', () {
      late ClerkAuthState authState;

      setUp(() async {
        authState = await createSignedOutAuthState();
      });

      tearDown(() {
        authState.terminate();
      });

      testWidgets('returns null for empty password', (tester) async {
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
      });
    });
  });
}

