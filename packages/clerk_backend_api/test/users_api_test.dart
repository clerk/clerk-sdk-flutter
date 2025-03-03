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

/// tests for UsersApi
void main() {
  // final instance = UsersApi();

  group('tests for UsersApi', () {
    // Ban a user
    //
    // Marks the given user as banned, which means that all their sessions are revoked and they are not allowed to sign in again.
    //
    //Future<User> banUser(String userId) async
    test('test banUser', () async {
      // TODO
    });

    // Create a new user
    //
    // Creates a new user. Your user management settings determine how you should setup your user model.  Any email address and phone number created using this method will be marked as verified.  Note: If you are performing a migration, check out our guide on [zero downtime migrations](https://clerk.com/docs/deployments/migrate-overview).  A rate limit rule of 20 requests per 10 seconds is applied to this endpoint.
    //
    //Future<User> createUser(CreateUserRequest createUserRequest) async
    test('test createUser', () async {
      // TODO
    });

    // Disable all user's Backup codes
    //
    // Disable all of a user's backup codes.
    //
    //Future<DisableMFA200Response> deleteBackupCode(String userId) async
    test('test deleteBackupCode', () async {
      // TODO
    });

    // Delete External Account
    //
    // Delete an external account by ID.
    //
    //Future<DeletedObject> deleteExternalAccount(String userId, String externalAccountId) async
    test('test deleteExternalAccount', () async {
      // TODO
    });

    // Delete all the user's TOTPs
    //
    // Deletes all of the user's TOTPs.
    //
    //Future<DisableMFA200Response> deleteTOTP(String userId) async
    test('test deleteTOTP', () async {
      // TODO
    });

    // Delete a user
    //
    // Delete the specified user
    //
    //Future<DeletedObject> deleteUser(String userId) async
    test('test deleteUser', () async {
      // TODO
    });

    // Delete user profile image
    //
    // Delete a user's profile image
    //
    //Future<User> deleteUserProfileImage(String userId) async
    test('test deleteUserProfileImage', () async {
      // TODO
    });

    // Disable a user's MFA methods
    //
    // Disable all of a user's MFA methods (e.g. OTP sent via SMS, TOTP on their authenticator app) at once.
    //
    //Future<DisableMFA200Response> disableMFA(String userId) async
    test('test disableMFA', () async {
      // TODO
    });

    // Retrieve the OAuth access token of a user
    //
    // Fetch the corresponding OAuth access token for a user that has previously authenticated with a particular OAuth provider. For OAuth 2.0, if the access token has expired and we have a corresponding refresh token, the access token will be refreshed transparently the new one will be returned.
    //
    //Future<List<GetOAuthAccessToken200ResponseInner>> getOAuthAccessToken(String userId, String provider, { bool paginated, int limit, int offset }) async
    test('test getOAuthAccessToken', () async {
      // TODO
    });

    // Retrieve a user
    //
    // Retrieve the details of a user
    //
    //Future<User> getUser(String userId) async
    test('test getUser', () async {
      // TODO
    });

    // List all users
    //
    // Returns a list of all users. The users are returned sorted by creation date, with the newest users appearing first.
    //
    //Future<List<User>> getUserList({ List<String> emailAddress, List<String> phoneNumber, List<String> externalId, List<String> username, List<String> web3Wallet, List<String> userId, List<String> organizationId, String query, String emailAddressQuery, String phoneNumberQuery, String usernameQuery, String nameQuery, bool banned, int lastActiveAtBefore, int lastActiveAtAfter, int lastActiveAtSince, int createdAtBefore, int createdAtAfter, int limit, int offset, String orderBy }) async
    test('test getUserList', () async {
      // TODO
    });

    // Count users
    //
    // Returns a total count of all users that match the given filtering criteria.
    //
    //Future<TotalCount> getUsersCount({ List<String> emailAddress, List<String> phoneNumber, List<String> externalId, List<String> username, List<String> web3Wallet, List<String> userId, List<String> organizationId, String query, String emailAddressQuery, String phoneNumberQuery, String usernameQuery, String nameQuery, bool banned, int lastActiveAtBefore, int lastActiveAtAfter, int lastActiveAtSince, int createdAtBefore, int createdAtAfter }) async
    test('test getUsersCount', () async {
      // TODO
    });

    // Lock a user
    //
    // Marks the given user as locked, which means they are not allowed to sign in again until the lock expires. Lock duration can be configured in the instance's restrictions settings.
    //
    //Future<User> lockUser(String userId) async
    test('test lockUser', () async {
      // TODO
    });

    // Set user profile image
    //
    // Update a user's profile image
    //
    //Future<User> setUserProfileImage(String userId, { MultipartFile file }) async
    test('test setUserProfileImage', () async {
      // TODO
    });

    // Unban a user
    //
    // Removes the ban mark from the given user.
    //
    //Future<User> unbanUser(String userId) async
    test('test unbanUser', () async {
      // TODO
    });

    // Unlock a user
    //
    // Removes the lock from the given user.
    //
    //Future<User> unlockUser(String userId) async
    test('test unlockUser', () async {
      // TODO
    });

    // Update a user
    //
    // Update a user's attributes.  You can set the user's primary contact identifiers (email address and phone numbers) by updating the `primary_email_address_id` and `primary_phone_number_id` attributes respectively. Both IDs should correspond to verified identifications that belong to the user.  You can remove a user's username by setting the username attribute to null or the blank string \"\". This is a destructive action; the identification will be deleted forever. Usernames can be removed only if they are optional in your instance settings and there's at least one other identifier which can be used for authentication.  This endpoint allows changing a user's password. When passing the `password` parameter directly you have two further options. You can ignore the password policy checks for your instance by setting the `skip_password_checks` parameter to `true`. You can also choose to sign the user out of all their active sessions on any device once the password is updated. Just set `sign_out_of_other_sessions` to `true`.
    //
    //Future<User> updateUser(String userId, UpdateUserRequest updateUserRequest) async
    test('test updateUser', () async {
      // TODO
    });

    // Merge and update a user's metadata
    //
    // Update a user's metadata attributes by merging existing values with the provided parameters.  This endpoint behaves differently than the *Update a user* endpoint. Metadata values will not be replaced entirely. Instead, a deep merge will be performed. Deep means that any nested JSON objects will be merged as well.  You can remove metadata keys at any level by setting their value to `null`.
    //
    //Future<User> updateUserMetadata(String userId, { UpdateUserMetadataRequest updateUserMetadataRequest }) async
    test('test updateUserMetadata', () async {
      // TODO
    });

    // Delete a user passkey
    //
    // Delete the passkey identification for a given user and notify them through email.
    //
    //Future<DeletedObject> userPasskeyDelete(String userId, String passkeyIdentificationId) async
    test('test userPasskeyDelete', () async {
      // TODO
    });

    // Delete a user web3 wallet
    //
    // Delete the web3 wallet identification for a given user.
    //
    //Future<DeletedObject> userWeb3WalletDelete(String userId, String web3WalletIdentificationId) async
    test('test userWeb3WalletDelete', () async {
      // TODO
    });

    // Retrieve all invitations for a user
    //
    // Retrieve a paginated list of the user's organization invitations
    //
    //Future<OrganizationInvitationsWithPublicOrganizationData> usersGetOrganizationInvitations(String userId, { int limit, int offset, String status }) async
    test('test usersGetOrganizationInvitations', () async {
      // TODO
    });

    // Retrieve all memberships for a user
    //
    // Retrieve a paginated list of the user's organization memberships
    //
    //Future<OrganizationMemberships> usersGetOrganizationMemberships(String userId, { int limit, int offset }) async
    test('test usersGetOrganizationMemberships', () async {
      // TODO
    });

    // Verify the password of a user
    //
    // Check that the user's password matches the supplied input. Useful for custom auth flows and re-verification.
    //
    //Future<VerifyPassword200Response> verifyPassword(String userId, { VerifyPasswordRequest verifyPasswordRequest }) async
    test('test verifyPassword', () async {
      // TODO
    });

    // Verify a TOTP or backup code for a user
    //
    // Verify that the provided TOTP or backup code is valid for the user. Verifying a backup code will result it in being consumed (i.e. it will become invalid). Useful for custom auth flows and re-verification.
    //
    //Future<VerifyTOTP200Response> verifyTOTP(String userId, { VerifyTOTPRequest verifyTOTPRequest }) async
    test('test verifyTOTP', () async {
      // TODO
    });
  });
}
