# clerk_backend_api.model.CreateOAuthApplicationRequest

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | The name of the new OAuth application. Max length: 256 | 
**redirectUris** | **List<String>** | An array of redirect URIs of the new OAuth application | [optional] [default to const []]
**callbackUrl** | **String** | The callback URL of the new OAuth application | [optional] 
**scopes** | **String** | Define the allowed scopes for the new OAuth applications that dictate the user payload of the OAuth user info endpoint. Available scopes are `profile`, `email`, `public_metadata`, `private_metadata`. Provide the requested scopes as a string, separated by spaces. | [optional] [default to 'profile email']
**public** | **bool** | If true, this client is public and you can use the Proof Key of Code Exchange (PKCE) flow. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


