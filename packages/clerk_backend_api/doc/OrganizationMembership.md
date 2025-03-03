# clerk_backend_api.model.OrganizationMembership

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**object** | **String** | String representing the object's type. Objects of the same type share the same value.  | 
**role** | **String** |  | 
**roleName** | **String** |  | [optional] 
**permissions** | **List<String>** |  | [default to const []]
**publicMetadata** | [**Map<String, Object>**](Object.md) | Metadata saved on the organization membership, accessible from both Frontend and Backend APIs | [default to const {}]
**privateMetadata** | [**Map<String, Object>**](Object.md) | Metadata saved on the organization membership, accessible only from the Backend API | [optional] [default to const {}]
**organization** | [**Organization**](Organization.md) |  | 
**publicUserData** | [**OrganizationMembershipPublicUserData**](OrganizationMembershipPublicUserData.md) |  | [optional] 
**createdAt** | **int** | Unix timestamp of creation. | 
**updatedAt** | **int** | Unix timestamp of last update. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


