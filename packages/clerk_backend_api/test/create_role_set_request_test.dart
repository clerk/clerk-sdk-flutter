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

// tests for CreateRoleSetRequest
void main() {
  // final instance = CreateRoleSetRequest();

  group('test CreateRoleSetRequest', () {
    // The name of the new role set
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // A unique key for the role set. Must start with 'role_set:' and contain only lowercase alphanumeric characters and underscores. If not provided, a key will be generated from the name.
    // String key
    test('to test the property `key`', () async {
      // TODO
    });

    // Optional description for the role set
    // String description
    test('to test the property `description`', () async {
      // TODO
    });

    // The key of the role to use as the default role for new organization members. Must be one of the roles in the `roles` array.
    // String defaultRoleKey
    test('to test the property `defaultRoleKey`', () async {
      // TODO
    });

    // The key of the role to assign to organization creators. Must be one of the roles in the `roles` array.
    // String creatorRoleKey
    test('to test the property `creatorRoleKey`', () async {
      // TODO
    });

    // The type of the role set. \"initial\" role sets are the default for new organizations. Only one role set can be \"initial\" per instance.
    // String type
    test('to test the property `type`', () async {
      // TODO
    });

    // Array of role keys to include in the role set. Must contain at least one role and no more than 10 roles.
    // List<String> roles (default value: const [])
    test('to test the property `roles`', () async {
      // TODO
    });
  });
}
