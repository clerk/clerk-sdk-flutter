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
  group('Permissions', () {
    late Permissions instance;
    late Permission permission;

    setUp(() {
      permission = Permission(
        object: PermissionObjectEnum.permission,
        id: 'perm_123',
        name: 'Read Users',
        key: 'org:users:read',
        description: 'Can read user data',
        type: 'user',
        createdAt: 1234567890,
        updatedAt: 1234567890,
      );
      instance = Permissions(
        data: [permission],
        totalCount: 1,
      );
    });

    test('constructor creates instance with default values', () {
      final empty = Permissions(totalCount: 0);
      expect(empty.data, isEmpty);
      expect(empty.totalCount, 0);
    });

    test('constructor creates instance with parameters', () {
      expect(instance.data.length, 1);
      expect(instance.data[0].name, 'Read Users');
      expect(instance.totalCount, 1);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['data'], isA<List>());
      expect(json['total_count'], 1);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'data': [
          {
            'object': 'permission',
            'id': 'perm_456',
            'name': 'Write Users',
            'key': 'org:users:write',
            'description': 'Can write user data',
            'type': 'user',
            'created_at': 1234567890,
            'updated_at': 1234567890,
          }
        ],
        'total_count': 1,
      };
      final result = Permissions.fromJson(json);
      expect(result, isNotNull);
      expect(result!.data.length, 1);
      expect(result.totalCount, 1);
    });

    test('fromJson returns null for non-map input', () {
      expect(Permissions.fromJson('invalid'), isNull);
      expect(Permissions.fromJson(123), isNull);
      expect(Permissions.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Permissions.listFromJson([]), isEmpty);
      expect(Permissions.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('Permissions'));
      expect(str, contains('totalCount=1'));
    });

    test('requiredKeys contains required fields', () {
      expect(Permissions.requiredKeys, contains('data'));
      expect(Permissions.requiredKeys, contains('total_count'));
    });
  });
}
