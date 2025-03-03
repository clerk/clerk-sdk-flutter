# clerk_backend_api.api.RedirectURLsApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createRedirectURL**](RedirectURLsApi.md#createredirecturl) | **POST** /redirect_urls | Create a redirect URL
[**deleteRedirectURL**](RedirectURLsApi.md#deleteredirecturl) | **DELETE** /redirect_urls/{id} | Delete a redirect URL
[**getRedirectURL**](RedirectURLsApi.md#getredirecturl) | **GET** /redirect_urls/{id} | Retrieve a redirect URL
[**listRedirectURLs**](RedirectURLsApi.md#listredirecturls) | **GET** /redirect_urls | List all redirect URLs


# **createRedirectURL**
> RedirectURL createRedirectURL(createRedirectURLRequest)

Create a redirect URL

Create a redirect URL

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = RedirectURLsApi();
final createRedirectURLRequest = CreateRedirectURLRequest(); // CreateRedirectURLRequest | 

try {
    final result = api_instance.createRedirectURL(createRedirectURLRequest);
    print(result);
} catch (e) {
    print('Exception when calling RedirectURLsApi->createRedirectURL: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createRedirectURLRequest** | [**CreateRedirectURLRequest**](CreateRedirectURLRequest.md)|  | [optional] 

### Return type

[**RedirectURL**](RedirectURL.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteRedirectURL**
> DeletedObject deleteRedirectURL(id)

Delete a redirect URL

Remove the selected redirect URL from the whitelist of the instance

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = RedirectURLsApi();
final id = id_example; // String | The ID of the redirect URL

try {
    final result = api_instance.deleteRedirectURL(id);
    print(result);
} catch (e) {
    print('Exception when calling RedirectURLsApi->deleteRedirectURL: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The ID of the redirect URL | 

### Return type

[**DeletedObject**](DeletedObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRedirectURL**
> RedirectURL getRedirectURL(id)

Retrieve a redirect URL

Retrieve the details of the redirect URL with the given ID

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = RedirectURLsApi();
final id = id_example; // String | The ID of the redirect URL

try {
    final result = api_instance.getRedirectURL(id);
    print(result);
} catch (e) {
    print('Exception when calling RedirectURLsApi->getRedirectURL: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The ID of the redirect URL | 

### Return type

[**RedirectURL**](RedirectURL.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listRedirectURLs**
> List<RedirectURL> listRedirectURLs(paginated, limit, offset)

List all redirect URLs

Lists all whitelisted redirect_urls for the instance

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = RedirectURLsApi();
final paginated = true; // bool | Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.listRedirectURLs(paginated, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling RedirectURLsApi->listRedirectURLs: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paginated** | **bool**| Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated. | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**List<RedirectURL>**](RedirectURL.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

