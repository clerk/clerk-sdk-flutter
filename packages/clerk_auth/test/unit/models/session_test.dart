import 'package:clerk_auth/src/models/client/session.dart';
import 'package:clerk_auth/src/models/client/user.dart';
import 'package:clerk_auth/src/models/client/user_public.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/extensions.dart';

import '../../test_helpers.dart';

User _createTestUser({
  String id = 'user_123',
  String? firstName,
  String? lastName,
}) {
  return User(
    id: id,
    externalId: null,
    username: null,
    firstName: firstName,
    lastName: lastName,
    profileImageUrl: null,
    imageUrl: null,
    hasImage: false,
    primaryEmailAddressId: null,
    primaryPhoneNumberId: null,
    primaryWeb3WalletId: null,
    publicMetadata: null,
    privateMetadata: {},
    unsafeMetadata: null,
    emailAddresses: null,
    phoneNumbers: null,
    web3Wallets: null,
    passkeys: null,
    organizationMemberships: null,
    createOrganizationEnabled: false,
    externalAccounts: null,
    passwordEnabled: false,
    twoFactorEnabled: false,
    totpEnabled: false,
    backupCodeEnabled: false,
    lastSignInAt: DateTimeExt.epoch,
    banned: false,
    locked: false,
    lockoutExpiresInSeconds: null,
    verificationAttemptsRemaining: null,
    updatedAt: DateTimeExt.epoch,
    createdAt: DateTimeExt.epoch,
    lastActiveAt: DateTimeExt.epoch,
    deleteSelfEnabled: false,
  );
}

Session _createTestSession({
  String id = 'sess_123',
  Status status = Status.active,
  User? user,
  String? lastActiveOrganizationId,
}) {
  final testUser = user ?? _createTestUser();
  return Session(
    id: id,
    status: status,
    lastActiveAt: DateTime.now(),
    expireAt: DateTime.now().add(const Duration(days: 1)),
    abandonAt: DateTime.now().add(const Duration(days: 7)),
    publicUserData: UserPublic(
      firstName: testUser.firstName,
      lastName: testUser.lastName,
      profileImageUrl: testUser.profileImageUrl,
      imageUrl: testUser.imageUrl,
      hasImage: testUser.hasImage ?? false,
      identifier: testUser.email ?? '',
    ),
    lastActiveOrganizationId: lastActiveOrganizationId,
    user: testUser,
  );
}

void main() {
  group('Session', () {
    group('isActive', () {
      test('returns true when status is active', () {
        final session = _createTestSession(status: Status.active);
        expect(session.isActive);
      });

      test('returns false when status is not active', () {
        final session = _createTestSession(status: Status.expired);
        expect(session.isActive, false);
      });

      test('returns false when status is abandoned', () {
        final session = _createTestSession(status: Status.abandoned);
        expect(session.isActive, false);
      });
    });

    group('organization', () {
      test('returns null when user has no organization memberships', () {
        final session = _createTestSession();
        expect(session.organization, isNull);
      });

      test('returns null when lastActiveOrganizationId is null', () {
        final session = _createTestSession(lastActiveOrganizationId: null);
        expect(session.organization, isNull);
      });
    });

    group('properties', () {
      test('has correct id', () {
        final session = _createTestSession(id: 'sess_abc123');
        expect(session.id, 'sess_abc123');
      });

      test('has correct status', () {
        final session = _createTestSession(status: Status.active);
        expect(session.status, Status.active);
      });

      test('has correct user', () {
        final user = _createTestUser(id: 'user_xyz', firstName: 'John');
        final session = _createTestSession(user: user);
        expect(session.user.id, 'user_xyz');
        expect(session.user.firstName, 'John');
      });

      test('has correct publicUserData', () {
        final user = _createTestUser(firstName: 'Jane', lastName: 'Doe');
        final session = _createTestSession(user: user);
        expect(session.publicUserData.firstName, 'Jane');
        expect(session.publicUserData.lastName, 'Doe');
      });
    });

    group('JSON serialization', () {
      test('toJson produces valid map', () {
        final session = _createTestSession(id: 'sess_test');
        final json = session.toJson();
        expect(json['id'], 'sess_test');
        expect(json.containsKey('status'));
        expect(json.containsKey('user'));
      });
    });
  });
}

