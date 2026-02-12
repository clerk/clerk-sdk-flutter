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
  group('CNameTarget', () {
    late CNameTarget instance;

    setUp(() {
      instance = CNameTarget(
        host: 'clerk.example.com',
        value: 'frontend-api.clerk.services',
        required_: true,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.host, 'clerk.example.com');
      expect(instance.value, 'frontend-api.clerk.services');
      expect(instance.required_, true);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['host'], 'clerk.example.com');
      expect(json['value'], 'frontend-api.clerk.services');
      expect(json['required'], true);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'host': 'api.example.com',
        'value': 'backend-api.clerk.services',
        'required': false,
      };
      final parsed = CNameTarget.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.host, 'api.example.com');
      expect(parsed.value, 'backend-api.clerk.services');
      expect(parsed.required_, false);
    });

    test('fromJson returns null for non-map input', () {
      expect(CNameTarget.fromJson('not a map'), isNull);
      expect(CNameTarget.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'host': 'a.com', 'value': 'v1', 'required': true},
        {'host': 'b.com', 'value': 'v2', 'required': false},
      ];
      final list = CNameTarget.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].host, 'a.com');
      expect(list[1].host, 'b.com');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(CNameTarget.listFromJson([]), isEmpty);
      expect(CNameTarget.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = CNameTarget(
        host: 'clerk.example.com',
        value: 'frontend-api.clerk.services',
        required_: true,
      );
      final different = CNameTarget(
        host: 'other.com',
        value: 'other.services',
        required_: false,
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      final same = CNameTarget(
        host: 'clerk.example.com',
        value: 'frontend-api.clerk.services',
        required_: true,
      );
      expect(instance.hashCode, equals(same.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('CNameTarget'));
      expect(str, contains('clerk.example.com'));
    });

    test('requiredKeys contains required fields', () {
      expect(CNameTarget.requiredKeys, contains('host'));
      expect(CNameTarget.requiredKeys, contains('value'));
      expect(CNameTarget.requiredKeys, contains('required'));
    });
  });
}
