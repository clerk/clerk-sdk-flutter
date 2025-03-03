# clerk_backend_api.model.CreateUserRequest

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**externalId** | **String** | The ID of the user as used in your external systems or your previous authentication solution. Must be unique across your instance. | [optional] 
**firstName** | **String** | The first name to assign to the user | [optional] 
**lastName** | **String** | The last name to assign to the user | [optional] 
**emailAddress** | **List<String>** | Email addresses to add to the user. Must be unique across your instance. The first email address will be set as the user's primary email address. | [optional] [default to const []]
**phoneNumber** | **List<String>** | Phone numbers to add to the user. Must be unique across your instance. The first phone number will be set as the user's primary phone number. | [optional] [default to const []]
**web3Wallet** | **List<String>** | Web3 wallets to add to the user. Must be unique across your instance. The first wallet will be set as the user's primary wallet. | [optional] [default to const []]
**username** | **String** | The username to give to the user. It must be unique across your instance. | [optional] 
**password** | **String** | The plaintext password to give the user. Must be at least 8 characters long, and can not be in any list of hacked passwords. | [optional] 
**passwordDigest** | **String** | In case you already have the password digests and not the passwords, you can use them for the newly created user via this property. The digests should be generated with one of the supported algorithms. The hashing algorithm can be specified using the `password_hasher` property. | [optional] 
**passwordHasher** | **String** | The hashing algorithm that was used to generate the password digest.  The algorithms we support at the moment are [`bcrypt`](https://en.wikipedia.org/wiki/Bcrypt), [`bcrypt_sha256_django`](https://docs.djangoproject.com/en/4.0/topics/auth/passwords/), [`md5`](https://en.wikipedia.org/wiki/MD5), `pbkdf2_sha1`, `pbkdf2_sha256`, [`pbkdf2_sha256_django`](https://docs.djangoproject.com/en/4.0/topics/auth/passwords/), [`phpass`](https://www.openwall.com/phpass/), [`scrypt_firebase`](https://firebaseopensource.com/projects/firebase/scrypt/), [`scrypt_werkzeug`](https://werkzeug.palletsprojects.com/en/3.0.x/utils/#werkzeug.security.generate_password_hash), [`sha256`](https://en.wikipedia.org/wiki/SHA-2), and the [`argon2`](https://argon2.online/) variants: `argon2i` and `argon2id`.  Each of the supported hashers expects the incoming digest to be in a particular format. See the [Clerk docs](https://clerk.com/docs/references/backend/user/create-user) for more information. | [optional] 
**skipPasswordChecks** | **bool** | When set to `true` all password checks are skipped. It is recommended to use this method only when migrating plaintext passwords to Clerk. Upon migration the user base should be prompted to pick stronger password. | [optional] 
**skipPasswordRequirement** | **bool** | When set to `true`, `password` is not required anymore when creating the user and can be omitted. This is useful when you are trying to create a user that doesn't have a password, in an instance that is using passwords. Please note that you cannot use this flag if password is the only way for a user to sign into your instance. | [optional] 
**totpSecret** | **String** | In case TOTP is configured on the instance, you can provide the secret to enable it on the newly created user without the need to reset it. Please note that currently the supported options are: * Period: 30 seconds * Code length: 6 digits * Algorithm: SHA1 | [optional] 
**backupCodes** | **List<String>** | If Backup Codes are configured on the instance, you can provide them to enable it on the newly created user without the need to reset them. You must provide the backup codes in plain format or the corresponding bcrypt digest. | [optional] [default to const []]
**publicMetadata** | [**Map<String, Object>**](Object.md) | Metadata saved on the user, that is visible to both your Frontend and Backend APIs | [optional] [default to const {}]
**privateMetadata** | [**Map<String, Object>**](Object.md) | Metadata saved on the user, that is only visible to your Backend API | [optional] [default to const {}]
**unsafeMetadata** | [**Map<String, Object>**](Object.md) | Metadata saved on the user, that can be updated from both the Frontend and Backend APIs. Note: Since this data can be modified from the frontend, it is not guaranteed to be safe. | [optional] [default to const {}]
**deleteSelfEnabled** | **bool** | If enabled, user can delete themselves via FAPI.  | [optional] 
**legalAcceptedAt** | **String** | A custom timestamp denoting _when_ the user accepted legal requirements, specified in RFC3339 format (e.g. `2012-10-20T07:15:20.902Z`). | [optional] 
**skipLegalChecks** | **bool** | When set to `true` all legal checks are skipped. It is not recommended to skip legal checks unless you are migrating a user to Clerk. | [optional] 
**createOrganizationEnabled** | **bool** | If enabled, user can create organizations via FAPI.  | [optional] 
**createOrganizationsLimit** | **int** | The maximum number of organizations the user can create. 0 means unlimited.  | [optional] 
**createdAt** | **String** | A custom date/time denoting _when_ the user signed up to the application, specified in RFC3339 format (e.g. `2012-10-20T07:15:20.902Z`). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


