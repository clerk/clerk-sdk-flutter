# clerk_backend_api.api.JWTTemplatesApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createJWTTemplate**](JWTTemplatesApi.md#createjwttemplate) | **POST** /jwt_templates | Create a JWT template
[**deleteJWTTemplate**](JWTTemplatesApi.md#deletejwttemplate) | **DELETE** /jwt_templates/{template_id} | Delete a Template
[**getJWTTemplate**](JWTTemplatesApi.md#getjwttemplate) | **GET** /jwt_templates/{template_id} | Retrieve a template
[**listJWTTemplates**](JWTTemplatesApi.md#listjwttemplates) | **GET** /jwt_templates | List all templates
[**updateJWTTemplate**](JWTTemplatesApi.md#updatejwttemplate) | **PATCH** /jwt_templates/{template_id} | Update a JWT template


# **createJWTTemplate**
> JWTTemplate createJWTTemplate(createJWTTemplateRequest)

Create a JWT template

Create a new JWT template

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = JWTTemplatesApi();
final createJWTTemplateRequest = CreateJWTTemplateRequest(); // CreateJWTTemplateRequest | 

try {
    final result = api_instance.createJWTTemplate(createJWTTemplateRequest);
    print(result);
} catch (e) {
    print('Exception when calling JWTTemplatesApi->createJWTTemplate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createJWTTemplateRequest** | [**CreateJWTTemplateRequest**](CreateJWTTemplateRequest.md)|  | [optional] 

### Return type

[**JWTTemplate**](JWTTemplate.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteJWTTemplate**
> DeletedObject deleteJWTTemplate(templateId)

Delete a Template



### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = JWTTemplatesApi();
final templateId = templateId_example; // String | JWT Template ID

try {
    final result = api_instance.deleteJWTTemplate(templateId);
    print(result);
} catch (e) {
    print('Exception when calling JWTTemplatesApi->deleteJWTTemplate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **templateId** | **String**| JWT Template ID | 

### Return type

[**DeletedObject**](DeletedObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getJWTTemplate**
> JWTTemplate getJWTTemplate(templateId)

Retrieve a template

Retrieve the details of a given JWT template

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = JWTTemplatesApi();
final templateId = templateId_example; // String | JWT Template ID

try {
    final result = api_instance.getJWTTemplate(templateId);
    print(result);
} catch (e) {
    print('Exception when calling JWTTemplatesApi->getJWTTemplate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **templateId** | **String**| JWT Template ID | 

### Return type

[**JWTTemplate**](JWTTemplate.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listJWTTemplates**
> List<JWTTemplate> listJWTTemplates(paginated, limit, offset)

List all templates

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = JWTTemplatesApi();
final paginated = true; // bool | Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.listJWTTemplates(paginated, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling JWTTemplatesApi->listJWTTemplates: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paginated** | **bool**| Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated. | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**List<JWTTemplate>**](JWTTemplate.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateJWTTemplate**
> JWTTemplate updateJWTTemplate(templateId, createJWTTemplateRequest)

Update a JWT template

Updates an existing JWT template

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = JWTTemplatesApi();
final templateId = templateId_example; // String | The ID of the JWT template to update
final createJWTTemplateRequest = CreateJWTTemplateRequest(); // CreateJWTTemplateRequest | 

try {
    final result = api_instance.updateJWTTemplate(templateId, createJWTTemplateRequest);
    print(result);
} catch (e) {
    print('Exception when calling JWTTemplatesApi->updateJWTTemplate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **templateId** | **String**| The ID of the JWT template to update | 
 **createJWTTemplateRequest** | [**CreateJWTTemplateRequest**](CreateJWTTemplateRequest.md)|  | [optional] 

### Return type

[**JWTTemplate**](JWTTemplate.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

