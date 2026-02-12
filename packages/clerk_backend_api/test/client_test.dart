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
  group('Client', () {
    late Client instance;
    late List<String> sessionIds;

    setUp(() {
      sessionIds = ['sess_1', 'sess_2'];
      instance = Client(
        object: ClientObjectEnum.client,
        id: 'client_123',
        sessionIds: sessionIds,
        sessions: [],
        signInId: 'signin_456',
        signUpId: 'signup_789',
        lastActiveSessionId: 'sess_1',
        lastAuthenticationStrategy: 'password',
        updatedAt: 1700000001,
        createdAt: 1700000000,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, ClientObjectEnum.client);
      expect(instance.id, 'client_123');
      expect(instance.signInId, 'signin_456');
      expect(instance.signUpId, 'signup_789');
      expect(instance.lastActiveSessionId, 'sess_1');
      expect(instance.lastAuthenticationStrategy, 'password');
      expect(instance.updatedAt, 1700000001);
      expect(instance.createdAt, 1700000000);
    });

    test('constructor creates instance with optional parameters', () {
      expect(instance.sessionIds, sessionIds);
      expect(instance.sessions, isEmpty);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], ClientObjectEnum.client);
      expect(json['id'], 'client_123');
      expect(json['session_ids'], sessionIds);
      expect(json['sessions'], isEmpty);
      expect(json['sign_in_id'], 'signin_456');
      expect(json['sign_up_id'], 'signup_789');
      expect(json['last_active_session_id'], 'sess_1');
      expect(json['last_authentication_strategy'], 'password');
      expect(json['updated_at'], 1700000001);
      expect(json['created_at'], 1700000000);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'client',
        'id': 'client_456',
        'session_ids': ['sess_3'],
        'sessions': [],
        'sign_in_id': 'signin_abc',
        'sign_up_id': 'signup_def',
        'last_active_session_id': 'sess_3',
        'last_authentication_strategy': 'oauth',
        'updated_at': 1700000003,
        'created_at': 1700000002,
      };
      final parsed = Client.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.object, ClientObjectEnum.client);
      expect(parsed.id, 'client_456');
      expect(parsed.sessionIds, ['sess_3']);
      expect(parsed.signInId, 'signin_abc');
      expect(parsed.lastAuthenticationStrategy, 'oauth');
    });

    test('fromJson returns null for non-map input', () {
      expect(Client.fromJson('not a map'), isNull);
      expect(Client.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'object': 'client', 'id': 'c1', 'session_ids': [], 'sessions': [], 'sign_in_id': 's1', 'sign_up_id': 'su1', 'last_active_session_id': 'sess1', 'last_authentication_strategy': 'password', 'updated_at': 1, 'created_at': 2},
        {'object': 'client', 'id': 'c2', 'session_ids': [], 'sessions': [], 'sign_in_id': 's2', 'sign_up_id': 'su2', 'last_active_session_id': 'sess2', 'last_authentication_strategy': 'oauth', 'updated_at': 3, 'created_at': 4},
      ];
      final list = Client.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].id, 'c1');
      expect(list[1].id, 'c2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Client.listFromJson([]), isEmpty);
      expect(Client.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = Client(
        object: ClientObjectEnum.client,
        id: 'client_123',
        sessionIds: sessionIds,
        sessions: [],
        signInId: 'signin_456',
        signUpId: 'signup_789',
        lastActiveSessionId: 'sess_1',
        lastAuthenticationStrategy: 'password',
        updatedAt: 1700000001,
        createdAt: 1700000000,
      );
      final different = Client(
        object: ClientObjectEnum.client,
        id: 'client_different',
        signInId: null,
        signUpId: null,
        lastActiveSessionId: null,
        lastAuthenticationStrategy: null,
        updatedAt: 1700000001,
        createdAt: 1700000000,
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('Client'));
      expect(str, contains('client_123'));
    });

    test('requiredKeys contains required fields', () {
      expect(Client.requiredKeys, contains('object'));
      expect(Client.requiredKeys, contains('id'));
      expect(Client.requiredKeys, contains('session_ids'));
      expect(Client.requiredKeys, contains('sessions'));
      expect(Client.requiredKeys, contains('sign_in_id'));
      expect(Client.requiredKeys, contains('sign_up_id'));
      expect(Client.requiredKeys, contains('last_active_session_id'));
      expect(Client.requiredKeys, contains('updated_at'));
      expect(Client.requiredKeys, contains('created_at'));
    });
  });

  group('ClientObjectEnum', () {
    test('values contains all enum values', () {
      expect(ClientObjectEnum.values, contains(ClientObjectEnum.client));
    });

    test('toJson returns correct string', () {
      expect(ClientObjectEnum.client.toJson(), 'client');
    });

    test('fromJson parses correct value', () {
      expect(ClientObjectEnum.fromJson('client'), ClientObjectEnum.client);
    });

    test('fromJson returns null for unknown value', () {
      expect(ClientObjectEnum.fromJson('unknown'), isNull);
    });
  });
}
