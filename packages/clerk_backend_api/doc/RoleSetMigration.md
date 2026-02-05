# openapi.model.RoleSetMigration

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** |  | 
**id** | **String** | The unique identifier of the migration | 
**organizationId** | **String** | The organization ID if the migration is scoped to a specific organization | [optional] 
**instanceId** | **String** | The instance ID this migration belongs to | 
**sourceRoleSetId** | **String** | The ID of the source role set being migrated from | 
**destRoleSetId** | **String** | The ID of the destination role set being migrated to | [optional] 
**triggerType** | **String** | What triggered this migration (e.g., \"role_set_deletion\", \"role_removal\") | 
**status** | **String** | Current status of the migration (e.g., \"enqueued\", \"in_progress\", \"completed\") | 
**migratedMembers** | **int** | Number of members that have been migrated so far | 
**mappings** | **Map<String, String>** | Role key mappings from source to destination roles | [optional] [default to const {}]
**startedAt** | **int** | Unix timestamp when the migration started | [optional] 
**completedAt** | **int** | Unix timestamp when the migration completed | [optional] 
**createdAt** | **int** | Unix timestamp of migration creation | 
**updatedAt** | **int** | Unix timestamp of last migration update | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


