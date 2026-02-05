# openapi.model.GetApiKeys200ResponseDataInner

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** |  | 
**id** | **String** |  | 
**type** | **String** |  | 
**subject** | **String** |  | 
**name** | **String** |  | 
**description** | **String** |  | [optional] 
**claims** | [**Object**](.md) |  | 
**scopes** | **List<String>** |  | [default to const []]
**revoked** | **bool** |  | 
**revocationReason** | **String** |  | 
**expired** | **bool** |  | 
**expiration** | **num** | The timestamp for when the API key will expire, in milliseconds | 
**createdBy** | **String** |  | 
**lastUsedAt** | **num** | The timestamp for when the API key was last used, in milliseconds | 
**createdAt** | **num** | The timestamp for when the API key was created, in milliseconds | 
**updatedAt** | **num** | The timestamp for when the API key was last updated, in milliseconds | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


