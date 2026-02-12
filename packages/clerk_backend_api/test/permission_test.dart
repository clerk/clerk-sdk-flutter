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
  group('Permission', () {
    late Permission instance;

    setUp(() {
      instance = Permission(
        object: PermissionObjectEnum.permission,
        id: 'perm_123',
        name: 'Read Users',
        key: 'org:users:read',
        description: 'Allows reading user data',
        type: 'system',
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, PermissionObjectEnum.permission);
      expect(instance.id, 'perm_123');
      expect(instance.name, 'Read Users');
      expect(instance.key, 'org:users:read');
      expect(instance.description, 'Allows reading user data');
      expect(instance.type, 'system');
      expect(instance.createdAt, 1700000000);
      expect(instance.updatedAt, 1700000001);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], PermissionObjectEnum.permission);
      expect(json['id'], 'perm_123');
      expect(json['name'], 'Read Users');
      expect(json['key'], 'org:users:read');
      expect(json['description'], 'Allows reading user data');
      expect(json['type'], 'system');
      expect(json['created_at'], 1700000000);
      expect(json['updated_at'], 1700000001);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'permission',
        'id': 'perm_456',
        'name': 'Write Users',
        'key': 'org:users:write',
        'description': 'Allows writing user data',
        'type': 'custom',
        'created_at': 1700000002,
        'updated_at': 1700000003,
      };
      final parsed = Permission.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.object, PermissionObjectEnum.permission);
      expect(parsed.id, 'perm_456');
      expect(parsed.name, 'Write Users');
      expect(parsed.key, 'org:users:write');
      expect(parsed.description, 'Allows writing user data');
      expect(parsed.type, 'custom');
    });

    test('fromJson returns null for non-map input', () {
      expect(Permission.fromJson('not a map'), isNull);
      expect(Permission.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'object': 'permission', 'id': 'p1', 'name': 'Perm 1', 'key': 'k1', 'description': 'd1', 'type': 't1', 'created_at': 1, 'updated_at': 2},
        {'object': 'permission', 'id': 'p2', 'name': 'Perm 2', 'key': 'k2', 'description': 'd2', 'type': 't2', 'created_at': 3, 'updated_at': 4},
      ];
      final list = Permission.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].id, 'p1');
      expect(list[1].id, 'p2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Permission.listFromJson([]), isEmpty);
      expect(Permission.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = Permission(
        object: PermissionObjectEnum.permission,
        id: 'perm_123',
        name: 'Read Users',
        key: 'org:users:read',
        description: 'Allows reading user data',
        type: 'system',
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      final different = Permission(
        object: PermissionObjectEnum.permission,
        id: 'perm_different',
        name: 'Different',
        key: 'different:key',
        description: 'Different description',
        type: 'custom',
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      final same = Permission(
        object: PermissionObjectEnum.permission,
        id: 'perm_123',
        name: 'Read Users',
        key: 'org:users:read',
        description: 'Allows reading user data',
        type: 'system',
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      expect(instance.hashCode, equals(same.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('Permission'));
      expect(str, contains('perm_123'));
      expect(str, contains('Read Users'));
    });

    test('requiredKeys contains required fields', () {
      expect(Permission.requiredKeys, contains('object'));
      expect(Permission.requiredKeys, contains('id'));
      expect(Permission.requiredKeys, contains('name'));
      expect(Permission.requiredKeys, contains('key'));
      expect(Permission.requiredKeys, contains('description'));
      expect(Permission.requiredKeys, contains('type'));
      expect(Permission.requiredKeys, contains('created_at'));
      expect(Permission.requiredKeys, contains('updated_at'));
    });
  });

  group('PermissionObjectEnum', () {
    test('values contains all enum values', () {
      expect(PermissionObjectEnum.values, contains(PermissionObjectEnum.permission));
    });

    test('toJson returns correct string', () {
      expect(PermissionObjectEnum.permission.toJson(), 'permission');
    });

    test('fromJson parses correct value', () {
      expect(PermissionObjectEnum.fromJson('permission'), PermissionObjectEnum.permission);
    });

    test('fromJson returns null for unknown value', () {
      expect(PermissionObjectEnum.fromJson('unknown'), isNull);
    });
  });
}
