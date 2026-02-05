# openapi.model.RoleSetItem

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** |  | 
**id** | **String** | The unique identifier of the role | 
**name** | **String** | The name of the role | 
**key** | **String** | The key of the role (e.g., \"org:admin\", \"org:member\") | 
**description** | **String** | Optional description of the role | 
**membersCount** | **int** | The number of members assigned to this role within the role set | [optional] 
**hasMembers** | **bool** | Whether this role has any members assigned within the role set | [optional] 
**createdAt** | **int** | Unix timestamp of role creation | 
**updatedAt** | **int** | Unix timestamp of last role update | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


