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

// tests for CreateUserRequest
void main() {
  // final instance = CreateUserRequest();

  group('test CreateUserRequest', () {
    // The ID of the user as used in your external systems or your previous authentication solution. Must be unique across your instance.
    // String externalId
    test('to test the property `externalId`', () async {
      // TODO
    });

    // The first name to assign to the user
    // String firstName
    test('to test the property `firstName`', () async {
      // TODO
    });

    // The last name to assign to the user
    // String lastName
    test('to test the property `lastName`', () async {
      // TODO
    });

    // Email addresses to add to the user. Must be unique across your instance. The first email address will be set as the user's primary email address.
    // List<String> emailAddress (default value: const [])
    test('to test the property `emailAddress`', () async {
      // TODO
    });

    // Phone numbers to add to the user. Must be unique across your instance. The first phone number will be set as the user's primary phone number.
    // List<String> phoneNumber (default value: const [])
    test('to test the property `phoneNumber`', () async {
      // TODO
    });

    // Web3 wallets to add to the user. Must be unique across your instance. The first wallet will be set as the user's primary wallet.
    // List<String> web3Wallet (default value: const [])
    test('to test the property `web3Wallet`', () async {
      // TODO
    });

    // The username to give to the user. It must be unique across your instance.
    // String username
    test('to test the property `username`', () async {
      // TODO
    });

    // The plaintext password to give the user. Must be at least 8 characters long, and can not be in any list of hacked passwords.
    // String password
    test('to test the property `password`', () async {
      // TODO
    });

    // In case you already have the password digests and not the passwords, you can use them for the newly created user via this property. The digests should be generated with one of the supported algorithms. The hashing algorithm can be specified using the `password_hasher` property.
    // String passwordDigest
    test('to test the property `passwordDigest`', () async {
      // TODO
    });

    // The hashing algorithm that was used to generate the password digest.  The algorithms we support at the moment are [`bcrypt`](https://en.wikipedia.org/wiki/Bcrypt), [`bcrypt_sha256_django`](https://docs.djangoproject.com/en/4.0/topics/auth/passwords/), [`md5`](https://en.wikipedia.org/wiki/MD5), `pbkdf2_sha1`, `pbkdf2_sha256`, [`pbkdf2_sha256_django`](https://docs.djangoproject.com/en/4.0/topics/auth/passwords/), [`phpass`](https://www.openwall.com/phpass/), [`scrypt_firebase`](https://firebaseopensource.com/projects/firebase/scrypt/), [`scrypt_werkzeug`](https://werkzeug.palletsprojects.com/en/3.0.x/utils/#werkzeug.security.generate_password_hash), [`sha256`](https://en.wikipedia.org/wiki/SHA-2), and the [`argon2`](https://argon2.online/) variants: `argon2i` and `argon2id`.  Each of the supported hashers expects the incoming digest to be in a particular format. See the [Clerk docs](https://clerk.com/docs/references/backend/user/create-user) for more information.
    // String passwordHasher
    test('to test the property `passwordHasher`', () async {
      // TODO
    });

    // When set to `true` all password checks are skipped. It is recommended to use this method only when migrating plaintext passwords to Clerk. Upon migration the user base should be prompted to pick stronger password.
    // bool skipPasswordChecks
    test('to test the property `skipPasswordChecks`', () async {
      // TODO
    });

    // When set to `true`, `password` is not required anymore when creating the user and can be omitted. This is useful when you are trying to create a user that doesn't have a password, in an instance that is using passwords. Please note that you cannot use this flag if password is the only way for a user to sign into your instance.
    // bool skipPasswordRequirement
    test('to test the property `skipPasswordRequirement`', () async {
      // TODO
    });

    // In case TOTP is configured on the instance, you can provide the secret to enable it on the newly created user without the need to reset it. Please note that currently the supported options are: * Period: 30 seconds * Code length: 6 digits * Algorithm: SHA1
    // String totpSecret
    test('to test the property `totpSecret`', () async {
      // TODO
    });

    // If Backup Codes are configured on the instance, you can provide them to enable it on the newly created user without the need to reset them. You must provide the backup codes in plain format or the corresponding bcrypt digest.
    // List<String> backupCodes (default value: const [])
    test('to test the property `backupCodes`', () async {
      // TODO
    });

    // Metadata saved on the user, that is visible to both your Frontend and Backend APIs
    // Map<String, Object> publicMetadata (default value: const {})
    test('to test the property `publicMetadata`', () async {
      // TODO
    });

    // Metadata saved on the user, that is only visible to your Backend API
    // Map<String, Object> privateMetadata (default value: const {})
    test('to test the property `privateMetadata`', () async {
      // TODO
    });

    // Metadata saved on the user, that can be updated from both the Frontend and Backend APIs. Note: Since this data can be modified from the frontend, it is not guaranteed to be safe.
    // Map<String, Object> unsafeMetadata (default value: const {})
    test('to test the property `unsafeMetadata`', () async {
      // TODO
    });

    // If enabled, user can delete themselves via FAPI.
    // bool deleteSelfEnabled
    test('to test the property `deleteSelfEnabled`', () async {
      // TODO
    });

    // A custom timestamp denoting _when_ the user accepted legal requirements, specified in RFC3339 format (e.g. `2012-10-20T07:15:20.902Z`).
    // String legalAcceptedAt
    test('to test the property `legalAcceptedAt`', () async {
      // TODO
    });

    // When set to `true` all legal checks are skipped. It is not recommended to skip legal checks unless you are migrating a user to Clerk.
    // bool skipLegalChecks
    test('to test the property `skipLegalChecks`', () async {
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

    // A custom date/time denoting _when_ the user signed up to the application, specified in RFC3339 format (e.g. `2012-10-20T07:15:20.902Z`).
    // String createdAt
    test('to test the property `createdAt`', () async {
      // TODO
    });
  });
}
