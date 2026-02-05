# openapi.api.OrganizationPermissionsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOrganizationPermission**](OrganizationPermissionsApi.md#createorganizationpermission) | **POST** /organization_permissions | Create a new organization permission
[**deleteOrganizationPermission**](OrganizationPermissionsApi.md#deleteorganizationpermission) | **DELETE** /organization_permissions/{permission_id} | Delete an organization permission
[**getOrganizationPermission**](OrganizationPermissionsApi.md#getorganizationpermission) | **GET** /organization_permissions/{permission_id} | Get an organization permission
[**listOrganizationPermissions**](OrganizationPermissionsApi.md#listorganizationpermissions) | **GET** /organization_permissions | Get a list of all organization permissions
[**updateOrganizationPermission**](OrganizationPermissionsApi.md#updateorganizationpermission) | **PATCH** /organization_permissions/{permission_id} | Update an organization permission


# **createOrganizationPermission**
> Permission createOrganizationPermission(createOrganizationPermissionRequest)

Create a new organization permission

Creates a new organization permission for the given instance.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationPermissionsApi();
final createOrganizationPermissionRequest = CreateOrganizationPermissionRequest(); // CreateOrganizationPermissionRequest | 

try {
    final result = api_instance.createOrganizationPermission(createOrganizationPermissionRequest);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationPermissionsApi->createOrganizationPermission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createOrganizationPermissionRequest** | [**CreateOrganizationPermissionRequest**](CreateOrganizationPermissionRequest.md)|  | 

### Return type

[**Permission**](Permission.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrganizationPermission**
> DeletedObject deleteOrganizationPermission(permissionId)

Delete an organization permission

Deletes an organization permission. System permissions cannot be deleted.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationPermissionsApi();
final permissionId = permissionId_example; // String | The ID of the permission to delete

try {
    final result = api_instance.deleteOrganizationPermission(permissionId);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationPermissionsApi->deleteOrganizationPermission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **permissionId** | **String**| The ID of the permission to delete | 

### Return type

[**DeletedObject**](DeletedObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrganizationPermission**
> Permission getOrganizationPermission(permissionId)

Get an organization permission

Retrieves the details of an organization permission.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationPermissionsApi();
final permissionId = permissionId_example; // String | The ID of the permission to retrieve

try {
    final result = api_instance.getOrganizationPermission(permissionId);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationPermissionsApi->getOrganizationPermission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **permissionId** | **String**| The ID of the permission to retrieve | 

### Return type

[**Permission**](Permission.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listOrganizationPermissions**
> Permissions listOrganizationPermissions(query, orderBy, limit, offset)

Get a list of all organization permissions

Retrieves all organization permissions for the given instance.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationPermissionsApi();
final query = query_example; // String | Returns organization permissions with ID, name, or key that match the given query. Uses exact match for permission ID and partial match for name and key.
final orderBy = orderBy_example; // String | Allows to return organization permissions in a particular order. At the moment, you can order the returned permissions by their `created_at`, `name`, or `key`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want permissions to be returned in descending order according to their `created_at` property, you can use `-created_at`.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.listOrganizationPermissions(query, orderBy, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationPermissionsApi->listOrganizationPermissions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **query** | **String**| Returns organization permissions with ID, name, or key that match the given query. Uses exact match for permission ID and partial match for name and key. | [optional] 
 **orderBy** | **String**| Allows to return organization permissions in a particular order. At the moment, you can order the returned permissions by their `created_at`, `name`, or `key`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want permissions to be returned in descending order according to their `created_at` property, you can use `-created_at`. | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**Permissions**](Permissions.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrganizationPermission**
> Permission updateOrganizationPermission(permissionId, updateOrganizationPermissionRequest)

Update an organization permission

Updates the properties of an existing organization permission. System permissions cannot be updated.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationPermissionsApi();
final permissionId = permissionId_example; // String | The ID of the permission to update
final updateOrganizationPermissionRequest = UpdateOrganizationPermissionRequest(); // UpdateOrganizationPermissionRequest | 

try {
    final result = api_instance.updateOrganizationPermission(permissionId, updateOrganizationPermissionRequest);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationPermissionsApi->updateOrganizationPermission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **permissionId** | **String**| The ID of the permission to update | 
 **updateOrganizationPermissionRequest** | [**UpdateOrganizationPermissionRequest**](UpdateOrganizationPermissionRequest.md)|  | 

### Return type

[**Permission**](Permission.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

