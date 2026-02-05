# openapi.model.ExternalAccountWithVerification

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** | String representing the object's type. Objects of the same type share the same value. | 
**id** | **String** |  | 
**provider** | **String** |  | 
**identificationId** | **String** |  | 
**providerUserId** | **String** | The unique ID of the user in the external provider's system | 
**approvedScopes** | **String** |  | 
**emailAddress** | **String** |  | 
**emailAddressVerified** | **bool** | Whether the email was verified by the OAuth provider at creation time. null = unknown (pre-migration data or custom OAuth providers), true = provider confirmed email was verified, false = provider confirmed email was NOT verified  | [optional] 
**firstName** | **String** |  | 
**lastName** | **String** |  | 
**avatarUrl** | **String** | Please use `image_url` instead | [optional] 
**imageUrl** | **String** |  | [optional] 
**username** | **String** |  | [optional] 
**phoneNumber** | **String** |  | [optional] 
**publicMetadata** | [**Map<String, Object>**](Object.md) |  | [default to const {}]
**label** | **String** |  | [optional] 
**createdAt** | **int** | Unix timestamp of creation  | 
**updatedAt** | **int** | Unix timestamp of creation  | 
**verification** | [**ExternalAccountWithVerificationVerification**](ExternalAccountWithVerificationVerification.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


