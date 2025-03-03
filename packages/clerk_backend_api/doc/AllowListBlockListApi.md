# clerk_backend_api.api.AllowListBlockListApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createAllowlistIdentifier**](AllowListBlockListApi.md#createallowlistidentifier) | **POST** /allowlist_identifiers | Add identifier to the allow-list
[**createBlocklistIdentifier**](AllowListBlockListApi.md#createblocklistidentifier) | **POST** /blocklist_identifiers | Add identifier to the block-list
[**deleteAllowlistIdentifier**](AllowListBlockListApi.md#deleteallowlistidentifier) | **DELETE** /allowlist_identifiers/{identifier_id} | Delete identifier from allow-list
[**deleteBlocklistIdentifier**](AllowListBlockListApi.md#deleteblocklistidentifier) | **DELETE** /blocklist_identifiers/{identifier_id} | Delete identifier from block-list
[**listAllowlistIdentifiers**](AllowListBlockListApi.md#listallowlistidentifiers) | **GET** /allowlist_identifiers | List all identifiers on the allow-list
[**listBlocklistIdentifiers**](AllowListBlockListApi.md#listblocklistidentifiers) | **GET** /blocklist_identifiers | List all identifiers on the block-list


# **createAllowlistIdentifier**
> AllowlistIdentifier createAllowlistIdentifier(createAllowlistIdentifierRequest)

Add identifier to the allow-list

Create an identifier allowed to sign up to an instance

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AllowListBlockListApi();
final createAllowlistIdentifierRequest = CreateAllowlistIdentifierRequest(); // CreateAllowlistIdentifierRequest | 

try {
    final result = api_instance.createAllowlistIdentifier(createAllowlistIdentifierRequest);
    print(result);
} catch (e) {
    print('Exception when calling AllowListBlockListApi->createAllowlistIdentifier: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createAllowlistIdentifierRequest** | [**CreateAllowlistIdentifierRequest**](CreateAllowlistIdentifierRequest.md)|  | [optional] 

### Return type

[**AllowlistIdentifier**](AllowlistIdentifier.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createBlocklistIdentifier**
> BlocklistIdentifier createBlocklistIdentifier(createBlocklistIdentifierRequest)

Add identifier to the block-list

Create an identifier that is blocked from accessing an instance

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AllowListBlockListApi();
final createBlocklistIdentifierRequest = CreateBlocklistIdentifierRequest(); // CreateBlocklistIdentifierRequest | 

try {
    final result = api_instance.createBlocklistIdentifier(createBlocklistIdentifierRequest);
    print(result);
} catch (e) {
    print('Exception when calling AllowListBlockListApi->createBlocklistIdentifier: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createBlocklistIdentifierRequest** | [**CreateBlocklistIdentifierRequest**](CreateBlocklistIdentifierRequest.md)|  | [optional] 

### Return type

[**BlocklistIdentifier**](BlocklistIdentifier.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteAllowlistIdentifier**
> DeletedObject deleteAllowlistIdentifier(identifierId)

Delete identifier from allow-list

Delete an identifier from the instance allow-list

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AllowListBlockListApi();
final identifierId = identifierId_example; // String | The ID of the identifier to delete from the allow-list

try {
    final result = api_instance.deleteAllowlistIdentifier(identifierId);
    print(result);
} catch (e) {
    print('Exception when calling AllowListBlockListApi->deleteAllowlistIdentifier: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **identifierId** | **String**| The ID of the identifier to delete from the allow-list | 

### Return type

[**DeletedObject**](DeletedObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteBlocklistIdentifier**
> DeletedObject deleteBlocklistIdentifier(identifierId)

Delete identifier from block-list

Delete an identifier from the instance block-list

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AllowListBlockListApi();
final identifierId = identifierId_example; // String | The ID of the identifier to delete from the block-list

try {
    final result = api_instance.deleteBlocklistIdentifier(identifierId);
    print(result);
} catch (e) {
    print('Exception when calling AllowListBlockListApi->deleteBlocklistIdentifier: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **identifierId** | **String**| The ID of the identifier to delete from the block-list | 

### Return type

[**DeletedObject**](DeletedObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listAllowlistIdentifiers**
> List<AllowlistIdentifier> listAllowlistIdentifiers(paginated, limit, offset)

List all identifiers on the allow-list

Get a list of all identifiers allowed to sign up to an instance

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AllowListBlockListApi();
final paginated = true; // bool | Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.listAllowlistIdentifiers(paginated, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling AllowListBlockListApi->listAllowlistIdentifiers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paginated** | **bool**| Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated. | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**List<AllowlistIdentifier>**](AllowlistIdentifier.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listBlocklistIdentifiers**
> BlocklistIdentifiers listBlocklistIdentifiers()

List all identifiers on the block-list

Get a list of all identifiers which are not allowed to access an instance

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AllowListBlockListApi();

try {
    final result = api_instance.listBlocklistIdentifiers();
    print(result);
} catch (e) {
    print('Exception when calling AllowListBlockListApi->listBlocklistIdentifiers: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BlocklistIdentifiers**](BlocklistIdentifiers.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

