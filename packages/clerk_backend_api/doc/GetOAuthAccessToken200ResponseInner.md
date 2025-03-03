# clerk_backend_api.model.GetOAuthAccessToken200ResponseInner

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** |  | [optional] 
**externalAccountId** | **String** | External account ID | [optional] 
**providerUserId** | **String** | The unique ID of the user in the external provider's system | [optional] 
**token** | **String** | The access token | [optional] 
**provider** | **String** | The ID of the provider | [optional] 
**publicMetadata** | [**Map<String, Object>**](Object.md) |  | [optional] [default to const {}]
**label** | **String** |  | [optional] 
**scopes** | **List<String>** | The list of scopes that the token is valid for. Only present for OAuth 2.0 tokens. | [optional] [default to const []]
**tokenSecret** | **String** | The token secret. Only present for OAuth 1.0 tokens. | [optional] 
**expiresAt** | **int** | Unix timestamp of the access token expiration. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


