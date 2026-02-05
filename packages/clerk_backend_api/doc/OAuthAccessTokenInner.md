# openapi.model.OAuthAccessTokenInner

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** |  | 
**externalAccountId** | **String** | External account ID | 
**providerUserId** | **String** | The unique ID of the user in the external provider's system | 
**token** | **String** | The access token | 
**expiresAt** | **int** | Unix timestamp of the access token expiration. | 
**provider** | **String** | The ID of the provider | 
**publicMetadata** | [**Map<String, Object>**](Object.md) |  | [default to const {}]
**label** | **String** |  | 
**scopes** | **List<String>** | The list of scopes that the token is valid for. Only present for OAuth 2.0 tokens. | [optional] [default to const []]
**idToken** | **String** | The ID token retrieved from the OIDC provider. Only present for OIDC-compliant OAuth 2.0 providers when available. | [optional] 
**tokenSecret** | **String** | The token secret. Only present for OAuth 1.0 tokens. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


