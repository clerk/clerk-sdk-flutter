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

/// tests for OrganizationRolesApi
void main() {
  // final instance = OrganizationRolesApi();

  group('tests for OrganizationRolesApi', () {
    // Assign a permission to an organization role
    //
    // Assigns a permission to an organization role
    //
    //Future<Role> assignPermissionToOrganizationRole(String organizationRoleId, String permissionId) async
    test('test assignPermissionToOrganizationRole', () async {
      // TODO
    });

    // Create an organization role
    //
    // Creates a new organization role with the given name and permissions for an instance. The key must be unique for the instance and start with the 'org:' prefix, followed by lowercase alphanumeric characters and underscores only. You can optionally provide a description for the role and specify whether it should be included in the initial role set. Organization roles support permissions that can be assigned to control access within the organization.
    //
    //Future<Role> createOrganizationRole(CreateOrganizationRoleRequest createOrganizationRoleRequest) async
    test('test createOrganizationRole', () async {
      // TODO
    });

    // Delete an organization role
    //
    // Deletes the organization role. The role cannot be deleted if it is currently used as the default creator role, domain default role, assigned to any members, or exists in any invitations.
    //
    //Future<DeletedObject> deleteOrganizationRole(String organizationRoleId) async
    test('test deleteOrganizationRole', () async {
      // TODO
    });

    // Retrieve an organization role
    //
    // Use this request to retrieve an existing organization role by its ID.
    //
    //Future<Role> getOrganizationRole(String organizationRoleId) async
    test('test getOrganizationRole', () async {
      // TODO
    });

    // Get a list of organization roles
    //
    // This request returns the list of organization roles for the instance. Results can be paginated using the optional `limit` and `offset` query parameters. The organization roles are ordered by descending creation date. Most recent roles will be returned first.
    //
    //Future<Roles> listOrganizationRoles({ String query, String orderBy, int limit, int offset }) async
    test('test listOrganizationRoles', () async {
      // TODO
    });

    // Remove a permission from an organization role
    //
    // Removes a permission from an organization role
    //
    //Future<Role> removePermissionFromOrganizationRole(String organizationRoleId, String permissionId) async
    test('test removePermissionFromOrganizationRole', () async {
      // TODO
    });

    // Update an organization role
    //
    // Updates an existing organization role. You can update the name, key, description, and permissions of the role. All parameters are optional - you can update only the fields you want to change. If the role is used as a creator role or domain default role, updating the key will cascade the update to the organization settings.
    //
    //Future<Role> updateOrganizationRole(String organizationRoleId, UpdateOrganizationRoleRequest updateOrganizationRoleRequest) async
    test('test updateOrganizationRole', () async {
      // TODO
    });
  });
}
