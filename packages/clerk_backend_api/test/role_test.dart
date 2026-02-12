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
  group('Role', () {
    late Role instance;
    late List<Permission> permissions;

    setUp(() {
      permissions = [
        Permission(
          object: PermissionObjectEnum.permission,
          id: 'perm_1',
          name: 'Read',
          key: 'org:read',
          description: 'Read access',
          type: 'system',
          createdAt: 1700000000,
          updatedAt: 1700000001,
        ),
      ];
      instance = Role(
        object: RoleObjectEnum.role,
        id: 'role_123',
        name: 'Admin',
        key: 'org:admin',
        description: 'Administrator role',
        isCreatorEligible: true,
        permissions: permissions,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, RoleObjectEnum.role);
      expect(instance.id, 'role_123');
      expect(instance.name, 'Admin');
      expect(instance.key, 'org:admin');
      expect(instance.description, 'Administrator role');
      expect(instance.isCreatorEligible, true);
      expect(instance.createdAt, 1700000000);
      expect(instance.updatedAt, 1700000001);
    });

    test('constructor creates instance with optional parameters', () {
      expect(instance.permissions, permissions);
      expect(instance.permissions.length, 1);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], RoleObjectEnum.role);
      expect(json['id'], 'role_123');
      expect(json['name'], 'Admin');
      expect(json['key'], 'org:admin');
      expect(json['description'], 'Administrator role');
      expect(json['is_creator_eligible'], true);
      expect(json['permissions'], isNotEmpty);
      expect(json['created_at'], 1700000000);
      expect(json['updated_at'], 1700000001);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'role',
        'id': 'role_456',
        'name': 'Member',
        'key': 'org:member',
        'description': 'Member role',
        'is_creator_eligible': false,
        'permissions': [],
        'created_at': 1700000002,
        'updated_at': 1700000003,
      };
      final parsed = Role.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.object, RoleObjectEnum.role);
      expect(parsed.id, 'role_456');
      expect(parsed.name, 'Member');
      expect(parsed.key, 'org:member');
      expect(parsed.isCreatorEligible, false);
    });

    test('fromJson returns null for non-map input', () {
      expect(Role.fromJson('not a map'), isNull);
      expect(Role.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'object': 'role', 'id': 'r1', 'name': 'Role 1', 'key': 'k1', 'description': 'd1', 'is_creator_eligible': true, 'permissions': [], 'created_at': 1, 'updated_at': 2},
        {'object': 'role', 'id': 'r2', 'name': 'Role 2', 'key': 'k2', 'description': 'd2', 'is_creator_eligible': false, 'permissions': [], 'created_at': 3, 'updated_at': 4},
      ];
      final list = Role.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].id, 'r1');
      expect(list[1].id, 'r2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Role.listFromJson([]), isEmpty);
      expect(Role.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = Role(
        object: RoleObjectEnum.role,
        id: 'role_123',
        name: 'Admin',
        key: 'org:admin',
        description: 'Administrator role',
        isCreatorEligible: true,
        permissions: permissions,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      final different = Role(
        object: RoleObjectEnum.role,
        id: 'role_different',
        name: 'Different',
        key: 'different:key',
        description: 'Different description',
        isCreatorEligible: false,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('Role'));
      expect(str, contains('role_123'));
      expect(str, contains('Admin'));
    });

    test('requiredKeys contains required fields', () {
      expect(Role.requiredKeys, contains('object'));
      expect(Role.requiredKeys, contains('id'));
      expect(Role.requiredKeys, contains('name'));
      expect(Role.requiredKeys, contains('key'));
      expect(Role.requiredKeys, contains('description'));
      expect(Role.requiredKeys, contains('is_creator_eligible'));
      expect(Role.requiredKeys, contains('permissions'));
      expect(Role.requiredKeys, contains('created_at'));
      expect(Role.requiredKeys, contains('updated_at'));
    });
  });

  group('RoleObjectEnum', () {
    test('values contains all enum values', () {
      expect(RoleObjectEnum.values, contains(RoleObjectEnum.role));
    });

    test('toJson returns correct string', () {
      expect(RoleObjectEnum.role.toJson(), 'role');
    });

    test('fromJson parses correct value', () {
      expect(RoleObjectEnum.fromJson('role'), RoleObjectEnum.role);
    });

    test('fromJson returns null for unknown value', () {
      expect(RoleObjectEnum.fromJson('unknown'), isNull);
    });
  });
}
