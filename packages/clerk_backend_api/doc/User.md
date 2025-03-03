# clerk_backend_api.model.User

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**object** | **String** | String representing the object's type. Objects of the same type share the same value.  | [optional] 
**externalId** | **String** |  | [optional] 
**primaryEmailAddressId** | **String** |  | [optional] 
**primaryPhoneNumberId** | **String** |  | [optional] 
**primaryWeb3WalletId** | **String** |  | [optional] 
**username** | **String** |  | [optional] 
**firstName** | **String** |  | [optional] 
**lastName** | **String** |  | [optional] 
**profileImageUrl** | **String** |  | [optional] 
**imageUrl** | **String** |  | [optional] 
**hasImage** | **bool** |  | [optional] 
**publicMetadata** | [**Map<String, Object>**](Object.md) |  | [optional] [default to const {}]
**privateMetadata** | [**Map<String, Object>**](Object.md) |  | [optional] [default to const {}]
**unsafeMetadata** | [**Map<String, Object>**](Object.md) |  | [optional] [default to const {}]
**emailAddresses** | [**List<EmailAddress>**](EmailAddress.md) |  | [optional] [default to const []]
**phoneNumbers** | [**List<PhoneNumber>**](PhoneNumber.md) |  | [optional] [default to const []]
**web3Wallets** | [**List<Web3Wallet>**](Web3Wallet.md) |  | [optional] [default to const []]
**passkeys** | [**List<SchemasPasskey>**](SchemasPasskey.md) |  | [optional] [default to const []]
**passwordEnabled** | **bool** |  | [optional] 
**twoFactorEnabled** | **bool** |  | [optional] 
**totpEnabled** | **bool** |  | [optional] 
**backupCodeEnabled** | **bool** |  | [optional] 
**mfaEnabledAt** | **int** | Unix timestamp of when MFA was last enabled for this user. It should be noted that this field is not nullified if MFA is disabled.  | [optional] 
**mfaDisabledAt** | **int** | Unix timestamp of when MFA was last disabled for this user. It should be noted that this field is not nullified if MFA is enabled again.  | [optional] 
**externalAccounts** | [**List<Object>**](Object.md) |  | [optional] [default to const []]
**samlAccounts** | [**List<SAMLAccount>**](SAMLAccount.md) |  | [optional] [default to const []]
**lastSignInAt** | **int** | Unix timestamp of last sign-in.  | [optional] 
**banned** | **bool** | Flag to denote whether user is banned or not.  | [optional] 
**locked** | **bool** | Flag to denote whether user is currently locked, i.e. restricted from signing in or not.  | [optional] 
**lockoutExpiresInSeconds** | **int** | The number of seconds remaining until the lockout period expires for a locked user. A null value for a locked user indicates that lockout never expires.  | [optional] 
**verificationAttemptsRemaining** | **int** | The number of verification attempts remaining until the user is locked. Null if account lockout is not enabled. Note: if a user is locked explicitly via the Backend API, they may still have verification attempts remaining.  | [optional] 
**updatedAt** | **int** | Unix timestamp of last update.  | [optional] 
**createdAt** | **int** | Unix timestamp of creation.  | [optional] 
**deleteSelfEnabled** | **bool** | If enabled, user can delete themselves via FAPI.  | [optional] 
**createOrganizationEnabled** | **bool** | If enabled, user can create organizations via FAPI.  | [optional] 
**createOrganizationsLimit** | **int** | The maximum number of organizations the user can create. 0 means unlimited.  | [optional] 
**lastActiveAt** | **int** | Unix timestamp of the latest session activity, with day precision.  | [optional] 
**legalAcceptedAt** | **int** | Unix timestamp of when the user accepted the legal requirements.  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


