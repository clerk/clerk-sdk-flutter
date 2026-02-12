//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:clerk_backend_api/api.dart';
import 'package:test/test.dart';

void main() {
  group('PasskeyVerification', () {
    late PasskeyVerification instance;

    setUp(() {
      instance = PasskeyVerification(
        object: PasskeyVerificationObjectEnum.verificationPasskey,
        status: PasskeyVerificationStatusEnum.verified,
        strategy: PasskeyVerificationStrategyEnum.passkey,
        nonce: PasskeyVerificationNonceEnum.nonce,
        message: 'Verification message',
        attempts: 3,
        expireAt: 1700000000,
        verifiedAtClient: 'client_123',
      );
    });

    test('constructor creates instance with required parameters', () {
      final minimal = PasskeyVerification(
        status: PasskeyVerificationStatusEnum.verified,
        strategy: PasskeyVerificationStrategyEnum.passkey,
        attempts: 1,
        expireAt: 1700000000,
      );
      expect(minimal.status, PasskeyVerificationStatusEnum.verified);
      expect(minimal.strategy, PasskeyVerificationStrategyEnum.passkey);
      expect(minimal.attempts, 1);
      expect(minimal.expireAt, 1700000000);
    });

    test('constructor creates instance with all parameters', () {
      expect(instance.object, PasskeyVerificationObjectEnum.verificationPasskey);
      expect(instance.status, PasskeyVerificationStatusEnum.verified);
      expect(instance.strategy, PasskeyVerificationStrategyEnum.passkey);
      expect(instance.nonce, PasskeyVerificationNonceEnum.nonce);
      expect(instance.message, 'Verification message');
      expect(instance.attempts, 3);
      expect(instance.expireAt, 1700000000);
      expect(instance.verifiedAtClient, 'client_123');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], PasskeyVerificationObjectEnum.verificationPasskey);
      expect(json['status'], PasskeyVerificationStatusEnum.verified);
      expect(json['strategy'], PasskeyVerificationStrategyEnum.passkey);
      expect(json['nonce'], PasskeyVerificationNonceEnum.nonce);
      expect(json['message'], 'Verification message');
      expect(json['attempts'], 3);
      expect(json['expire_at'], 1700000000);
      expect(json['verified_at_client'], 'client_123');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'verification_passkey',
        'status': 'verified',
        'strategy': 'passkey',
        'nonce': 'nonce',
        'message': 'Another message',
        'attempts': 2,
        'expire_at': 1700001000,
        'verified_at_client': 'client_456',
      };
      final result = PasskeyVerification.fromJson(json);
      expect(result, isNotNull);
      expect(result!.object, PasskeyVerificationObjectEnum.verificationPasskey);
      expect(result.status, PasskeyVerificationStatusEnum.verified);
      expect(result.strategy, PasskeyVerificationStrategyEnum.passkey);
      expect(result.nonce, PasskeyVerificationNonceEnum.nonce);
      expect(result.message, 'Another message');
      expect(result.attempts, 2);
      expect(result.expireAt, 1700001000);
    });

    test('fromJson returns null for non-map input', () {
      expect(PasskeyVerification.fromJson('invalid'), isNull);
      expect(PasskeyVerification.fromJson(123), isNull);
      expect(PasskeyVerification.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {
          'status': 'verified',
          'strategy': 'passkey',
          'attempts': 1,
          'expire_at': 1700000000,
        },
        {
          'status': 'verified',
          'strategy': 'passkey',
          'attempts': 2,
          'expire_at': 1700001000,
        },
      ];
      final result = PasskeyVerification.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].attempts, 1);
      expect(result[1].attempts, 2);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(PasskeyVerification.listFromJson([]), isEmpty);
      expect(PasskeyVerification.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = PasskeyVerification(
        object: PasskeyVerificationObjectEnum.verificationPasskey,
        status: PasskeyVerificationStatusEnum.verified,
        strategy: PasskeyVerificationStrategyEnum.passkey,
        nonce: PasskeyVerificationNonceEnum.nonce,
        message: 'Verification message',
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
      expect(str, contains('PasskeyVerification'));
      expect(str, contains('attempts=3'));
    });

    test('requiredKeys contains required fields', () {
      expect(PasskeyVerification.requiredKeys, contains('status'));
      expect(PasskeyVerification.requiredKeys, contains('strategy'));
      expect(PasskeyVerification.requiredKeys, contains('attempts'));
      expect(PasskeyVerification.requiredKeys, contains('expire_at'));
    });
  });

  group('PasskeyVerificationStatusEnum', () {
    test('values contains all enum values', () {
      expect(PasskeyVerificationStatusEnum.values, contains(PasskeyVerificationStatusEnum.verified));
    });

    test('toJson returns correct string', () {
      expect(PasskeyVerificationStatusEnum.verified.toJson(), 'verified');
    });

    test('fromJson parses correct value', () {
      expect(PasskeyVerificationStatusEnum.fromJson('verified'), PasskeyVerificationStatusEnum.verified);
    });

    test('fromJson returns null for unknown value', () {
      expect(PasskeyVerificationStatusEnum.fromJson('unknown'), isNull);
    });
  });

  group('PasskeyVerificationStrategyEnum', () {
    test('values contains all enum values', () {
      expect(PasskeyVerificationStrategyEnum.values, contains(PasskeyVerificationStrategyEnum.passkey));
    });

    test('toJson returns correct string', () {
      expect(PasskeyVerificationStrategyEnum.passkey.toJson(), 'passkey');
    });

    test('fromJson parses correct value', () {
      expect(PasskeyVerificationStrategyEnum.fromJson('passkey'), PasskeyVerificationStrategyEnum.passkey);
    });

    test('fromJson returns null for unknown value', () {
      expect(PasskeyVerificationStrategyEnum.fromJson('unknown'), isNull);
    });
  });

  group('PasskeyVerificationNonceEnum', () {
    test('values contains all enum values', () {
      expect(PasskeyVerificationNonceEnum.values, contains(PasskeyVerificationNonceEnum.nonce));
    });

    test('toJson returns correct string', () {
      expect(PasskeyVerificationNonceEnum.nonce.toJson(), 'nonce');
    });

    test('fromJson parses correct value', () {
      expect(PasskeyVerificationNonceEnum.fromJson('nonce'), PasskeyVerificationNonceEnum.nonce);
    });

    test('fromJson returns null for unknown value', () {
      expect(PasskeyVerificationNonceEnum.fromJson('unknown'), isNull);
    });
  });
}
