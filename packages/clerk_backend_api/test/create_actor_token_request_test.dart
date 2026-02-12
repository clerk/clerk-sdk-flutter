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
  group('CreateActorTokenRequest', () {
    late CreateActorTokenRequest instance;
    late CreateActorTokenRequestActor actor;

    setUp(() {
      actor = CreateActorTokenRequestActor(sub: 'admin_user_123');
      instance = CreateActorTokenRequest(
        userId: 'user_123',
        actor: actor,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.userId, 'user_123');
      expect(instance.actor, actor);
    });

    test('constructor uses default values', () {
      expect(instance.expiresInSeconds, 3600);
      expect(instance.sessionMaxDurationInSeconds, 1800);
    });

    test('constructor accepts custom values', () {
      final custom = CreateActorTokenRequest(
        userId: 'user_456',
        actor: actor,
        expiresInSeconds: 7200,
        sessionMaxDurationInSeconds: 3600,
      );
      expect(custom.expiresInSeconds, 7200);
      expect(custom.sessionMaxDurationInSeconds, 3600);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['user_id'], 'user_123');
      expect(json['expires_in_seconds'], 3600);
      expect(json['session_max_duration_in_seconds'], 1800);
    });

    test('fromJson returns null for non-map input', () {
      expect(CreateActorTokenRequest.fromJson('invalid'), isNull);
      expect(CreateActorTokenRequest.fromJson(123), isNull);
      expect(CreateActorTokenRequest.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(CreateActorTokenRequest.listFromJson([]), isEmpty);
      expect(CreateActorTokenRequest.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('CreateActorTokenRequest'));
      expect(str, contains('userId=user_123'));
    });

    test('requiredKeys contains required fields', () {
      expect(CreateActorTokenRequest.requiredKeys, contains('user_id'));
      expect(CreateActorTokenRequest.requiredKeys, contains('actor'));
    });
  });
}
