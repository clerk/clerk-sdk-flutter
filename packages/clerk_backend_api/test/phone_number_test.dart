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
  group('PhoneNumber', () {
    late PhoneNumber instance;
    late PhoneNumberVerification verification;
    late List<IdentificationLink> linkedTo;

    setUp(() {
      verification = PhoneNumberVerification(
        status: PhoneNumberVerificationStatusEnum.verified,
        strategy: PhoneNumberVerificationStrategyEnum.admin,
        attempts: 1,
        expireAt: 1700000000,
      );
      linkedTo = [
        IdentificationLink(type: 'email_address', id: 'idn_123'),
      ];
      instance = PhoneNumber(
        id: 'phn_123',
        object: PhoneNumberObjectEnum.phoneNumber,
        phoneNumber: '+1234567890',
        reservedForSecondFactor: true,
        defaultSecondFactor: false,
        reserved: false,
        verification: verification,
        linkedTo: linkedTo,
        backupCodes: ['code1', 'code2'],
        createdAt: 1600000000,
        updatedAt: 1600001000,
      );
    });

    test('constructor creates instance with required parameters', () {
      final minimal = PhoneNumber(
        object: PhoneNumberObjectEnum.phoneNumber,
        phoneNumber: '+1234567890',
        reserved: false,
        verification: null,
        linkedTo: [],
        createdAt: 1600000000,
        updatedAt: 1600001000,
      );
      expect(minimal.object, PhoneNumberObjectEnum.phoneNumber);
      expect(minimal.phoneNumber, '+1234567890');
      expect(minimal.reserved, false);
    });

    test('constructor creates instance with all parameters', () {
      expect(instance.id, 'phn_123');
      expect(instance.object, PhoneNumberObjectEnum.phoneNumber);
      expect(instance.phoneNumber, '+1234567890');
      expect(instance.reservedForSecondFactor, true);
      expect(instance.defaultSecondFactor, false);
      expect(instance.reserved, false);
      expect(instance.verification, verification);
      expect(instance.linkedTo, linkedTo);
      expect(instance.backupCodes, ['code1', 'code2']);
      expect(instance.createdAt, 1600000000);
      expect(instance.updatedAt, 1600001000);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['id'], 'phn_123');
      expect(json['object'], PhoneNumberObjectEnum.phoneNumber);
      expect(json['phone_number'], '+1234567890');
      expect(json['reserved_for_second_factor'], true);
      expect(json['default_second_factor'], false);
      expect(json['reserved'], false);
      expect(json['verification'], isNotNull);
      expect(json['linked_to'], isA<List>());
      expect(json['backup_codes'], ['code1', 'code2']);
      expect(json['created_at'], 1600000000);
      expect(json['updated_at'], 1600001000);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'id': 'phn_456',
        'object': 'phone_number',
        'phone_number': '+0987654321',
        'reserved_for_second_factor': false,
        'default_second_factor': true,
        'reserved': true,
        'verification': {
          'status': 'verified',
          'strategy': 'admin',
          'attempts': 2,
          'expire_at': 1700000000,
        },
        'linked_to': [
          {'type': 'email_address', 'id': 'idn_456'},
        ],
        'backup_codes': ['backup1'],
        'created_at': 1600002000,
        'updated_at': 1600003000,
      };
      final result = PhoneNumber.fromJson(json);
      expect(result, isNotNull);
      expect(result!.id, 'phn_456');
      expect(result.object, PhoneNumberObjectEnum.phoneNumber);
      expect(result.phoneNumber, '+0987654321');
      expect(result.reservedForSecondFactor, false);
      expect(result.defaultSecondFactor, true);
      expect(result.reserved, true);
      expect(result.verification, isNotNull);
      expect(result.linkedTo.length, 1);
    });

    test('fromJson returns null for non-map input', () {
      expect(PhoneNumber.fromJson('invalid'), isNull);
      expect(PhoneNumber.fromJson(123), isNull);
      expect(PhoneNumber.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {
          'object': 'phone_number',
          'phone_number': '+1111111111',
          'reserved': false,
          'verification': {
            'status': 'verified',
            'strategy': 'admin',
            'attempts': 1,
            'expire_at': 1700000000,
          },
          'linked_to': [],
          'created_at': 1600000000,
          'updated_at': 1600001000,
        },
        {
          'object': 'phone_number',
          'phone_number': '+2222222222',
          'reserved': true,
          'verification': {
            'status': 'verified',
            'strategy': 'admin',
            'attempts': 1,
            'expire_at': 1700000000,
          },
          'linked_to': [],
          'created_at': 1600000000,
          'updated_at': 1600001000,
        },
      ];
      final result = PhoneNumber.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].phoneNumber, '+1111111111');
      expect(result[1].phoneNumber, '+2222222222');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(PhoneNumber.listFromJson([]), isEmpty);
      expect(PhoneNumber.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = PhoneNumber(
        id: 'phn_123',
        object: PhoneNumberObjectEnum.phoneNumber,
        phoneNumber: '+1234567890',
        reservedForSecondFactor: true,
        defaultSecondFactor: false,
        reserved: false,
        verification: verification,
        linkedTo: linkedTo,
        backupCodes: ['code1', 'code2'],
        createdAt: 1600000000,
        updatedAt: 1600001000,
      );
      expect(instance, equals(other));
    });

    test('hashCode is consistent', () {
      // hashCode should be consistent across multiple calls
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('PhoneNumber'));
      expect(str, contains('phoneNumber=+1234567890'));
    });

    test('requiredKeys contains required fields', () {
      expect(PhoneNumber.requiredKeys, contains('object'));
      expect(PhoneNumber.requiredKeys, contains('phone_number'));
      expect(PhoneNumber.requiredKeys, contains('reserved'));
      expect(PhoneNumber.requiredKeys, contains('verification'));
      expect(PhoneNumber.requiredKeys, contains('linked_to'));
      expect(PhoneNumber.requiredKeys, contains('created_at'));
      expect(PhoneNumber.requiredKeys, contains('updated_at'));
    });
  });

  group('PhoneNumberObjectEnum', () {
    test('values contains all enum values', () {
      expect(PhoneNumberObjectEnum.values, contains(PhoneNumberObjectEnum.phoneNumber));
    });

    test('toJson returns correct string', () {
      expect(PhoneNumberObjectEnum.phoneNumber.toJson(), 'phone_number');
    });

    test('fromJson parses correct value', () {
      expect(PhoneNumberObjectEnum.fromJson('phone_number'), PhoneNumberObjectEnum.phoneNumber);
    });

    test('fromJson returns null for unknown value', () {
      expect(PhoneNumberObjectEnum.fromJson('unknown'), isNull);
    });
  });
}
