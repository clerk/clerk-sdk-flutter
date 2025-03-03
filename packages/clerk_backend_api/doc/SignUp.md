# clerk_backend_api.model.SignUp

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** |  | 
**id** | **String** |  | 
**status** | **String** |  | 
**requiredFields** | **List<String>** |  | [default to const []]
**optionalFields** | **List<String>** |  | [default to const []]
**missingFields** | **List<String>** |  | [default to const []]
**unverifiedFields** | **List<String>** |  | [default to const []]
**verifications** | [**SignUpVerifications**](SignUpVerifications.md) |  | 
**username** | **String** |  | 
**emailAddress** | **String** |  | 
**phoneNumber** | **String** |  | 
**web3Wallet** | **String** |  | 
**passwordEnabled** | **bool** |  | 
**firstName** | **String** |  | 
**lastName** | **String** |  | 
**unsafeMetadata** | [**Map<String, Object>**](Object.md) |  | [optional] [default to const {}]
**publicMetadata** | [**Map<String, Object>**](Object.md) |  | [optional] [default to const {}]
**customAction** | **bool** |  | 
**externalId** | **String** |  | 
**createdSessionId** | **String** |  | 
**createdUserId** | **String** |  | 
**abandonAt** | **int** | Unix timestamp at which the user abandoned the sign up attempt.  | 
**legalAcceptedAt** | **int** | Unix timestamp at which the user accepted the legal requirements.  | 
**externalAccount** | [**Object**](.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


