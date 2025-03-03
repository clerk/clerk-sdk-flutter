# clerk_backend_api.api.SignUpsApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getSignUp**](SignUpsApi.md#getsignup) | **GET** /sign_ups/{id} | Retrieve a sign-up by ID
[**updateSignUp**](SignUpsApi.md#updatesignup) | **PATCH** /sign_ups/{id} | Update a sign-up


# **getSignUp**
> SignUp getSignUp(id)

Retrieve a sign-up by ID

Retrieve the details of the sign-up with the given ID

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SignUpsApi();
final id = id_example; // String | The ID of the sign-up to retrieve

try {
    final result = api_instance.getSignUp(id);
    print(result);
} catch (e) {
    print('Exception when calling SignUpsApi->getSignUp: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The ID of the sign-up to retrieve | 

### Return type

[**SignUp**](SignUp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateSignUp**
> SignUp updateSignUp(id, updateSignUpRequest)

Update a sign-up

Update the sign-up with the given ID

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SignUpsApi();
final id = id_example; // String | The ID of the sign-up to update
final updateSignUpRequest = UpdateSignUpRequest(); // UpdateSignUpRequest | 

try {
    final result = api_instance.updateSignUp(id, updateSignUpRequest);
    print(result);
} catch (e) {
    print('Exception when calling SignUpsApi->updateSignUp: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The ID of the sign-up to update | 
 **updateSignUpRequest** | [**UpdateSignUpRequest**](UpdateSignUpRequest.md)|  | [optional] 

### Return type

[**SignUp**](SignUp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

