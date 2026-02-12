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
  group('ActorToken', () {
    late ActorToken instance;

    setUp(() {
      instance = ActorToken(
        object: ActorTokenObjectEnum.actorToken,
        id: 'act_123',
        status: ActorTokenStatusEnum.pending,
        userId: 'user_456',
        actor: {'sub': 'actor_789'},
        token: 'token_abc',
        url: 'https://example.com/actor',
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
    });

    test('constructor creates instance with required parameters', () {
      final token = ActorToken(
        object: ActorTokenObjectEnum.actorToken,
        id: 'act_123',
        status: ActorTokenStatusEnum.pending,
        userId: 'user_456',
        actor: {'sub': 'actor_789'},
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      expect(token.object, ActorTokenObjectEnum.actorToken);
      expect(token.id, 'act_123');
      expect(token.status, ActorTokenStatusEnum.pending);
      expect(token.userId, 'user_456');
      expect(token.actor, {'sub': 'actor_789'});
      expect(token.token, isNull);
      expect(token.url, isNull);
      expect(token.createdAt, 1700000000);
      expect(token.updatedAt, 1700000001);
    });

    test('constructor creates instance with optional parameters', () {
      expect(instance.token, 'token_abc');
      expect(instance.url, 'https://example.com/actor');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], ActorTokenObjectEnum.actorToken);
      expect(json['id'], 'act_123');
      expect(json['status'], ActorTokenStatusEnum.pending);
      expect(json['user_id'], 'user_456');
      expect(json['actor'], {'sub': 'actor_789'});
      expect(json['token'], 'token_abc');
      expect(json['url'], 'https://example.com/actor');
      expect(json['created_at'], 1700000000);
      expect(json['updated_at'], 1700000001);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'actor_token',
        'id': 'act_123',
        'status': 'pending',
        'user_id': 'user_456',
        'actor': {'sub': 'actor_789'},
        'token': 'token_abc',
        'url': 'https://example.com/actor',
        'created_at': 1700000000,
        'updated_at': 1700000001,
      };
      final token = ActorToken.fromJson(json);
      expect(token, isNotNull);
      expect(token!.object, ActorTokenObjectEnum.actorToken);
      expect(token.id, 'act_123');
      expect(token.status, ActorTokenStatusEnum.pending);
      expect(token.userId, 'user_456');
      expect(token.actor, {'sub': 'actor_789'});
      expect(token.token, 'token_abc');
      expect(token.url, 'https://example.com/actor');
      expect(token.createdAt, 1700000000);
      expect(token.updatedAt, 1700000001);
    });

    test('fromJson returns null for non-map input', () {
      expect(ActorToken.fromJson(null), isNull);
      expect(ActorToken.fromJson('string'), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {
          'object': 'actor_token',
          'id': 'act_1',
          'status': 'pending',
          'user_id': 'user_1',
          'actor': {},
          'created_at': 1700000000,
          'updated_at': 1700000001,
        },
        {
          'object': 'actor_token',
          'id': 'act_2',
          'status': 'accepted',
          'user_id': 'user_2',
          'actor': {},
          'created_at': 1700000002,
          'updated_at': 1700000003,
        },
      ];
      final list = ActorToken.listFromJson(jsonList);
      expect(list.length, 2);
      expect(list[0].id, 'act_1');
      expect(list[1].id, 'act_2');
    });

    test('equality operator works correctly', () {
      final actor = {'sub': 'actor_789'};
      final token1 = ActorToken(
        object: ActorTokenObjectEnum.actorToken,
        id: 'act_123',
        status: ActorTokenStatusEnum.pending,
        userId: 'user_456',
        actor: actor,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      final token2 = ActorToken(
        object: ActorTokenObjectEnum.actorToken,
        id: 'act_123',
        status: ActorTokenStatusEnum.pending,
        userId: 'user_456',
        actor: actor,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      final token3 = ActorToken(
        object: ActorTokenObjectEnum.actorToken,
        id: 'act_different',
        status: ActorTokenStatusEnum.pending,
        userId: 'user_456',
        actor: actor,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      expect(token1, equals(token2));
      expect(token1, isNot(equals(token3)));
    });

    test('hashCode is consistent', () {
      final actor = {'sub': 'actor_789'};
      final token1 = ActorToken(
        object: ActorTokenObjectEnum.actorToken,
        id: 'act_123',
        status: ActorTokenStatusEnum.pending,
        userId: 'user_456',
        actor: actor,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      final token2 = ActorToken(
        object: ActorTokenObjectEnum.actorToken,
        id: 'act_123',
        status: ActorTokenStatusEnum.pending,
        userId: 'user_456',
        actor: actor,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      expect(token1.hashCode, equals(token2.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('ActorToken['));
      expect(str, contains('object='));
      expect(str, contains('id='));
    });
  });

  group('ActorTokenObjectEnum', () {
    test('values contains all enum values', () {
      expect(ActorTokenObjectEnum.values, contains(ActorTokenObjectEnum.actorToken));
    });

    test('fromJson parses valid value', () {
      expect(ActorTokenObjectEnum.fromJson('actor_token'), ActorTokenObjectEnum.actorToken);
    });

    test('fromJson returns null for invalid value', () {
      expect(ActorTokenObjectEnum.fromJson('invalid'), isNull);
    });

    test('toJson returns correct string', () {
      expect(ActorTokenObjectEnum.actorToken.toJson(), 'actor_token');
    });
  });

  group('ActorTokenStatusEnum', () {
    test('values contains all enum values', () {
      expect(ActorTokenStatusEnum.values, contains(ActorTokenStatusEnum.pending));
      expect(ActorTokenStatusEnum.values, contains(ActorTokenStatusEnum.accepted));
      expect(ActorTokenStatusEnum.values, contains(ActorTokenStatusEnum.revoked));
    });

    test('fromJson parses valid values', () {
      expect(ActorTokenStatusEnum.fromJson('pending'), ActorTokenStatusEnum.pending);
      expect(ActorTokenStatusEnum.fromJson('accepted'), ActorTokenStatusEnum.accepted);
      expect(ActorTokenStatusEnum.fromJson('revoked'), ActorTokenStatusEnum.revoked);
    });

    test('fromJson returns null for invalid value', () {
      expect(ActorTokenStatusEnum.fromJson('invalid'), isNull);
    });

    test('toJson returns correct string', () {
      expect(ActorTokenStatusEnum.pending.toJson(), 'pending');
      expect(ActorTokenStatusEnum.accepted.toJson(), 'accepted');
      expect(ActorTokenStatusEnum.revoked.toJson(), 'revoked');
    });
  });
}
