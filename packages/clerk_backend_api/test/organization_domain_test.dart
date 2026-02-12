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
  group('OrganizationDomain', () {
    late OrganizationDomain instance;

    setUp(() {
      instance = OrganizationDomain(
        object: OrganizationDomainObjectEnum.organizationDomain,
        id: 'orgdomain_123',
        organizationId: 'org_123',
        name: 'example.com',
        enrollmentMode: OrganizationDomainEnrollmentModeEnum.manualInvitation,
        affiliationEmailAddress: null,
        verification: null,
        totalPendingInvitations: 5,
        totalPendingSuggestions: 3,
        createdAt: 1234567890,
        updatedAt: 1234567890,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.id, 'orgdomain_123');
      expect(instance.object, OrganizationDomainObjectEnum.organizationDomain);
      expect(instance.organizationId, 'org_123');
      expect(instance.name, 'example.com');
      expect(instance.enrollmentMode, OrganizationDomainEnrollmentModeEnum.manualInvitation);
      expect(instance.totalPendingInvitations, 5);
      expect(instance.totalPendingSuggestions, 3);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['id'], 'orgdomain_123');
      expect(json['object'], OrganizationDomainObjectEnum.organizationDomain);
      expect(json['organization_id'], 'org_123');
      expect(json['name'], 'example.com');
      expect(json['enrollment_mode'], OrganizationDomainEnrollmentModeEnum.manualInvitation);
      expect(json['total_pending_invitations'], 5);
      expect(json['total_pending_suggestions'], 3);
    });

    test('fromJson returns null for non-map input', () {
      expect(OrganizationDomain.fromJson('invalid'), isNull);
      expect(OrganizationDomain.fromJson(123), isNull);
      expect(OrganizationDomain.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(OrganizationDomain.listFromJson([]), isEmpty);
      expect(OrganizationDomain.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('OrganizationDomain'));
      expect(str, contains('id=orgdomain_123'));
    });

    test('requiredKeys contains required fields', () {
      expect(OrganizationDomain.requiredKeys, contains('object'));
      expect(OrganizationDomain.requiredKeys, contains('id'));
      expect(OrganizationDomain.requiredKeys, contains('organization_id'));
      expect(OrganizationDomain.requiredKeys, contains('name'));
      expect(OrganizationDomain.requiredKeys, contains('enrollment_mode'));
    });

    test('enrollment mode enum values are correct', () {
      expect(OrganizationDomainEnrollmentModeEnum.manualInvitation.value, 'manual_invitation');
      expect(OrganizationDomainEnrollmentModeEnum.automaticInvitation.value, 'automatic_invitation');
      expect(OrganizationDomainEnrollmentModeEnum.automaticSuggestion.value, 'automatic_suggestion');
    });
  });
}
