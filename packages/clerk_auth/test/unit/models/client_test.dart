import 'package:clerk_auth/src/clerk_auth/clerk_error.dart';
import 'package:clerk_auth/src/models/client/client.dart';
import 'package:clerk_auth/src/models/client/session.dart';
import 'package:clerk_auth/src/models/client/user.dart';
import 'package:clerk_auth/src/models/client/user_public.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/extensions.dart';

import '../../test_helpers.dart';

User _createTestUser({
  required String id,
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
  required String id,
  required User user,
  Status status = Status.active,
  String? lastActiveOrganizationId,
}) {
  return Session(
    id: id,
    status: status,
    lastActiveAt: DateTime.now(),
    expireAt: DateTime.now().add(const Duration(days: 1)),
    abandonAt: DateTime.now().add(const Duration(days: 7)),
    publicUserData: UserPublic(
      firstName: user.firstName,
      lastName: user.lastName,
      profileImageUrl: user.profileImageUrl,
      imageUrl: user.imageUrl,
      hasImage: user.hasImage ?? false,
      identifier: user.email ?? '',
    ),
    lastActiveOrganizationId: lastActiveOrganizationId,
    user: user,
  );
}

void main() {
  group('Client', () {
    test('empty client has expected properties', () {
      expect(Client.empty.isEmpty);
      expect(Client.empty.isNotEmpty, false);
      expect(Client.empty.id, isNull);
      expect(Client.empty.sessions, isEmpty);
      expect(Client.empty.signIn, isNull);
      expect(Client.empty.signUp, isNull);
    });

    test('non-empty client is not empty', () {
      final client = Client(id: 'client_123');
      expect(client.isEmpty, false);
      expect(client.isNotEmpty);
    });

    group('activeSession', () {
      test('returns null when no sessions exist', () {
        expect(Client.empty.activeSession, isNull);
      });

      test('returns session matching lastActiveSessionId', () {
        final user = _createTestUser(id: 'user_1');
        final session1 = _createTestSession(id: 'sess_1', user: user);
        final session2 = _createTestSession(id: 'sess_2', user: user);

        final client = Client(
          id: 'client_123',
          sessions: [session1, session2],
          lastActiveSessionId: 'sess_2',
        );

        expect(client.activeSession, session2);
      });

      test('returns first active session when lastActiveSessionId not found',
          () {
        final user = _createTestUser(id: 'user_1');
        final activeSession =
            _createTestSession(id: 'sess_1', user: user, status: Status.active);
        final inactiveSession = _createTestSession(
            id: 'sess_2', user: user, status: Status.expired);

        final client = Client(
          id: 'client_123',
          sessions: [inactiveSession, activeSession],
          lastActiveSessionId: 'sess_nonexistent',
        );

        expect(client.activeSession, activeSession);
      });
    });

    group('sessionFor', () {
      test('returns session for given user', () {
        final user1 = _createTestUser(id: 'user_1', firstName: 'John');
        final user2 = _createTestUser(id: 'user_2', firstName: 'Jane');
        final session1 = _createTestSession(id: 'sess_1', user: user1);
        final session2 = _createTestSession(id: 'sess_2', user: user2);

        final client = Client(
          id: 'client_123',
          sessions: [session1, session2],
        );

        expect(client.sessionFor(user1), session1);
        expect(client.sessionFor(user2), session2);
      });

      test('throws ClerkError when no session found for user', () {
        final user = _createTestUser(id: 'user_1', firstName: 'John');
        final otherUser = _createTestUser(id: 'user_2', firstName: 'Jane');
        final session = _createTestSession(id: 'sess_1', user: user);

        final client = Client(
          id: 'client_123',
          sessions: [session],
        );

        expect(
          () => client.sessionFor(otherUser),
          throwsA(isA<ClerkError>()),
        );
      });
    });

    group('userIds', () {
      test('returns empty iterable when no sessions', () {
        expect(Client.empty.userIds, isEmpty);
      });

      test('returns user ids from all sessions', () {
        final user1 = _createTestUser(id: 'user_1');
        final user2 = _createTestUser(id: 'user_2');
        final session1 = _createTestSession(id: 'sess_1', user: user1);
        final session2 = _createTestSession(id: 'sess_2', user: user2);

        final client = Client(
          id: 'client_123',
          sessions: [session1, session2],
        );

        expect(client.userIds.toList(), ['user_1', 'user_2']);
      });
    });

    group('user', () {
      test('returns null when no active session', () {
        expect(Client.empty.user, isNull);
      });

      test('returns user from active session', () {
        final user = _createTestUser(id: 'user_1', firstName: 'John');
        final session = _createTestSession(id: 'sess_1', user: user);

        final client = Client(
          id: 'client_123',
          sessions: [session],
          lastActiveSessionId: 'sess_1',
        );

        expect(client.user, user);
        expect(client.user?.firstName, 'John');
      });
    });

    group('refreshUser', () {
      test('returns updated user from session', () {
        final user = _createTestUser(id: 'user_1', firstName: 'John');
        final session = _createTestSession(id: 'sess_1', user: user);

        final client = Client(
          id: 'client_123',
          sessions: [session],
        );

        final refreshedUser = client.refreshUser(user);
        expect(refreshedUser.id, user.id);
      });
    });

    group('JSON serialization', () {
      test('toJson produces valid map', () {
        final client = Client(
          id: 'client_123',
          lastActiveSessionId: 'sess_1',
        );

        final json = client.toJson();
        expect(json['id'], 'client_123');
        expect(json['last_active_session_id'], 'sess_1');
      });

      test('fromJson creates client from map', () {
        final json = {
          'id': 'client_456',
          'last_active_session_id': 'sess_2',
          'sessions': <Map<String, dynamic>>[],
          'updated_at': DateTime.now().millisecondsSinceEpoch,
          'created_at': DateTime.now().millisecondsSinceEpoch,
        };

        final client = Client.fromJson(json);
        expect(client.id, 'client_456');
        expect(client.lastActiveSessionId, 'sess_2');
      });

      test('round-trip serialization preserves data', () {
        final original = Client(
          id: 'client_789',
          lastActiveSessionId: 'sess_3',
          sessions: [],
        );

        final json = original.toJson();
        final restored = Client.fromJson(json);

        expect(restored.id, original.id);
        expect(restored.lastActiveSessionId, original.lastActiveSessionId);
      });
    });
  });
}

