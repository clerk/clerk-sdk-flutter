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
  group('CreateAllowlistIdentifierRequest', () {
    late CreateAllowlistIdentifierRequest instance;

    setUp(() {
      instance = CreateAllowlistIdentifierRequest(
        identifier: 'test@example.com',
        notify: true,
      );
    });

    test('constructor creates instance with required parameters', () {
      final minimal = CreateAllowlistIdentifierRequest(
        identifier: 'user@example.com',
      );
      expect(minimal.identifier, 'user@example.com');
      expect(minimal.notify, false); // default value
    });

    test('constructor creates instance with all parameters', () {
      expect(instance.identifier, 'test@example.com');
      expect(instance.notify, true);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['identifier'], 'test@example.com');
      expect(json['notify'], true);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'identifier': 'another@example.com',
        'notify': true,
      };
      final result = CreateAllowlistIdentifierRequest.fromJson(json);
      expect(result, isNotNull);
      expect(result!.identifier, 'another@example.com');
      expect(result.notify, true);
    });

    test('fromJson uses default for notify when not provided', () {
      final json = {
        'identifier': 'test@example.com',
      };
      final result = CreateAllowlistIdentifierRequest.fromJson(json);
      expect(result, isNotNull);
      expect(result!.notify, false);
    });

    test('fromJson returns null for non-map input', () {
      expect(CreateAllowlistIdentifierRequest.fromJson('invalid'), isNull);
      expect(CreateAllowlistIdentifierRequest.fromJson(123), isNull);
      expect(CreateAllowlistIdentifierRequest.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {'identifier': 'user1@example.com'},
        {'identifier': 'user2@example.com', 'notify': true},
      ];
      final result = CreateAllowlistIdentifierRequest.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].identifier, 'user1@example.com');
      expect(result[1].notify, true);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(CreateAllowlistIdentifierRequest.listFromJson([]), isEmpty);
      expect(CreateAllowlistIdentifierRequest.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = CreateAllowlistIdentifierRequest(
        identifier: 'test@example.com',
        notify: true,
      );
      expect(instance, equals(other));

      final different = CreateAllowlistIdentifierRequest(
        identifier: 'different@example.com',
      );
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('CreateAllowlistIdentifierRequest'));
      expect(str, contains('identifier=test@example.com'));
      expect(str, contains('notify=true'));
    });

    test('requiredKeys contains required fields', () {
      expect(CreateAllowlistIdentifierRequest.requiredKeys, contains('identifier'));
    });
  });
}
