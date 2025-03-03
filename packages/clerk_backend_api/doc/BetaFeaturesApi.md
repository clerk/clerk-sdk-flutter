# clerk_backend_api.api.BetaFeaturesApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**changeProductionInstanceDomain**](BetaFeaturesApi.md#changeproductioninstancedomain) | **POST** /instance/change_domain | Update production instance domain
[**updateInstanceAuthConfig**](BetaFeaturesApi.md#updateinstanceauthconfig) | **PATCH** /beta_features/instance_settings | Update instance settings
[**updateProductionInstanceDomain**](BetaFeaturesApi.md#updateproductioninstancedomain) | **PUT** /beta_features/domain | Update production instance domain


# **changeProductionInstanceDomain**
> changeProductionInstanceDomain(changeProductionInstanceDomainRequest)

Update production instance domain

Change the domain of a production instance.  Changing the domain requires updating the [DNS records](https://clerk.com/docs/deployments/overview#dns-records) accordingly, deploying new [SSL certificates](https://clerk.com/docs/deployments/overview#deploy), updating your Social Connection's redirect URLs and setting the new keys in your code.  WARNING: Changing your domain will invalidate all current user sessions (i.e. users will be logged out). Also, while your application is being deployed, a small downtime is expected to occur.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = BetaFeaturesApi();
final changeProductionInstanceDomainRequest = ChangeProductionInstanceDomainRequest(); // ChangeProductionInstanceDomainRequest | 

try {
    api_instance.changeProductionInstanceDomain(changeProductionInstanceDomainRequest);
} catch (e) {
    print('Exception when calling BetaFeaturesApi->changeProductionInstanceDomain: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **changeProductionInstanceDomainRequest** | [**ChangeProductionInstanceDomainRequest**](ChangeProductionInstanceDomainRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateInstanceAuthConfig**
> UpdateInstanceAuthConfig200Response updateInstanceAuthConfig(updateInstanceAuthConfigRequest)

Update instance settings

Updates the settings of an instance

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = BetaFeaturesApi();
final updateInstanceAuthConfigRequest = UpdateInstanceAuthConfigRequest(); // UpdateInstanceAuthConfigRequest | 

try {
    final result = api_instance.updateInstanceAuthConfig(updateInstanceAuthConfigRequest);
    print(result);
} catch (e) {
    print('Exception when calling BetaFeaturesApi->updateInstanceAuthConfig: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateInstanceAuthConfigRequest** | [**UpdateInstanceAuthConfigRequest**](UpdateInstanceAuthConfigRequest.md)|  | [optional] 

### Return type

[**UpdateInstanceAuthConfig200Response**](UpdateInstanceAuthConfig200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProductionInstanceDomain**
> updateProductionInstanceDomain(updateProductionInstanceDomainRequest)

Update production instance domain

Change the domain of a production instance.  Changing the domain requires updating the [DNS records](https://clerk.com/docs/deployments/overview#dns-records) accordingly, deploying new [SSL certificates](https://clerk.com/docs/deployments/overview#deploy), updating your Social Connection's redirect URLs and setting the new keys in your code.  WARNING: Changing your domain will invalidate all current user sessions (i.e. users will be logged out). Also, while your application is being deployed, a small downtime is expected to occur.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = BetaFeaturesApi();
final updateProductionInstanceDomainRequest = UpdateProductionInstanceDomainRequest(); // UpdateProductionInstanceDomainRequest | 

try {
    api_instance.updateProductionInstanceDomain(updateProductionInstanceDomainRequest);
} catch (e) {
    print('Exception when calling BetaFeaturesApi->updateProductionInstanceDomain: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateProductionInstanceDomainRequest** | [**UpdateProductionInstanceDomainRequest**](UpdateProductionInstanceDomainRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

