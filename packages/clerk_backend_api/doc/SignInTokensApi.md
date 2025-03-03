# clerk_backend_api.api.SignInTokensApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createSignInToken**](SignInTokensApi.md#createsignintoken) | **POST** /sign_in_tokens | Create sign-in token
[**revokeSignInToken**](SignInTokensApi.md#revokesignintoken) | **POST** /sign_in_tokens/{sign_in_token_id}/revoke | Revoke the given sign-in token


# **createSignInToken**
> SignInToken createSignInToken(createSignInTokenRequest)

Create sign-in token

Creates a new sign-in token and associates it with the given user. By default, sign-in tokens expire in 30 days. You can optionally supply a different duration in seconds using the `expires_in_seconds` property.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SignInTokensApi();
final createSignInTokenRequest = CreateSignInTokenRequest(); // CreateSignInTokenRequest | 

try {
    final result = api_instance.createSignInToken(createSignInTokenRequest);
    print(result);
} catch (e) {
    print('Exception when calling SignInTokensApi->createSignInToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createSignInTokenRequest** | [**CreateSignInTokenRequest**](CreateSignInTokenRequest.md)|  | [optional] 

### Return type

[**SignInToken**](SignInToken.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeSignInToken**
> SignInToken revokeSignInToken(signInTokenId)

Revoke the given sign-in token

Revokes a pending sign-in token

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SignInTokensApi();
final signInTokenId = signInTokenId_example; // String | The ID of the sign-in token to be revoked

try {
    final result = api_instance.revokeSignInToken(signInTokenId);
    print(result);
} catch (e) {
    print('Exception when calling SignInTokensApi->revokeSignInToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **signInTokenId** | **String**| The ID of the sign-in token to be revoked | 

### Return type

[**SignInToken**](SignInToken.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

