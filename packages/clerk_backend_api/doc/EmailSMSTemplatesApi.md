# clerk_backend_api.api.EmailSMSTemplatesApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getTemplate**](EmailSMSTemplatesApi.md#gettemplate) | **GET** /templates/{template_type}/{slug} | Retrieve a template
[**getTemplateList**](EmailSMSTemplatesApi.md#gettemplatelist) | **GET** /templates/{template_type} | List all templates
[**previewTemplate**](EmailSMSTemplatesApi.md#previewtemplate) | **POST** /templates/{template_type}/{slug}/preview | Preview changes to a template
[**revertTemplate**](EmailSMSTemplatesApi.md#reverttemplate) | **POST** /templates/{template_type}/{slug}/revert | Revert a template
[**toggleTemplateDelivery**](EmailSMSTemplatesApi.md#toggletemplatedelivery) | **POST** /templates/{template_type}/{slug}/toggle_delivery | Toggle the delivery by Clerk for a template of a given type and slug
[**upsertTemplate**](EmailSMSTemplatesApi.md#upserttemplate) | **PUT** /templates/{template_type}/{slug} | Update a template for a given type and slug


# **getTemplate**
> Template getTemplate(templateType, slug)

Retrieve a template

Returns the details of a template

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = EmailSMSTemplatesApi();
final templateType = templateType_example; // String | The type of templates to retrieve (email or SMS)
final slug = slug_example; // String | The slug (i.e. machine-friendly name) of the template to retrieve

try {
    final result = api_instance.getTemplate(templateType, slug);
    print(result);
} catch (e) {
    print('Exception when calling EmailSMSTemplatesApi->getTemplate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **templateType** | **String**| The type of templates to retrieve (email or SMS) | 
 **slug** | **String**| The slug (i.e. machine-friendly name) of the template to retrieve | 

### Return type

[**Template**](Template.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTemplateList**
> List<Template> getTemplateList(templateType, paginated, limit, offset)

List all templates

Returns a list of all templates. The templates are returned sorted by position.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = EmailSMSTemplatesApi();
final templateType = templateType_example; // String | The type of templates to list (email or SMS)
final paginated = true; // bool | Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.getTemplateList(templateType, paginated, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling EmailSMSTemplatesApi->getTemplateList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **templateType** | **String**| The type of templates to list (email or SMS) | 
 **paginated** | **bool**| Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated. | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**List<Template>**](Template.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **previewTemplate**
> Object previewTemplate(templateType, slug, previewTemplateRequest)

Preview changes to a template

Returns a preview of a template for a given template_type, slug and body

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = EmailSMSTemplatesApi();
final templateType = templateType_example; // String | The type of template to preview
final slug = slug_example; // String | The slug of the template to preview
final previewTemplateRequest = PreviewTemplateRequest(); // PreviewTemplateRequest | Required parameters

try {
    final result = api_instance.previewTemplate(templateType, slug, previewTemplateRequest);
    print(result);
} catch (e) {
    print('Exception when calling EmailSMSTemplatesApi->previewTemplate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **templateType** | **String**| The type of template to preview | 
 **slug** | **String**| The slug of the template to preview | 
 **previewTemplateRequest** | [**PreviewTemplateRequest**](PreviewTemplateRequest.md)| Required parameters | [optional] 

### Return type

[**Object**](Object.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revertTemplate**
> Template revertTemplate(templateType, slug)

Revert a template

Reverts an updated template to its default state

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = EmailSMSTemplatesApi();
final templateType = templateType_example; // String | The type of template to revert
final slug = slug_example; // String | The slug of the template to revert

try {
    final result = api_instance.revertTemplate(templateType, slug);
    print(result);
} catch (e) {
    print('Exception when calling EmailSMSTemplatesApi->revertTemplate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **templateType** | **String**| The type of template to revert | 
 **slug** | **String**| The slug of the template to revert | 

### Return type

[**Template**](Template.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **toggleTemplateDelivery**
> Template toggleTemplateDelivery(templateType, slug, toggleTemplateDeliveryRequest)

Toggle the delivery by Clerk for a template of a given type and slug

Toggles the delivery by Clerk for a template of a given type and slug. If disabled, Clerk will not deliver the resulting email or SMS. The app developer will need to listen to the `email.created` or `sms.created` webhooks in order to handle delivery themselves.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = EmailSMSTemplatesApi();
final templateType = templateType_example; // String | The type of template to toggle delivery for
final slug = slug_example; // String | The slug of the template for which to toggle delivery
final toggleTemplateDeliveryRequest = ToggleTemplateDeliveryRequest(); // ToggleTemplateDeliveryRequest | 

try {
    final result = api_instance.toggleTemplateDelivery(templateType, slug, toggleTemplateDeliveryRequest);
    print(result);
} catch (e) {
    print('Exception when calling EmailSMSTemplatesApi->toggleTemplateDelivery: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **templateType** | **String**| The type of template to toggle delivery for | 
 **slug** | **String**| The slug of the template for which to toggle delivery | 
 **toggleTemplateDeliveryRequest** | [**ToggleTemplateDeliveryRequest**](ToggleTemplateDeliveryRequest.md)|  | [optional] 

### Return type

[**Template**](Template.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **upsertTemplate**
> Template upsertTemplate(templateType, slug, upsertTemplateRequest)

Update a template for a given type and slug

Updates the existing template of the given type and slug

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = EmailSMSTemplatesApi();
final templateType = templateType_example; // String | The type of template to update
final slug = slug_example; // String | The slug of the template to update
final upsertTemplateRequest = UpsertTemplateRequest(); // UpsertTemplateRequest | 

try {
    final result = api_instance.upsertTemplate(templateType, slug, upsertTemplateRequest);
    print(result);
} catch (e) {
    print('Exception when calling EmailSMSTemplatesApi->upsertTemplate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **templateType** | **String**| The type of template to update | 
 **slug** | **String**| The slug of the template to update | 
 **upsertTemplateRequest** | [**UpsertTemplateRequest**](UpsertTemplateRequest.md)|  | [optional] 

### Return type

[**Template**](Template.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

