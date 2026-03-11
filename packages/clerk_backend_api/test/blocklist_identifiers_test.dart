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
  group('BlocklistIdentifiers', () {
    late BlocklistIdentifiers instance;
    late BlocklistIdentifier identifier;

    setUp(() {
      identifier = BlocklistIdentifier(
        object: BlocklistIdentifierObjectEnum.blocklistIdentifier,
        id: 'bli_123',
        identifier: 'blocked@example.com',
        identifierType: BlocklistIdentifierIdentifierTypeEnum.emailAddress,
        createdAt: 1234567890,
        updatedAt: 1234567890,
      );
      instance = BlocklistIdentifiers(
        data: [identifier],
        totalCount: 1,
      );
    });

    test('constructor creates instance with default values', () {
      final empty = BlocklistIdentifiers(totalCount: 0);
      expect(empty.data, isEmpty);
      expect(empty.totalCount, 0);
    });

    test('constructor creates instance with parameters', () {
      expect(instance.data.length, 1);
      expect(instance.data[0].identifier, 'blocked@example.com');
      expect(instance.totalCount, 1);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['data'], isA<List>());
      expect(json['total_count'], 1);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'data': [
          {
            'object': 'blocklist_identifier',
            'id': 'bli_456',
            'identifier': 'spam@test.com',
            'identifier_type': 'email_address',
            'created_at': 1234567890,
            'updated_at': 1234567890,
          }
        ],
        'total_count': 1,
      };
      final result = BlocklistIdentifiers.fromJson(json);
      expect(result, isNotNull);
      expect(result!.data.length, 1);
      expect(result.totalCount, 1);
    });

    test('fromJson returns null for non-map input', () {
      expect(BlocklistIdentifiers.fromJson('invalid'), isNull);
      expect(BlocklistIdentifiers.fromJson(123), isNull);
      expect(BlocklistIdentifiers.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(BlocklistIdentifiers.listFromJson([]), isEmpty);
      expect(BlocklistIdentifiers.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('BlocklistIdentifiers'));
      expect(str, contains('totalCount=1'));
    });

    test('requiredKeys contains required fields', () {
      expect(BlocklistIdentifiers.requiredKeys, contains('data'));
      expect(BlocklistIdentifiers.requiredKeys, contains('total_count'));
    });
  });
}
