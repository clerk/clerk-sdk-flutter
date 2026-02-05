# openapi.model.Role

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
**key** | **String** |  | 
**description** | **String** |  | 
**isCreatorEligible** | **bool** | Whether this role is eligible to be an organization creator role | 
**permissions** | [**List<Permission>**](Permission.md) |  | [default to const []]
**createdAt** | **int** | Unix timestamp of creation.  | 
**updatedAt** | **int** | Unix timestamp of last update.  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


