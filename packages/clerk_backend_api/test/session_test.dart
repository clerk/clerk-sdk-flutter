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
  group('Session', () {
    late Session instance;
    late Object actor;

    setUp(() {
      actor = {'sub': 'actor_123'};
      instance = Session(
        object: SessionObjectEnum.session,
        id: 'sess_123',
        userId: 'user_456',
        clientId: 'client_789',
        actor: actor,
        status: SessionStatusEnum.active,
        lastActiveOrganizationId: 'org_abc',
        lastActiveAt: 1700000000,
        latestActivity: null,
        expireAt: 1700100000,
        abandonAt: 1700200000,
        updatedAt: 1700000001,
        createdAt: 1700000002,
        tasks: [],
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, SessionObjectEnum.session);
      expect(instance.id, 'sess_123');
      expect(instance.userId, 'user_456');
      expect(instance.clientId, 'client_789');
      expect(instance.status, SessionStatusEnum.active);
      expect(instance.lastActiveAt, 1700000000);
      expect(instance.expireAt, 1700100000);
      expect(instance.abandonAt, 1700200000);
      expect(instance.updatedAt, 1700000001);
      expect(instance.createdAt, 1700000002);
    });

    test('constructor creates instance with optional parameters', () {
      expect(instance.actor, actor);
      expect(instance.lastActiveOrganizationId, 'org_abc');
      expect(instance.latestActivity, isNull);
      expect(instance.tasks, isEmpty);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], SessionObjectEnum.session);
      expect(json['id'], 'sess_123');
      expect(json['user_id'], 'user_456');
      expect(json['client_id'], 'client_789');
      expect(json['actor'], actor);
      expect(json['status'], SessionStatusEnum.active);
      expect(json['last_active_organization_id'], 'org_abc');
      expect(json['last_active_at'], 1700000000);
      expect(json['latest_activity'], isNull);
      expect(json['expire_at'], 1700100000);
      expect(json['abandon_at'], 1700200000);
      expect(json['updated_at'], 1700000001);
      expect(json['created_at'], 1700000002);
      expect(json['tasks'], isEmpty);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'session',
        'id': 'sess_456',
        'user_id': 'user_789',
        'client_id': 'client_abc',
        'status': 'revoked',
        'last_active_at': 1700000003,
        'expire_at': 1700100001,
        'abandon_at': 1700200001,
        'updated_at': 1700000004,
        'created_at': 1700000005,
      };
      final parsed = Session.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.object, SessionObjectEnum.session);
      expect(parsed.id, 'sess_456');
      expect(parsed.userId, 'user_789');
      expect(parsed.clientId, 'client_abc');
      expect(parsed.status, SessionStatusEnum.revoked);
      expect(parsed.lastActiveAt, 1700000003);
      expect(parsed.expireAt, 1700100001);
      expect(parsed.abandonAt, 1700200001);
    });

    test('fromJson returns null for non-map input', () {
      expect(Session.fromJson('not a map'), isNull);
      expect(Session.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'object': 'session', 'id': 'sess_1', 'user_id': 'u1', 'client_id': 'c1', 'status': 'active', 'last_active_at': 1, 'expire_at': 2, 'abandon_at': 3, 'updated_at': 4, 'created_at': 5},
        {'object': 'session', 'id': 'sess_2', 'user_id': 'u2', 'client_id': 'c2', 'status': 'ended', 'last_active_at': 6, 'expire_at': 7, 'abandon_at': 8, 'updated_at': 9, 'created_at': 10},
      ];
      final list = Session.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].id, 'sess_1');
      expect(list[1].id, 'sess_2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Session.listFromJson([]), isEmpty);
      expect(Session.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = Session(
        object: SessionObjectEnum.session,
        id: 'sess_123',
        userId: 'user_456',
        clientId: 'client_789',
        actor: actor,
        status: SessionStatusEnum.active,
        lastActiveOrganizationId: 'org_abc',
        lastActiveAt: 1700000000,
        latestActivity: null,
        expireAt: 1700100000,
        abandonAt: 1700200000,
        updatedAt: 1700000001,
        createdAt: 1700000002,
        tasks: [],
      );
      final different = Session(
        object: SessionObjectEnum.session,
        id: 'sess_different',
        userId: 'user_different',
        clientId: 'client_different',
        status: SessionStatusEnum.ended,
        lastActiveAt: 1700000000,
        expireAt: 1700100000,
        abandonAt: 1700200000,
        updatedAt: 1700000001,
        createdAt: 1700000002,
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('Session'));
      expect(str, contains('sess_123'));
      expect(str, contains('user_456'));
    });

    test('requiredKeys contains required fields', () {
      expect(Session.requiredKeys, contains('object'));
      expect(Session.requiredKeys, contains('id'));
      expect(Session.requiredKeys, contains('user_id'));
      expect(Session.requiredKeys, contains('client_id'));
      expect(Session.requiredKeys, contains('status'));
      expect(Session.requiredKeys, contains('last_active_at'));
      expect(Session.requiredKeys, contains('expire_at'));
      expect(Session.requiredKeys, contains('abandon_at'));
      expect(Session.requiredKeys, contains('updated_at'));
      expect(Session.requiredKeys, contains('created_at'));
    });
  });

  group('SessionObjectEnum', () {
    test('values contains all enum values', () {
      expect(SessionObjectEnum.values, contains(SessionObjectEnum.session));
    });

    test('toJson returns correct string', () {
      expect(SessionObjectEnum.session.toJson(), 'session');
    });

    test('fromJson parses correct value', () {
      expect(SessionObjectEnum.fromJson('session'), SessionObjectEnum.session);
    });

    test('fromJson returns null for unknown value', () {
      expect(SessionObjectEnum.fromJson('unknown'), isNull);
    });
  });

  group('SessionStatusEnum', () {
    test('values contains all enum values', () {
      expect(SessionStatusEnum.values, hasLength(8));
      expect(SessionStatusEnum.values, contains(SessionStatusEnum.active));
      expect(SessionStatusEnum.values, contains(SessionStatusEnum.revoked));
      expect(SessionStatusEnum.values, contains(SessionStatusEnum.ended));
      expect(SessionStatusEnum.values, contains(SessionStatusEnum.expired));
      expect(SessionStatusEnum.values, contains(SessionStatusEnum.removed));
      expect(SessionStatusEnum.values, contains(SessionStatusEnum.abandoned));
      expect(SessionStatusEnum.values, contains(SessionStatusEnum.replaced));
      expect(SessionStatusEnum.values, contains(SessionStatusEnum.pending));
    });

    test('toJson returns correct string', () {
      expect(SessionStatusEnum.active.toJson(), 'active');
      expect(SessionStatusEnum.revoked.toJson(), 'revoked');
      expect(SessionStatusEnum.ended.toJson(), 'ended');
      expect(SessionStatusEnum.expired.toJson(), 'expired');
      expect(SessionStatusEnum.removed.toJson(), 'removed');
      expect(SessionStatusEnum.abandoned.toJson(), 'abandoned');
      expect(SessionStatusEnum.replaced.toJson(), 'replaced');
      expect(SessionStatusEnum.pending.toJson(), 'pending');
    });

    test('fromJson parses correct values', () {
      expect(SessionStatusEnum.fromJson('active'), SessionStatusEnum.active);
      expect(SessionStatusEnum.fromJson('revoked'), SessionStatusEnum.revoked);
      expect(SessionStatusEnum.fromJson('ended'), SessionStatusEnum.ended);
      expect(SessionStatusEnum.fromJson('expired'), SessionStatusEnum.expired);
      expect(SessionStatusEnum.fromJson('removed'), SessionStatusEnum.removed);
      expect(SessionStatusEnum.fromJson('abandoned'), SessionStatusEnum.abandoned);
      expect(SessionStatusEnum.fromJson('replaced'), SessionStatusEnum.replaced);
      expect(SessionStatusEnum.fromJson('pending'), SessionStatusEnum.pending);
    });

    test('fromJson returns null for unknown value', () {
      expect(SessionStatusEnum.fromJson('unknown'), isNull);
    });
  });
}
