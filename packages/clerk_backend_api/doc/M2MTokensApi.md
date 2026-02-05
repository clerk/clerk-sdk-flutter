# openapi.api.M2MTokensApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createM2MToken**](M2MTokensApi.md#createm2mtoken) | **POST** /m2m_tokens | Create a M2M Token
[**getM2MTokens**](M2MTokensApi.md#getm2mtokens) | **GET** /m2m_tokens | Get M2M Tokens
[**revokeM2MToken**](M2MTokensApi.md#revokem2mtoken) | **POST** /m2m_tokens/{m2m_token_id}/revoke | Revoke a M2M Token
[**verifyM2MToken**](M2MTokensApi.md#verifym2mtoken) | **POST** /m2m_tokens/verify | Verify a M2M Token


# **createM2MToken**
> CreateM2MToken201Response createM2MToken(createM2MTokenRequest)

Create a M2M Token

Creates a new M2M Token. Must be authenticated via a Machine Secret Key.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = M2MTokensApi();
final createM2MTokenRequest = CreateM2MTokenRequest(); // CreateM2MTokenRequest | 

try {
    final result = api_instance.createM2MToken(createM2MTokenRequest);
    print(result);
} catch (e) {
    print('Exception when calling M2MTokensApi->createM2MToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createM2MTokenRequest** | [**CreateM2MTokenRequest**](CreateM2MTokenRequest.md)|  | 

### Return type

[**CreateM2MToken201Response**](CreateM2MToken201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getM2MTokens**
> GetM2MTokens200Response getM2MTokens(subject, revoked, expired, limit, offset)

Get M2M Tokens

Fetches M2M tokens for a specific machine.  This endpoint can be authenticated by either a Machine Secret Key or by a Clerk Secret Key.  - When fetching M2M tokens with a Machine Secret Key, only tokens associated with the authenticated machine can be retrieved. - When fetching M2M tokens with a Clerk Secret Key, tokens for any machine in the instance can be retrieved.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = M2MTokensApi();
final subject = subject_example; // String | 
final revoked = true; // bool | 
final expired = true; // bool | 
final limit = 8.14; // num | 
final offset = 8.14; // num | 

try {
    final result = api_instance.getM2MTokens(subject, revoked, expired, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling M2MTokensApi->getM2MTokens: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subject** | **String**|  | 
 **revoked** | **bool**|  | [optional] [default to false]
 **expired** | **bool**|  | [optional] [default to false]
 **limit** | **num**|  | [optional] [default to 10]
 **offset** | **num**|  | [optional] [default to 0]

### Return type

[**GetM2MTokens200Response**](GetM2MTokens200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeM2MToken**
> GetM2MTokens200ResponseM2mTokensInner revokeM2MToken(m2mTokenId, revokeApiKeyRequest)

Revoke a M2M Token

Revokes a M2M Token.  This endpoint can be authenticated by either a Machine Secret Key or by a Clerk Secret Key.  - When revoking a M2M Token with a Machine Secret Key, the token must managed by the Machine associated with the Machine Secret Key. - When revoking a M2M Token with a Clerk Secret Key, any token on the Instance can be revoked.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = M2MTokensApi();
final m2mTokenId = m2mTokenId_example; // String | 
final revokeApiKeyRequest = RevokeApiKeyRequest(); // RevokeApiKeyRequest | 

try {
    final result = api_instance.revokeM2MToken(m2mTokenId, revokeApiKeyRequest);
    print(result);
} catch (e) {
    print('Exception when calling M2MTokensApi->revokeM2MToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **m2mTokenId** | **String**|  | 
 **revokeApiKeyRequest** | [**RevokeApiKeyRequest**](RevokeApiKeyRequest.md)|  | 

### Return type

[**GetM2MTokens200ResponseM2mTokensInner**](GetM2MTokens200ResponseM2mTokensInner.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifyM2MToken**
> GetM2MTokens200ResponseM2mTokensInner verifyM2MToken(verifyM2MTokenRequest)

Verify a M2M Token

Verifies a M2M Token.  This endpoint can be authenticated by either a Machine Secret Key or by a Clerk Secret Key.  - When verifying a M2M Token with a Machine Secret Key, the token must be granted access to the Machine associated with the Machine Secret Key. - When verifying a M2M Token with a Clerk Secret Key, any token on the Instance can be verified.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = M2MTokensApi();
final verifyM2MTokenRequest = VerifyM2MTokenRequest(); // VerifyM2MTokenRequest | 

try {
    final result = api_instance.verifyM2MToken(verifyM2MTokenRequest);
    print(result);
} catch (e) {
    print('Exception when calling M2MTokensApi->verifyM2MToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **verifyM2MTokenRequest** | [**VerifyM2MTokenRequest**](VerifyM2MTokenRequest.md)|  | 

### Return type

[**GetM2MTokens200ResponseM2mTokensInner**](GetM2MTokens200ResponseM2mTokensInner.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

