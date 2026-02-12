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
  group('DisableMFA200Response', () {
    late DisableMFA200Response instance;

    setUp(() {
      instance = DisableMFA200Response(
        userId: 'user_123',
      );
    });

    test('constructor creates instance with optional parameters', () {
      final empty = DisableMFA200Response();
      expect(empty.userId, isNull);
    });

    test('constructor creates instance with userId parameter', () {
      expect(instance.userId, 'user_123');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['user_id'], 'user_123');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'user_id': 'user_456',
      };
      final result = DisableMFA200Response.fromJson(json);
      expect(result, isNotNull);
      expect(result!.userId, 'user_456');
    });

    test('fromJson returns null for non-map input', () {
      expect(DisableMFA200Response.fromJson('invalid'), isNull);
      expect(DisableMFA200Response.fromJson(123), isNull);
      expect(DisableMFA200Response.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {'user_id': 'user_1'},
        {'user_id': 'user_2'},
      ];
      final result = DisableMFA200Response.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].userId, 'user_1');
      expect(result[1].userId, 'user_2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(DisableMFA200Response.listFromJson([]), isEmpty);
      expect(DisableMFA200Response.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = DisableMFA200Response(
        userId: 'user_123',
      );
      expect(instance, equals(other));

      final different = DisableMFA200Response(
        userId: 'user_different',
      );
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('DisableMFA200Response'));
      expect(str, contains('userId=user_123'));
    });

    test('requiredKeys is empty', () {
      expect(DisableMFA200Response.requiredKeys, isEmpty);
    });
  });
}
