# openapi.api.APIKeysApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createApiKey**](APIKeysApi.md#createapikey) | **POST** /api_keys | Create an API Key
[**deleteApiKey**](APIKeysApi.md#deleteapikey) | **DELETE** /api_keys/{apiKeyID} | Delete an API Key
[**getApiKey**](APIKeysApi.md#getapikey) | **GET** /api_keys/{apiKeyID} | Get an API Key by ID
[**getApiKeySecret**](APIKeysApi.md#getapikeysecret) | **GET** /api_keys/{apiKeyID}/secret | Get an API Key Secret
[**getApiKeys**](APIKeysApi.md#getapikeys) | **GET** /api_keys | Get API Keys
[**revokeApiKey**](APIKeysApi.md#revokeapikey) | **POST** /api_keys/{apiKeyID}/revoke | Revoke an API Key
[**updateApiKey**](APIKeysApi.md#updateapikey) | **PATCH** /api_keys/{apiKeyID} | Update an API Key
[**verifyApiKey**](APIKeysApi.md#verifyapikey) | **POST** /api_keys/verify | Verify an API Key


# **createApiKey**
> CreateApiKey200Response createApiKey(createApiKeyRequest)

Create an API Key

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = APIKeysApi();
final createApiKeyRequest = CreateApiKeyRequest(); // CreateApiKeyRequest | 

try {
    final result = api_instance.createApiKey(createApiKeyRequest);
    print(result);
} catch (e) {
    print('Exception when calling APIKeysApi->createApiKey: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createApiKeyRequest** | [**CreateApiKeyRequest**](CreateApiKeyRequest.md)|  | 

### Return type

[**CreateApiKey200Response**](CreateApiKey200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteApiKey**
> DeleteApiKey200Response deleteApiKey(apiKeyID)

Delete an API Key

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = APIKeysApi();
final apiKeyID = apiKeyID_example; // String | 

try {
    final result = api_instance.deleteApiKey(apiKeyID);
    print(result);
} catch (e) {
    print('Exception when calling APIKeysApi->deleteApiKey: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKeyID** | **String**|  | 

### Return type

[**DeleteApiKey200Response**](DeleteApiKey200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getApiKey**
> GetApiKeys200ResponseDataInner getApiKey(apiKeyID)

Get an API Key by ID

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = APIKeysApi();
final apiKeyID = apiKeyID_example; // String | 

try {
    final result = api_instance.getApiKey(apiKeyID);
    print(result);
} catch (e) {
    print('Exception when calling APIKeysApi->getApiKey: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKeyID** | **String**|  | 

### Return type

[**GetApiKeys200ResponseDataInner**](GetApiKeys200ResponseDataInner.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getApiKeySecret**
> GetApiKeySecret200Response getApiKeySecret(apiKeyID)

Get an API Key Secret

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = APIKeysApi();
final apiKeyID = apiKeyID_example; // String | 

try {
    final result = api_instance.getApiKeySecret(apiKeyID);
    print(result);
} catch (e) {
    print('Exception when calling APIKeysApi->getApiKeySecret: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKeyID** | **String**|  | 

### Return type

[**GetApiKeySecret200Response**](GetApiKeySecret200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getApiKeys**
> GetApiKeys200Response getApiKeys(subject, type, includeInvalid, limit, offset, query)

Get API Keys

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = APIKeysApi();
final subject = subject_example; // String | 
final type = type_example; // String | 
final includeInvalid = includeInvalid_example; // String | 
final limit = 8.14; // num | 
final offset = 8.14; // num | 
final query = query_example; // String | 

try {
    final result = api_instance.getApiKeys(subject, type, includeInvalid, limit, offset, query);
    print(result);
} catch (e) {
    print('Exception when calling APIKeysApi->getApiKeys: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subject** | **String**|  | 
 **type** | **String**|  | [optional] [default to 'api_key']
 **includeInvalid** | **String**|  | [optional] [default to 'false']
 **limit** | **num**|  | [optional] [default to 10]
 **offset** | **num**|  | [optional] [default to 0]
 **query** | **String**|  | [optional] 

### Return type

[**GetApiKeys200Response**](GetApiKeys200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeApiKey**
> GetApiKeys200ResponseDataInner revokeApiKey(apiKeyID, revokeApiKeyRequest)

Revoke an API Key

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = APIKeysApi();
final apiKeyID = apiKeyID_example; // String | 
final revokeApiKeyRequest = RevokeApiKeyRequest(); // RevokeApiKeyRequest | 

try {
    final result = api_instance.revokeApiKey(apiKeyID, revokeApiKeyRequest);
    print(result);
} catch (e) {
    print('Exception when calling APIKeysApi->revokeApiKey: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKeyID** | **String**|  | 
 **revokeApiKeyRequest** | [**RevokeApiKeyRequest**](RevokeApiKeyRequest.md)|  | 

### Return type

[**GetApiKeys200ResponseDataInner**](GetApiKeys200ResponseDataInner.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateApiKey**
> GetApiKeys200ResponseDataInner updateApiKey(apiKeyID, updateApiKeyRequest)

Update an API Key

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = APIKeysApi();
final apiKeyID = apiKeyID_example; // String | 
final updateApiKeyRequest = UpdateApiKeyRequest(); // UpdateApiKeyRequest | 

try {
    final result = api_instance.updateApiKey(apiKeyID, updateApiKeyRequest);
    print(result);
} catch (e) {
    print('Exception when calling APIKeysApi->updateApiKey: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKeyID** | **String**|  | 
 **updateApiKeyRequest** | [**UpdateApiKeyRequest**](UpdateApiKeyRequest.md)|  | 

### Return type

[**GetApiKeys200ResponseDataInner**](GetApiKeys200ResponseDataInner.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifyApiKey**
> GetApiKeys200ResponseDataInner verifyApiKey(verifyApiKeyRequest)

Verify an API Key

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = APIKeysApi();
final verifyApiKeyRequest = VerifyApiKeyRequest(); // VerifyApiKeyRequest | 

try {
    final result = api_instance.verifyApiKey(verifyApiKeyRequest);
    print(result);
} catch (e) {
    print('Exception when calling APIKeysApi->verifyApiKey: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **verifyApiKeyRequest** | [**VerifyApiKeyRequest**](VerifyApiKeyRequest.md)|  | 

### Return type

[**GetApiKeys200ResponseDataInner**](GetApiKeys200ResponseDataInner.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

