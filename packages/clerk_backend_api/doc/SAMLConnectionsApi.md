# clerk_backend_api.api.SAMLConnectionsApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createSAMLConnection**](SAMLConnectionsApi.md#createsamlconnection) | **POST** /saml_connections | Create a SAML Connection
[**deleteSAMLConnection**](SAMLConnectionsApi.md#deletesamlconnection) | **DELETE** /saml_connections/{saml_connection_id} | Delete a SAML Connection
[**getSAMLConnection**](SAMLConnectionsApi.md#getsamlconnection) | **GET** /saml_connections/{saml_connection_id} | Retrieve a SAML Connection by ID
[**listSAMLConnections**](SAMLConnectionsApi.md#listsamlconnections) | **GET** /saml_connections | Get a list of SAML Connections for an instance
[**updateSAMLConnection**](SAMLConnectionsApi.md#updatesamlconnection) | **PATCH** /saml_connections/{saml_connection_id} | Update a SAML Connection


# **createSAMLConnection**
> SchemasSAMLConnection createSAMLConnection(createSAMLConnectionRequest)

Create a SAML Connection

Create a new SAML Connection.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SAMLConnectionsApi();
final createSAMLConnectionRequest = CreateSAMLConnectionRequest(); // CreateSAMLConnectionRequest | 

try {
    final result = api_instance.createSAMLConnection(createSAMLConnectionRequest);
    print(result);
} catch (e) {
    print('Exception when calling SAMLConnectionsApi->createSAMLConnection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createSAMLConnectionRequest** | [**CreateSAMLConnectionRequest**](CreateSAMLConnectionRequest.md)|  | [optional] 

### Return type

[**SchemasSAMLConnection**](SchemasSAMLConnection.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteSAMLConnection**
> DeletedObject deleteSAMLConnection(samlConnectionId)

Delete a SAML Connection

Deletes the SAML Connection whose ID matches the provided `id` in the path.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SAMLConnectionsApi();
final samlConnectionId = samlConnectionId_example; // String | The ID of the SAML Connection to delete

try {
    final result = api_instance.deleteSAMLConnection(samlConnectionId);
    print(result);
} catch (e) {
    print('Exception when calling SAMLConnectionsApi->deleteSAMLConnection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **samlConnectionId** | **String**| The ID of the SAML Connection to delete | 

### Return type

[**DeletedObject**](DeletedObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSAMLConnection**
> SchemasSAMLConnection getSAMLConnection(samlConnectionId)

Retrieve a SAML Connection by ID

Fetches the SAML Connection whose ID matches the provided `saml_connection_id` in the path.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SAMLConnectionsApi();
final samlConnectionId = samlConnectionId_example; // String | The ID of the SAML Connection

try {
    final result = api_instance.getSAMLConnection(samlConnectionId);
    print(result);
} catch (e) {
    print('Exception when calling SAMLConnectionsApi->getSAMLConnection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **samlConnectionId** | **String**| The ID of the SAML Connection | 

### Return type

[**SchemasSAMLConnection**](SchemasSAMLConnection.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listSAMLConnections**
> SAMLConnections listSAMLConnections(limit, offset, query, orderBy, organizationId)

Get a list of SAML Connections for an instance

Returns the list of SAML Connections for an instance. Results can be paginated using the optional `limit` and `offset` query parameters. The SAML Connections are ordered by descending creation date and the most recent will be returned first.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SAMLConnectionsApi();
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
final query = query_example; // String | Returns SAML connections that have a name that matches the given query, via case-insensitive partial match.
final orderBy = orderBy_example; // String | Sorts organizations memberships by phone_number, email_address, created_at, first_name, last_name or username. By prepending one of those values with + or -, we can choose to sort in ascending (ASC) or descending (DESC) order.
final organizationId = []; // List<String> | Returns SAML connections that have an associated organization ID to the given organizations. For each organization id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set. Accepts up to 100 organization ids.

try {
    final result = api_instance.listSAMLConnections(limit, offset, query, orderBy, organizationId);
    print(result);
} catch (e) {
    print('Exception when calling SAMLConnectionsApi->listSAMLConnections: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]
 **query** | **String**| Returns SAML connections that have a name that matches the given query, via case-insensitive partial match. | [optional] 
 **orderBy** | **String**| Sorts organizations memberships by phone_number, email_address, created_at, first_name, last_name or username. By prepending one of those values with + or -, we can choose to sort in ascending (ASC) or descending (DESC) order. | [optional] 
 **organizationId** | [**List<String>**](String.md)| Returns SAML connections that have an associated organization ID to the given organizations. For each organization id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set. Accepts up to 100 organization ids. | [optional] [default to const []]

### Return type

[**SAMLConnections**](SAMLConnections.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateSAMLConnection**
> SchemasSAMLConnection updateSAMLConnection(samlConnectionId, updateSAMLConnectionRequest)

Update a SAML Connection

Updates the SAML Connection whose ID matches the provided `id` in the path.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SAMLConnectionsApi();
final samlConnectionId = samlConnectionId_example; // String | The ID of the SAML Connection to update
final updateSAMLConnectionRequest = UpdateSAMLConnectionRequest(); // UpdateSAMLConnectionRequest | 

try {
    final result = api_instance.updateSAMLConnection(samlConnectionId, updateSAMLConnectionRequest);
    print(result);
} catch (e) {
    print('Exception when calling SAMLConnectionsApi->updateSAMLConnection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **samlConnectionId** | **String**| The ID of the SAML Connection to update | 
 **updateSAMLConnectionRequest** | [**UpdateSAMLConnectionRequest**](UpdateSAMLConnectionRequest.md)|  | 

### Return type

[**SchemasSAMLConnection**](SchemasSAMLConnection.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

