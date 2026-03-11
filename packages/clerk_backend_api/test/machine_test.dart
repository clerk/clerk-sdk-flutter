//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:clerk_backend_api/api.dart';
import 'package:test/test.dart';

void main() {
  group('Machine', () {
    late Machine instance;

    setUp(() {
      instance = Machine(
        object: MachineObjectEnum.machine,
        id: 'machine_123',
        name: 'Test Machine',
        instanceId: 'inst_123',
        createdAt: 1234567890,
        updatedAt: 1234567890,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.id, 'machine_123');
      expect(instance.object, MachineObjectEnum.machine);
      expect(instance.name, 'Test Machine');
      expect(instance.instanceId, 'inst_123');
      expect(instance.createdAt, 1234567890);
      expect(instance.updatedAt, 1234567890);
    });

    test('constructor uses default values', () {
      expect(instance.defaultTokenTtl, 3600);
      expect(instance.scopedMachines, isEmpty);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['id'], 'machine_123');
      expect(json['object'], MachineObjectEnum.machine);
      expect(json['name'], 'Test Machine');
      expect(json['instance_id'], 'inst_123');
      expect(json['default_token_ttl'], 3600);
    });

    test('fromJson returns null for non-map input', () {
      expect(Machine.fromJson('invalid'), isNull);
      expect(Machine.fromJson(123), isNull);
      expect(Machine.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Machine.listFromJson([]), isEmpty);
      expect(Machine.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('Machine'));
      expect(str, contains('id=machine_123'));
    });

    test('requiredKeys contains required fields', () {
      expect(Machine.requiredKeys, contains('object'));
      expect(Machine.requiredKeys, contains('id'));
      expect(Machine.requiredKeys, contains('name'));
      expect(Machine.requiredKeys, contains('instance_id'));
    });
  });
}
