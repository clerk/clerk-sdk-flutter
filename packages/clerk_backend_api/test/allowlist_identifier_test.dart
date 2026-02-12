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
  group('AllowlistIdentifier', () {
    test('constructor creates instance with all optional parameters', () {
      final instance = AllowlistIdentifier(
        object: AllowlistIdentifierObjectEnum.allowlistIdentifier,
        id: 'alid_123',
        invitationId: 'inv_456',
        identifier: 'test@example.com',
        identifierType: AllowlistIdentifierIdentifierTypeEnum.emailAddress,
        instanceId: 'ins_789',
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      expect(instance.object, AllowlistIdentifierObjectEnum.allowlistIdentifier);
      expect(instance.id, 'alid_123');
      expect(instance.invitationId, 'inv_456');
      expect(instance.identifier, 'test@example.com');
      expect(instance.identifierType, AllowlistIdentifierIdentifierTypeEnum.emailAddress);
      expect(instance.instanceId, 'ins_789');
      expect(instance.createdAt, 1700000000);
      expect(instance.updatedAt, 1700000001);
    });

    test('constructor creates instance with no parameters', () {
      final instance = AllowlistIdentifier();
      expect(instance.object, isNull);
      expect(instance.id, isNull);
    });

    test('toJson produces correct map', () {
      final instance = AllowlistIdentifier(
        object: AllowlistIdentifierObjectEnum.allowlistIdentifier,
        id: 'alid_123',
        identifier: 'test@example.com',
        identifierType: AllowlistIdentifierIdentifierTypeEnum.emailAddress,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      final json = instance.toJson();
      expect(json['object'], AllowlistIdentifierObjectEnum.allowlistIdentifier);
      expect(json['id'], 'alid_123');
      expect(json['identifier'], 'test@example.com');
      expect(json['identifier_type'], AllowlistIdentifierIdentifierTypeEnum.emailAddress);
      expect(json['created_at'], 1700000000);
      expect(json['updated_at'], 1700000001);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'allowlist_identifier',
        'id': 'alid_123',
        'invitation_id': 'inv_456',
        'identifier': 'test@example.com',
        'identifier_type': 'email_address',
        'instance_id': 'ins_789',
        'created_at': 1700000000,
        'updated_at': 1700000001,
      };
      final instance = AllowlistIdentifier.fromJson(json);
      expect(instance, isNotNull);
      expect(instance!.object, AllowlistIdentifierObjectEnum.allowlistIdentifier);
      expect(instance.id, 'alid_123');
      expect(instance.invitationId, 'inv_456');
      expect(instance.identifier, 'test@example.com');
      expect(instance.identifierType, AllowlistIdentifierIdentifierTypeEnum.emailAddress);
    });

    test('fromJson returns null for non-map input', () {
      expect(AllowlistIdentifier.fromJson(null), isNull);
      expect(AllowlistIdentifier.fromJson('string'), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {'object': 'allowlist_identifier', 'id': 'alid_1'},
        {'object': 'allowlist_identifier', 'id': 'alid_2'},
      ];
      final list = AllowlistIdentifier.listFromJson(jsonList);
      expect(list.length, 2);
      expect(list[0].id, 'alid_1');
      expect(list[1].id, 'alid_2');
    });

    test('equality operator works correctly', () {
      final instance1 = AllowlistIdentifier(id: 'alid_123', identifier: 'test@example.com');
      final instance2 = AllowlistIdentifier(id: 'alid_123', identifier: 'test@example.com');
      final instance3 = AllowlistIdentifier(id: 'alid_456', identifier: 'other@example.com');
      expect(instance1, equals(instance2));
      expect(instance1, isNot(equals(instance3)));
    });

    test('hashCode is consistent', () {
      final instance1 = AllowlistIdentifier(id: 'alid_123', identifier: 'test@example.com');
      final instance2 = AllowlistIdentifier(id: 'alid_123', identifier: 'test@example.com');
      expect(instance1.hashCode, equals(instance2.hashCode));
    });

    test('toString returns expected format', () {
      final instance = AllowlistIdentifier(id: 'alid_123');
      final str = instance.toString();
      expect(str, contains('AllowlistIdentifier['));
    });
  });

  group('AllowlistIdentifierObjectEnum', () {
    test('values contains all enum values', () {
      expect(AllowlistIdentifierObjectEnum.values, contains(AllowlistIdentifierObjectEnum.allowlistIdentifier));
    });

    test('fromJson parses valid value', () {
      expect(AllowlistIdentifierObjectEnum.fromJson('allowlist_identifier'), AllowlistIdentifierObjectEnum.allowlistIdentifier);
    });

    test('fromJson returns null for invalid value', () {
      expect(AllowlistIdentifierObjectEnum.fromJson('invalid'), isNull);
    });

    test('toJson returns correct string', () {
      expect(AllowlistIdentifierObjectEnum.allowlistIdentifier.toJson(), 'allowlist_identifier');
    });
  });

  group('AllowlistIdentifierIdentifierTypeEnum', () {
    test('values contains all enum values', () {
      expect(AllowlistIdentifierIdentifierTypeEnum.values, contains(AllowlistIdentifierIdentifierTypeEnum.emailAddress));
      expect(AllowlistIdentifierIdentifierTypeEnum.values, contains(AllowlistIdentifierIdentifierTypeEnum.phoneNumber));
      expect(AllowlistIdentifierIdentifierTypeEnum.values, contains(AllowlistIdentifierIdentifierTypeEnum.web3Wallet));
    });

    test('fromJson parses valid values', () {
      expect(AllowlistIdentifierIdentifierTypeEnum.fromJson('email_address'), AllowlistIdentifierIdentifierTypeEnum.emailAddress);
      expect(AllowlistIdentifierIdentifierTypeEnum.fromJson('phone_number'), AllowlistIdentifierIdentifierTypeEnum.phoneNumber);
      expect(AllowlistIdentifierIdentifierTypeEnum.fromJson('web3_wallet'), AllowlistIdentifierIdentifierTypeEnum.web3Wallet);
    });

    test('fromJson returns null for invalid value', () {
      expect(AllowlistIdentifierIdentifierTypeEnum.fromJson('invalid'), isNull);
    });

    test('toJson returns correct string', () {
      expect(AllowlistIdentifierIdentifierTypeEnum.emailAddress.toJson(), 'email_address');
      expect(AllowlistIdentifierIdentifierTypeEnum.phoneNumber.toJson(), 'phone_number');
      expect(AllowlistIdentifierIdentifierTypeEnum.web3Wallet.toJson(), 'web3_wallet');
    });
  });
}
