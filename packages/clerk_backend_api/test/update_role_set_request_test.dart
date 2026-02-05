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

// tests for UpdateRoleSetRequest
void main() {
  // final instance = UpdateRoleSetRequest();

  group('test UpdateRoleSetRequest', () {
    // The new name for the role set
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // A unique key for the role set. Must start with 'role_set:' and contain only lowercase alphanumeric characters and underscores.
    // String key
    test('to test the property `key`', () async {
      // TODO
    });

    // Optional description for the role set
    // String description
    test('to test the property `description`', () async {
      // TODO
    });

    // Set to \"initial\" to make this the default role set for new organizations. Only one role set can be \"initial\" per instance; setting this will change any existing initial role set to \"custom\".
    // String type
    test('to test the property `type`', () async {
      // TODO
    });

    // The key of the role to use as the default role for new organization members. Must be an existing role in the role set.
    // String defaultRoleKey
    test('to test the property `defaultRoleKey`', () async {
      // TODO
    });

    // The key of the role to assign to organization creators. Must be an existing role in the role set.
    // String creatorRoleKey
    test('to test the property `creatorRoleKey`', () async {
      // TODO
    });
  });
}
