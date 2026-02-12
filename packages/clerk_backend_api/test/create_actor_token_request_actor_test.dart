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
  group('CreateActorTokenRequestActor', () {
    late CreateActorTokenRequestActor instance;

    setUp(() {
      instance = CreateActorTokenRequestActor(sub: 'admin_user_123');
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.sub, 'admin_user_123');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['sub'], 'admin_user_123');
    });

    test('fromJson creates instance from map', () {
      final json = {'sub': 'admin_user_456'};
      final result = CreateActorTokenRequestActor.fromJson(json);
      expect(result, isNotNull);
      expect(result!.sub, 'admin_user_456');
    });

    test('fromJson returns null for non-map input', () {
      expect(CreateActorTokenRequestActor.fromJson('invalid'), isNull);
      expect(CreateActorTokenRequestActor.fromJson(123), isNull);
      expect(CreateActorTokenRequestActor.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(CreateActorTokenRequestActor.listFromJson([]), isEmpty);
      expect(CreateActorTokenRequestActor.listFromJson(null), isEmpty);
    });

    test('equality works correctly', () {
      final other = CreateActorTokenRequestActor(sub: 'admin_user_123');
      expect(instance, equals(other));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('CreateActorTokenRequestActor'));
      expect(str, contains('sub=admin_user_123'));
    });

    test('requiredKeys contains required fields', () {
      expect(CreateActorTokenRequestActor.requiredKeys, contains('sub'));
    });
  });
}
