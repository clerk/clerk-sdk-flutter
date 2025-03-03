# clerk_backend_api.api.OrganizationDomainsApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOrganizationDomain**](OrganizationDomainsApi.md#createorganizationdomain) | **POST** /organizations/{organization_id}/domains | Create a new organization domain.
[**deleteOrganizationDomain**](OrganizationDomainsApi.md#deleteorganizationdomain) | **DELETE** /organizations/{organization_id}/domains/{domain_id} | Remove a domain from an organization.
[**listOrganizationDomains**](OrganizationDomainsApi.md#listorganizationdomains) | **GET** /organizations/{organization_id}/domains | Get a list of all domains of an organization.
[**updateOrganizationDomain**](OrganizationDomainsApi.md#updateorganizationdomain) | **PATCH** /organizations/{organization_id}/domains/{domain_id} | Update an organization domain.


# **createOrganizationDomain**
> OrganizationDomain createOrganizationDomain(organizationId, createOrganizationDomainRequest)

Create a new organization domain.

Creates a new organization domain. By default the domain is verified, but can be optionally set to unverified.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationDomainsApi();
final organizationId = organizationId_example; // String | The ID of the organization where the new domain will be created.
final createOrganizationDomainRequest = CreateOrganizationDomainRequest(); // CreateOrganizationDomainRequest | 

try {
    final result = api_instance.createOrganizationDomain(organizationId, createOrganizationDomainRequest);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationDomainsApi->createOrganizationDomain: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The ID of the organization where the new domain will be created. | 
 **createOrganizationDomainRequest** | [**CreateOrganizationDomainRequest**](CreateOrganizationDomainRequest.md)|  | 

### Return type

[**OrganizationDomain**](OrganizationDomain.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrganizationDomain**
> DeletedObject deleteOrganizationDomain(organizationId, domainId)

Remove a domain from an organization.

Removes the given domain from the organization.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationDomainsApi();
final organizationId = organizationId_example; // String | The ID of the organization the domain belongs to
final domainId = domainId_example; // String | The ID of the domain

try {
    final result = api_instance.deleteOrganizationDomain(organizationId, domainId);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationDomainsApi->deleteOrganizationDomain: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The ID of the organization the domain belongs to | 
 **domainId** | **String**| The ID of the domain | 

### Return type

[**DeletedObject**](DeletedObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listOrganizationDomains**
> OrganizationDomains listOrganizationDomains(organizationId, verified, enrollmentMode, limit, offset)

Get a list of all domains of an organization.

Get a list of all domains of an organization.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationDomainsApi();
final organizationId = organizationId_example; // String | The organization ID.
final verified = verified_example; // String | Filter domains by their verification status. `true` or `false`
final enrollmentMode = enrollmentMode_example; // String | Filter domains by their enrollment mode
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.listOrganizationDomains(organizationId, verified, enrollmentMode, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationDomainsApi->listOrganizationDomains: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The organization ID. | 
 **verified** | **String**| Filter domains by their verification status. `true` or `false` | [optional] 
 **enrollmentMode** | **String**| Filter domains by their enrollment mode | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**OrganizationDomains**](OrganizationDomains.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrganizationDomain**
> OrganizationDomain updateOrganizationDomain(organizationId, domainId, updateOrganizationDomainRequest)

Update an organization domain.

Updates the properties of an existing organization domain.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationDomainsApi();
final organizationId = organizationId_example; // String | The ID of the organization the domain belongs to
final domainId = domainId_example; // String | The ID of the domain
final updateOrganizationDomainRequest = UpdateOrganizationDomainRequest(); // UpdateOrganizationDomainRequest | 

try {
    final result = api_instance.updateOrganizationDomain(organizationId, domainId, updateOrganizationDomainRequest);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationDomainsApi->updateOrganizationDomain: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The ID of the organization the domain belongs to | 
 **domainId** | **String**| The ID of the domain | 
 **updateOrganizationDomainRequest** | [**UpdateOrganizationDomainRequest**](UpdateOrganizationDomainRequest.md)|  | 

### Return type

[**OrganizationDomain**](OrganizationDomain.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

