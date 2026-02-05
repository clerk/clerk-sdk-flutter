# openapi.model.CreateRoleSetRequest

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | The name of the new role set | 
**key** | **String** | A unique key for the role set. Must start with 'role_set:' and contain only lowercase alphanumeric characters and underscores. If not provided, a key will be generated from the name. | [optional] 
**description** | **String** | Optional description for the role set | [optional] 
**defaultRoleKey** | **String** | The key of the role to use as the default role for new organization members. Must be one of the roles in the `roles` array. | 
**creatorRoleKey** | **String** | The key of the role to assign to organization creators. Must be one of the roles in the `roles` array. | 
**type** | **String** | The type of the role set. \"initial\" role sets are the default for new organizations. Only one role set can be \"initial\" per instance. | [optional] 
**roles** | **List<String>** | Array of role keys to include in the role set. Must contain at least one role and no more than 10 roles. | [default to const []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


