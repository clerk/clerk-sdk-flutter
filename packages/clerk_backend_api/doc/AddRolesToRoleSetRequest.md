# openapi.model.AddRolesToRoleSetRequest

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**roleKeys** | **List<String>** | Array of role keys to add to the role set. Must contain at least one role and no more than 10 roles. | [default to const []]
**defaultRoleKey** | **String** | Optionally update the default role to one of the newly added roles. | [optional] 
**creatorRoleKey** | **String** | Optionally update the creator role to one of the newly added roles. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


