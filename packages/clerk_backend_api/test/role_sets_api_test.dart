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

/// tests for RoleSetsApi
void main() {
  // final instance = RoleSetsApi();

  group('tests for RoleSetsApi', () {
    // Add roles to a role set
    //
    // Adds one or more roles to an existing role set. You can optionally update the default role or creator role when adding new roles.
    //
    //Future<RoleSet> addRolesToRoleSet(String roleSetKeyOrId, AddRolesToRoleSetRequest addRolesToRoleSetRequest) async
    test('test addRolesToRoleSet', () async {
      // TODO
    });

    // Create a role set
    //
    // Creates a new role set with the given name and roles. The key must be unique for the instance and start with the 'role_set:' prefix, followed by lowercase alphanumeric characters and underscores only. You must provide at least one role and specify a default role key and creator role key.
    //
    //Future<RoleSet> createRoleSet(CreateRoleSetRequest createRoleSetRequest) async
    test('test createRoleSet', () async {
      // TODO
    });

    // Retrieve a role set
    //
    // Retrieves an existing role set by its key or ID.
    //
    //Future<RoleSet> getRoleSet(String roleSetKeyOrId) async
    test('test getRoleSet', () async {
      // TODO
    });

    // Get a list of role sets
    //
    // Returns a list of role sets for the instance. Results can be paginated using the optional `limit` and `offset` query parameters. The role sets are ordered by descending creation date by default.
    //
    //Future<RoleSets> listRoleSets({ String query, String orderBy, int limit, int offset }) async
    test('test listRoleSets', () async {
      // TODO
    });

    // Replace a role in a role set
    //
    // Replaces a role in a role set with another role. This atomically removes the source role and reassigns any members to the destination role.
    //
    //Future<RoleSet> replaceRoleInRoleSet(String roleSetKeyOrId, ReplaceRoleInRoleSetRequest replaceRoleInRoleSetRequest) async
    test('test replaceRoleInRoleSet', () async {
      // TODO
    });

    // Replace a role set
    //
    // Replaces a role set with another role set. This is functionally equivalent to deleting the role set but allows for atomic replacement with migration support. Organizations using this role set will be migrated to the destination role set.
    //
    //Future<DeletedObject> replaceRoleSet(String roleSetKeyOrId, ReplaceRoleSetRequest replaceRoleSetRequest) async
    test('test replaceRoleSet', () async {
      // TODO
    });

    // Update a role set
    //
    // Updates an existing role set. You can update the name, key, description, type, default role, or creator role. All parameters are optional - you can update only the fields you want to change.
    //
    //Future<RoleSet> updateRoleSet(String roleSetKeyOrId, UpdateRoleSetRequest updateRoleSetRequest) async
    test('test updateRoleSet', () async {
      // TODO
    });
  });
}
