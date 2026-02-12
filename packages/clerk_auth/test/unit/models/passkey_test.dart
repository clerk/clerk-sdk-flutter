import 'package:clerk_auth/src/models/client/passkey.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/client/verification.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/extensions.dart';

import '../../test_helpers.dart';

void main() {
  group('Passkey', () {
    test('fromJson creates passkey from JSON', () {
      final json = {
        'id': 'pk_123',
        'name': 'My Passkey',
        'verification': {
          'status': 'verified',
          'strategy': 'passkey',
          'attempts': 0,
          'expire_at': 1700000000000,
        },
        'last_used_at': 1699500000000,
        'updated_at': 1700000000000,
        'created_at': 1699000000000,
      };

      final passkey = Passkey.fromJson(json);

      expect(passkey.id, 'pk_123');
      expect(passkey.name, 'My Passkey');
      expect(passkey.verification.status, Status.verified);
    });

    test('toJson serializes passkey', () {
      final passkey = Passkey(
        id: 'pk_456',
        name: 'Work Passkey',
        verification: Verification(
          status: Status.verified,
          strategy: Strategy.passkey,
          attempts: 0,
          expireAt: DateTimeExt.epoch,
        ),
        lastUsedAt: DateTimeExt.epoch,
        updatedAt: DateTimeExt.epoch,
        createdAt: DateTimeExt.epoch,
      );

      final json = passkey.toJson();

      expect(json['id'], 'pk_456');
      expect(json['name'], 'Work Passkey');
    });

    test('passkey has correct properties', () {
      final passkey = Passkey(
        id: 'pk_789',
        name: 'Mobile Passkey',
        verification: Verification(
          status: Status.pending,
          strategy: Strategy.passkey,
          attempts: 2,
          expireAt: DateTime.now().add(const Duration(hours: 1)),
        ),
        lastUsedAt: DateTime.now(),
        updatedAt: DateTime.now(),
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
      );

      expect(passkey.id, 'pk_789');
      expect(passkey.name, 'Mobile Passkey');
      expect(passkey.verification.attempts, 2);
    });
  });
}

