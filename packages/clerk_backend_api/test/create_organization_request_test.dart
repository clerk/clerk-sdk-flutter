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

// tests for CreateOrganizationRequest
void main() {
  // final instance = CreateOrganizationRequest();

  group('test CreateOrganizationRequest', () {
    // The name of the new organization. May not contain URLs or HTML. Max length: 256
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // The ID of the User who will become the administrator for the new organization
    // String createdBy
    test('to test the property `createdBy`', () async {
      // TODO
    });

    // Metadata saved on the organization, accessible only from the Backend API
    // Map<String, Object> privateMetadata (default value: const {})
    test('to test the property `privateMetadata`', () async {
      // TODO
    });

    // Metadata saved on the organization, read-only from the Frontend API and fully accessible (read/write) from the Backend API
    // Map<String, Object> publicMetadata (default value: const {})
    test('to test the property `publicMetadata`', () async {
      // TODO
    });

    // A slug for the new organization. Can contain only lowercase alphanumeric characters and the dash \"-\". Must be unique for the instance.
    // String slug
    test('to test the property `slug`', () async {
      // TODO
    });

    // The maximum number of memberships allowed for this organization
    // int maxAllowedMemberships
    test('to test the property `maxAllowedMemberships`', () async {
      // TODO
    });

    // A custom date/time denoting _when_ the organization was created, specified in RFC3339 format (e.g. `2012-10-20T07:15:20.902Z`).
    // String createdAt
    test('to test the property `createdAt`', () async {
      // TODO
    });
  });
}
