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

/// tests for InvitationsApi
void main() {
  // final instance = InvitationsApi();

  group('tests for InvitationsApi', () {
    // Create multiple invitations
    //
    // Use this API operation to create multiple invitations for the provided email addresses. You can choose to send the invitations as emails by setting the `notify` parameter to `true`. There cannot be an existing invitation for any of the email addresses you provide unless you set `ignore_existing` to `true` for specific email addresses. Please note that there must be no existing user for any of the email addresses you provide, and this rule cannot be bypassed.
    //
    //Future<List<Invitation>> createBulkInvitations({ List<CreateBulkInvitationsRequestInner> createBulkInvitationsRequestInner }) async
    test('test createBulkInvitations', () async {
      // TODO
    });

    // Create an invitation
    //
    // Creates a new invitation for the given email address and sends the invitation email. Keep in mind that you cannot create an invitation if there is already one for the given email address. Also, trying to create an invitation for an email address that already exists in your application will result to an error.
    //
    //Future<Invitation> createInvitation({ CreateInvitationRequest createInvitationRequest }) async
    test('test createInvitation', () async {
      // TODO
    });

    // List all invitations
    //
    // Returns all non-revoked invitations for your application, sorted by creation date
    //
    //Future<List<Invitation>> listInvitations({ String status, String query, String orderBy, bool paginated, int limit, int offset }) async
    test('test listInvitations', () async {
      // TODO
    });

    // Revokes an invitation
    //
    // Revokes the given invitation. Revoking an invitation will prevent the user from using the invitation link that was sent to them. However, it doesn't prevent the user from signing up if they follow the sign up flow. Only active (i.e. non-revoked) invitations can be revoked.
    //
    //Future<RevokeInvitation200Response> revokeInvitation(String invitationId) async
    test('test revokeInvitation', () async {
      // TODO
    });
  });
}
