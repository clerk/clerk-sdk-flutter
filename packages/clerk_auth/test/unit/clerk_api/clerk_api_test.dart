import 'dart:convert';

import 'package:clerk_auth/src/clerk_api/api.dart';
import 'package:test/test.dart';

void main() {
  group('Derive domain from public key', () {
    late final String domain;
    late final String publicKey;

    setUpAll(() {
      domain = 'https://some.domain/';
      publicKey = 'public_key_${base64.encode(utf8.encode(domain))}';
    });

    test('will fail unless encoded part follows underscore', () {
      expect(
        () => Api.deriveDomainFrom('NOT A PUBLIC KEY'),
        throwsA(const TypeMatcher<FormatException>()),
      );
    });

    test('will pass when encoded part follows underscore', () {
      final result = Api.deriveDomainFrom(publicKey);
      expect(result, isA<String>());
    });

    test('will return correct domain from decoded key', () {
      final result = Api.deriveDomainFrom(publicKey);
      expect(result, domain);
    });
  });
}
