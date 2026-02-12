import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/client/verification.dart';
import 'package:clerk_auth/src/models/client/web3_wallet.dart';
import 'package:clerk_auth/src/models/enums.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/extensions.dart';

import '../../test_helpers.dart';

void main() {
  group('Web3Wallet', () {
    test('identifier returns web3Wallet value', () {
      final wallet = Web3Wallet(
        id: 'w3w_123',
        web3Wallet: '0x1234567890abcdef',
        verification: Verification(
          status: Status.verified,
          strategy: Strategy.web3MetamaskSignature,
          attempts: 0,
          expireAt: DateTime.now().add(const Duration(hours: 1)),
        ),
        updatedAt: DateTimeExt.epoch,
        createdAt: DateTimeExt.epoch,
      );

      expect(wallet.identifier, '0x1234567890abcdef');
    });

    test('type is web3wallet', () {
      final wallet = Web3Wallet(
        id: 'w3w_123',
        web3Wallet: '0xabcdef',
        verification: Verification(
          status: Status.verified,
          strategy: Strategy.web3MetamaskSignature,
          attempts: 0,
          expireAt: DateTime.now().add(const Duration(hours: 1)),
        ),
        updatedAt: DateTimeExt.epoch,
        createdAt: DateTimeExt.epoch,
      );

      expect(wallet.type, IdentifierType.web3wallet);
    });

    test('fromJson creates web3 wallet from JSON', () {
      final json = {
        'id': 'w3w_456',
        'web3_wallet': '0xfedcba9876543210',
        'verification': {
          'status': 'verified',
          'strategy': 'web3_metamask_signature',
          'attempts': 1,
          'expire_at': 1700000000000,
        },
        'updated_at': 1700000000000,
        'created_at': 1699000000000,
      };

      final wallet = Web3Wallet.fromJson(json);

      expect(wallet.id, 'w3w_456');
      expect(wallet.web3Wallet, '0xfedcba9876543210');
      expect(wallet.identifier, '0xfedcba9876543210');
    });

    test('toJson serializes web3 wallet', () {
      final wallet = Web3Wallet(
        id: 'w3w_789',
        web3Wallet: '0x123abc',
        verification: Verification(
          status: Status.verified,
          strategy: Strategy.web3MetamaskSignature,
          attempts: 0,
          expireAt: DateTimeExt.epoch,
        ),
        updatedAt: DateTimeExt.epoch,
        createdAt: DateTimeExt.epoch,
      );

      final json = wallet.toJson();

      expect(json['id'], 'w3w_789');
      expect(json['web3_wallet'], '0x123abc');
    });
  });
}

