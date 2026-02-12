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
  group('IdentificationLink', () {
    late IdentificationLink instance;

    setUp(() {
      instance = IdentificationLink(
        type: 'email_address',
        id: 'idn_123',
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.type, 'email_address');
      expect(instance.id, 'idn_123');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['type'], 'email_address');
      expect(json['id'], 'idn_123');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'type': 'phone_number',
        'id': 'idn_456',
      };
      final result = IdentificationLink.fromJson(json);
      expect(result, isNotNull);
      expect(result!.type, 'phone_number');
      expect(result.id, 'idn_456');
    });

    test('fromJson returns null for non-map input', () {
      expect(IdentificationLink.fromJson('invalid'), isNull);
      expect(IdentificationLink.fromJson(123), isNull);
      expect(IdentificationLink.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {'type': 'email_address', 'id': 'idn_1'},
        {'type': 'phone_number', 'id': 'idn_2'},
      ];
      final result = IdentificationLink.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].type, 'email_address');
      expect(result[1].type, 'phone_number');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(IdentificationLink.listFromJson([]), isEmpty);
      expect(IdentificationLink.listFromJson(null), isEmpty);
    });

    test('mapFromJson creates map from json', () {
      final jsonMap = {
        'key1': {'type': 'email_address', 'id': 'idn_1'},
        'key2': {'type': 'phone_number', 'id': 'idn_2'},
      };
      final result = IdentificationLink.mapFromJson(jsonMap);
      expect(result.length, 2);
      expect(result['key1']!.type, 'email_address');
      expect(result['key2']!.type, 'phone_number');
    });

    test('mapListFromJson creates map of lists from json', () {
      final jsonMap = {
        'group1': [
          {'type': 'email_address', 'id': 'idn_1'},
        ],
        'group2': [
          {'type': 'phone_number', 'id': 'idn_2'},
          {'type': 'web3_wallet', 'id': 'idn_3'},
        ],
      };
      final result = IdentificationLink.mapListFromJson(jsonMap);
      expect(result.length, 2);
      expect(result['group1']!.length, 1);
      expect(result['group2']!.length, 2);
    });

    test('equality operator works correctly', () {
      final other = IdentificationLink(
        type: 'email_address',
        id: 'idn_123',
      );
      expect(instance, equals(other));

      final different = IdentificationLink(
        type: 'phone_number',
        id: 'idn_456',
      );
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      final other = IdentificationLink(
        type: 'email_address',
        id: 'idn_123',
      );
      expect(instance.hashCode, equals(other.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('IdentificationLink'));
      expect(str, contains('type=email_address'));
      expect(str, contains('id=idn_123'));
    });

    test('requiredKeys contains required fields', () {
      expect(IdentificationLink.requiredKeys, contains('type'));
      expect(IdentificationLink.requiredKeys, contains('id'));
    });
  });
}
