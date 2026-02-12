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
  group('OrganizationSettings', () {
    late OrganizationSettings instance;

    setUp(() {
      instance = OrganizationSettings(
        object: OrganizationSettingsObjectEnum.organizationSettings,
        enabled: true,
        maxAllowedMemberships: 100,
        maxAllowedRoles: 10,
        maxRoleSetsAllowed: 5,
        maxAllowedPermissions: 50,
        creatorRole: 'admin',
        adminDeleteEnabled: true,
        domainsEnabled: true,
        slugDisabled: false,
        domainsEnrollmentModes: [
          OrganizationSettingsDomainsEnrollmentModesEnum.manualInvitation,
          OrganizationSettingsDomainsEnrollmentModesEnum.automaticInvitation,
        ],
        domainsDefaultRole: 'member',
        initialRoleSetKey: 'default_set',
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, OrganizationSettingsObjectEnum.organizationSettings);
      expect(instance.enabled, true);
      expect(instance.maxAllowedMemberships, 100);
      expect(instance.maxAllowedRoles, 10);
      expect(instance.creatorRole, 'admin');
      expect(instance.adminDeleteEnabled, true);
      expect(instance.domainsEnabled, true);
      expect(instance.domainsDefaultRole, 'member');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], OrganizationSettingsObjectEnum.organizationSettings);
      expect(json['enabled'], true);
      expect(json['max_allowed_memberships'], 100);
      expect(json['max_allowed_roles'], 10);
      expect(json['creator_role'], 'admin');
      expect(json['admin_delete_enabled'], true);
      expect(json['domains_enabled'], true);
      expect(json['domains_default_role'], 'member');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'organization_settings',
        'enabled': false,
        'max_allowed_memberships': 50,
        'max_allowed_roles': 5,
        'creator_role': 'owner',
        'admin_delete_enabled': false,
        'domains_enabled': false,
        'domains_enrollment_modes': ['manual_invitation'],
        'domains_default_role': 'viewer',
      };
      final result = OrganizationSettings.fromJson(json);
      expect(result, isNotNull);
      expect(result!.enabled, false);
      expect(result.maxAllowedMemberships, 50);
      expect(result.creatorRole, 'owner');
      expect(result.domainsDefaultRole, 'viewer');
    });

    test('fromJson returns null for non-map input', () {
      expect(OrganizationSettings.fromJson('invalid'), isNull);
      expect(OrganizationSettings.fromJson(123), isNull);
      expect(OrganizationSettings.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(OrganizationSettings.listFromJson([]), isEmpty);
      expect(OrganizationSettings.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('OrganizationSettings'));
      expect(str, contains('enabled=true'));
      expect(str, contains('creatorRole=admin'));
    });

    test('requiredKeys contains required fields', () {
      expect(OrganizationSettings.requiredKeys, contains('object'));
      expect(OrganizationSettings.requiredKeys, contains('enabled'));
      expect(OrganizationSettings.requiredKeys, contains('max_allowed_memberships'));
      expect(OrganizationSettings.requiredKeys, contains('creator_role'));
    });
  });

  group('OrganizationSettingsObjectEnum', () {
    test('values contains all enum values', () {
      expect(OrganizationSettingsObjectEnum.values, contains(OrganizationSettingsObjectEnum.organizationSettings));
    });

    test('toJson returns correct string', () {
      expect(OrganizationSettingsObjectEnum.organizationSettings.toJson(), 'organization_settings');
    });

    test('fromJson parses correct value', () {
      expect(OrganizationSettingsObjectEnum.fromJson('organization_settings'), OrganizationSettingsObjectEnum.organizationSettings);
    });

    test('fromJson returns null for unknown value', () {
      expect(OrganizationSettingsObjectEnum.fromJson('unknown'), isNull);
    });
  });

  group('OrganizationSettingsDomainsEnrollmentModesEnum', () {
    test('values contains all enum values', () {
      expect(OrganizationSettingsDomainsEnrollmentModesEnum.values, contains(OrganizationSettingsDomainsEnrollmentModesEnum.manualInvitation));
      expect(OrganizationSettingsDomainsEnrollmentModesEnum.values, contains(OrganizationSettingsDomainsEnrollmentModesEnum.automaticInvitation));
      expect(OrganizationSettingsDomainsEnrollmentModesEnum.values, contains(OrganizationSettingsDomainsEnrollmentModesEnum.automaticSuggestion));
    });

    test('toJson returns correct string', () {
      expect(OrganizationSettingsDomainsEnrollmentModesEnum.manualInvitation.toJson(), 'manual_invitation');
      expect(OrganizationSettingsDomainsEnrollmentModesEnum.automaticInvitation.toJson(), 'automatic_invitation');
    });

    test('fromJson parses correct value', () {
      expect(OrganizationSettingsDomainsEnrollmentModesEnum.fromJson('manual_invitation'), OrganizationSettingsDomainsEnrollmentModesEnum.manualInvitation);
    });
  });
}
