# clerk_backend_api.api.TestingTokensApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createTestingToken**](TestingTokensApi.md#createtestingtoken) | **POST** /testing_tokens | Retrieve a new testing token


# **createTestingToken**
> TestingToken createTestingToken()

Retrieve a new testing token

Retrieve a new testing token.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = TestingTokensApi();

try {
    final result = api_instance.createTestingToken();
    print(result);
} catch (e) {
    print('Exception when calling TestingTokensApi->createTestingToken: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**TestingToken**](TestingToken.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

