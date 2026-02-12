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
  group('Roles', () {
    late Roles instance;
    late Role role;

    setUp(() {
      role = Role(
        object: RoleObjectEnum.role,
        id: 'role_123',
        name: 'Admin',
        key: 'org:admin',
        description: 'Administrator role',
        isCreatorEligible: true,
        permissions: [],
        createdAt: 1234567890,
        updatedAt: 1234567890,
      );
      instance = Roles(
        data: [role],
        totalCount: 1,
      );
    });

    test('constructor creates instance with default values', () {
      final empty = Roles(totalCount: 0);
      expect(empty.data, isEmpty);
      expect(empty.totalCount, 0);
    });

    test('constructor creates instance with parameters', () {
      expect(instance.data.length, 1);
      expect(instance.data[0].name, 'Admin');
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
            'object': 'role',
            'id': 'role_456',
            'name': 'Member',
            'key': 'org:member',
            'description': 'Member role',
            'is_creator_eligible': false,
            'permissions': [],
            'created_at': 1234567890,
            'updated_at': 1234567890,
          }
        ],
        'total_count': 1,
      };
      final result = Roles.fromJson(json);
      expect(result, isNotNull);
      expect(result!.data.length, 1);
      expect(result.totalCount, 1);
    });

    test('fromJson returns null for non-map input', () {
      expect(Roles.fromJson('invalid'), isNull);
      expect(Roles.fromJson(123), isNull);
      expect(Roles.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Roles.listFromJson([]), isEmpty);
      expect(Roles.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('Roles'));
      expect(str, contains('totalCount=1'));
    });

    test('requiredKeys contains required fields', () {
      expect(Roles.requiredKeys, contains('data'));
      expect(Roles.requiredKeys, contains('total_count'));
    });
  });
}
