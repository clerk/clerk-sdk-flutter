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
  group('CreatePhoneNumberRequest', () {
    late CreatePhoneNumberRequest instance;

    setUp(() {
      instance = CreatePhoneNumberRequest(
        userId: 'user_123',
        phoneNumber: '+15551234567',
        verified: true,
        primary: true,
        reservedForSecondFactor: true,
      );
    });

    test('constructor creates instance with required parameters', () {
      final minimal = CreatePhoneNumberRequest(
        userId: 'user_456',
        phoneNumber: '+15559876543',
      );
      expect(minimal.userId, 'user_456');
      expect(minimal.phoneNumber, '+15559876543');
      expect(minimal.verified, isNull);
      expect(minimal.primary, isNull);
      expect(minimal.reservedForSecondFactor, isNull);
    });

    test('constructor creates instance with all parameters', () {
      expect(instance.userId, 'user_123');
      expect(instance.phoneNumber, '+15551234567');
      expect(instance.verified, true);
      expect(instance.primary, true);
      expect(instance.reservedForSecondFactor, true);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['user_id'], 'user_123');
      expect(json['phone_number'], '+15551234567');
      expect(json['verified'], true);
      expect(json['primary'], true);
      expect(json['reserved_for_second_factor'], true);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'user_id': 'user_789',
        'phone_number': '+15550001111',
        'verified': false,
        'primary': false,
        'reserved_for_second_factor': false,
      };
      final result = CreatePhoneNumberRequest.fromJson(json);
      expect(result, isNotNull);
      expect(result!.userId, 'user_789');
      expect(result.phoneNumber, '+15550001111');
      expect(result.verified, false);
      expect(result.primary, false);
      expect(result.reservedForSecondFactor, false);
    });

    test('fromJson returns null for non-map input', () {
      expect(CreatePhoneNumberRequest.fromJson('invalid'), isNull);
      expect(CreatePhoneNumberRequest.fromJson(123), isNull);
      expect(CreatePhoneNumberRequest.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {'user_id': 'user_1', 'phone_number': '+15551111111'},
        {'user_id': 'user_2', 'phone_number': '+15552222222', 'verified': true},
      ];
      final result = CreatePhoneNumberRequest.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].phoneNumber, '+15551111111');
      expect(result[1].verified, true);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(CreatePhoneNumberRequest.listFromJson([]), isEmpty);
      expect(CreatePhoneNumberRequest.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = CreatePhoneNumberRequest(
        userId: 'user_123',
        phoneNumber: '+15551234567',
        verified: true,
        primary: true,
        reservedForSecondFactor: true,
      );
      expect(instance, equals(other));

      final different = CreatePhoneNumberRequest(
        userId: 'user_different',
        phoneNumber: '+15550000000',
      );
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('CreatePhoneNumberRequest'));
      expect(str, contains('userId=user_123'));
      expect(str, contains('phoneNumber=+15551234567'));
    });

    test('requiredKeys contains required fields', () {
      expect(CreatePhoneNumberRequest.requiredKeys, contains('user_id'));
      expect(CreatePhoneNumberRequest.requiredKeys, contains('phone_number'));
    });
  });
}
