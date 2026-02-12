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
  group('OTP', () {
    late OTP instance;

    setUp(() {
      instance = OTP(
        status: OTPStatusEnum.unverified,
        strategy: OTPStrategyEnum.emailCode,
        attempts: 3,
        expireAt: 1700000000,
        verifiedAtClient: 'client_123',
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.status, OTPStatusEnum.unverified);
      expect(instance.strategy, OTPStrategyEnum.emailCode);
      expect(instance.attempts, 3);
      expect(instance.expireAt, 1700000000);
    });

    test('constructor creates instance with optional parameters', () {
      expect(instance.verifiedAtClient, 'client_123');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['status'], OTPStatusEnum.unverified);
      expect(json['strategy'], OTPStrategyEnum.emailCode);
      expect(json['attempts'], 3);
      expect(json['expire_at'], 1700000000);
      expect(json['verified_at_client'], 'client_123');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'status': 'verified',
        'strategy': 'phone_code',
        'attempts': 1,
        'expire_at': 1700000001,
        'verified_at_client': 'client_456',
      };
      final parsed = OTP.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.status, OTPStatusEnum.verified);
      expect(parsed.strategy, OTPStrategyEnum.phoneCode);
      expect(parsed.attempts, 1);
      expect(parsed.verifiedAtClient, 'client_456');
    });

    test('fromJson returns null for non-map input', () {
      expect(OTP.fromJson('not a map'), isNull);
      expect(OTP.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'status': 'unverified', 'strategy': 'email_code', 'attempts': 1, 'expire_at': 1},
        {'status': 'verified', 'strategy': 'phone_code', 'attempts': 2, 'expire_at': 2},
      ];
      final list = OTP.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].status, OTPStatusEnum.unverified);
      expect(list[1].status, OTPStatusEnum.verified);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(OTP.listFromJson([]), isEmpty);
      expect(OTP.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = OTP(
        status: OTPStatusEnum.unverified,
        strategy: OTPStrategyEnum.emailCode,
        attempts: 3,
        expireAt: 1700000000,
        verifiedAtClient: 'client_123',
      );
      final different = OTP(
        status: OTPStatusEnum.verified,
        strategy: OTPStrategyEnum.phoneCode,
        attempts: 1,
        expireAt: 1700000000,
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('OTP'));
      expect(str, contains('unverified'));
    });

    test('requiredKeys contains required fields', () {
      expect(OTP.requiredKeys, contains('status'));
      expect(OTP.requiredKeys, contains('strategy'));
      expect(OTP.requiredKeys, contains('attempts'));
      expect(OTP.requiredKeys, contains('expire_at'));
    });
  });

  group('OTPStatusEnum', () {
    test('values contains all enum values', () {
      expect(OTPStatusEnum.values, hasLength(4));
      expect(OTPStatusEnum.values, contains(OTPStatusEnum.unverified));
      expect(OTPStatusEnum.values, contains(OTPStatusEnum.verified));
      expect(OTPStatusEnum.values, contains(OTPStatusEnum.failed));
      expect(OTPStatusEnum.values, contains(OTPStatusEnum.expired));
    });

    test('toJson returns correct string', () {
      expect(OTPStatusEnum.unverified.toJson(), 'unverified');
      expect(OTPStatusEnum.verified.toJson(), 'verified');
      expect(OTPStatusEnum.failed.toJson(), 'failed');
      expect(OTPStatusEnum.expired.toJson(), 'expired');
    });

    test('fromJson parses correct values', () {
      expect(OTPStatusEnum.fromJson('unverified'), OTPStatusEnum.unverified);
      expect(OTPStatusEnum.fromJson('verified'), OTPStatusEnum.verified);
      expect(OTPStatusEnum.fromJson('failed'), OTPStatusEnum.failed);
      expect(OTPStatusEnum.fromJson('expired'), OTPStatusEnum.expired);
    });

    test('fromJson returns null for unknown value', () {
      expect(OTPStatusEnum.fromJson('unknown'), isNull);
    });
  });

  group('OTPStrategyEnum', () {
    test('values contains all enum values', () {
      expect(OTPStrategyEnum.values, hasLength(3));
      expect(OTPStrategyEnum.values, contains(OTPStrategyEnum.phoneCode));
      expect(OTPStrategyEnum.values, contains(OTPStrategyEnum.emailCode));
      expect(OTPStrategyEnum.values, contains(OTPStrategyEnum.resetPasswordEmailCode));
    });

    test('toJson returns correct string', () {
      expect(OTPStrategyEnum.phoneCode.toJson(), 'phone_code');
      expect(OTPStrategyEnum.emailCode.toJson(), 'email_code');
      expect(OTPStrategyEnum.resetPasswordEmailCode.toJson(), 'reset_password_email_code');
    });

    test('fromJson parses correct values', () {
      expect(OTPStrategyEnum.fromJson('phone_code'), OTPStrategyEnum.phoneCode);
      expect(OTPStrategyEnum.fromJson('email_code'), OTPStrategyEnum.emailCode);
      expect(OTPStrategyEnum.fromJson('reset_password_email_code'), OTPStrategyEnum.resetPasswordEmailCode);
    });

    test('fromJson returns null for unknown value', () {
      expect(OTPStrategyEnum.fromJson('unknown'), isNull);
    });
  });
}
