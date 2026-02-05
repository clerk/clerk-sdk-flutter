# openapi.api.RoleSetsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addRolesToRoleSet**](RoleSetsApi.md#addrolestoroleset) | **POST** /role_sets/{role_set_key_or_id}/roles | Add roles to a role set
[**createRoleSet**](RoleSetsApi.md#createroleset) | **POST** /role_sets | Create a role set
[**getRoleSet**](RoleSetsApi.md#getroleset) | **GET** /role_sets/{role_set_key_or_id} | Retrieve a role set
[**listRoleSets**](RoleSetsApi.md#listrolesets) | **GET** /role_sets | Get a list of role sets
[**replaceRoleInRoleSet**](RoleSetsApi.md#replaceroleinroleset) | **POST** /role_sets/{role_set_key_or_id}/roles/replace | Replace a role in a role set
[**replaceRoleSet**](RoleSetsApi.md#replaceroleset) | **POST** /role_sets/{role_set_key_or_id}/replace | Replace a role set
[**updateRoleSet**](RoleSetsApi.md#updateroleset) | **PATCH** /role_sets/{role_set_key_or_id} | Update a role set


# **addRolesToRoleSet**
> RoleSet addRolesToRoleSet(roleSetKeyOrId, addRolesToRoleSetRequest)

Add roles to a role set

Adds one or more roles to an existing role set. You can optionally update the default role or creator role when adding new roles.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = RoleSetsApi();
final roleSetKeyOrId = roleSetKeyOrId_example; // String | The key or ID of the role set
final addRolesToRoleSetRequest = AddRolesToRoleSetRequest(); // AddRolesToRoleSetRequest | 

try {
    final result = api_instance.addRolesToRoleSet(roleSetKeyOrId, addRolesToRoleSetRequest);
    print(result);
} catch (e) {
    print('Exception when calling RoleSetsApi->addRolesToRoleSet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roleSetKeyOrId** | **String**| The key or ID of the role set | 
 **addRolesToRoleSetRequest** | [**AddRolesToRoleSetRequest**](AddRolesToRoleSetRequest.md)|  | 

### Return type

[**RoleSet**](RoleSet.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createRoleSet**
> RoleSet createRoleSet(createRoleSetRequest)

Create a role set

Creates a new role set with the given name and roles. The key must be unique for the instance and start with the 'role_set:' prefix, followed by lowercase alphanumeric characters and underscores only. You must provide at least one role and specify a default role key and creator role key.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = RoleSetsApi();
final createRoleSetRequest = CreateRoleSetRequest(); // CreateRoleSetRequest | 

try {
    final result = api_instance.createRoleSet(createRoleSetRequest);
    print(result);
} catch (e) {
    print('Exception when calling RoleSetsApi->createRoleSet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createRoleSetRequest** | [**CreateRoleSetRequest**](CreateRoleSetRequest.md)|  | 

### Return type

[**RoleSet**](RoleSet.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRoleSet**
> RoleSet getRoleSet(roleSetKeyOrId)

Retrieve a role set

Retrieves an existing role set by its key or ID.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = RoleSetsApi();
final roleSetKeyOrId = roleSetKeyOrId_example; // String | The key or ID of the role set

try {
    final result = api_instance.getRoleSet(roleSetKeyOrId);
    print(result);
} catch (e) {
    print('Exception when calling RoleSetsApi->getRoleSet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roleSetKeyOrId** | **String**| The key or ID of the role set | 

### Return type

[**RoleSet**](RoleSet.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listRoleSets**
> RoleSets listRoleSets(query, orderBy, limit, offset)

Get a list of role sets

Returns a list of role sets for the instance. Results can be paginated using the optional `limit` and `offset` query parameters. The role sets are ordered by descending creation date by default.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = RoleSetsApi();
final query = query_example; // String | Returns role sets with ID, name, or key that match the given query. Uses exact match for role set ID and partial match for name and key.
final orderBy = orderBy_example; // String | Allows to return role sets in a particular order. At the moment, you can order the returned role sets by their `created_at`, `name`, or `key`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want role sets to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.listRoleSets(query, orderBy, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling RoleSetsApi->listRoleSets: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **query** | **String**| Returns role sets with ID, name, or key that match the given query. Uses exact match for role set ID and partial match for name and key. | [optional] 
 **orderBy** | **String**| Allows to return role sets in a particular order. At the moment, you can order the returned role sets by their `created_at`, `name`, or `key`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want role sets to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`. | [optional] [default to '-created_at']
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**RoleSets**](RoleSets.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **replaceRoleInRoleSet**
> RoleSet replaceRoleInRoleSet(roleSetKeyOrId, replaceRoleInRoleSetRequest)

Replace a role in a role set

Replaces a role in a role set with another role. This atomically removes the source role and reassigns any members to the destination role.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = RoleSetsApi();
final roleSetKeyOrId = roleSetKeyOrId_example; // String | The key or ID of the role set
final replaceRoleInRoleSetRequest = ReplaceRoleInRoleSetRequest(); // ReplaceRoleInRoleSetRequest | 

try {
    final result = api_instance.replaceRoleInRoleSet(roleSetKeyOrId, replaceRoleInRoleSetRequest);
    print(result);
} catch (e) {
    print('Exception when calling RoleSetsApi->replaceRoleInRoleSet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roleSetKeyOrId** | **String**| The key or ID of the role set | 
 **replaceRoleInRoleSetRequest** | [**ReplaceRoleInRoleSetRequest**](ReplaceRoleInRoleSetRequest.md)|  | 

### Return type

[**RoleSet**](RoleSet.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **replaceRoleSet**
> DeletedObject replaceRoleSet(roleSetKeyOrId, replaceRoleSetRequest)

Replace a role set

Replaces a role set with another role set. This is functionally equivalent to deleting the role set but allows for atomic replacement with migration support. Organizations using this role set will be migrated to the destination role set.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = RoleSetsApi();
final roleSetKeyOrId = roleSetKeyOrId_example; // String | The key or ID of the role set to replace
final replaceRoleSetRequest = ReplaceRoleSetRequest(); // ReplaceRoleSetRequest | 

try {
    final result = api_instance.replaceRoleSet(roleSetKeyOrId, replaceRoleSetRequest);
    print(result);
} catch (e) {
    print('Exception when calling RoleSetsApi->replaceRoleSet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roleSetKeyOrId** | **String**| The key or ID of the role set to replace | 
 **replaceRoleSetRequest** | [**ReplaceRoleSetRequest**](ReplaceRoleSetRequest.md)|  | 

### Return type

[**DeletedObject**](DeletedObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateRoleSet**
> RoleSet updateRoleSet(roleSetKeyOrId, updateRoleSetRequest)

Update a role set

Updates an existing role set. You can update the name, key, description, type, default role, or creator role. All parameters are optional - you can update only the fields you want to change.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = RoleSetsApi();
final roleSetKeyOrId = roleSetKeyOrId_example; // String | The key or ID of the role set to update
final updateRoleSetRequest = UpdateRoleSetRequest(); // UpdateRoleSetRequest | 

try {
    final result = api_instance.updateRoleSet(roleSetKeyOrId, updateRoleSetRequest);
    print(result);
} catch (e) {
    print('Exception when calling RoleSetsApi->updateRoleSet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roleSetKeyOrId** | **String**| The key or ID of the role set to update | 
 **updateRoleSetRequest** | [**UpdateRoleSetRequest**](UpdateRoleSetRequest.md)|  | 

### Return type

[**RoleSet**](RoleSet.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

