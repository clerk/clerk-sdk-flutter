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
  group('Web3Wallet', () {
    late Web3Wallet instance;
    late Web3WalletVerification verification;

    setUp(() {
      verification = Web3WalletVerification(
        status: Web3WalletVerificationStatusEnum.verified,
        strategy: Web3WalletVerificationStrategyEnum.admin,
        attempts: 1,
        expireAt: 1700000000,
      );
      instance = Web3Wallet(
        id: 'w3w_123',
        object: Web3WalletObjectEnum.web3Wallet,
        web3Wallet: '0x1234567890abcdef1234567890abcdef12345678',
        verification: verification,
        createdAt: 1600000000,
        updatedAt: 1600001000,
      );
    });

    test('constructor creates instance with required parameters', () {
      final minimal = Web3Wallet(
        object: Web3WalletObjectEnum.web3Wallet,
        web3Wallet: '0xabcdef',
        verification: null,
        createdAt: 1600000000,
        updatedAt: 1600001000,
      );
      expect(minimal.object, Web3WalletObjectEnum.web3Wallet);
      expect(minimal.web3Wallet, '0xabcdef');
      expect(minimal.verification, isNull);
    });

    test('constructor creates instance with all parameters', () {
      expect(instance.id, 'w3w_123');
      expect(instance.object, Web3WalletObjectEnum.web3Wallet);
      expect(instance.web3Wallet, '0x1234567890abcdef1234567890abcdef12345678');
      expect(instance.verification, verification);
      expect(instance.createdAt, 1600000000);
      expect(instance.updatedAt, 1600001000);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['id'], 'w3w_123');
      expect(json['object'], Web3WalletObjectEnum.web3Wallet);
      expect(json['web3_wallet'], '0x1234567890abcdef1234567890abcdef12345678');
      expect(json['verification'], isNotNull);
      expect(json['created_at'], 1600000000);
      expect(json['updated_at'], 1600001000);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'id': 'w3w_456',
        'object': 'web3_wallet',
        'web3_wallet': '0xfedcba9876543210',
        'verification': {
          'status': 'verified',
          'strategy': 'admin',
          'attempts': 2,
          'expire_at': 1700000000,
        },
        'created_at': 1600002000,
        'updated_at': 1600003000,
      };
      final result = Web3Wallet.fromJson(json);
      expect(result, isNotNull);
      expect(result!.id, 'w3w_456');
      expect(result.object, Web3WalletObjectEnum.web3Wallet);
      expect(result.web3Wallet, '0xfedcba9876543210');
      expect(result.verification, isNotNull);
      expect(result.createdAt, 1600002000);
      expect(result.updatedAt, 1600003000);
    });

    test('fromJson returns null for non-map input', () {
      expect(Web3Wallet.fromJson('invalid'), isNull);
      expect(Web3Wallet.fromJson(123), isNull);
      expect(Web3Wallet.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {
          'object': 'web3_wallet',
          'web3_wallet': '0x1111',
          'verification': {
            'status': 'verified',
            'strategy': 'admin',
            'attempts': 1,
            'expire_at': 1700000000,
          },
          'created_at': 1600000000,
          'updated_at': 1600001000,
        },
        {
          'object': 'web3_wallet',
          'web3_wallet': '0x2222',
          'verification': {
            'status': 'verified',
            'strategy': 'admin',
            'attempts': 1,
            'expire_at': 1700000000,
          },
          'created_at': 1600000000,
          'updated_at': 1600001000,
        },
      ];
      final result = Web3Wallet.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].web3Wallet, '0x1111');
      expect(result[1].web3Wallet, '0x2222');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Web3Wallet.listFromJson([]), isEmpty);
      expect(Web3Wallet.listFromJson(null), isEmpty);
    });

    test('mapFromJson creates map from json', () {
      final jsonMap = {
        'key1': {
          'object': 'web3_wallet',
          'web3_wallet': '0x1111',
          'verification': {
            'status': 'verified',
            'strategy': 'admin',
            'attempts': 1,
            'expire_at': 1700000000,
          },
          'created_at': 1600000000,
          'updated_at': 1600001000,
        },
      };
      final result = Web3Wallet.mapFromJson(jsonMap);
      expect(result.length, 1);
      expect(result['key1']!.web3Wallet, '0x1111');
    });

    test('equality operator works correctly', () {
      final other = Web3Wallet(
        id: 'w3w_123',
        object: Web3WalletObjectEnum.web3Wallet,
        web3Wallet: '0x1234567890abcdef1234567890abcdef12345678',
        verification: verification,
        createdAt: 1600000000,
        updatedAt: 1600001000,
      );
      expect(instance, equals(other));
    });

    test('hashCode is consistent', () {
      final other = Web3Wallet(
        id: 'w3w_123',
        object: Web3WalletObjectEnum.web3Wallet,
        web3Wallet: '0x1234567890abcdef1234567890abcdef12345678',
        verification: verification,
        createdAt: 1600000000,
        updatedAt: 1600001000,
      );
      expect(instance.hashCode, equals(other.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('Web3Wallet'));
      expect(str, contains('web3Wallet=0x1234567890abcdef1234567890abcdef12345678'));
    });

    test('requiredKeys contains required fields', () {
      expect(Web3Wallet.requiredKeys, contains('object'));
      expect(Web3Wallet.requiredKeys, contains('web3_wallet'));
      expect(Web3Wallet.requiredKeys, contains('verification'));
      expect(Web3Wallet.requiredKeys, contains('created_at'));
      expect(Web3Wallet.requiredKeys, contains('updated_at'));
    });
  });

  group('Web3WalletObjectEnum', () {
    test('values contains all enum values', () {
      expect(Web3WalletObjectEnum.values, contains(Web3WalletObjectEnum.web3Wallet));
    });

    test('toJson returns correct string', () {
      expect(Web3WalletObjectEnum.web3Wallet.toJson(), 'web3_wallet');
    });

    test('fromJson parses correct value', () {
      expect(Web3WalletObjectEnum.fromJson('web3_wallet'), Web3WalletObjectEnum.web3Wallet);
    });

    test('fromJson returns null for unknown value', () {
      expect(Web3WalletObjectEnum.fromJson('unknown'), isNull);
    });
  });
}
