# clerk_backend_api.model.OrganizationInvitation

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** | String representing the object's type. Objects of the same type share the same value.  | 
**id** | **String** |  | 
**emailAddress** | **String** |  | 
**role** | **String** |  | 
**roleName** | **String** |  | 
**organizationId** | **String** |  | [optional] 
**status** | **String** |  | [optional] 
**publicMetadata** | [**Map<String, Object>**](Object.md) |  | [default to const {}]
**privateMetadata** | [**Map<String, Object>**](Object.md) |  | [optional] [default to const {}]
**url** | **String** |  | 
**expiresAt** | **int** | Unix timestamp of expiration. | 
**createdAt** | **int** | Unix timestamp of creation. | 
**updatedAt** | **int** | Unix timestamp of last update. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


