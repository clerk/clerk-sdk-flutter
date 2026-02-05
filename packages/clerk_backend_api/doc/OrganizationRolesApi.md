# openapi.api.OrganizationRolesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**assignPermissionToOrganizationRole**](OrganizationRolesApi.md#assignpermissiontoorganizationrole) | **POST** /organization_roles/{organization_role_id}/permissions/{permission_id} | Assign a permission to an organization role
[**createOrganizationRole**](OrganizationRolesApi.md#createorganizationrole) | **POST** /organization_roles | Create an organization role
[**deleteOrganizationRole**](OrganizationRolesApi.md#deleteorganizationrole) | **DELETE** /organization_roles/{organization_role_id} | Delete an organization role
[**getOrganizationRole**](OrganizationRolesApi.md#getorganizationrole) | **GET** /organization_roles/{organization_role_id} | Retrieve an organization role
[**listOrganizationRoles**](OrganizationRolesApi.md#listorganizationroles) | **GET** /organization_roles | Get a list of organization roles
[**removePermissionFromOrganizationRole**](OrganizationRolesApi.md#removepermissionfromorganizationrole) | **DELETE** /organization_roles/{organization_role_id}/permissions/{permission_id} | Remove a permission from an organization role
[**updateOrganizationRole**](OrganizationRolesApi.md#updateorganizationrole) | **PATCH** /organization_roles/{organization_role_id} | Update an organization role


# **assignPermissionToOrganizationRole**
> Role assignPermissionToOrganizationRole(organizationRoleId, permissionId)

Assign a permission to an organization role

Assigns a permission to an organization role

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationRolesApi();
final organizationRoleId = organizationRoleId_example; // String | The ID of the organization role
final permissionId = permissionId_example; // String | The ID of the permission to assign

try {
    final result = api_instance.assignPermissionToOrganizationRole(organizationRoleId, permissionId);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationRolesApi->assignPermissionToOrganizationRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationRoleId** | **String**| The ID of the organization role | 
 **permissionId** | **String**| The ID of the permission to assign | 

### Return type

[**Role**](Role.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createOrganizationRole**
> Role createOrganizationRole(createOrganizationRoleRequest)

Create an organization role

Creates a new organization role with the given name and permissions for an instance. The key must be unique for the instance and start with the 'org:' prefix, followed by lowercase alphanumeric characters and underscores only. You can optionally provide a description for the role and specify whether it should be included in the initial role set. Organization roles support permissions that can be assigned to control access within the organization.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationRolesApi();
final createOrganizationRoleRequest = CreateOrganizationRoleRequest(); // CreateOrganizationRoleRequest | 

try {
    final result = api_instance.createOrganizationRole(createOrganizationRoleRequest);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationRolesApi->createOrganizationRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createOrganizationRoleRequest** | [**CreateOrganizationRoleRequest**](CreateOrganizationRoleRequest.md)|  | 

### Return type

[**Role**](Role.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrganizationRole**
> DeletedObject deleteOrganizationRole(organizationRoleId)

Delete an organization role

Deletes the organization role. The role cannot be deleted if it is currently used as the default creator role, domain default role, assigned to any members, or exists in any invitations.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationRolesApi();
final organizationRoleId = organizationRoleId_example; // String | The ID of the organization role to delete

try {
    final result = api_instance.deleteOrganizationRole(organizationRoleId);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationRolesApi->deleteOrganizationRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationRoleId** | **String**| The ID of the organization role to delete | 

### Return type

[**DeletedObject**](DeletedObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrganizationRole**
> Role getOrganizationRole(organizationRoleId)

Retrieve an organization role

Use this request to retrieve an existing organization role by its ID.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationRolesApi();
final organizationRoleId = organizationRoleId_example; // String | The ID of the organization role

try {
    final result = api_instance.getOrganizationRole(organizationRoleId);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationRolesApi->getOrganizationRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationRoleId** | **String**| The ID of the organization role | 

### Return type

[**Role**](Role.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listOrganizationRoles**
> Roles listOrganizationRoles(query, orderBy, limit, offset)

Get a list of organization roles

This request returns the list of organization roles for the instance. Results can be paginated using the optional `limit` and `offset` query parameters. The organization roles are ordered by descending creation date. Most recent roles will be returned first.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationRolesApi();
final query = query_example; // String | Returns organization roles with ID, name, or key that match the given query. Uses exact match for organization role ID and partial match for name and key.
final orderBy = orderBy_example; // String | Allows to return organization roles in a particular order. At the moment, you can order the returned organization roles by their `created_at`, `name`, or `key`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want organization roles to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.listOrganizationRoles(query, orderBy, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationRolesApi->listOrganizationRoles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **query** | **String**| Returns organization roles with ID, name, or key that match the given query. Uses exact match for organization role ID and partial match for name and key. | [optional] 
 **orderBy** | **String**| Allows to return organization roles in a particular order. At the moment, you can order the returned organization roles by their `created_at`, `name`, or `key`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want organization roles to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`. | [optional] [default to '-created_at']
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**Roles**](Roles.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removePermissionFromOrganizationRole**
> Role removePermissionFromOrganizationRole(organizationRoleId, permissionId)

Remove a permission from an organization role

Removes a permission from an organization role

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationRolesApi();
final organizationRoleId = organizationRoleId_example; // String | The ID of the organization role
final permissionId = permissionId_example; // String | The ID of the permission to remove

try {
    final result = api_instance.removePermissionFromOrganizationRole(organizationRoleId, permissionId);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationRolesApi->removePermissionFromOrganizationRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationRoleId** | **String**| The ID of the organization role | 
 **permissionId** | **String**| The ID of the permission to remove | 

### Return type

[**Role**](Role.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrganizationRole**
> Role updateOrganizationRole(organizationRoleId, updateOrganizationRoleRequest)

Update an organization role

Updates an existing organization role. You can update the name, key, description, and permissions of the role. All parameters are optional - you can update only the fields you want to change. If the role is used as a creator role or domain default role, updating the key will cascade the update to the organization settings.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationRolesApi();
final organizationRoleId = organizationRoleId_example; // String | The ID of the organization role to update
final updateOrganizationRoleRequest = UpdateOrganizationRoleRequest(); // UpdateOrganizationRoleRequest | 

try {
    final result = api_instance.updateOrganizationRole(organizationRoleId, updateOrganizationRoleRequest);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationRolesApi->updateOrganizationRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationRoleId** | **String**| The ID of the organization role to update | 
 **updateOrganizationRoleRequest** | [**UpdateOrganizationRoleRequest**](UpdateOrganizationRoleRequest.md)|  | 

### Return type

[**Role**](Role.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

