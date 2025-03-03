# clerk_backend_api.model.EmailAddress

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**object** | **String** | String representing the object's type. Objects of the same type share the same value.  | 
**emailAddress** | **String** |  | 
**reserved** | **bool** |  | 
**verification** | [**EmailAddressVerification**](EmailAddressVerification.md) |  | 
**linkedTo** | [**List<IdentificationLink>**](IdentificationLink.md) |  | [default to const []]
**matchesSsoConnection** | **bool** | Indicates whether this email address domain matches an active enterprise connection.  | [optional] 
**createdAt** | **int** | Unix timestamp of creation  | 
**updatedAt** | **int** | Unix timestamp of creation  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


