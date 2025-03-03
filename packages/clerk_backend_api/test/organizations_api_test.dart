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

/// tests for OrganizationsApi
void main() {
  // final instance = OrganizationsApi();

  group('tests for OrganizationsApi', () {
    // Create an organization
    //
    // Creates a new organization with the given name for an instance. You can specify an optional slug for the new organization. If provided, the organization slug can contain only lowercase alphanumeric characters (letters and digits) and the dash \"-\". Organization slugs must be unique for the instance. You can provide additional metadata for the organization and set any custom attribute you want. Organizations support private and public metadata. Private metadata can only be accessed from the Backend API. Public metadata can be accessed from the Backend API, and are read-only from the Frontend API. The `created_by` user will see this as their [active organization] (https://clerk.com/docs/organizations/overview#active-organization) the next time they create a session, presuming they don't explicitly set a different organization as active before then.
    //
    //Future<Organization> createOrganization({ CreateOrganizationRequest createOrganizationRequest }) async
    test('test createOrganization', () async {
      // TODO
    });

    // Delete an organization
    //
    // Deletes the given organization. Please note that deleting an organization will also delete all memberships and invitations. This is not reversible.
    //
    //Future<DeletedObject> deleteOrganization(String organizationId) async
    test('test deleteOrganization', () async {
      // TODO
    });

    // Delete the organization's logo.
    //
    // Delete the organization's logo.
    //
    //Future<Organization> deleteOrganizationLogo(String organizationId) async
    test('test deleteOrganizationLogo', () async {
      // TODO
    });

    // Retrieve an organization by ID or slug
    //
    // Fetches the organization whose ID or slug matches the provided `id_or_slug` URL query parameter.
    //
    //Future<Organization> getOrganization(String organizationId, { bool includeMembersCount, bool includeMissingMemberWithElevatedPermissions }) async
    test('test getOrganization', () async {
      // TODO
    });

    // Get a list of organizations for an instance
    //
    // This request returns the list of organizations for an instance. Results can be paginated using the optional `limit` and `offset` query parameters. The organizations are ordered by descending creation date. Most recent organizations will be returned first.
    //
    //Future<Organizations> listOrganizations({ bool includeMembersCount, bool includeMissingMemberWithElevatedPermissions, String query, List<String> userId, List<String> organizationId, String orderBy, int limit, int offset }) async
    test('test listOrganizations', () async {
      // TODO
    });

    // Merge and update metadata for an organization
    //
    // Update organization metadata attributes by merging existing values with the provided parameters. Metadata values will be updated via a deep merge. Deep meaning that any nested JSON objects will be merged as well. You can remove metadata keys at any level by setting their value to `null`.
    //
    //Future<Organization> mergeOrganizationMetadata(String organizationId, MergeOrganizationMetadataRequest mergeOrganizationMetadataRequest) async
    test('test mergeOrganizationMetadata', () async {
      // TODO
    });

    // Update an organization
    //
    // Updates an existing organization
    //
    //Future<Organization> updateOrganization(String organizationId, UpdateOrganizationRequest updateOrganizationRequest) async
    test('test updateOrganization', () async {
      // TODO
    });

    // Upload a logo for the organization
    //
    // Set or replace an organization's logo, by uploading an image file. This endpoint uses the `multipart/form-data` request content type and accepts a file of image type. The file size cannot exceed 10MB. Only the following file content types are supported: `image/jpeg`, `image/png`, `image/gif`, `image/webp`, `image/x-icon`, `image/vnd.microsoft.icon`.
    //
    //Future<OrganizationWithLogo> uploadOrganizationLogo(String organizationId, MultipartFile file, { String uploaderUserId }) async
    test('test uploadOrganizationLogo', () async {
      // TODO
    });
  });
}
