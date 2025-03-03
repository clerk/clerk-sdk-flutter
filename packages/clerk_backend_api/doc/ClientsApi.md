# clerk_backend_api.api.ClientsApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getClient**](ClientsApi.md#getclient) | **GET** /clients/{client_id} | Get a client
[**getClientList**](ClientsApi.md#getclientlist) | **GET** /clients | List all clients
[**verifyClient**](ClientsApi.md#verifyclient) | **POST** /clients/verify | Verify a client


# **getClient**
> Client getClient(clientId)

Get a client

Returns the details of a client.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientsApi();
final clientId = clientId_example; // String | Client ID.

try {
    final result = api_instance.getClient(clientId);
    print(result);
} catch (e) {
    print('Exception when calling ClientsApi->getClient: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **clientId** | **String**| Client ID. | 

### Return type

[**Client**](Client.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getClientList**
> List<Client> getClientList(paginated, limit, offset)

List all clients

Returns a list of all clients. The clients are returned sorted by creation date, with the newest clients appearing first. Warning: the endpoint is being deprecated and will be removed in future versions.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientsApi();
final paginated = true; // bool | Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.getClientList(paginated, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling ClientsApi->getClientList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paginated** | **bool**| Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated. | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**List<Client>**](Client.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifyClient**
> Client verifyClient(verifyClientRequest)

Verify a client

Verifies the client in the provided token

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientsApi();
final verifyClientRequest = VerifyClientRequest(); // VerifyClientRequest | Parameters.

try {
    final result = api_instance.verifyClient(verifyClientRequest);
    print(result);
} catch (e) {
    print('Exception when calling ClientsApi->verifyClient: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **verifyClientRequest** | [**VerifyClientRequest**](VerifyClientRequest.md)| Parameters. | [optional] 

### Return type

[**Client**](Client.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

