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
  group('BlocklistIdentifier', () {
    late BlocklistIdentifier instance;

    setUp(() {
      instance = BlocklistIdentifier(
        object: BlocklistIdentifierObjectEnum.blocklistIdentifier,
        id: 'blid_123',
        identifier: 'blocked@example.com',
        identifierType: BlocklistIdentifierIdentifierTypeEnum.emailAddress,
        instanceId: 'ins_456',
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
    });

    test('constructor creates instance with all parameters', () {
      expect(instance.object, BlocklistIdentifierObjectEnum.blocklistIdentifier);
      expect(instance.id, 'blid_123');
      expect(instance.identifier, 'blocked@example.com');
      expect(instance.identifierType, BlocklistIdentifierIdentifierTypeEnum.emailAddress);
      expect(instance.instanceId, 'ins_456');
      expect(instance.createdAt, 1700000000);
      expect(instance.updatedAt, 1700000001);
    });

    test('constructor creates instance with null optional parameters', () {
      final minimal = BlocklistIdentifier();
      expect(minimal.object, isNull);
      expect(minimal.id, isNull);
      expect(minimal.identifier, isNull);
      expect(minimal.identifierType, isNull);
      expect(minimal.instanceId, isNull);
      expect(minimal.createdAt, isNull);
      expect(minimal.updatedAt, isNull);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], BlocklistIdentifierObjectEnum.blocklistIdentifier);
      expect(json['id'], 'blid_123');
      expect(json['identifier'], 'blocked@example.com');
      expect(json['identifier_type'], BlocklistIdentifierIdentifierTypeEnum.emailAddress);
      expect(json['instance_id'], 'ins_456');
      expect(json['created_at'], 1700000000);
      expect(json['updated_at'], 1700000001);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'blocklist_identifier',
        'id': 'blid_789',
        'identifier': '+1234567890',
        'identifier_type': 'phone_number',
        'instance_id': 'ins_abc',
        'created_at': 1700000002,
        'updated_at': 1700000003,
      };
      final parsed = BlocklistIdentifier.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.object, BlocklistIdentifierObjectEnum.blocklistIdentifier);
      expect(parsed.id, 'blid_789');
      expect(parsed.identifier, '+1234567890');
      expect(parsed.identifierType, BlocklistIdentifierIdentifierTypeEnum.phoneNumber);
      expect(parsed.instanceId, 'ins_abc');
      expect(parsed.createdAt, 1700000002);
      expect(parsed.updatedAt, 1700000003);
    });

    test('fromJson returns null for non-map input', () {
      expect(BlocklistIdentifier.fromJson('not a map'), isNull);
      expect(BlocklistIdentifier.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'object': 'blocklist_identifier', 'id': 'blid_1', 'identifier': 'a@test.com', 'identifier_type': 'email_address'},
        {'object': 'blocklist_identifier', 'id': 'blid_2', 'identifier': 'b@test.com', 'identifier_type': 'email_address'},
      ];
      final list = BlocklistIdentifier.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].id, 'blid_1');
      expect(list[1].id, 'blid_2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(BlocklistIdentifier.listFromJson([]), isEmpty);
      expect(BlocklistIdentifier.listFromJson(null), isEmpty);
    });

    test('mapFromJson creates map from json', () {
      final jsonMap = {
        'key1': {'object': 'blocklist_identifier', 'id': 'blid_1'},
        'key2': {'object': 'blocklist_identifier', 'id': 'blid_2'},
      };
      final map = BlocklistIdentifier.mapFromJson(jsonMap);
      expect(map.length, 2);
      expect(map['key1']?.id, 'blid_1');
      expect(map['key2']?.id, 'blid_2');
    });

    test('equality operator works correctly', () {
      final same = BlocklistIdentifier(
        object: BlocklistIdentifierObjectEnum.blocklistIdentifier,
        id: 'blid_123',
        identifier: 'blocked@example.com',
        identifierType: BlocklistIdentifierIdentifierTypeEnum.emailAddress,
        instanceId: 'ins_456',
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      final different = BlocklistIdentifier(
        object: BlocklistIdentifierObjectEnum.blocklistIdentifier,
        id: 'blid_different',
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      final same = BlocklistIdentifier(
        object: BlocklistIdentifierObjectEnum.blocklistIdentifier,
        id: 'blid_123',
        identifier: 'blocked@example.com',
        identifierType: BlocklistIdentifierIdentifierTypeEnum.emailAddress,
        instanceId: 'ins_456',
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      expect(instance.hashCode, equals(same.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('BlocklistIdentifier'));
      expect(str, contains('blid_123'));
      expect(str, contains('blocked@example.com'));
    });

    test('requiredKeys is empty for this model', () {
      expect(BlocklistIdentifier.requiredKeys, isEmpty);
    });
  });

  group('BlocklistIdentifierObjectEnum', () {
    test('values contains all enum values', () {
      expect(BlocklistIdentifierObjectEnum.values, contains(BlocklistIdentifierObjectEnum.blocklistIdentifier));
    });

    test('toJson returns correct string', () {
      expect(BlocklistIdentifierObjectEnum.blocklistIdentifier.toJson(), 'blocklist_identifier');
    });

    test('fromJson parses correct value', () {
      expect(BlocklistIdentifierObjectEnum.fromJson('blocklist_identifier'), BlocklistIdentifierObjectEnum.blocklistIdentifier);
    });

    test('fromJson returns null for unknown value', () {
      expect(BlocklistIdentifierObjectEnum.fromJson('unknown'), isNull);
    });

    test('toString returns value', () {
      expect(BlocklistIdentifierObjectEnum.blocklistIdentifier.toString(), 'blocklist_identifier');
    });
  });

  group('BlocklistIdentifierIdentifierTypeEnum', () {
    test('values contains all enum values', () {
      expect(BlocklistIdentifierIdentifierTypeEnum.values, hasLength(3));
      expect(BlocklistIdentifierIdentifierTypeEnum.values, contains(BlocklistIdentifierIdentifierTypeEnum.emailAddress));
      expect(BlocklistIdentifierIdentifierTypeEnum.values, contains(BlocklistIdentifierIdentifierTypeEnum.phoneNumber));
      expect(BlocklistIdentifierIdentifierTypeEnum.values, contains(BlocklistIdentifierIdentifierTypeEnum.web3Wallet));
    });

    test('toJson returns correct string', () {
      expect(BlocklistIdentifierIdentifierTypeEnum.emailAddress.toJson(), 'email_address');
      expect(BlocklistIdentifierIdentifierTypeEnum.phoneNumber.toJson(), 'phone_number');
      expect(BlocklistIdentifierIdentifierTypeEnum.web3Wallet.toJson(), 'web3_wallet');
    });

    test('fromJson parses correct values', () {
      expect(BlocklistIdentifierIdentifierTypeEnum.fromJson('email_address'), BlocklistIdentifierIdentifierTypeEnum.emailAddress);
      expect(BlocklistIdentifierIdentifierTypeEnum.fromJson('phone_number'), BlocklistIdentifierIdentifierTypeEnum.phoneNumber);
      expect(BlocklistIdentifierIdentifierTypeEnum.fromJson('web3_wallet'), BlocklistIdentifierIdentifierTypeEnum.web3Wallet);
    });

    test('fromJson returns null for unknown value', () {
      expect(BlocklistIdentifierIdentifierTypeEnum.fromJson('unknown'), isNull);
    });
  });
}
