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

// tests for CreateOrganizationInvitationRequest
void main() {
  // final instance = CreateOrganizationInvitationRequest();

  group('test CreateOrganizationInvitationRequest', () {
    // The email address of the new member that is going to be invited to the organization
    // String emailAddress
    test('to test the property `emailAddress`', () async {
      // TODO
    });

    // The ID of the user that invites the new member to the organization. Must be an administrator in the organization.
    // String inviterUserId
    test('to test the property `inviterUserId`', () async {
      // TODO
    });

    // The role of the new member in the organization
    // String role
    test('to test the property `role`', () async {
      // TODO
    });

    // Metadata saved on the organization invitation, read-only from the Frontend API and fully accessible (read/write) from the Backend API. When the organization invitation is accepted, the metadata will be transferred to the newly created organization membership.
    // Map<String, Object> publicMetadata (default value: const {})
    test('to test the property `publicMetadata`', () async {
      // TODO
    });

    // Metadata saved on the organization invitation, fully accessible (read/write) from the Backend API but not visible from the Frontend API. When the organization invitation is accepted, the metadata will be transferred to the newly created organization membership.
    // Map<String, Object> privateMetadata (default value: const {})
    test('to test the property `privateMetadata`', () async {
      // TODO
    });

    // Optional URL that the invitee will be redirected to once they accept the invitation by clicking the join link in the invitation email.
    // String redirectUrl
    test('to test the property `redirectUrl`', () async {
      // TODO
    });

    // The number of days the invitation will be valid for. By default, the invitation has a 30 days expire.
    // int expiresInDays
    test('to test the property `expiresInDays`', () async {
      // TODO
    });
  });
}
