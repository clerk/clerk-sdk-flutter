# clerk_backend_api.model.PhoneNumber

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**object** | **String** | String representing the object's type. Objects of the same type share the same value.  | 
**phoneNumber** | **String** |  | 
**reservedForSecondFactor** | **bool** |  | [optional] 
**defaultSecondFactor** | **bool** |  | [optional] 
**reserved** | **bool** |  | 
**verification** | [**PhoneNumberVerification**](PhoneNumberVerification.md) |  | 
**linkedTo** | [**List<IdentificationLink>**](IdentificationLink.md) |  | [default to const []]
**backupCodes** | **List<String>** |  | [optional] [default to const []]
**createdAt** | **int** | Unix timestamp of creation  | 
**updatedAt** | **int** | Unix timestamp of creation  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


