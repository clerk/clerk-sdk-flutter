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
  group('Web3WalletVerification', () {
    late Web3WalletVerification instance;

    setUp(() {
      instance = Web3WalletVerification(
        object: Web3WalletVerificationObjectEnum.verificationAdmin,
        status: Web3WalletVerificationStatusEnum.verified,
        strategy: Web3WalletVerificationStrategyEnum.admin,
        nonce: 'nonce_123',
        message: 'Sign this message',
        attempts: 3,
        expireAt: 1700000000,
        verifiedAtClient: 'client_123',
      );
    });

    test('constructor creates instance with required parameters', () {
      final minimal = Web3WalletVerification(
        status: Web3WalletVerificationStatusEnum.verified,
        strategy: Web3WalletVerificationStrategyEnum.admin,
        attempts: 1,
        expireAt: 1700000000,
      );
      expect(minimal.status, Web3WalletVerificationStatusEnum.verified);
      expect(minimal.strategy, Web3WalletVerificationStrategyEnum.admin);
      expect(minimal.attempts, 1);
      expect(minimal.expireAt, 1700000000);
    });

    test('constructor creates instance with all parameters', () {
      expect(instance.object, Web3WalletVerificationObjectEnum.verificationAdmin);
      expect(instance.status, Web3WalletVerificationStatusEnum.verified);
      expect(instance.strategy, Web3WalletVerificationStrategyEnum.admin);
      expect(instance.nonce, 'nonce_123');
      expect(instance.message, 'Sign this message');
      expect(instance.attempts, 3);
      expect(instance.expireAt, 1700000000);
      expect(instance.verifiedAtClient, 'client_123');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], Web3WalletVerificationObjectEnum.verificationAdmin);
      expect(json['status'], Web3WalletVerificationStatusEnum.verified);
      expect(json['strategy'], Web3WalletVerificationStrategyEnum.admin);
      expect(json['nonce'], 'nonce_123');
      expect(json['message'], 'Sign this message');
      expect(json['attempts'], 3);
      expect(json['expire_at'], 1700000000);
      expect(json['verified_at_client'], 'client_123');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'verification_admin',
        'status': 'verified',
        'strategy': 'admin',
        'nonce': 'nonce_456',
        'message': 'Another message',
        'attempts': 2,
        'expire_at': 1700001000,
        'verified_at_client': 'client_456',
      };
      final result = Web3WalletVerification.fromJson(json);
      expect(result, isNotNull);
      expect(result!.object, Web3WalletVerificationObjectEnum.verificationAdmin);
      expect(result.status, Web3WalletVerificationStatusEnum.verified);
      expect(result.strategy, Web3WalletVerificationStrategyEnum.admin);
      expect(result.nonce, 'nonce_456');
      expect(result.message, 'Another message');
      expect(result.attempts, 2);
      expect(result.expireAt, 1700001000);
    });

    test('fromJson returns null for non-map input', () {
      expect(Web3WalletVerification.fromJson('invalid'), isNull);
      expect(Web3WalletVerification.fromJson(123), isNull);
      expect(Web3WalletVerification.fromJson(null), isNull);
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
      final result = Web3WalletVerification.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].attempts, 1);
      expect(result[1].attempts, 2);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Web3WalletVerification.listFromJson([]), isEmpty);
      expect(Web3WalletVerification.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = Web3WalletVerification(
        object: Web3WalletVerificationObjectEnum.verificationAdmin,
        status: Web3WalletVerificationStatusEnum.verified,
        strategy: Web3WalletVerificationStrategyEnum.admin,
        nonce: 'nonce_123',
        message: 'Sign this message',
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
      expect(str, contains('Web3WalletVerification'));
      expect(str, contains('nonce=nonce_123'));
    });

    test('requiredKeys contains required fields', () {
      expect(Web3WalletVerification.requiredKeys, contains('status'));
      expect(Web3WalletVerification.requiredKeys, contains('strategy'));
      expect(Web3WalletVerification.requiredKeys, contains('attempts'));
      expect(Web3WalletVerification.requiredKeys, contains('expire_at'));
    });
  });

  group('Web3WalletVerificationStatusEnum', () {
    test('values contains all enum values', () {
      expect(Web3WalletVerificationStatusEnum.values, contains(Web3WalletVerificationStatusEnum.verified));
    });

    test('toJson returns correct string', () {
      expect(Web3WalletVerificationStatusEnum.verified.toJson(), 'verified');
    });

    test('fromJson parses correct value', () {
      expect(Web3WalletVerificationStatusEnum.fromJson('verified'), Web3WalletVerificationStatusEnum.verified);
    });

    test('fromJson returns null for unknown value', () {
      expect(Web3WalletVerificationStatusEnum.fromJson('unknown'), isNull);
    });
  });

  group('Web3WalletVerificationStrategyEnum', () {
    test('values contains all enum values', () {
      expect(Web3WalletVerificationStrategyEnum.values, contains(Web3WalletVerificationStrategyEnum.admin));
    });

    test('toJson returns correct string', () {
      expect(Web3WalletVerificationStrategyEnum.admin.toJson(), 'admin');
    });

    test('fromJson parses correct value', () {
      expect(Web3WalletVerificationStrategyEnum.fromJson('admin'), Web3WalletVerificationStrategyEnum.admin);
    });

    test('fromJson returns null for unknown value', () {
      expect(Web3WalletVerificationStrategyEnum.fromJson('unknown'), isNull);
    });
  });
}
