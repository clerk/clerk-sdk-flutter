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

/// tests for OrganizationMembershipsApi
void main() {
  // final instance = OrganizationMembershipsApi();

  group('tests for OrganizationMembershipsApi', () {
    // Create a new organization membership
    //
    // Adds a user as a member to the given organization. Only users in the same instance as the organization can be added as members.  This organization will be the user's [active organization] (https://clerk.com/docs/organizations/overview#active-organization) the next time they create a session, presuming they don't explicitly set a different organization as active before then.
    //
    //Future<OrganizationMembership> createOrganizationMembership(String organizationId, CreateOrganizationMembershipRequest createOrganizationMembershipRequest) async
    test('test createOrganizationMembership', () async {
      // TODO
    });

    // Remove a member from an organization
    //
    // Removes the given membership from the organization
    //
    //Future<OrganizationMembership> deleteOrganizationMembership(String organizationId, String userId) async
    test('test deleteOrganizationMembership', () async {
      // TODO
    });

    // Get a list of all organization memberships within an instance.
    //
    // Retrieves all organization user memberships for the given instance.
    //
    //Future<OrganizationMemberships> instanceGetOrganizationMemberships({ String orderBy, int limit, int offset }) async
    test('test instanceGetOrganizationMemberships', () async {
      // TODO
    });

    // Get a list of all members of an organization
    //
    // Retrieves all user memberships for the given organization
    //
    //Future<OrganizationMemberships> listOrganizationMemberships(String organizationId, { String orderBy, List<String> userId, List<String> emailAddress, List<String> phoneNumber, List<String> username, List<String> web3Wallet, List<String> role, String query, String emailAddressQuery, String phoneNumberQuery, String usernameQuery, String nameQuery, int lastActiveAtBefore, int lastActiveAtAfter, int createdAtBefore, int createdAtAfter, int limit, int offset }) async
    test('test listOrganizationMemberships', () async {
      // TODO
    });

    // Update an organization membership
    //
    // Updates the properties of an existing organization membership
    //
    //Future<OrganizationMembership> updateOrganizationMembership(String organizationId, String userId, UpdateOrganizationMembershipRequest updateOrganizationMembershipRequest) async
    test('test updateOrganizationMembership', () async {
      // TODO
    });

    // Merge and update organization membership metadata
    //
    // Update an organization membership's metadata attributes by merging existing values with the provided parameters. Metadata values will be updated via a deep merge. Deep means that any nested JSON objects will be merged as well. You can remove metadata keys at any level by setting their value to `null`.
    //
    //Future<OrganizationMembership> updateOrganizationMembershipMetadata(String organizationId, String userId, { UpdateOrganizationMembershipMetadataRequest updateOrganizationMembershipMetadataRequest }) async
    test('test updateOrganizationMembershipMetadata', () async {
      // TODO
    });
  });
}
