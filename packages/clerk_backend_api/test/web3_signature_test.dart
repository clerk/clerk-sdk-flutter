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
  group('Web3Signature', () {
    late Web3Signature instance;

    setUp(() {
      instance = Web3Signature(
        status: Web3SignatureStatusEnum.verified,
        strategy: Web3SignatureStrategyEnum.metamaskSignature,
        nonce: 'abc123',
        message: 'Sign this message',
        attempts: 1,
        expireAt: 1700000000,
        verifiedAtClient: 'client_123',
      );
    });

    test('constructor creates instance with required parameters', () {
      final minimal = Web3Signature(
        status: Web3SignatureStatusEnum.unverified,
        strategy: Web3SignatureStrategyEnum.coinbaseWalletSignature,
        attempts: 0,
        expireAt: 1700000000,
      );
      expect(minimal.status, Web3SignatureStatusEnum.unverified);
      expect(minimal.strategy, Web3SignatureStrategyEnum.coinbaseWalletSignature);
      expect(minimal.attempts, 0);
      expect(minimal.expireAt, 1700000000);
      expect(minimal.nonce, isNull);
      expect(minimal.message, isNull);
    });

    test('constructor creates instance with all parameters', () {
      expect(instance.status, Web3SignatureStatusEnum.verified);
      expect(instance.strategy, Web3SignatureStrategyEnum.metamaskSignature);
      expect(instance.nonce, 'abc123');
      expect(instance.message, 'Sign this message');
      expect(instance.attempts, 1);
      expect(instance.expireAt, 1700000000);
      expect(instance.verifiedAtClient, 'client_123');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['status'], Web3SignatureStatusEnum.verified);
      expect(json['strategy'], Web3SignatureStrategyEnum.metamaskSignature);
      expect(json['nonce'], 'abc123');
      expect(json['message'], 'Sign this message');
      expect(json['attempts'], 1);
      expect(json['expire_at'], 1700000000);
      expect(json['verified_at_client'], 'client_123');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'status': 'verified',
        'strategy': 'web3_metamask_signature',
        'nonce': 'xyz789',
        'message': 'Another message',
        'attempts': 2,
        'expire_at': 1700001000,
        'verified_at_client': 'client_456',
      };
      final result = Web3Signature.fromJson(json);
      expect(result, isNotNull);
      expect(result!.status, Web3SignatureStatusEnum.verified);
      expect(result.strategy, Web3SignatureStrategyEnum.metamaskSignature);
      expect(result.nonce, 'xyz789');
      expect(result.message, 'Another message');
      expect(result.attempts, 2);
      expect(result.expireAt, 1700001000);
    });

    test('fromJson returns null for non-map input', () {
      expect(Web3Signature.fromJson('invalid'), isNull);
      expect(Web3Signature.fromJson(123), isNull);
      expect(Web3Signature.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Web3Signature.listFromJson([]), isEmpty);
      expect(Web3Signature.listFromJson(null), isEmpty);
    });

    test('equality works correctly', () {
      final other = Web3Signature(
        status: Web3SignatureStatusEnum.verified,
        strategy: Web3SignatureStrategyEnum.metamaskSignature,
        nonce: 'abc123',
        message: 'Sign this message',
        attempts: 1,
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
      expect(str, contains('Web3Signature'));
      expect(str, contains('nonce=abc123'));
    });

    test('requiredKeys contains required fields', () {
      expect(Web3Signature.requiredKeys, contains('status'));
      expect(Web3Signature.requiredKeys, contains('strategy'));
      expect(Web3Signature.requiredKeys, contains('attempts'));
      expect(Web3Signature.requiredKeys, contains('expire_at'));
    });
  });

  group('Web3SignatureStatusEnum', () {
    test('values contains all enum values', () {
      expect(Web3SignatureStatusEnum.values, hasLength(4));
      expect(Web3SignatureStatusEnum.values, contains(Web3SignatureStatusEnum.unverified));
      expect(Web3SignatureStatusEnum.values, contains(Web3SignatureStatusEnum.verified));
      expect(Web3SignatureStatusEnum.values, contains(Web3SignatureStatusEnum.failed));
      expect(Web3SignatureStatusEnum.values, contains(Web3SignatureStatusEnum.expired));
    });

    test('toJson returns correct string', () {
      expect(Web3SignatureStatusEnum.verified.toJson(), 'verified');
      expect(Web3SignatureStatusEnum.unverified.toJson(), 'unverified');
    });

    test('fromJson parses correct value', () {
      expect(Web3SignatureStatusEnum.fromJson('verified'), Web3SignatureStatusEnum.verified);
      expect(Web3SignatureStatusEnum.fromJson('unverified'), Web3SignatureStatusEnum.unverified);
    });

    test('fromJson returns null for unknown value', () {
      expect(Web3SignatureStatusEnum.fromJson('unknown'), isNull);
    });
  });

  group('Web3SignatureStrategyEnum', () {
    test('values contains all enum values', () {
      expect(Web3SignatureStrategyEnum.values, hasLength(3));
      expect(Web3SignatureStrategyEnum.values, contains(Web3SignatureStrategyEnum.metamaskSignature));
      expect(Web3SignatureStrategyEnum.values, contains(Web3SignatureStrategyEnum.coinbaseWalletSignature));
      expect(Web3SignatureStrategyEnum.values, contains(Web3SignatureStrategyEnum.okxWalletSignature));
    });

    test('toJson returns correct string', () {
      expect(Web3SignatureStrategyEnum.metamaskSignature.toJson(), 'web3_metamask_signature');
      expect(Web3SignatureStrategyEnum.coinbaseWalletSignature.toJson(), 'web3_coinbase_wallet_signature');
    });

    test('fromJson parses correct value', () {
      expect(Web3SignatureStrategyEnum.fromJson('web3_metamask_signature'), Web3SignatureStrategyEnum.metamaskSignature);
      expect(Web3SignatureStrategyEnum.fromJson('web3_coinbase_wallet_signature'), Web3SignatureStrategyEnum.coinbaseWalletSignature);
    });

    test('fromJson returns null for unknown value', () {
      expect(Web3SignatureStrategyEnum.fromJson('unknown'), isNull);
    });
  });
}
