# clerk_backend_api.api.MiscellaneousApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getPublicInterstitial**](MiscellaneousApi.md#getpublicinterstitial) | **GET** /public/interstitial | Returns the markup for the interstitial page


# **getPublicInterstitial**
> getPublicInterstitial(frontendApi, frontendApi2, publishableKey, proxyUrl, domain, signInUrl, useDomainForScript)

Returns the markup for the interstitial page

The Clerk interstitial endpoint serves an html page that loads clerk.js in order to check the user's authentication state. It is used by Clerk SDKs when the user's authentication state cannot be immediately determined.

### Example
```dart
import 'package:clerk_backend_api/api.dart';

final api_instance = MiscellaneousApi();
final frontendApi = frontendApi_example; // String | Please use `frontend_api` instead
final frontendApi2 = frontendApi_example; // String | The Frontend API key of your instance
final publishableKey = publishableKey_example; // String | The publishable key of your instance
final proxyUrl = proxyUrl_example; // String | The proxy URL of your instance
final domain = domain_example; // String | The domain of your instance
final signInUrl = signInUrl_example; // String | The sign in URL of your instance
final useDomainForScript = true; // bool | Whether to use the domain for the script URL

try {
    api_instance.getPublicInterstitial(frontendApi, frontendApi2, publishableKey, proxyUrl, domain, signInUrl, useDomainForScript);
} catch (e) {
    print('Exception when calling MiscellaneousApi->getPublicInterstitial: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **frontendApi** | **String**| Please use `frontend_api` instead | [optional] 
 **frontendApi2** | **String**| The Frontend API key of your instance | [optional] 
 **publishableKey** | **String**| The publishable key of your instance | [optional] 
 **proxyUrl** | **String**| The proxy URL of your instance | [optional] 
 **domain** | **String**| The domain of your instance | [optional] 
 **signInUrl** | **String**| The sign in URL of your instance | [optional] 
 **useDomainForScript** | **bool**| Whether to use the domain for the script URL | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

