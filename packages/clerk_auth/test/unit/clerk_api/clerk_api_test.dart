import 'dart:convert';

import 'package:clerk_auth/src/clerk_api/api.dart';
import 'package:clerk_auth/src/clerk_auth/auth_config.dart';
import 'package:clerk_auth/src/clerk_auth/persistor.dart';
import 'package:test/test.dart';

import '../../test_helpers.dart';

void main() {
  group('Derive domain from publishable key', () {
    late final String domain;
    late final String publishableKey;

    setUpAll(() {
      domain = 'https://some.domain/';
      publishableKey = 'publishable_key_${base64.encode(utf8.encode(domain))}';
    });

    test('will fail unless encoded part follows underscore', () {
      expect(
        () => Api(
          config: const AuthConfig(
            publishableKey: 'NOT A PUBLISHABLE KEY',
            localesLookup: testLocalesLookup,
            persistor: Persistor.none,
            httpService: noneHttpService,
          ),
        ),
        throwsA(const TypeMatcher<FormatException>()),
      );
    });

    test('will pass when encoded part follows underscore', () {
      final result = Api(
        config: AuthConfig(
          publishableKey: publishableKey,
          localesLookup: testLocalesLookup,
          persistor: Persistor.none,
          httpService: noneHttpService,
        ),
      );
      expect(result.domain, isA<String>());
    });

    test('will return correct domain from decoded key', () {
      final result = Api(
        config: AuthConfig(
          publishableKey: publishableKey,
          localesLookup: testLocalesLookup,
          persistor: Persistor.none,
          httpService: noneHttpService,
        ),
      );
      expect(result.domain, domain);
    });
  });
}
