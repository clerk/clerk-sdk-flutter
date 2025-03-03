# clerk_backend_api.api.ProxyChecksApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**verifyDomainProxy**](ProxyChecksApi.md#verifydomainproxy) | **POST** /proxy_checks | Verify the proxy configuration for your domain


# **verifyDomainProxy**
> ProxyCheck verifyDomainProxy(verifyDomainProxyRequest)

Verify the proxy configuration for your domain

This endpoint can be used to validate that a proxy-enabled domain is operational. It tries to verify that the proxy URL provided in the parameters maps to a functional proxy that can reach the Clerk Frontend API.  You can use this endpoint before you set a proxy URL for a domain. This way you can ensure that switching to proxy-based configuration will not lead to downtime for your instance.  The `proxy_url` parameter allows for testing proxy configurations for domains that don't have a proxy URL yet, or operate on a different proxy URL than the one provided. It can also be used to re-validate a domain that is already configured to work with a proxy.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ProxyChecksApi();
final verifyDomainProxyRequest = VerifyDomainProxyRequest(); // VerifyDomainProxyRequest | 

try {
    final result = api_instance.verifyDomainProxy(verifyDomainProxyRequest);
    print(result);
} catch (e) {
    print('Exception when calling ProxyChecksApi->verifyDomainProxy: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **verifyDomainProxyRequest** | [**VerifyDomainProxyRequest**](VerifyDomainProxyRequest.md)|  | [optional] 

### Return type

[**ProxyCheck**](ProxyCheck.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

