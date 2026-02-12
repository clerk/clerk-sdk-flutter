//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:clerk_backend_api/api.dart';
import 'package:test/test.dart';

void main() {
  group('JWKS', () {
    late JWKS instance;

    setUp(() {
      instance = JWKS(keys: []);
    });

    test('constructor creates instance with default values', () {
      final jwks = JWKS();
      expect(jwks.keys, isEmpty);
    });

    test('constructor creates instance with parameters', () {
      expect(instance.keys, isEmpty);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['keys'], isA<List>());
      expect(json['keys'], isEmpty);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'keys': [],
      };
      final result = JWKS.fromJson(json);
      expect(result, isNotNull);
      expect(result!.keys, isEmpty);
    });

    test('fromJson returns null for non-map input', () {
      expect(JWKS.fromJson('invalid'), isNull);
      expect(JWKS.fromJson(123), isNull);
      expect(JWKS.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(JWKS.listFromJson([]), isEmpty);
      expect(JWKS.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('JWKS'));
      expect(str, contains('keys='));
    });

    test('requiredKeys is empty for this model', () {
      expect(JWKS.requiredKeys, isEmpty);
    });
  });
}
