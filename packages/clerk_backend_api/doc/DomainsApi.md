# clerk_backend_api.api.DomainsApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addDomain**](DomainsApi.md#adddomain) | **POST** /domains | Add a domain
[**deleteDomain**](DomainsApi.md#deletedomain) | **DELETE** /domains/{domain_id} | Delete a satellite domain
[**listDomains**](DomainsApi.md#listdomains) | **GET** /domains | List all instance domains
[**updateDomain**](DomainsApi.md#updatedomain) | **PATCH** /domains/{domain_id} | Update a domain


# **addDomain**
> Domain addDomain(addDomainRequest)

Add a domain

Add a new domain for your instance. Useful in the case of multi-domain instances, allows adding satellite domains to an instance. The new domain must have a `name`. The domain name can contain the port for development instances, like `localhost:3000`. At the moment, instances can have only one primary domain, so the `is_satellite` parameter must be set to `true`. If you're planning to configure the new satellite domain to run behind a proxy, pass the `proxy_url` parameter accordingly.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DomainsApi();
final addDomainRequest = AddDomainRequest(); // AddDomainRequest | 

try {
    final result = api_instance.addDomain(addDomainRequest);
    print(result);
} catch (e) {
    print('Exception when calling DomainsApi->addDomain: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addDomainRequest** | [**AddDomainRequest**](AddDomainRequest.md)|  | [optional] 

### Return type

[**Domain**](Domain.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteDomain**
> DeletedObject deleteDomain(domainId)

Delete a satellite domain

Deletes a satellite domain for the instance. It is currently not possible to delete the instance's primary domain.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DomainsApi();
final domainId = domainId_example; // String | The ID of the domain that will be deleted. Must be a satellite domain.

try {
    final result = api_instance.deleteDomain(domainId);
    print(result);
} catch (e) {
    print('Exception when calling DomainsApi->deleteDomain: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **domainId** | **String**| The ID of the domain that will be deleted. Must be a satellite domain. | 

### Return type

[**DeletedObject**](DeletedObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listDomains**
> Domains listDomains()

List all instance domains

Use this endpoint to get a list of all domains for an instance. The response will contain the primary domain for the instance and any satellite domains. Each domain in the response contains information about the URLs where Clerk operates and the required CNAME targets.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DomainsApi();

try {
    final result = api_instance.listDomains();
    print(result);
} catch (e) {
    print('Exception when calling DomainsApi->listDomains: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Domains**](Domains.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateDomain**
> Domain updateDomain(domainId, updateDomainRequest)

Update a domain

The `proxy_url` can be updated only for production instances. Update one of the instance's domains. Both primary and satellite domains can be updated. If you choose to use Clerk via proxy, use this endpoint to specify the `proxy_url`. Whenever you decide you'd rather switch to DNS setup for Clerk, simply set `proxy_url` to `null` for the domain. When you update a production instance's primary domain name, you have to make sure that you've completed all the necessary setup steps for DNS and emails to work. Expect downtime otherwise. Updating a primary domain's name will also update the instance's home origin, affecting the default application paths.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DomainsApi();
final domainId = domainId_example; // String | The ID of the domain that will be updated.
final updateDomainRequest = UpdateDomainRequest(); // UpdateDomainRequest | 

try {
    final result = api_instance.updateDomain(domainId, updateDomainRequest);
    print(result);
} catch (e) {
    print('Exception when calling DomainsApi->updateDomain: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **domainId** | **String**| The ID of the domain that will be updated. | 
 **updateDomainRequest** | [**UpdateDomainRequest**](UpdateDomainRequest.md)|  | 

### Return type

[**Domain**](Domain.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

