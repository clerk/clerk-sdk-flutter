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
  group('SignInToken', () {
    late SignInToken instance;

    setUp(() {
      instance = SignInToken(
        object: SignInTokenObjectEnum.signInToken,
        id: 'sit_123',
        status: SignInTokenStatusEnum.pending,
        userId: 'user_456',
        token: 'abc123token',
        url: 'https://example.com/sign-in/abc123',
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, SignInTokenObjectEnum.signInToken);
      expect(instance.id, 'sit_123');
      expect(instance.status, SignInTokenStatusEnum.pending);
      expect(instance.userId, 'user_456');
      expect(instance.createdAt, 1700000000);
      expect(instance.updatedAt, 1700000001);
    });

    test('constructor creates instance with optional parameters', () {
      expect(instance.token, 'abc123token');
      expect(instance.url, 'https://example.com/sign-in/abc123');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], SignInTokenObjectEnum.signInToken);
      expect(json['id'], 'sit_123');
      expect(json['status'], SignInTokenStatusEnum.pending);
      expect(json['user_id'], 'user_456');
      expect(json['token'], 'abc123token');
      expect(json['url'], 'https://example.com/sign-in/abc123');
      expect(json['created_at'], 1700000000);
      expect(json['updated_at'], 1700000001);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'sign_in_token',
        'id': 'sit_456',
        'status': 'accepted',
        'user_id': 'user_789',
        'token': 'xyz789token',
        'url': 'https://example.com/sign-in/xyz789',
        'created_at': 1700000002,
        'updated_at': 1700000003,
      };
      final parsed = SignInToken.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.object, SignInTokenObjectEnum.signInToken);
      expect(parsed.id, 'sit_456');
      expect(parsed.status, SignInTokenStatusEnum.accepted);
      expect(parsed.userId, 'user_789');
      expect(parsed.token, 'xyz789token');
    });

    test('fromJson returns null for non-map input', () {
      expect(SignInToken.fromJson('not a map'), isNull);
      expect(SignInToken.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'object': 'sign_in_token', 'id': 's1', 'status': 'pending', 'user_id': 'u1', 'created_at': 1, 'updated_at': 2},
        {'object': 'sign_in_token', 'id': 's2', 'status': 'accepted', 'user_id': 'u2', 'created_at': 3, 'updated_at': 4},
      ];
      final list = SignInToken.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].id, 's1');
      expect(list[1].id, 's2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(SignInToken.listFromJson([]), isEmpty);
      expect(SignInToken.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = SignInToken(
        object: SignInTokenObjectEnum.signInToken,
        id: 'sit_123',
        status: SignInTokenStatusEnum.pending,
        userId: 'user_456',
        token: 'abc123token',
        url: 'https://example.com/sign-in/abc123',
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      final different = SignInToken(
        object: SignInTokenObjectEnum.signInToken,
        id: 'sit_different',
        status: SignInTokenStatusEnum.revoked,
        userId: 'user_different',
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('SignInToken'));
      expect(str, contains('sit_123'));
      expect(str, contains('user_456'));
    });

    test('requiredKeys contains required fields', () {
      expect(SignInToken.requiredKeys, contains('object'));
      expect(SignInToken.requiredKeys, contains('id'));
      expect(SignInToken.requiredKeys, contains('status'));
      expect(SignInToken.requiredKeys, contains('user_id'));
      expect(SignInToken.requiredKeys, contains('created_at'));
      expect(SignInToken.requiredKeys, contains('updated_at'));
    });
  });

  group('SignInTokenObjectEnum', () {
    test('values contains all enum values', () {
      expect(SignInTokenObjectEnum.values, contains(SignInTokenObjectEnum.signInToken));
    });

    test('toJson returns correct string', () {
      expect(SignInTokenObjectEnum.signInToken.toJson(), 'sign_in_token');
    });

    test('fromJson parses correct value', () {
      expect(SignInTokenObjectEnum.fromJson('sign_in_token'), SignInTokenObjectEnum.signInToken);
    });

    test('fromJson returns null for unknown value', () {
      expect(SignInTokenObjectEnum.fromJson('unknown'), isNull);
    });
  });

  group('SignInTokenStatusEnum', () {
    test('values contains all enum values', () {
      expect(SignInTokenStatusEnum.values, hasLength(3));
      expect(SignInTokenStatusEnum.values, contains(SignInTokenStatusEnum.pending));
      expect(SignInTokenStatusEnum.values, contains(SignInTokenStatusEnum.accepted));
      expect(SignInTokenStatusEnum.values, contains(SignInTokenStatusEnum.revoked));
    });

    test('toJson returns correct string', () {
      expect(SignInTokenStatusEnum.pending.toJson(), 'pending');
      expect(SignInTokenStatusEnum.accepted.toJson(), 'accepted');
      expect(SignInTokenStatusEnum.revoked.toJson(), 'revoked');
    });

    test('fromJson parses correct values', () {
      expect(SignInTokenStatusEnum.fromJson('pending'), SignInTokenStatusEnum.pending);
      expect(SignInTokenStatusEnum.fromJson('accepted'), SignInTokenStatusEnum.accepted);
      expect(SignInTokenStatusEnum.fromJson('revoked'), SignInTokenStatusEnum.revoked);
    });

    test('fromJson returns null for unknown value', () {
      expect(SignInTokenStatusEnum.fromJson('unknown'), isNull);
    });
  });
}
