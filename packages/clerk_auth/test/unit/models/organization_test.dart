import 'package:clerk_auth/src/models/client/organization.dart';
import 'package:clerk_auth/src/models/client/organization_invitation.dart';
import 'package:clerk_auth/src/models/client/organization_membership.dart';
import 'package:clerk_auth/src/models/client/permission.dart';
import 'package:clerk_auth/src/models/client/user_public.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/extensions.dart';

import '../../test_helpers.dart';

void main() {
  group('Organization', () {
    test('personal organization has empty id', () {
      expect(Organization.personal.id, '');
    });

    test('personal organization isPersonal returns true', () {
      expect(Organization.personal.isPersonal, true);
    });

    test('non-personal organization isPersonal returns false', () {
      const org = Organization(id: 'org_123', name: 'Test Org');
      expect(org.isPersonal, false);
    });

    test('hasUnlimitedMembership returns true when maxAllowedMemberships is 0', () {
      const org = Organization(maxAllowedMemberships: 0);
      expect(org.hasUnlimitedMembership, true);
    });

    test('hasUnlimitedMembership returns false when maxAllowedMemberships > 0', () {
      const org = Organization(maxAllowedMemberships: 10);
      expect(org.hasUnlimitedMembership, false);
    });

    test('fromJson creates organization from JSON', () {
      final json = {
        'id': 'org_123',
        'name': 'Test Organization',
        'max_allowed_memberships': 5,
        'admin_delete_enabled': true,
        'slug': 'test-org',
        'logo_url': 'https://example.com/logo.png',
        'image_url': 'https://example.com/image.png',
        'has_image': true,
        'members_count': 3,
        'pending_invitations_count': 2,
        'public_metadata': {'key': 'value'},
        'updated_at': 1700000000000,
        'created_at': 1699000000000,
      };

      final org = Organization.fromJson(json);

      expect(org.id, 'org_123');
      expect(org.name, 'Test Organization');
      expect(org.maxAllowedMemberships, 5);
      expect(org.adminDeleteEnabled, true);
      expect(org.slug, 'test-org');
      expect(org.hasImage, true);
      expect(org.membersCount, 3);
      expect(org.pendingInvitationsCount, 2);
    });

    test('toJson serializes organization', () {
      const org = Organization(
        id: 'org_456',
        name: 'Another Org',
        maxAllowedMemberships: 10,
      );

      final json = org.toJson();

      expect(json['id'], 'org_456');
      expect(json['name'], 'Another Org');
      expect(json['max_allowed_memberships'], 10);
    });
  });

  group('OrganizationInvitation', () {
    test('fromJson creates invitation from JSON', () {
      final json = <String, dynamic>{
        'id': 'inv_123',
        'status': 'pending',
        'role_name': 'admin',
        'public_organization_data': <String, dynamic>{
          'id': 'org_123',
          'name': 'Test Org',
          'max_allowed_memberships': 0,
          'admin_delete_enabled': false,
          'slug': '',
          'logo_url': '',
          'image_url': '',
          'has_image': false,
          'members_count': 0,
          'pending_invitations_count': 0,
          'public_metadata': <String, dynamic>{},
          'updated_at': 0,
          'created_at': 0,
        },
        'updated_at': 1700000000000,
        'created_at': 1699000000000,
      };

      final invitation = OrganizationInvitation.fromJson(json);

      expect(invitation.id, 'inv_123');
      expect(invitation.roleName, 'admin');
      expect(invitation.organization.id, 'org_123');
    });

    test('toJson serializes invitation', () {
      final invitation = OrganizationInvitation(
        id: 'inv_456',
        status: Status.pending,
        roleName: 'member',
        organization: const Organization(id: 'org_789', name: 'Org'),
        updatedAt: DateTimeExt.epoch,
        createdAt: DateTimeExt.epoch,
      );

      final json = invitation.toJson();

      expect(json['id'], 'inv_456');
      expect(json['role_name'], 'member');
    });
  });

  group('OrganizationMembership', () {
    test('hasPermission returns true when permission exists', () {
      final membership = OrganizationMembership(
        id: 'mem_123',
        role: 'admin',
        roleName: 'Admin',
        organization: const Organization(id: 'org_123'),
        publicUserData: null,
        permissions: [Permission.profileManage, Permission.membershipsRead],
        updatedAt: DateTimeExt.epoch,
        createdAt: DateTimeExt.epoch,
      );

      expect(membership.hasPermission(Permission.profileManage), true);
      expect(membership.hasPermission(Permission.membershipsRead), true);
    });

    test('hasPermission returns false when permission does not exist', () {
      final membership = OrganizationMembership(
        id: 'mem_123',
        role: 'member',
        roleName: 'Member',
        organization: const Organization(id: 'org_123'),
        publicUserData: null,
        permissions: [Permission.membershipsRead],
        updatedAt: DateTimeExt.epoch,
        createdAt: DateTimeExt.epoch,
      );

      expect(membership.hasPermission(Permission.profileManage), false);
      expect(membership.hasPermission(Permission.domainsManage), false);
    });
  });
}

