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
  group('CreateBlocklistIdentifierRequest', () {
    late CreateBlocklistIdentifierRequest instance;

    setUp(() {
      instance = CreateBlocklistIdentifierRequest(
        identifier: 'blocked@example.com',
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.identifier, 'blocked@example.com');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['identifier'], 'blocked@example.com');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'identifier': 'another@example.com',
      };
      final result = CreateBlocklistIdentifierRequest.fromJson(json);
      expect(result, isNotNull);
      expect(result!.identifier, 'another@example.com');
    });

    test('fromJson returns null for non-map input', () {
      expect(CreateBlocklistIdentifierRequest.fromJson('invalid'), isNull);
      expect(CreateBlocklistIdentifierRequest.fromJson(123), isNull);
      expect(CreateBlocklistIdentifierRequest.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {'identifier': 'user1@example.com'},
        {'identifier': 'user2@example.com'},
      ];
      final result = CreateBlocklistIdentifierRequest.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].identifier, 'user1@example.com');
      expect(result[1].identifier, 'user2@example.com');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(CreateBlocklistIdentifierRequest.listFromJson([]), isEmpty);
      expect(CreateBlocklistIdentifierRequest.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = CreateBlocklistIdentifierRequest(
        identifier: 'blocked@example.com',
      );
      expect(instance, equals(other));

      final different = CreateBlocklistIdentifierRequest(
        identifier: 'different@example.com',
      );
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('CreateBlocklistIdentifierRequest'));
      expect(str, contains('identifier=blocked@example.com'));
    });

    test('requiredKeys contains required fields', () {
      expect(CreateBlocklistIdentifierRequest.requiredKeys, contains('identifier'));
    });
  });
}
