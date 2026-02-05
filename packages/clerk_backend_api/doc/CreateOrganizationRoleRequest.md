# openapi.model.CreateOrganizationRoleRequest

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | The name of the new organization role | 
**key** | **String** | A unique key for the organization role. Must start with 'org:' and contain only lowercase alphanumeric characters and underscores. | 
**description** | **String** | Optional description for the role | [optional] 
**permissions** | **List<String>** | Array of permission IDs to assign to the role | [optional] [default to const []]
**includeInInitialRoleSet** | **bool** | Whether this role should be included in the initial role set | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


