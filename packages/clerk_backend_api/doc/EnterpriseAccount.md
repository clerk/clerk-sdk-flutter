# openapi.model.EnterpriseAccount

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**object** | **String** | String representing the object's type. Objects of the same type share the same value.  | 
**protocol** | **String** | The authentication protocol used to sign in.  | [optional] 
**provider** | **String** |  | 
**active** | **bool** |  | 
**emailAddress** | **String** |  | 
**firstName** | **String** |  | [optional] 
**lastName** | **String** |  | [optional] 
**providerUserId** | **String** | The unique ID of the user in the external provider's system | [optional] 
**enterpriseConnectionId** | **String** |  | [optional] 
**publicMetadata** | [**Map<String, Object>**](Object.md) |  | [optional] [default to const {}]
**verification** | [**EnterpriseAccountVerification**](EnterpriseAccountVerification.md) |  | 
**enterpriseConnection** | [**EnterpriseAccountEnterpriseConnection**](EnterpriseAccountEnterpriseConnection.md) |  | [optional] 
**lastAuthenticatedAt** | **int** | Unix timestamp of last authentication.  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


