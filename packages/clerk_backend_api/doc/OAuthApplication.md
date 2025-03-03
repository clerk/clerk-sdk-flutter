# clerk_backend_api.model.OAuthApplication

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** |  | 
**id** | **String** |  | 
**instanceId** | **String** |  | 
**name** | **String** |  | 
**clientId** | **String** |  | 
**public** | **bool** |  | 
**scopes** | **String** |  | 
**redirectUris** | **List<String>** |  | [default to const []]
**callbackUrl** | **String** | Deprecated: Use redirect_uris instead.  | 
**authorizeUrl** | **String** |  | 
**tokenFetchUrl** | **String** |  | 
**userInfoUrl** | **String** |  | 
**discoveryUrl** | **String** |  | 
**tokenIntrospectionUrl** | **String** |  | 
**createdAt** | **int** | Unix timestamp of creation.  | 
**updatedAt** | **int** | Unix timestamp of last update.  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


