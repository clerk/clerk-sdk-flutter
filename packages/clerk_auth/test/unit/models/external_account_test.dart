import 'package:clerk_auth/src/models/client/external_account.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/client/verification.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/extensions.dart';

import '../../test_helpers.dart';

Verification _createVerification({
  Status status = Status.verified,
  String? errorMessage,
}) {
  return Verification(
    status: status,
    strategy: Strategy.password,
    attempts: 0,
    expireAt: DateTime.now().add(const Duration(hours: 1)),
    errorMessage: errorMessage,
  );
}

ExternalAccount _createExternalAccount({
  Verification? verification,
}) {
  return ExternalAccount(
    id: 'ext_123',
    provider: 'google',
    providerUserId: 'google_user_123',
    approvedScopes: 'email profile',
    emailAddress: 'test@example.com',
    username: 'testuser',
    firstName: 'Test',
    lastName: 'User',
    avatarUrl: 'https://example.com/avatar.png',
    imageUrl: 'https://example.com/image.png',
    label: 'Personal',
    publicMetadata: {'key': 'value'},
    verification: verification ?? _createVerification(),
    updatedAt: DateTimeExt.epoch,
    createdAt: DateTimeExt.epoch,
  );
}

void main() {
  group('ExternalAccount', () {
    test('isVerified returns true when verification status is verified', () {
      final account = _createExternalAccount(
        verification: _createVerification(status: Status.verified),
      );
      expect(account.isVerified, true);
    });

    test('isVerified returns false when verification status is not verified', () {
      final account = _createExternalAccount(
        verification: _createVerification(status: Status.pending),
      );
      expect(account.isVerified, false);
    });

    test('isInError returns true when verification has error message', () {
      final account = _createExternalAccount(
        verification: _createVerification(errorMessage: 'Something went wrong'),
      );
      expect(account.isInError, true);
    });

    test('isInError returns false when verification has no error message', () {
      final account = _createExternalAccount(
        verification: _createVerification(errorMessage: null),
      );
      expect(account.isInError, false);
    });

    test('isExpired returns true when verification status is expired', () {
      final account = _createExternalAccount(
        verification: _createVerification(status: Status.expired),
      );
      expect(account.isExpired, true);
    });

    test('isExpired returns false when verification status is not expired', () {
      final account = _createExternalAccount(
        verification: _createVerification(status: Status.verified),
      );
      expect(account.isExpired, false);
    });

    test('fromJson creates external account from JSON', () {
      final json = {
        'id': 'ext_456',
        'provider': 'github',
        'provider_user_id': 'github_user_456',
        'approved_scopes': 'repo user',
        'email_address': 'github@example.com',
        'username': 'githubuser',
        'first_name': 'GitHub',
        'last_name': 'User',
        'avatar_url': null,
        'image_url': null,
        'label': null,
        'public_metadata': null,
        'verification': {
          'status': 'verified',
          'strategy': 'oauth_github',
          'attempts': 1,
          'expire_at': 1700000000000,
        },
        'updated_at': 1700000000000,
        'created_at': 1699000000000,
      };

      final account = ExternalAccount.fromJson(json);

      expect(account.id, 'ext_456');
      expect(account.provider, 'github');
      expect(account.providerUserId, 'github_user_456');
      expect(account.emailAddress, 'github@example.com');
    });

    test('toJson serializes external account', () {
      final account = _createExternalAccount();
      final json = account.toJson();

      expect(json['id'], 'ext_123');
      expect(json['provider'], 'google');
      expect(json['email_address'], 'test@example.com');
    });
  });
}

