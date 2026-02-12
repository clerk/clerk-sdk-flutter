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
  group('OrganizationMembership', () {
    late OrganizationMembership instance;
    late Organization testOrg;

    setUp(() {
      testOrg = Organization(
        id: 'org_123',
        object: OrganizationObjectEnum.organization,
        name: 'Test Org',
        slug: 'test-org',
        hasImage: false,
        membersCount: 5,
        maxAllowedMemberships: 100,
        adminDeleteEnabled: true,
        publicMetadata: {},
        createdAt: 1700000000,
        updatedAt: 1700001000,
      );

      instance = OrganizationMembership(
        id: 'mem_123',
        object: OrganizationMembershipObjectEnum.organizationMembership,
        role: 'admin',
        roleName: 'Administrator',
        permissions: ['read', 'write', 'delete'],
        publicMetadata: {'key': 'value'},
        privateMetadata: {'secret': 'data'},
        organization: testOrg,
        createdAt: 1700000000,
        updatedAt: 1700001000,
      );
    });

    test('constructor creates instance with required parameters', () {
      final minimal = OrganizationMembership(
        id: 'mem_1',
        object: OrganizationMembershipObjectEnum.organizationMembership,
        role: 'member',
        permissions: [],
        publicMetadata: {},
        organization: testOrg,
        createdAt: 1700000000,
        updatedAt: 1700001000,
      );
      expect(minimal.id, 'mem_1');
      expect(minimal.role, 'member');
      expect(minimal.roleName, isNull);
      expect(minimal.permissions, isEmpty);
      expect(minimal.privateMetadata, isEmpty);
      expect(minimal.publicUserData, isNull);
    });

    test('constructor creates instance with all parameters', () {
      expect(instance.id, 'mem_123');
      expect(instance.object, OrganizationMembershipObjectEnum.organizationMembership);
      expect(instance.role, 'admin');
      expect(instance.roleName, 'Administrator');
      expect(instance.permissions, ['read', 'write', 'delete']);
      expect(instance.publicMetadata, {'key': 'value'});
      expect(instance.privateMetadata, {'secret': 'data'});
      expect(instance.organization.id, 'org_123');
      expect(instance.createdAt, 1700000000);
      expect(instance.updatedAt, 1700001000);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['id'], 'mem_123');
      expect(json['object'], OrganizationMembershipObjectEnum.organizationMembership);
      expect(json['role'], 'admin');
      expect(json['role_name'], 'Administrator');
      expect(json['permissions'], ['read', 'write', 'delete']);
      expect(json['public_metadata'], {'key': 'value'});
      expect(json['private_metadata'], {'secret': 'data'});
      expect(json['created_at'], 1700000000);
      expect(json['updated_at'], 1700001000);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'id': 'mem_456',
        'object': 'organization_membership',
        'role': 'member',
        'role_name': 'Member',
        'permissions': ['read'],
        'public_metadata': {'foo': 'bar'},
        'private_metadata': {},
        'organization': {
          'id': 'org_456',
          'object': 'organization',
          'name': 'Another Org',
          'slug': 'another-org',
          'has_image': true,
          'members_count': 10,
          'max_allowed_memberships': 50,
          'admin_delete_enabled': false,
          'public_metadata': {},
          'created_at': 1600000000,
          'updated_at': 1600001000,
        },
        'created_at': 1600000000,
        'updated_at': 1600001000,
      };
      final result = OrganizationMembership.fromJson(json);
      expect(result, isNotNull);
      expect(result!.id, 'mem_456');
      expect(result.role, 'member');
      expect(result.roleName, 'Member');
      expect(result.organization.id, 'org_456');
    });

    test('fromJson returns null for non-map input', () {
      expect(OrganizationMembership.fromJson('invalid'), isNull);
      expect(OrganizationMembership.fromJson(123), isNull);
      expect(OrganizationMembership.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(OrganizationMembership.listFromJson([]), isEmpty);
      expect(OrganizationMembership.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('OrganizationMembership'));
      expect(str, contains('id=mem_123'));
      expect(str, contains('role=admin'));
    });

    test('requiredKeys contains required fields', () {
      expect(OrganizationMembership.requiredKeys, contains('id'));
      expect(OrganizationMembership.requiredKeys, contains('object'));
      expect(OrganizationMembership.requiredKeys, contains('role'));
      expect(OrganizationMembership.requiredKeys, contains('permissions'));
      expect(OrganizationMembership.requiredKeys, contains('public_metadata'));
      expect(OrganizationMembership.requiredKeys, contains('organization'));
      expect(OrganizationMembership.requiredKeys, contains('created_at'));
      expect(OrganizationMembership.requiredKeys, contains('updated_at'));
    });
  });

  group('OrganizationMembershipObjectEnum', () {
    test('values contains all enum values', () {
      expect(OrganizationMembershipObjectEnum.values, contains(OrganizationMembershipObjectEnum.organizationMembership));
    });

    test('toJson returns correct string', () {
      expect(OrganizationMembershipObjectEnum.organizationMembership.toJson(), 'organization_membership');
    });

    test('fromJson parses correct value', () {
      expect(OrganizationMembershipObjectEnum.fromJson('organization_membership'), OrganizationMembershipObjectEnum.organizationMembership);
    });

    test('fromJson returns null for unknown value', () {
      expect(OrganizationMembershipObjectEnum.fromJson('unknown'), isNull);
    });
  });
}
