# openapi.api.InstanceSettingsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getInstance**](InstanceSettingsApi.md#getinstance) | **GET** /instance | Fetch the current instance
[**getInstanceProtect**](InstanceSettingsApi.md#getinstanceprotect) | **GET** /instance/protect | Get instance protect settings
[**updateInstance**](InstanceSettingsApi.md#updateinstance) | **PATCH** /instance | Update instance settings
[**updateInstanceOrganizationSettings**](InstanceSettingsApi.md#updateinstanceorganizationsettings) | **PATCH** /instance/organization_settings | Update instance organization settings
[**updateInstanceProtect**](InstanceSettingsApi.md#updateinstanceprotect) | **PATCH** /instance/protect | Update instance protect settings
[**updateInstanceRestrictions**](InstanceSettingsApi.md#updateinstancerestrictions) | **PATCH** /instance/restrictions | Update instance restrictions


# **getInstance**
> Instance getInstance()

Fetch the current instance

Fetches the current instance

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InstanceSettingsApi();

try {
    final result = api_instance.getInstance();
    print(result);
} catch (e) {
    print('Exception when calling InstanceSettingsApi->getInstance: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Instance**](Instance.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getInstanceProtect**
> InstanceProtect getInstanceProtect()

Get instance protect settings

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InstanceSettingsApi();

try {
    final result = api_instance.getInstanceProtect();
    print(result);
} catch (e) {
    print('Exception when calling InstanceSettingsApi->getInstanceProtect: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InstanceProtect**](InstanceProtect.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateInstance**
> updateInstance(updateInstanceRequest)

Update instance settings

Updates the settings of an instance

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InstanceSettingsApi();
final updateInstanceRequest = UpdateInstanceRequest(); // UpdateInstanceRequest | 

try {
    api_instance.updateInstance(updateInstanceRequest);
} catch (e) {
    print('Exception when calling InstanceSettingsApi->updateInstance: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateInstanceRequest** | [**UpdateInstanceRequest**](UpdateInstanceRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateInstanceOrganizationSettings**
> OrganizationSettings updateInstanceOrganizationSettings(updateInstanceOrganizationSettingsRequest)

Update instance organization settings

Updates the organization settings of the instance

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InstanceSettingsApi();
final updateInstanceOrganizationSettingsRequest = UpdateInstanceOrganizationSettingsRequest(); // UpdateInstanceOrganizationSettingsRequest | 

try {
    final result = api_instance.updateInstanceOrganizationSettings(updateInstanceOrganizationSettingsRequest);
    print(result);
} catch (e) {
    print('Exception when calling InstanceSettingsApi->updateInstanceOrganizationSettings: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateInstanceOrganizationSettingsRequest** | [**UpdateInstanceOrganizationSettingsRequest**](UpdateInstanceOrganizationSettingsRequest.md)|  | [optional] 

### Return type

[**OrganizationSettings**](OrganizationSettings.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateInstanceProtect**
> InstanceProtect updateInstanceProtect(updateInstanceProtectRequest)

Update instance protect settings

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InstanceSettingsApi();
final updateInstanceProtectRequest = UpdateInstanceProtectRequest(); // UpdateInstanceProtectRequest | 

try {
    final result = api_instance.updateInstanceProtect(updateInstanceProtectRequest);
    print(result);
} catch (e) {
    print('Exception when calling InstanceSettingsApi->updateInstanceProtect: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateInstanceProtectRequest** | [**UpdateInstanceProtectRequest**](UpdateInstanceProtectRequest.md)|  | [optional] 

### Return type

[**InstanceProtect**](InstanceProtect.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateInstanceRestrictions**
> InstanceRestrictions updateInstanceRestrictions(updateInstanceRestrictionsRequest)

Update instance restrictions

Updates the restriction settings of an instance

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InstanceSettingsApi();
final updateInstanceRestrictionsRequest = UpdateInstanceRestrictionsRequest(); // UpdateInstanceRestrictionsRequest | 

try {
    final result = api_instance.updateInstanceRestrictions(updateInstanceRestrictionsRequest);
    print(result);
} catch (e) {
    print('Exception when calling InstanceSettingsApi->updateInstanceRestrictions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateInstanceRestrictionsRequest** | [**UpdateInstanceRestrictionsRequest**](UpdateInstanceRestrictionsRequest.md)|  | [optional] 

### Return type

[**InstanceRestrictions**](InstanceRestrictions.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

