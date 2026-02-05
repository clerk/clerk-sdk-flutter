# openapi.model.OrganizationWithLogo

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** |  | 
**id** | **String** |  | 
**name** | **String** |  | 
**slug** | **String** |  | 
**imageUrl** | **String** |  | 
**hasImage** | **bool** |  | 
**membersCount** | **int** |  | [optional] 
**missingMemberWithElevatedPermissions** | **bool** |  | [optional] 
**pendingInvitationsCount** | **int** |  | [optional] 
**maxAllowedMemberships** | **int** |  | 
**adminDeleteEnabled** | **bool** |  | 
**publicMetadata** | [**Map<String, Object>**](Object.md) |  | [default to const {}]
**privateMetadata** | [**Map<String, Object>**](Object.md) |  | [optional] [default to const {}]
**createdBy** | **String** |  | [optional] 
**createdAt** | **int** | Unix timestamp of creation.  | 
**updatedAt** | **int** | Unix timestamp of last update.  | 
**lastActiveAt** | **int** | Unix timestamp of last activity.  | [optional] 
**logoUrl** | **String** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


