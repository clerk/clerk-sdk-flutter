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
  group('PhoneNumberVerification', () {
    late PhoneNumberVerification instance;

    setUp(() {
      instance = PhoneNumberVerification(
        object: PhoneNumberVerificationObjectEnum.verificationAdmin,
        status: PhoneNumberVerificationStatusEnum.verified,
        strategy: PhoneNumberVerificationStrategyEnum.admin,
        attempts: 3,
        expireAt: 1700000000,
        verifiedAtClient: 'client_123',
      );
    });

    test('constructor creates instance with required parameters', () {
      final minimal = PhoneNumberVerification(
        status: PhoneNumberVerificationStatusEnum.verified,
        strategy: PhoneNumberVerificationStrategyEnum.admin,
        attempts: 1,
        expireAt: 1700000000,
      );
      expect(minimal.status, PhoneNumberVerificationStatusEnum.verified);
      expect(minimal.strategy, PhoneNumberVerificationStrategyEnum.admin);
      expect(minimal.attempts, 1);
      expect(minimal.expireAt, 1700000000);
    });

    test('constructor creates instance with all parameters', () {
      expect(instance.object, PhoneNumberVerificationObjectEnum.verificationAdmin);
      expect(instance.status, PhoneNumberVerificationStatusEnum.verified);
      expect(instance.strategy, PhoneNumberVerificationStrategyEnum.admin);
      expect(instance.attempts, 3);
      expect(instance.expireAt, 1700000000);
      expect(instance.verifiedAtClient, 'client_123');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], PhoneNumberVerificationObjectEnum.verificationAdmin);
      expect(json['status'], PhoneNumberVerificationStatusEnum.verified);
      expect(json['strategy'], PhoneNumberVerificationStrategyEnum.admin);
      expect(json['attempts'], 3);
      expect(json['expire_at'], 1700000000);
      expect(json['verified_at_client'], 'client_123');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'verification_admin',
        'status': 'verified',
        'strategy': 'admin',
        'attempts': 2,
        'expire_at': 1700001000,
        'verified_at_client': 'client_456',
      };
      final result = PhoneNumberVerification.fromJson(json);
      expect(result, isNotNull);
      expect(result!.object, PhoneNumberVerificationObjectEnum.verificationAdmin);
      expect(result.status, PhoneNumberVerificationStatusEnum.verified);
      expect(result.strategy, PhoneNumberVerificationStrategyEnum.admin);
      expect(result.attempts, 2);
      expect(result.expireAt, 1700001000);
      expect(result.verifiedAtClient, 'client_456');
    });

    test('fromJson returns null for non-map input', () {
      expect(PhoneNumberVerification.fromJson('invalid'), isNull);
      expect(PhoneNumberVerification.fromJson(123), isNull);
      expect(PhoneNumberVerification.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {
          'status': 'verified',
          'strategy': 'admin',
          'attempts': 1,
          'expire_at': 1700000000,
        },
        {
          'status': 'verified',
          'strategy': 'admin',
          'attempts': 2,
          'expire_at': 1700001000,
        },
      ];
      final result = PhoneNumberVerification.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].attempts, 1);
      expect(result[1].attempts, 2);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(PhoneNumberVerification.listFromJson([]), isEmpty);
      expect(PhoneNumberVerification.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = PhoneNumberVerification(
        object: PhoneNumberVerificationObjectEnum.verificationAdmin,
        status: PhoneNumberVerificationStatusEnum.verified,
        strategy: PhoneNumberVerificationStrategyEnum.admin,
        attempts: 3,
        expireAt: 1700000000,
        verifiedAtClient: 'client_123',
      );
      expect(instance, equals(other));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('PhoneNumberVerification'));
      expect(str, contains('attempts=3'));
    });

    test('requiredKeys contains required fields', () {
      expect(PhoneNumberVerification.requiredKeys, contains('status'));
      expect(PhoneNumberVerification.requiredKeys, contains('strategy'));
      expect(PhoneNumberVerification.requiredKeys, contains('attempts'));
      expect(PhoneNumberVerification.requiredKeys, contains('expire_at'));
    });
  });

  group('PhoneNumberVerificationStatusEnum', () {
    test('values contains all enum values', () {
      expect(PhoneNumberVerificationStatusEnum.values, contains(PhoneNumberVerificationStatusEnum.verified));
    });

    test('toJson returns correct string', () {
      expect(PhoneNumberVerificationStatusEnum.verified.toJson(), 'verified');
    });

    test('fromJson parses correct value', () {
      expect(PhoneNumberVerificationStatusEnum.fromJson('verified'), PhoneNumberVerificationStatusEnum.verified);
    });

    test('fromJson returns null for unknown value', () {
      expect(PhoneNumberVerificationStatusEnum.fromJson('unknown'), isNull);
    });
  });

  group('PhoneNumberVerificationStrategyEnum', () {
    test('values contains all enum values', () {
      expect(PhoneNumberVerificationStrategyEnum.values, contains(PhoneNumberVerificationStrategyEnum.admin));
    });

    test('toJson returns correct string', () {
      expect(PhoneNumberVerificationStrategyEnum.admin.toJson(), 'admin');
    });

    test('fromJson parses correct value', () {
      expect(PhoneNumberVerificationStrategyEnum.fromJson('admin'), PhoneNumberVerificationStrategyEnum.admin);
    });

    test('fromJson returns null for unknown value', () {
      expect(PhoneNumberVerificationStrategyEnum.fromJson('unknown'), isNull);
    });
  });
}
