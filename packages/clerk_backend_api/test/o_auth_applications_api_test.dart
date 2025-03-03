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

/// tests for OAuthApplicationsApi
void main() {
  // final instance = OAuthApplicationsApi();

  group('tests for OAuthApplicationsApi', () {
    // Create an OAuth application
    //
    // Creates a new OAuth application with the given name and callback URL for an instance. The callback URL must be a valid url. All URL schemes are allowed such as `http://`, `https://`, `myapp://`, etc...
    //
    //Future<OAuthApplicationWithSecret> createOAuthApplication({ CreateOAuthApplicationRequest createOAuthApplicationRequest }) async
    test('test createOAuthApplication', () async {
      // TODO
    });

    // Delete an OAuth application
    //
    // Deletes the given OAuth application. This is not reversible.
    //
    //Future<DeletedObject> deleteOAuthApplication(String oauthApplicationId) async
    test('test deleteOAuthApplication', () async {
      // TODO
    });

    // Retrieve an OAuth application by ID
    //
    // Fetches the OAuth application whose ID matches the provided `id` in the path.
    //
    //Future<OAuthApplication> getOAuthApplication(String oauthApplicationId) async
    test('test getOAuthApplication', () async {
      // TODO
    });

    // Get a list of OAuth applications for an instance
    //
    // This request returns the list of OAuth applications for an instance. Results can be paginated using the optional `limit` and `offset` query parameters. The OAuth applications are ordered by descending creation date. Most recent OAuth applications will be returned first.
    //
    //Future<OAuthApplications> listOAuthApplications({ int limit, int offset }) async
    test('test listOAuthApplications', () async {
      // TODO
    });

    // Rotate the client secret of the given OAuth application
    //
    // Rotates the OAuth application's client secret. When the client secret is rotated, make sure to update it in authorized OAuth clients.
    //
    //Future<OAuthApplicationWithSecret> rotateOAuthApplicationSecret(String oauthApplicationId) async
    test('test rotateOAuthApplicationSecret', () async {
      // TODO
    });

    // Update an OAuth application
    //
    // Updates an existing OAuth application
    //
    //Future<OAuthApplication> updateOAuthApplication(String oauthApplicationId, UpdateOAuthApplicationRequest updateOAuthApplicationRequest) async
    test('test updateOAuthApplication', () async {
      // TODO
    });
  });
}
