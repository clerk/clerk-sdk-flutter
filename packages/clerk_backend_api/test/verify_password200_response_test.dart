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
  group('VerifyPassword200Response', () {
    late VerifyPassword200Response instance;

    setUp(() {
      instance = VerifyPassword200Response(
        verified: true,
      );
    });

    test('constructor creates instance with optional parameters', () {
      final empty = VerifyPassword200Response();
      expect(empty.verified, isNull);
    });

    test('constructor creates instance with verified parameter', () {
      expect(instance.verified, true);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['verified'], true);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'verified': false,
      };
      final result = VerifyPassword200Response.fromJson(json);
      expect(result, isNotNull);
      expect(result!.verified, false);
    });

    test('fromJson returns null for non-map input', () {
      expect(VerifyPassword200Response.fromJson('invalid'), isNull);
      expect(VerifyPassword200Response.fromJson(123), isNull);
      expect(VerifyPassword200Response.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {'verified': true},
        {'verified': false},
      ];
      final result = VerifyPassword200Response.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].verified, true);
      expect(result[1].verified, false);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(VerifyPassword200Response.listFromJson([]), isEmpty);
      expect(VerifyPassword200Response.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = VerifyPassword200Response(
        verified: true,
      );
      expect(instance, equals(other));

      final different = VerifyPassword200Response(
        verified: false,
      );
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('VerifyPassword200Response'));
      expect(str, contains('verified=true'));
    });

    test('requiredKeys is empty', () {
      expect(VerifyPassword200Response.requiredKeys, isEmpty);
    });
  });
}
