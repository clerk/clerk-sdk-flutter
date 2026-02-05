# openapi.api.MachinesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createMachine**](MachinesApi.md#createmachine) | **POST** /machines | Create a machine
[**createMachineScope**](MachinesApi.md#createmachinescope) | **POST** /machines/{machine_id}/scopes | Create a machine scope
[**deleteMachine**](MachinesApi.md#deletemachine) | **DELETE** /machines/{machine_id} | Delete a machine
[**deleteMachineScope**](MachinesApi.md#deletemachinescope) | **DELETE** /machines/{machine_id}/scopes/{other_machine_id} | Delete a machine scope
[**getMachine**](MachinesApi.md#getmachine) | **GET** /machines/{machine_id} | Retrieve a machine
[**getMachineSecretKey**](MachinesApi.md#getmachinesecretkey) | **GET** /machines/{machine_id}/secret_key | Retrieve a machine secret key
[**listMachines**](MachinesApi.md#listmachines) | **GET** /machines | Get a list of machines for an instance
[**rotateMachineSecretKey**](MachinesApi.md#rotatemachinesecretkey) | **POST** /machines/{machine_id}/secret_key/rotate | Rotate a machine's secret key
[**updateMachine**](MachinesApi.md#updatemachine) | **PATCH** /machines/{machine_id} | Update a machine


# **createMachine**
> CreateMachine200Response createMachine(createMachineRequest)

Create a machine

Creates a new machine.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MachinesApi();
final createMachineRequest = CreateMachineRequest(); // CreateMachineRequest | 

try {
    final result = api_instance.createMachine(createMachineRequest);
    print(result);
} catch (e) {
    print('Exception when calling MachinesApi->createMachine: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createMachineRequest** | [**CreateMachineRequest**](CreateMachineRequest.md)|  | [optional] 

### Return type

[**CreateMachine200Response**](CreateMachine200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createMachineScope**
> MachineScope createMachineScope(machineId, createMachineScopeRequest)

Create a machine scope

Creates a new machine scope, allowing the specified machine to access another machine. Maximum of 150 scopes per machine.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MachinesApi();
final machineId = machineId_example; // String | The ID of the machine that will have access to another machine
final createMachineScopeRequest = CreateMachineScopeRequest(); // CreateMachineScopeRequest | 

try {
    final result = api_instance.createMachineScope(machineId, createMachineScopeRequest);
    print(result);
} catch (e) {
    print('Exception when calling MachinesApi->createMachineScope: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **machineId** | **String**| The ID of the machine that will have access to another machine | 
 **createMachineScopeRequest** | [**CreateMachineScopeRequest**](CreateMachineScopeRequest.md)|  | [optional] 

### Return type

[**MachineScope**](MachineScope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMachine**
> DeleteMachine200Response deleteMachine(machineId)

Delete a machine

Deletes a machine.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MachinesApi();
final machineId = machineId_example; // String | The ID of the machine to delete

try {
    final result = api_instance.deleteMachine(machineId);
    print(result);
} catch (e) {
    print('Exception when calling MachinesApi->deleteMachine: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **machineId** | **String**| The ID of the machine to delete | 

### Return type

[**DeleteMachine200Response**](DeleteMachine200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMachineScope**
> DeleteMachineScope200Response deleteMachineScope(machineId, otherMachineId)

Delete a machine scope

Deletes a machine scope, removing access from one machine to another.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MachinesApi();
final machineId = machineId_example; // String | The ID of the machine that has access to another machine
final otherMachineId = otherMachineId_example; // String | The ID of the machine that is being accessed

try {
    final result = api_instance.deleteMachineScope(machineId, otherMachineId);
    print(result);
} catch (e) {
    print('Exception when calling MachinesApi->deleteMachineScope: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **machineId** | **String**| The ID of the machine that has access to another machine | 
 **otherMachineId** | **String**| The ID of the machine that is being accessed | 

### Return type

[**DeleteMachineScope200Response**](DeleteMachineScope200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMachine**
> Machine getMachine(machineId)

Retrieve a machine

Returns the details of a machine.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MachinesApi();
final machineId = machineId_example; // String | The ID of the machine to retrieve

try {
    final result = api_instance.getMachine(machineId);
    print(result);
} catch (e) {
    print('Exception when calling MachinesApi->getMachine: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **machineId** | **String**| The ID of the machine to retrieve | 

### Return type

[**Machine**](Machine.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMachineSecretKey**
> GetMachineSecretKey200Response getMachineSecretKey(machineId)

Retrieve a machine secret key

Returns the secret key for a machine.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MachinesApi();
final machineId = machineId_example; // String | The ID of the machine to retrieve the secret key for

try {
    final result = api_instance.getMachineSecretKey(machineId);
    print(result);
} catch (e) {
    print('Exception when calling MachinesApi->getMachineSecretKey: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **machineId** | **String**| The ID of the machine to retrieve the secret key for | 

### Return type

[**GetMachineSecretKey200Response**](GetMachineSecretKey200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMachines**
> ListMachines200Response listMachines(limit, offset, query, orderBy)

Get a list of machines for an instance

This request returns the list of machines for an instance. The machines are ordered by descending creation date (i.e. most recent machines will be returned first)

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MachinesApi();
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
final query = query_example; // String | Returns machines with ID or name that match the given query. Uses exact match for machine ID and partial match for name.
final orderBy = orderBy_example; // String | Allows to return machines in a particular order. You can order the returned machines by their `name` or `created_at`. To specify the direction, use the `+` or `-` symbols prepended to the property to order by. For example, to return machines in descending order by `created_at`, use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`.

try {
    final result = api_instance.listMachines(limit, offset, query, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling MachinesApi->listMachines: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]
 **query** | **String**| Returns machines with ID or name that match the given query. Uses exact match for machine ID and partial match for name. | [optional] 
 **orderBy** | **String**| Allows to return machines in a particular order. You can order the returned machines by their `name` or `created_at`. To specify the direction, use the `+` or `-` symbols prepended to the property to order by. For example, to return machines in descending order by `created_at`, use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`. | [optional] [default to '-created_at']

### Return type

[**ListMachines200Response**](ListMachines200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **rotateMachineSecretKey**
> GetMachineSecretKey200Response rotateMachineSecretKey(machineId, rotateMachineSecretKeyRequest)

Rotate a machine's secret key

Rotates the machine's secret key. When the secret key is rotated, make sure to update it in your machine/application. The previous secret key will remain valid for the duration specified by the previous_token_ttl parameter.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MachinesApi();
final machineId = machineId_example; // String | The ID of the machine to rotate the secret key for
final rotateMachineSecretKeyRequest = RotateMachineSecretKeyRequest(); // RotateMachineSecretKeyRequest | 

try {
    final result = api_instance.rotateMachineSecretKey(machineId, rotateMachineSecretKeyRequest);
    print(result);
} catch (e) {
    print('Exception when calling MachinesApi->rotateMachineSecretKey: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **machineId** | **String**| The ID of the machine to rotate the secret key for | 
 **rotateMachineSecretKeyRequest** | [**RotateMachineSecretKeyRequest**](RotateMachineSecretKeyRequest.md)|  | 

### Return type

[**GetMachineSecretKey200Response**](GetMachineSecretKey200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMachine**
> Machine updateMachine(machineId, updateMachineRequest)

Update a machine

Updates an existing machine. Only the provided fields will be updated.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MachinesApi();
final machineId = machineId_example; // String | The ID of the machine to update
final updateMachineRequest = UpdateMachineRequest(); // UpdateMachineRequest | 

try {
    final result = api_instance.updateMachine(machineId, updateMachineRequest);
    print(result);
} catch (e) {
    print('Exception when calling MachinesApi->updateMachine: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **machineId** | **String**| The ID of the machine to update | 
 **updateMachineRequest** | [**UpdateMachineRequest**](UpdateMachineRequest.md)|  | [optional] 

### Return type

[**Machine**](Machine.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

