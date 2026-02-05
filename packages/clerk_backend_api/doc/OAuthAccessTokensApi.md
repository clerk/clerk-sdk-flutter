# openapi.api.OAuthAccessTokensApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**verifyOAuthAccessToken**](OAuthAccessTokensApi.md#verifyoauthaccesstoken) | **POST** /oauth_applications/access_tokens/verify | Verify an OAuth Access Token


# **verifyOAuthAccessToken**
> VerifyOAuthAccessToken200Response verifyOAuthAccessToken(verifyOAuthAccessTokenRequest)

Verify an OAuth Access Token

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OAuthAccessTokensApi();
final verifyOAuthAccessTokenRequest = VerifyOAuthAccessTokenRequest(); // VerifyOAuthAccessTokenRequest | 

try {
    final result = api_instance.verifyOAuthAccessToken(verifyOAuthAccessTokenRequest);
    print(result);
} catch (e) {
    print('Exception when calling OAuthAccessTokensApi->verifyOAuthAccessToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **verifyOAuthAccessTokenRequest** | [**VerifyOAuthAccessTokenRequest**](VerifyOAuthAccessTokenRequest.md)|  | 

### Return type

[**VerifyOAuthAccessToken200Response**](VerifyOAuthAccessToken200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

