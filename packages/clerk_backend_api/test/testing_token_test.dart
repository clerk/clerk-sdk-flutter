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
  group('TestingToken', () {
    late TestingToken instance;

    setUp(() {
      instance = TestingToken(
        object: TestingTokenObjectEnum.testingToken,
        token: 'test_token_abc123',
        expiresAt: 1700000000,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, TestingTokenObjectEnum.testingToken);
      expect(instance.token, 'test_token_abc123');
      expect(instance.expiresAt, 1700000000);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], TestingTokenObjectEnum.testingToken);
      expect(json['token'], 'test_token_abc123');
      expect(json['expires_at'], 1700000000);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'testing_token',
        'token': 'another_token_xyz',
        'expires_at': 1700000001,
      };
      final parsed = TestingToken.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.object, TestingTokenObjectEnum.testingToken);
      expect(parsed.token, 'another_token_xyz');
      expect(parsed.expiresAt, 1700000001);
    });

    test('fromJson returns null for non-map input', () {
      expect(TestingToken.fromJson('not a map'), isNull);
      expect(TestingToken.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'object': 'testing_token', 'token': 't1', 'expires_at': 1},
        {'object': 'testing_token', 'token': 't2', 'expires_at': 2},
      ];
      final list = TestingToken.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].token, 't1');
      expect(list[1].token, 't2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(TestingToken.listFromJson([]), isEmpty);
      expect(TestingToken.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = TestingToken(
        object: TestingTokenObjectEnum.testingToken,
        token: 'test_token_abc123',
        expiresAt: 1700000000,
      );
      final different = TestingToken(
        object: TestingTokenObjectEnum.testingToken,
        token: 'different_token',
        expiresAt: 1700000000,
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      final same = TestingToken(
        object: TestingTokenObjectEnum.testingToken,
        token: 'test_token_abc123',
        expiresAt: 1700000000,
      );
      expect(instance.hashCode, equals(same.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('TestingToken'));
      expect(str, contains('test_token_abc123'));
    });

    test('requiredKeys contains required fields', () {
      expect(TestingToken.requiredKeys, contains('object'));
      expect(TestingToken.requiredKeys, contains('token'));
      expect(TestingToken.requiredKeys, contains('expires_at'));
    });
  });

  group('TestingTokenObjectEnum', () {
    test('values contains all enum values', () {
      expect(TestingTokenObjectEnum.values, contains(TestingTokenObjectEnum.testingToken));
    });

    test('toJson returns correct string', () {
      expect(TestingTokenObjectEnum.testingToken.toJson(), 'testing_token');
    });

    test('fromJson parses correct value', () {
      expect(TestingTokenObjectEnum.fromJson('testing_token'), TestingTokenObjectEnum.testingToken);
    });

    test('fromJson returns null for unknown value', () {
      expect(TestingTokenObjectEnum.fromJson('unknown'), isNull);
    });
  });
}
