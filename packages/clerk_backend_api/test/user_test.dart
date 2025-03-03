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

// tests for User
void main() {
  // final instance = User();

  group('test User', () {
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // String representing the object's type. Objects of the same type share the same value.
    // String object
    test('to test the property `object`', () async {
      // TODO
    });

    // String externalId
    test('to test the property `externalId`', () async {
      // TODO
    });

    // String primaryEmailAddressId
    test('to test the property `primaryEmailAddressId`', () async {
      // TODO
    });

    // String primaryPhoneNumberId
    test('to test the property `primaryPhoneNumberId`', () async {
      // TODO
    });

    // String primaryWeb3WalletId
    test('to test the property `primaryWeb3WalletId`', () async {
      // TODO
    });

    // String username
    test('to test the property `username`', () async {
      // TODO
    });

    // String firstName
    test('to test the property `firstName`', () async {
      // TODO
    });

    // String lastName
    test('to test the property `lastName`', () async {
      // TODO
    });

    // String profileImageUrl
    test('to test the property `profileImageUrl`', () async {
      // TODO
    });

    // String imageUrl
    test('to test the property `imageUrl`', () async {
      // TODO
    });

    // bool hasImage
    test('to test the property `hasImage`', () async {
      // TODO
    });

    // Map<String, Object> publicMetadata (default value: const {})
    test('to test the property `publicMetadata`', () async {
      // TODO
    });

    // Map<String, Object> privateMetadata (default value: const {})
    test('to test the property `privateMetadata`', () async {
      // TODO
    });

    // Map<String, Object> unsafeMetadata (default value: const {})
    test('to test the property `unsafeMetadata`', () async {
      // TODO
    });

    // List<EmailAddress> emailAddresses (default value: const [])
    test('to test the property `emailAddresses`', () async {
      // TODO
    });

    // List<PhoneNumber> phoneNumbers (default value: const [])
    test('to test the property `phoneNumbers`', () async {
      // TODO
    });

    // List<Web3Wallet> web3Wallets (default value: const [])
    test('to test the property `web3Wallets`', () async {
      // TODO
    });

    // List<SchemasPasskey> passkeys (default value: const [])
    test('to test the property `passkeys`', () async {
      // TODO
    });

    // bool passwordEnabled
    test('to test the property `passwordEnabled`', () async {
      // TODO
    });

    // bool twoFactorEnabled
    test('to test the property `twoFactorEnabled`', () async {
      // TODO
    });

    // bool totpEnabled
    test('to test the property `totpEnabled`', () async {
      // TODO
    });

    // bool backupCodeEnabled
    test('to test the property `backupCodeEnabled`', () async {
      // TODO
    });

    // Unix timestamp of when MFA was last enabled for this user. It should be noted that this field is not nullified if MFA is disabled.
    // int mfaEnabledAt
    test('to test the property `mfaEnabledAt`', () async {
      // TODO
    });

    // Unix timestamp of when MFA was last disabled for this user. It should be noted that this field is not nullified if MFA is enabled again.
    // int mfaDisabledAt
    test('to test the property `mfaDisabledAt`', () async {
      // TODO
    });

    // List<Object> externalAccounts (default value: const [])
    test('to test the property `externalAccounts`', () async {
      // TODO
    });

    // List<SAMLAccount> samlAccounts (default value: const [])
    test('to test the property `samlAccounts`', () async {
      // TODO
    });

    // Unix timestamp of last sign-in.
    // int lastSignInAt
    test('to test the property `lastSignInAt`', () async {
      // TODO
    });

    // Flag to denote whether user is banned or not.
    // bool banned
    test('to test the property `banned`', () async {
      // TODO
    });

    // Flag to denote whether user is currently locked, i.e. restricted from signing in or not.
    // bool locked
    test('to test the property `locked`', () async {
      // TODO
    });

    // The number of seconds remaining until the lockout period expires for a locked user. A null value for a locked user indicates that lockout never expires.
    // int lockoutExpiresInSeconds
    test('to test the property `lockoutExpiresInSeconds`', () async {
      // TODO
    });

    // The number of verification attempts remaining until the user is locked. Null if account lockout is not enabled. Note: if a user is locked explicitly via the Backend API, they may still have verification attempts remaining.
    // int verificationAttemptsRemaining
    test('to test the property `verificationAttemptsRemaining`', () async {
      // TODO
    });

    // Unix timestamp of last update.
    // int updatedAt
    test('to test the property `updatedAt`', () async {
      // TODO
    });

    // Unix timestamp of creation.
    // int createdAt
    test('to test the property `createdAt`', () async {
      // TODO
    });

    // If enabled, user can delete themselves via FAPI.
    // bool deleteSelfEnabled
    test('to test the property `deleteSelfEnabled`', () async {
      // TODO
    });

    // If enabled, user can create organizations via FAPI.
    // bool createOrganizationEnabled
    test('to test the property `createOrganizationEnabled`', () async {
      // TODO
    });

    // The maximum number of organizations the user can create. 0 means unlimited.
    // int createOrganizationsLimit
    test('to test the property `createOrganizationsLimit`', () async {
      // TODO
    });

    // Unix timestamp of the latest session activity, with day precision.
    // int lastActiveAt
    test('to test the property `lastActiveAt`', () async {
      // TODO
    });

    // Unix timestamp of when the user accepted the legal requirements.
    // int legalAcceptedAt
    test('to test the property `legalAcceptedAt`', () async {
      // TODO
    });
  });
}
