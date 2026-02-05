# openapi.model.UpdateRoleSetRequest

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | The new name for the role set | [optional] 
**key** | **String** | A unique key for the role set. Must start with 'role_set:' and contain only lowercase alphanumeric characters and underscores. | [optional] 
**description** | **String** | Optional description for the role set | [optional] 
**type** | **String** | Set to \"initial\" to make this the default role set for new organizations. Only one role set can be \"initial\" per instance; setting this will change any existing initial role set to \"custom\". | [optional] 
**defaultRoleKey** | **String** | The key of the role to use as the default role for new organization members. Must be an existing role in the role set. | [optional] 
**creatorRoleKey** | **String** | The key of the role to assign to organization creators. Must be an existing role in the role set. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


