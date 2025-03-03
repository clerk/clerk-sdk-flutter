# clerk_backend_api.api.WebhooksApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createSvixApp**](WebhooksApi.md#createsvixapp) | **POST** /webhooks/svix | Create a Svix app
[**deleteSvixApp**](WebhooksApi.md#deletesvixapp) | **DELETE** /webhooks/svix | Delete a Svix app
[**generateSvixAuthURL**](WebhooksApi.md#generatesvixauthurl) | **POST** /webhooks/svix_url | Create a Svix Dashboard URL


# **createSvixApp**
> SvixURL createSvixApp()

Create a Svix app

Create a Svix app and associate it with the current instance

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = WebhooksApi();

try {
    final result = api_instance.createSvixApp();
    print(result);
} catch (e) {
    print('Exception when calling WebhooksApi->createSvixApp: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**SvixURL**](SvixURL.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteSvixApp**
> deleteSvixApp()

Delete a Svix app

Delete a Svix app and disassociate it from the current instance

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = WebhooksApi();

try {
    api_instance.deleteSvixApp();
} catch (e) {
    print('Exception when calling WebhooksApi->deleteSvixApp: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **generateSvixAuthURL**
> SvixURL generateSvixAuthURL()

Create a Svix Dashboard URL

Generate a new url for accessing the Svix's management dashboard for that particular instance

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = WebhooksApi();

try {
    final result = api_instance.generateSvixAuthURL();
    print(result);
} catch (e) {
    print('Exception when calling WebhooksApi->generateSvixAuthURL: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**SvixURL**](SvixURL.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

