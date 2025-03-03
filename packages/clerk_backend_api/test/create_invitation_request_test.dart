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

// tests for CreateInvitationRequest
void main() {
  // final instance = CreateInvitationRequest();

  group('test CreateInvitationRequest', () {
    // The email address the invitation will be sent to
    // String emailAddress
    test('to test the property `emailAddress`', () async {
      // TODO
    });

    // Metadata that will be attached to the newly created invitation. The value of this property should be a well-formed JSON object. Once the user accepts the invitation and signs up, these metadata will end up in the user's public metadata.
    // Map<String, Object> publicMetadata (default value: const {})
    test('to test the property `publicMetadata`', () async {
      // TODO
    });

    // Optional URL which specifies where to redirect the user once they click the invitation link. This is only required if you have implemented a [custom flow](https://clerk.com/docs/authentication/invitations#custom-flow) and you're not using Clerk Hosted Pages or Clerk Components.
    // String redirectUrl
    test('to test the property `redirectUrl`', () async {
      // TODO
    });

    // Optional flag which denotes whether an email invitation should be sent to the given email address. Defaults to `true`.
    // bool notify (default value: true)
    test('to test the property `notify`', () async {
      // TODO
    });

    // Whether an invitation should be created if there is already an existing invitation for this email address, or it's claimed by another user.
    // bool ignoreExisting (default value: false)
    test('to test the property `ignoreExisting`', () async {
      // TODO
    });

    // The number of days the invitation will be valid for. By default, the invitation expires after 30 days.
    // int expiresInDays
    test('to test the property `expiresInDays`', () async {
      // TODO
    });

    // The slug of the email template to use for the invitation email.
    // String templateSlug
    test('to test the property `templateSlug`', () async {
      // TODO
    });
  });
}
