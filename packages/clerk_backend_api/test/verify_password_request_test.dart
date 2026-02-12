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
  group('VerifyPasswordRequest', () {
    late VerifyPasswordRequest instance;

    setUp(() {
      instance = VerifyPasswordRequest(
        password: 'securePassword123!',
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.password, 'securePassword123!');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['password'], 'securePassword123!');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'password': 'anotherPassword456!',
      };
      final result = VerifyPasswordRequest.fromJson(json);
      expect(result, isNotNull);
      expect(result!.password, 'anotherPassword456!');
    });

    test('fromJson returns null for non-map input', () {
      expect(VerifyPasswordRequest.fromJson('invalid'), isNull);
      expect(VerifyPasswordRequest.fromJson(123), isNull);
      expect(VerifyPasswordRequest.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {'password': 'pass1'},
        {'password': 'pass2'},
      ];
      final result = VerifyPasswordRequest.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].password, 'pass1');
      expect(result[1].password, 'pass2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(VerifyPasswordRequest.listFromJson([]), isEmpty);
      expect(VerifyPasswordRequest.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = VerifyPasswordRequest(
        password: 'securePassword123!',
      );
      expect(instance, equals(other));

      final different = VerifyPasswordRequest(
        password: 'differentPassword',
      );
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('VerifyPasswordRequest'));
      expect(str, contains('password=securePassword123!'));
    });

    test('requiredKeys contains required fields', () {
      expect(VerifyPasswordRequest.requiredKeys, contains('password'));
    });
  });
}
