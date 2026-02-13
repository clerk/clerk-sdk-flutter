import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/clerk_sdk_grammar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_support/test_support.dart';

void main() {
  group('ClerkSdkGrammar', () {
    setUpAll(() {
      // Initialize grammars for testing
      ClerkSdkGrammar.initialise(
        {'en': const ClerkSdkGrammarEn()},
        const ClerkSdkGrammarEn(),
      );
    });

    test('of returns grammar for exact locale match', () {
      final grammar = ClerkSdkGrammar.of('en');
      expect(grammar, isA<ClerkSdkGrammarEn>());
    });

    test('of returns grammar for language code when full locale not found', () {
      final grammar = ClerkSdkGrammar.of('en_US');
      expect(grammar, isA<ClerkSdkGrammarEn>());
    });

    test('of returns default grammar when locale not found', () {
      final grammar = ClerkSdkGrammar.of('fr');
      expect(grammar, isA<ClerkSdkGrammarEn>());
    });

    test('initialise with null grammars uses empty map', () {
      ClerkSdkGrammar.initialise(null, const ClerkSdkGrammarEn());
      final grammar = ClerkSdkGrammar.of('de');
      expect(grammar, isA<ClerkSdkGrammarEn>());
    });

    test('initialise with null default uses ClerkSdkGrammarEn', () {
      ClerkSdkGrammar.initialise({}, null);
      final grammar = ClerkSdkGrammar.of('de');
      expect(grammar, isA<ClerkSdkGrammarEn>());
    });
  });

  group('ClerkSdkGrammarEn', () {
    const grammar = ClerkSdkGrammarEn();

    group('toSentence', () {
      test('capitalizes first letter', () {
        expect(grammar.toSentence('hello world'), 'Hello world');
      });

      test('returns empty string for empty input', () {
        expect(grammar.toSentence(''), '');
      });

      test('handles single character', () {
        expect(grammar.toSentence('a'), 'A');
      });

      test('handles already capitalized string', () {
        expect(grammar.toSentence('Hello'), 'Hello');
      });
    });

    group('toSlug', () {
      test('converts to lowercase', () {
        expect(grammar.toSlug('HELLO'), 'hello');
      });

      test('replaces spaces with hyphens', () {
        expect(grammar.toSlug('hello world'), 'hello-world');
      });

      test('removes special characters', () {
        expect(grammar.toSlug('hello@world!'), 'hello-world-');
      });

      test('handles multiple spaces', () {
        expect(grammar.toSlug('hello   world'), 'hello-world');
      });

      test('handles mixed case and special chars', () {
        expect(grammar.toSlug('My Organization Name!'), 'my-organization-name-');
      });
    });

    group('toLitany', () {
      late ClerkAuthState authState;

      setUp(() async {
        authState = await createSignedOutAuthState();
      });

      tearDown(() {
        authState.terminate();
      });

      testWidgets('returns empty string for empty list', (tester) async {
        late BuildContext capturedContext;
        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                capturedContext = context;
                return const SizedBox();
              },
            ),
          ),
        );
        await tester.pumpAndSettle();

        final result = grammar.toLitany(
          [],
          context: capturedContext,
        );
        expect(result, '');
      });

      testWidgets('returns single item as-is', (tester) async {
        late BuildContext capturedContext;
        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                capturedContext = context;
                return const SizedBox();
              },
            ),
          ),
        );
        await tester.pumpAndSettle();

        final result = grammar.toLitany(
          ['first'],
          context: capturedContext,
        );
        expect(result, 'first');
      });

      testWidgets('joins two items with "or" when not inclusive', (tester) async {
        late BuildContext capturedContext;
        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                capturedContext = context;
                return const SizedBox();
              },
            ),
          ),
        );
        await tester.pumpAndSettle();

        final result = grammar.toLitany(
          ['first', 'second'],
          context: capturedContext,
          inclusive: false,
        );
        expect(result, 'first or second');
      });
    });
  });
}

