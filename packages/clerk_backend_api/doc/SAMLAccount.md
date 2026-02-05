# openapi.model.SAMLAccount

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**object** | **String** | String representing the object's type. Objects of the same type share the same value.  | 
**provider** | **String** |  | 
**active** | **bool** |  | 
**emailAddress** | **String** |  | 
**firstName** | **String** |  | [optional] 
**lastName** | **String** |  | [optional] 
**providerUserId** | **String** |  | [optional] 
**lastAuthenticatedAt** | **int** | Unix timestamp of last authentication.  | [optional] 
**publicMetadata** | [**Map<String, Object>**](Object.md) |  | [optional] [default to const {}]
**verification** | [**SAMLAccountVerification**](SAMLAccountVerification.md) |  | 
**samlConnection** | [**SAMLAccountSamlConnection**](SAMLAccountSamlConnection.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


