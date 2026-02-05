# openapi.model.User

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**object** | **String** | String representing the object's type. Objects of the same type share the same value.  | 
**externalId** | **String** |  | 
**primaryEmailAddressId** | **String** |  | 
**primaryPhoneNumberId** | **String** |  | 
**primaryWeb3WalletId** | **String** |  | 
**username** | **String** |  | 
**firstName** | **String** |  | 
**lastName** | **String** |  | 
**locale** | **String** |  | [optional] 
**profileImageUrl** | **String** |  | [optional] 
**imageUrl** | **String** |  | [optional] 
**hasImage** | **bool** |  | 
**publicMetadata** | [**Map<String, Object>**](Object.md) |  | [default to const {}]
**privateMetadata** | [**Map<String, Object>**](Object.md) |  | [optional] [default to const {}]
**unsafeMetadata** | [**Map<String, Object>**](Object.md) |  | [optional] [default to const {}]
**emailAddresses** | [**List<EmailAddress>**](EmailAddress.md) |  | [default to const []]
**phoneNumbers** | [**List<PhoneNumber>**](PhoneNumber.md) |  | [default to const []]
**web3Wallets** | [**List<Web3Wallet>**](Web3Wallet.md) |  | [default to const []]
**passkeys** | [**List<Passkey>**](Passkey.md) |  | [default to const []]
**passwordEnabled** | **bool** |  | 
**twoFactorEnabled** | **bool** |  | 
**totpEnabled** | **bool** |  | 
**backupCodeEnabled** | **bool** |  | 
**mfaEnabledAt** | **int** | Unix timestamp of when MFA was last enabled for this user. It should be noted that this field is not nullified if MFA is disabled.  | 
**mfaDisabledAt** | **int** | Unix timestamp of when MFA was last disabled for this user. It should be noted that this field is not nullified if MFA is enabled again.  | 
**passwordLastUpdatedAt** | **int** | Unix timestamp of when the user's password was last updated.  | [optional] 
**externalAccounts** | [**List<ExternalAccountWithVerification>**](ExternalAccountWithVerification.md) |  | [default to const []]
**samlAccounts** | [**List<SAMLAccount>**](SAMLAccount.md) |  | [default to const []]
**enterpriseAccounts** | [**List<EnterpriseAccount>**](EnterpriseAccount.md) |  | [default to const []]
**organizationMemberships** | [**List<OrganizationMembership>**](OrganizationMembership.md) |  | [optional] [default to const []]
**lastSignInAt** | **int** | Unix timestamp of last sign-in.  | 
**banned** | **bool** | Flag to denote whether user is banned or not.  | 
**locked** | **bool** | Flag to denote whether user is currently locked, i.e. restricted from signing in or not.  | 
**lockoutExpiresInSeconds** | **int** | The number of seconds remaining until the lockout period expires for a locked user. A null value for a locked user indicates that lockout never expires.  | 
**verificationAttemptsRemaining** | **int** | The number of verification attempts remaining until the user is locked. Null if account lockout is not enabled. Note: if a user is locked explicitly via the Backend API, they may still have verification attempts remaining.  | 
**updatedAt** | **int** | Unix timestamp of last update.  | 
**createdAt** | **int** | Unix timestamp of creation.  | 
**deleteSelfEnabled** | **bool** | If enabled, user can delete themselves via FAPI.  | 
**createOrganizationEnabled** | **bool** | If enabled, user can create organizations via FAPI.  | 
**createOrganizationsLimit** | **int** | The maximum number of organizations the user can create. 0 means unlimited.  | [optional] 
**lastActiveAt** | **int** | Unix timestamp of the latest session activity, with day precision.  | 
**legalAcceptedAt** | **int** | Unix timestamp of when the user accepted the legal requirements.  | 
**bypassClientTrust** | **bool** | When set to `true`, the user will bypass client trust checks during sign-in. | [optional] [default to false]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


