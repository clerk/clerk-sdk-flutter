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
  group('Instance', () {
    late Instance instance;

    setUp(() {
      instance = Instance(
        object: InstanceObjectEnum.instance,
        id: 'inst_123',
        environmentType: 'development',
        allowedOrigins: ['https://example.com'],
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.id, 'inst_123');
      expect(instance.object, InstanceObjectEnum.instance);
      expect(instance.environmentType, 'development');
      expect(instance.allowedOrigins, ['https://example.com']);
    });

    test('constructor uses default values', () {
      final inst = Instance(
        object: InstanceObjectEnum.instance,
        id: 'inst_456',
        environmentType: 'production',
      );
      expect(inst.allowedOrigins, isEmpty);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['id'], 'inst_123');
      expect(json['object'], InstanceObjectEnum.instance);
      expect(json['environment_type'], 'development');
      expect(json['allowed_origins'], ['https://example.com']);
    });

    test('fromJson returns null for non-map input', () {
      expect(Instance.fromJson('invalid'), isNull);
      expect(Instance.fromJson(123), isNull);
      expect(Instance.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Instance.listFromJson([]), isEmpty);
      expect(Instance.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('Instance'));
      expect(str, contains('id=inst_123'));
    });

    test('requiredKeys contains required fields', () {
      expect(Instance.requiredKeys, contains('object'));
      expect(Instance.requiredKeys, contains('id'));
      expect(Instance.requiredKeys, contains('environment_type'));
    });
  });
}
