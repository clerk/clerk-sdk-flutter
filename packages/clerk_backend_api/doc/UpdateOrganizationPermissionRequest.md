# openapi.model.UpdateOrganizationPermissionRequest

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | The name of the permission. | [optional] 
**key** | **String** | The key of the permission. Must have the format \"org:feature:action\" where feature and action are segments consisting of lowercase letters, digits, or underscores. Cannot begin with \"org:sys_\" as that prefix is reserved for system permissions. | [optional] 
**description** | **String** | A description of the permission. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


