import 'package:clerk_auth/src/models/client/organization_domain.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/client/verification.dart';
import 'package:clerk_auth/src/models/enums.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/extensions.dart';

import '../../test_helpers.dart';

void main() {
  group('OrganizationDomain', () {
    test('isVerified returns true when verification status is verified', () {
      final domain = OrganizationDomain(
        id: 'dom_123',
        orgId: 'org_123',
        name: 'example.com',
        enrollmentMode: EnrollmentMode.automaticInvitation,
        affiliationEmailAddress: 'admin@example.com',
        verification: Verification(
          status: Status.verified,
          strategy: Strategy.emailCode,
          attempts: 0,
          expireAt: DateTime.now().add(const Duration(hours: 1)),
        ),
        totalPendingInvitations: 0,
        totalPendingSuggestions: 0,
        updatedAt: DateTimeExt.epoch,
        createdAt: DateTimeExt.epoch,
      );

      expect(domain.isVerified, true);
    });

    test('isVerified returns false when verification status is not verified', () {
      final domain = OrganizationDomain(
        id: 'dom_123',
        orgId: 'org_123',
        name: 'example.com',
        enrollmentMode: EnrollmentMode.automaticInvitation,
        affiliationEmailAddress: null,
        verification: Verification(
          status: Status.pending,
          strategy: Strategy.emailCode,
          attempts: 0,
          expireAt: DateTime.now().add(const Duration(hours: 1)),
        ),
        totalPendingInvitations: 5,
        totalPendingSuggestions: 3,
        updatedAt: DateTimeExt.epoch,
        createdAt: DateTimeExt.epoch,
      );

      expect(domain.isVerified, false);
    });

    test('isVerified returns false when verification is null', () {
      final domain = OrganizationDomain(
        id: 'dom_123',
        orgId: 'org_123',
        name: 'example.com',
        enrollmentMode: EnrollmentMode.manualInvitation,
        affiliationEmailAddress: null,
        verification: null,
        totalPendingInvitations: 0,
        totalPendingSuggestions: 0,
        updatedAt: DateTimeExt.epoch,
        createdAt: DateTimeExt.epoch,
      );

      expect(domain.isVerified, false);
    });

    test('equality is based on id', () {
      final domain1 = OrganizationDomain(
        id: 'dom_123',
        orgId: 'org_123',
        name: 'example.com',
        enrollmentMode: EnrollmentMode.automaticInvitation,
        affiliationEmailAddress: null,
        verification: null,
        totalPendingInvitations: 0,
        totalPendingSuggestions: 0,
        updatedAt: DateTimeExt.epoch,
        createdAt: DateTimeExt.epoch,
      );

      final domain2 = OrganizationDomain(
        id: 'dom_123',
        orgId: 'org_456',
        name: 'different.com',
        enrollmentMode: EnrollmentMode.manualInvitation,
        affiliationEmailAddress: 'test@test.com',
        verification: null,
        totalPendingInvitations: 10,
        totalPendingSuggestions: 5,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now(),
      );

      expect(domain1 == domain2, true);
      expect(domain1.hashCode, domain2.hashCode);
    });

    test('fromJson creates domain from JSON', () {
      final json = <String, dynamic>{
        'id': 'dom_456',
        'organization_id': 'org_789',
        'name': 'test.org',
        'enrollment_mode': 'automatic_invitation',
        'affiliation_email_address': 'admin@test.org',
        'verification': <String, dynamic>{
          'status': 'verified',
          'strategy': 'email_code',
          'attempts': 1,
          'expire_at': 1700000000000,
        },
        'total_pending_invitations': 2,
        'total_pending_suggestions': 1,
        'updated_at': 1700000000000,
        'created_at': 1699000000000,
      };

      final domain = OrganizationDomain.fromJson(json);

      expect(domain.id, 'dom_456');
      expect(domain.orgId, 'org_789');
      expect(domain.name, 'test.org');
      expect(domain.affiliationEmailAddress, 'admin@test.org');
      expect(domain.totalPendingInvitations, 2);
    });

    test('toJson serializes domain', () {
      final domain = OrganizationDomain(
        id: 'dom_789',
        orgId: 'org_abc',
        name: 'company.io',
        enrollmentMode: EnrollmentMode.automaticSuggestion,
        affiliationEmailAddress: null,
        verification: null,
        totalPendingInvitations: 0,
        totalPendingSuggestions: 0,
        updatedAt: DateTimeExt.epoch,
        createdAt: DateTimeExt.epoch,
      );

      final json = domain.toJson();

      expect(json['id'], 'dom_789');
      expect(json['organization_id'], 'org_abc');
      expect(json['name'], 'company.io');
    });
  });
}

