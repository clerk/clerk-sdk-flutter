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
  group('Organization', () {
    late Organization instance;
    late Map<String, Object> publicMetadata;
    late Map<String, Object> privateMetadata;

    setUp(() {
      publicMetadata = {'plan': 'enterprise'};
      privateMetadata = {'internal_id': 'int_123'};
      instance = Organization(
        object: OrganizationObjectEnum.organization,
        id: 'org_123',
        name: 'Acme Corp',
        slug: 'acme-corp',
        imageUrl: 'https://example.com/logo.png',
        hasImage: true,
        membersCount: 50,
        missingMemberWithElevatedPermissions: false,
        pendingInvitationsCount: 5,
        maxAllowedMemberships: 100,
        adminDeleteEnabled: true,
        publicMetadata: publicMetadata,
        privateMetadata: privateMetadata,
        createdBy: 'user_creator',
        createdAt: 1700000000,
        updatedAt: 1700000001,
        lastActiveAt: 1700000002,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, OrganizationObjectEnum.organization);
      expect(instance.id, 'org_123');
      expect(instance.name, 'Acme Corp');
      expect(instance.slug, 'acme-corp');
      expect(instance.hasImage, true);
      expect(instance.maxAllowedMemberships, 100);
      expect(instance.adminDeleteEnabled, true);
      expect(instance.createdAt, 1700000000);
      expect(instance.updatedAt, 1700000001);
    });

    test('constructor creates instance with optional parameters', () {
      expect(instance.imageUrl, 'https://example.com/logo.png');
      expect(instance.membersCount, 50);
      expect(instance.missingMemberWithElevatedPermissions, false);
      expect(instance.pendingInvitationsCount, 5);
      expect(instance.publicMetadata, publicMetadata);
      expect(instance.privateMetadata, privateMetadata);
      expect(instance.createdBy, 'user_creator');
      expect(instance.lastActiveAt, 1700000002);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], OrganizationObjectEnum.organization);
      expect(json['id'], 'org_123');
      expect(json['name'], 'Acme Corp');
      expect(json['slug'], 'acme-corp');
      expect(json['image_url'], 'https://example.com/logo.png');
      expect(json['has_image'], true);
      expect(json['members_count'], 50);
      expect(json['missing_member_with_elevated_permissions'], false);
      expect(json['pending_invitations_count'], 5);
      expect(json['max_allowed_memberships'], 100);
      expect(json['admin_delete_enabled'], true);
      expect(json['public_metadata'], publicMetadata);
      expect(json['private_metadata'], privateMetadata);
      expect(json['created_by'], 'user_creator');
      expect(json['created_at'], 1700000000);
      expect(json['updated_at'], 1700000001);
      expect(json['last_active_at'], 1700000002);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'organization',
        'id': 'org_456',
        'name': 'Parsed Org',
        'slug': 'parsed-org',
        'has_image': false,
        'max_allowed_memberships': 50,
        'admin_delete_enabled': false,
        'public_metadata': {'key': 'value'},
        'created_at': 1700000002,
        'updated_at': 1700000003,
      };
      final parsed = Organization.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.object, OrganizationObjectEnum.organization);
      expect(parsed.id, 'org_456');
      expect(parsed.name, 'Parsed Org');
      expect(parsed.slug, 'parsed-org');
      expect(parsed.hasImage, false);
      expect(parsed.maxAllowedMemberships, 50);
      expect(parsed.adminDeleteEnabled, false);
    });

    test('fromJson returns null for non-map input', () {
      expect(Organization.fromJson('not a map'), isNull);
      expect(Organization.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'object': 'organization', 'id': 'org_1', 'name': 'Org 1', 'slug': 'org-1', 'has_image': false, 'max_allowed_memberships': 10, 'admin_delete_enabled': true, 'public_metadata': {}, 'created_at': 1, 'updated_at': 2},
        {'object': 'organization', 'id': 'org_2', 'name': 'Org 2', 'slug': 'org-2', 'has_image': true, 'max_allowed_memberships': 20, 'admin_delete_enabled': false, 'public_metadata': {}, 'created_at': 3, 'updated_at': 4},
      ];
      final list = Organization.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].id, 'org_1');
      expect(list[1].id, 'org_2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Organization.listFromJson([]), isEmpty);
      expect(Organization.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = Organization(
        object: OrganizationObjectEnum.organization,
        id: 'org_123',
        name: 'Acme Corp',
        slug: 'acme-corp',
        imageUrl: 'https://example.com/logo.png',
        hasImage: true,
        membersCount: 50,
        missingMemberWithElevatedPermissions: false,
        pendingInvitationsCount: 5,
        maxAllowedMemberships: 100,
        adminDeleteEnabled: true,
        publicMetadata: publicMetadata,
        privateMetadata: privateMetadata,
        createdBy: 'user_creator',
        createdAt: 1700000000,
        updatedAt: 1700000001,
        lastActiveAt: 1700000002,
      );
      final different = Organization(
        object: OrganizationObjectEnum.organization,
        id: 'org_different',
        name: 'Different Org',
        slug: 'different-org',
        hasImage: false,
        maxAllowedMemberships: 10,
        adminDeleteEnabled: false,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('Organization'));
      expect(str, contains('org_123'));
      expect(str, contains('Acme Corp'));
    });

    test('requiredKeys contains required fields', () {
      expect(Organization.requiredKeys, contains('object'));
      expect(Organization.requiredKeys, contains('id'));
      expect(Organization.requiredKeys, contains('name'));
      expect(Organization.requiredKeys, contains('slug'));
      expect(Organization.requiredKeys, contains('has_image'));
      expect(Organization.requiredKeys, contains('max_allowed_memberships'));
      expect(Organization.requiredKeys, contains('admin_delete_enabled'));
      expect(Organization.requiredKeys, contains('public_metadata'));
      expect(Organization.requiredKeys, contains('created_at'));
      expect(Organization.requiredKeys, contains('updated_at'));
    });
  });

  group('OrganizationObjectEnum', () {
    test('values contains all enum values', () {
      expect(OrganizationObjectEnum.values, contains(OrganizationObjectEnum.organization));
    });

    test('toJson returns correct string', () {
      expect(OrganizationObjectEnum.organization.toJson(), 'organization');
    });

    test('fromJson parses correct value', () {
      expect(OrganizationObjectEnum.fromJson('organization'), OrganizationObjectEnum.organization);
    });

    test('fromJson returns null for unknown value', () {
      expect(OrganizationObjectEnum.fromJson('unknown'), isNull);
    });
  });
}
