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
  group('CreateSignInTokenRequest', () {
    late CreateSignInTokenRequest instance;

    setUp(() {
      instance = CreateSignInTokenRequest(
        userId: 'user_123',
        expiresInSeconds: 86400,
      );
    });

    test('constructor creates instance with required parameters', () {
      final minimal = CreateSignInTokenRequest(
        userId: 'user_456',
      );
      expect(minimal.userId, 'user_456');
      expect(minimal.expiresInSeconds, 2592000); // default value (30 days)
    });

    test('constructor creates instance with all parameters', () {
      expect(instance.userId, 'user_123');
      expect(instance.expiresInSeconds, 86400);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['user_id'], 'user_123');
      expect(json['expires_in_seconds'], 86400);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'user_id': 'user_789',
        'expires_in_seconds': 3600,
      };
      final result = CreateSignInTokenRequest.fromJson(json);
      expect(result, isNotNull);
      expect(result!.userId, 'user_789');
      expect(result.expiresInSeconds, 3600);
    });

    test('fromJson uses default for expiresInSeconds when not provided', () {
      final json = {
        'user_id': 'user_abc',
      };
      final result = CreateSignInTokenRequest.fromJson(json);
      expect(result, isNotNull);
      expect(result!.expiresInSeconds, 2592000);
    });

    test('fromJson returns null for non-map input', () {
      expect(CreateSignInTokenRequest.fromJson('invalid'), isNull);
      expect(CreateSignInTokenRequest.fromJson(123), isNull);
      expect(CreateSignInTokenRequest.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {'user_id': 'user_1'},
        {'user_id': 'user_2', 'expires_in_seconds': 7200},
      ];
      final result = CreateSignInTokenRequest.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].userId, 'user_1');
      expect(result[1].expiresInSeconds, 7200);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(CreateSignInTokenRequest.listFromJson([]), isEmpty);
      expect(CreateSignInTokenRequest.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = CreateSignInTokenRequest(
        userId: 'user_123',
        expiresInSeconds: 86400,
      );
      expect(instance, equals(other));

      final different = CreateSignInTokenRequest(
        userId: 'user_different',
      );
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('CreateSignInTokenRequest'));
      expect(str, contains('userId=user_123'));
      expect(str, contains('expiresInSeconds=86400'));
    });

    test('requiredKeys contains required fields', () {
      expect(CreateSignInTokenRequest.requiredKeys, contains('user_id'));
    });
  });
}
