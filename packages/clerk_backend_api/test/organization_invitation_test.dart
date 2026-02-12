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
  group('OrganizationInvitation', () {
    late OrganizationInvitation instance;

    setUp(() {
      instance = OrganizationInvitation(
        object: OrganizationInvitationObjectEnum.organizationInvitation,
        id: 'inv_123',
        emailAddress: 'test@example.com',
        role: 'admin',
        roleName: 'Administrator',
        organizationId: 'org_123',
        inviterId: 'user_123',
        publicInviterData: null,
        status: 'pending',
        publicMetadata: {'key': 'value'},
        privateMetadata: {'secret': 'data'},
        url: 'https://example.com/invite/abc',
        expiresAt: 1700100000,
        createdAt: 1700000000,
        updatedAt: 1700001000,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.id, 'inv_123');
      expect(instance.object, OrganizationInvitationObjectEnum.organizationInvitation);
      expect(instance.emailAddress, 'test@example.com');
      expect(instance.role, 'admin');
      expect(instance.roleName, 'Administrator');
      expect(instance.organizationId, 'org_123');
      expect(instance.inviterId, 'user_123');
      expect(instance.status, 'pending');
      expect(instance.url, 'https://example.com/invite/abc');
      expect(instance.expiresAt, 1700100000);
      expect(instance.createdAt, 1700000000);
      expect(instance.updatedAt, 1700001000);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], OrganizationInvitationObjectEnum.organizationInvitation);
      expect(json['id'], 'inv_123');
      expect(json['email_address'], 'test@example.com');
      expect(json['role'], 'admin');
      expect(json['role_name'], 'Administrator');
      expect(json['organization_id'], 'org_123');
      expect(json['inviter_id'], 'user_123');
      expect(json['status'], 'pending');
      expect(json['url'], 'https://example.com/invite/abc');
      expect(json['expires_at'], 1700100000);
      expect(json['created_at'], 1700000000);
      expect(json['updated_at'], 1700001000);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'organization_invitation',
        'id': 'inv_456',
        'email_address': 'other@example.com',
        'role': 'member',
        'role_name': 'Member',
        'organization_id': 'org_456',
        'inviter_id': 'user_456',
        'public_inviter_data': {
          'user_id': 'user_456',
          'first_name': 'John',
          'last_name': 'Doe',
          'image_url': 'https://example.com/image.png',
          'has_image': true,
          'identifier': 'john@example.com',
        },
        'status': 'accepted',
        'public_metadata': {},
        'private_metadata': {},
        'url': 'https://example.com/invite/xyz',
        'expires_at': 1600100000,
        'created_at': 1600000000,
        'updated_at': 1600001000,
      };
      final result = OrganizationInvitation.fromJson(json);
      expect(result, isNotNull);
      expect(result!.id, 'inv_456');
      expect(result.emailAddress, 'other@example.com');
      expect(result.role, 'member');
      expect(result.status, 'accepted');
    });

    test('fromJson returns null for non-map input', () {
      expect(OrganizationInvitation.fromJson('invalid'), isNull);
      expect(OrganizationInvitation.fromJson(123), isNull);
      expect(OrganizationInvitation.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(OrganizationInvitation.listFromJson([]), isEmpty);
      expect(OrganizationInvitation.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('OrganizationInvitation'));
      expect(str, contains('id=inv_123'));
      expect(str, contains('emailAddress=test@example.com'));
    });

    test('requiredKeys contains required fields', () {
      expect(OrganizationInvitation.requiredKeys, contains('object'));
      expect(OrganizationInvitation.requiredKeys, contains('id'));
      expect(OrganizationInvitation.requiredKeys, contains('email_address'));
      expect(OrganizationInvitation.requiredKeys, contains('role'));
      expect(OrganizationInvitation.requiredKeys, contains('role_name'));
    });
  });

  group('OrganizationInvitationObjectEnum', () {
    test('values contains all enum values', () {
      expect(OrganizationInvitationObjectEnum.values, contains(OrganizationInvitationObjectEnum.organizationInvitation));
    });

    test('toJson returns correct string', () {
      expect(OrganizationInvitationObjectEnum.organizationInvitation.toJson(), 'organization_invitation');
    });

    test('fromJson parses correct value', () {
      expect(OrganizationInvitationObjectEnum.fromJson('organization_invitation'), OrganizationInvitationObjectEnum.organizationInvitation);
    });

    test('fromJson returns null for unknown value', () {
      expect(OrganizationInvitationObjectEnum.fromJson('unknown'), isNull);
    });
  });
}
