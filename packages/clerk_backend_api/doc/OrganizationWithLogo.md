# clerk_backend_api.model.OrganizationWithLogo

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** |  | 
**id** | **String** |  | 
**name** | **String** |  | 
**slug** | **String** |  | 
**membersCount** | **int** |  | [optional] 
**missingMemberWithElevatedPermissions** | **bool** |  | [optional] 
**pendingInvitationsCount** | **int** |  | [optional] 
**maxAllowedMemberships** | **int** |  | 
**adminDeleteEnabled** | **bool** |  | 
**publicMetadata** | [**Map<String, Object>**](Object.md) |  | [default to const {}]
**privateMetadata** | [**Map<String, Object>**](Object.md) |  | [default to const {}]
**createdBy** | **String** |  | [optional] 
**createdAt** | **int** | Unix timestamp of creation.  | 
**updatedAt** | **int** | Unix timestamp of last update.  | 
**logoUrl** | **String** |  | [optional] 
**imageUrl** | **String** |  | 
**hasImage** | **bool** |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


