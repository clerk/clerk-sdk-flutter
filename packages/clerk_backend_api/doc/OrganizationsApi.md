# clerk_backend_api.api.OrganizationsApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOrganization**](OrganizationsApi.md#createorganization) | **POST** /organizations | Create an organization
[**deleteOrganization**](OrganizationsApi.md#deleteorganization) | **DELETE** /organizations/{organization_id} | Delete an organization
[**deleteOrganizationLogo**](OrganizationsApi.md#deleteorganizationlogo) | **DELETE** /organizations/{organization_id}/logo | Delete the organization's logo.
[**getOrganization**](OrganizationsApi.md#getorganization) | **GET** /organizations/{organization_id} | Retrieve an organization by ID or slug
[**listOrganizations**](OrganizationsApi.md#listorganizations) | **GET** /organizations | Get a list of organizations for an instance
[**mergeOrganizationMetadata**](OrganizationsApi.md#mergeorganizationmetadata) | **PATCH** /organizations/{organization_id}/metadata | Merge and update metadata for an organization
[**updateOrganization**](OrganizationsApi.md#updateorganization) | **PATCH** /organizations/{organization_id} | Update an organization
[**uploadOrganizationLogo**](OrganizationsApi.md#uploadorganizationlogo) | **PUT** /organizations/{organization_id}/logo | Upload a logo for the organization


# **createOrganization**
> Organization createOrganization(createOrganizationRequest)

Create an organization

Creates a new organization with the given name for an instance. You can specify an optional slug for the new organization. If provided, the organization slug can contain only lowercase alphanumeric characters (letters and digits) and the dash \"-\". Organization slugs must be unique for the instance. You can provide additional metadata for the organization and set any custom attribute you want. Organizations support private and public metadata. Private metadata can only be accessed from the Backend API. Public metadata can be accessed from the Backend API, and are read-only from the Frontend API. The `created_by` user will see this as their [active organization] (https://clerk.com/docs/organizations/overview#active-organization) the next time they create a session, presuming they don't explicitly set a different organization as active before then.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationsApi();
final createOrganizationRequest = CreateOrganizationRequest(); // CreateOrganizationRequest | 

try {
    final result = api_instance.createOrganization(createOrganizationRequest);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationsApi->createOrganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createOrganizationRequest** | [**CreateOrganizationRequest**](CreateOrganizationRequest.md)|  | [optional] 

### Return type

[**Organization**](Organization.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrganization**
> DeletedObject deleteOrganization(organizationId)

Delete an organization

Deletes the given organization. Please note that deleting an organization will also delete all memberships and invitations. This is not reversible.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationsApi();
final organizationId = organizationId_example; // String | The ID of the organization to delete

try {
    final result = api_instance.deleteOrganization(organizationId);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationsApi->deleteOrganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The ID of the organization to delete | 

### Return type

[**DeletedObject**](DeletedObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrganizationLogo**
> Organization deleteOrganizationLogo(organizationId)

Delete the organization's logo.

Delete the organization's logo.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationsApi();
final organizationId = organizationId_example; // String | The ID of the organization for which the logo will be deleted.

try {
    final result = api_instance.deleteOrganizationLogo(organizationId);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationsApi->deleteOrganizationLogo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The ID of the organization for which the logo will be deleted. | 

### Return type

[**Organization**](Organization.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrganization**
> Organization getOrganization(organizationId, includeMembersCount, includeMissingMemberWithElevatedPermissions)

Retrieve an organization by ID or slug

Fetches the organization whose ID or slug matches the provided `id_or_slug` URL query parameter.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationsApi();
final organizationId = organizationId_example; // String | The ID or slug of the organization
final includeMembersCount = true; // bool | Flag to denote whether or not the organization's members count should be included in the response.
final includeMissingMemberWithElevatedPermissions = true; // bool | Flag to denote whether or not to include a member with elevated permissions who is not currently a member of the organization.

try {
    final result = api_instance.getOrganization(organizationId, includeMembersCount, includeMissingMemberWithElevatedPermissions);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationsApi->getOrganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The ID or slug of the organization | 
 **includeMembersCount** | **bool**| Flag to denote whether or not the organization's members count should be included in the response. | [optional] 
 **includeMissingMemberWithElevatedPermissions** | **bool**| Flag to denote whether or not to include a member with elevated permissions who is not currently a member of the organization. | [optional] 

### Return type

[**Organization**](Organization.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listOrganizations**
> Organizations listOrganizations(includeMembersCount, includeMissingMemberWithElevatedPermissions, query, userId, organizationId, orderBy, limit, offset)

Get a list of organizations for an instance

This request returns the list of organizations for an instance. Results can be paginated using the optional `limit` and `offset` query parameters. The organizations are ordered by descending creation date. Most recent organizations will be returned first.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationsApi();
final includeMembersCount = true; // bool | Flag to denote whether the member counts of each organization should be included in the response or not.
final includeMissingMemberWithElevatedPermissions = true; // bool | Flag to denote whether or not to include a member with elevated permissions who is not currently a member of the organization.
final query = query_example; // String | Returns organizations with ID, name, or slug that match the given query. Uses exact match for organization ID and partial match for name and slug.
final userId = []; // List<String> | Returns organizations with the user ids specified. Any user ids not found are ignored. For each user id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set.
final organizationId = []; // List<String> | Returns organizations with the organization ids specified. Any organization ids not found are ignored. For each organization id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set. Accepts up to 100 organization ids. Example: ?organization_id=+org_1&organization_id=-org_2
final orderBy = orderBy_example; // String | Allows to return organizations in a particular order. At the moment, you can order the returned organizations either by their `name`, `created_at` or `members_count`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want organizations to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.listOrganizations(includeMembersCount, includeMissingMemberWithElevatedPermissions, query, userId, organizationId, orderBy, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationsApi->listOrganizations: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **includeMembersCount** | **bool**| Flag to denote whether the member counts of each organization should be included in the response or not. | [optional] 
 **includeMissingMemberWithElevatedPermissions** | **bool**| Flag to denote whether or not to include a member with elevated permissions who is not currently a member of the organization. | [optional] 
 **query** | **String**| Returns organizations with ID, name, or slug that match the given query. Uses exact match for organization ID and partial match for name and slug. | [optional] 
 **userId** | [**List<String>**](String.md)| Returns organizations with the user ids specified. Any user ids not found are ignored. For each user id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set. | [optional] [default to const []]
 **organizationId** | [**List<String>**](String.md)| Returns organizations with the organization ids specified. Any organization ids not found are ignored. For each organization id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set. Accepts up to 100 organization ids. Example: ?organization_id=+org_1&organization_id=-org_2 | [optional] [default to const []]
 **orderBy** | **String**| Allows to return organizations in a particular order. At the moment, you can order the returned organizations either by their `name`, `created_at` or `members_count`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want organizations to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`. | [optional] [default to '-created_at']
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**Organizations**](Organizations.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mergeOrganizationMetadata**
> Organization mergeOrganizationMetadata(organizationId, mergeOrganizationMetadataRequest)

Merge and update metadata for an organization

Update organization metadata attributes by merging existing values with the provided parameters. Metadata values will be updated via a deep merge. Deep meaning that any nested JSON objects will be merged as well. You can remove metadata keys at any level by setting their value to `null`.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationsApi();
final organizationId = organizationId_example; // String | The ID of the organization for which metadata will be merged or updated
final mergeOrganizationMetadataRequest = MergeOrganizationMetadataRequest(); // MergeOrganizationMetadataRequest | 

try {
    final result = api_instance.mergeOrganizationMetadata(organizationId, mergeOrganizationMetadataRequest);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationsApi->mergeOrganizationMetadata: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The ID of the organization for which metadata will be merged or updated | 
 **mergeOrganizationMetadataRequest** | [**MergeOrganizationMetadataRequest**](MergeOrganizationMetadataRequest.md)|  | 

### Return type

[**Organization**](Organization.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrganization**
> Organization updateOrganization(organizationId, updateOrganizationRequest)

Update an organization

Updates an existing organization

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationsApi();
final organizationId = organizationId_example; // String | The ID of the organization to update
final updateOrganizationRequest = UpdateOrganizationRequest(); // UpdateOrganizationRequest | 

try {
    final result = api_instance.updateOrganization(organizationId, updateOrganizationRequest);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationsApi->updateOrganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The ID of the organization to update | 
 **updateOrganizationRequest** | [**UpdateOrganizationRequest**](UpdateOrganizationRequest.md)|  | 

### Return type

[**Organization**](Organization.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uploadOrganizationLogo**
> OrganizationWithLogo uploadOrganizationLogo(organizationId, file, uploaderUserId)

Upload a logo for the organization

Set or replace an organization's logo, by uploading an image file. This endpoint uses the `multipart/form-data` request content type and accepts a file of image type. The file size cannot exceed 10MB. Only the following file content types are supported: `image/jpeg`, `image/png`, `image/gif`, `image/webp`, `image/x-icon`, `image/vnd.microsoft.icon`.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationsApi();
final organizationId = organizationId_example; // String | The ID of the organization for which to upload a logo
final file = BINARY_DATA_HERE; // MultipartFile | 
final uploaderUserId = uploaderUserId_example; // String | The ID of the user that will be credited with the image upload.

try {
    final result = api_instance.uploadOrganizationLogo(organizationId, file, uploaderUserId);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationsApi->uploadOrganizationLogo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The ID of the organization for which to upload a logo | 
 **file** | **MultipartFile**|  | 
 **uploaderUserId** | **String**| The ID of the user that will be credited with the image upload. | [optional] 

### Return type

[**OrganizationWithLogo**](OrganizationWithLogo.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

