# openapi.model.CreateM2MToken201Response

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** |  | 
**id** | **String** |  | 
**subject** | **String** |  | 
**claims** | [**Object**](.md) |  | [optional] 
**scopes** | **List<String>** |  | [optional] [default to const []]
**token** | **String** |  | 
**revoked** | **bool** |  | 
**revocationReason** | **String** |  | 
**expired** | **bool** |  | 
**expiration** | **num** | The timestamp for when the token will expire, in milliseconds | 
**lastUsedAt** | **num** | The timestamp for when the token was last used, in milliseconds | 
**createdAt** | **num** | The timestamp for when the token was created, in milliseconds | 
**updatedAt** | **num** | The timestamp for when the token was last updated, in milliseconds | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


