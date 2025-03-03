# clerk_backend_api.model.CreateJWTTemplateRequest

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | JWT template name | 
**claims** | [**Object**](.md) | JWT template claims in JSON format | 
**lifetime** | **num** | JWT token lifetime | [optional] 
**allowedClockSkew** | **num** | JWT token allowed clock skew | [optional] 
**customSigningKey** | **bool** | Whether a custom signing key/algorithm is also provided for this template | [optional] 
**signingAlgorithm** | **String** | The custom signing algorithm to use when minting JWTs. Required if `custom_signing_key` is `true`. | [optional] 
**signingKey** | **String** | The custom signing private key to use when minting JWTs. Required if `custom_signing_key` is `true`. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


