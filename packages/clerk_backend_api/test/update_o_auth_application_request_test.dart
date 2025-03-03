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

// tests for UpdateOAuthApplicationRequest
void main() {
  // final instance = UpdateOAuthApplicationRequest();

  group('test UpdateOAuthApplicationRequest', () {
    // The new name of the OAuth application. Max length: 256
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // An array of redirect URIs of the new OAuth application
    // List<String> redirectUris (default value: const [])
    test('to test the property `redirectUris`', () async {
      // TODO
    });

    // The new callback URL of the OAuth application
    // String callbackUrl
    test('to test the property `callbackUrl`', () async {
      // TODO
    });

    // Define the allowed scopes for the new OAuth applications that dictate the user payload of the OAuth user info endpoint. Available scopes are `profile`, `email`, `public_metadata`, `private_metadata`. Provide the requested scopes as a string, separated by spaces.
    // String scopes (default value: 'profile email')
    test('to test the property `scopes`', () async {
      // TODO
    });

    // If true, this client is public and you can use the Proof Key of Code Exchange (PKCE) flow.
    // bool public
    test('to test the property `public`', () async {
      // TODO
    });
  });
}
