# openapi.model.RoleSet

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** |  | 
**id** | **String** | The unique identifier of the role set | 
**name** | **String** | The name of the role set | 
**key** | **String** | A unique key for the role set (e.g., \"role_set:default\") | 
**description** | **String** | Optional description of the role set | 
**roles** | [**List<RoleSetItem>**](RoleSetItem.md) | The list of roles in this role set | [default to const []]
**defaultRole** | [**RoleSetItem**](RoleSetItem.md) | The default role assigned to new organization members | [optional] 
**creatorRole** | [**RoleSetItem**](RoleSetItem.md) | The role assigned to the creator of an organization | [optional] 
**type** | **String** | The type of the role set (\"initial\" or \"custom\") | 
**roleSetMigration** | [**RoleSetMigration**](RoleSetMigration.md) | Active migration information, only present when status is \"enqueued\" or \"in_progress\" | [optional] 
**createdAt** | **int** | Unix timestamp of role set creation | 
**updatedAt** | **int** | Unix timestamp of last role set update | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


