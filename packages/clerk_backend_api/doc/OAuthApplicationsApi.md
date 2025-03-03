# clerk_backend_api.api.OAuthApplicationsApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOAuthApplication**](OAuthApplicationsApi.md#createoauthapplication) | **POST** /oauth_applications | Create an OAuth application
[**deleteOAuthApplication**](OAuthApplicationsApi.md#deleteoauthapplication) | **DELETE** /oauth_applications/{oauth_application_id} | Delete an OAuth application
[**getOAuthApplication**](OAuthApplicationsApi.md#getoauthapplication) | **GET** /oauth_applications/{oauth_application_id} | Retrieve an OAuth application by ID
[**listOAuthApplications**](OAuthApplicationsApi.md#listoauthapplications) | **GET** /oauth_applications | Get a list of OAuth applications for an instance
[**rotateOAuthApplicationSecret**](OAuthApplicationsApi.md#rotateoauthapplicationsecret) | **POST** /oauth_applications/{oauth_application_id}/rotate_secret | Rotate the client secret of the given OAuth application
[**updateOAuthApplication**](OAuthApplicationsApi.md#updateoauthapplication) | **PATCH** /oauth_applications/{oauth_application_id} | Update an OAuth application


# **createOAuthApplication**
> OAuthApplicationWithSecret createOAuthApplication(createOAuthApplicationRequest)

Create an OAuth application

Creates a new OAuth application with the given name and callback URL for an instance. The callback URL must be a valid url. All URL schemes are allowed such as `http://`, `https://`, `myapp://`, etc...

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OAuthApplicationsApi();
final createOAuthApplicationRequest = CreateOAuthApplicationRequest(); // CreateOAuthApplicationRequest | 

try {
    final result = api_instance.createOAuthApplication(createOAuthApplicationRequest);
    print(result);
} catch (e) {
    print('Exception when calling OAuthApplicationsApi->createOAuthApplication: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createOAuthApplicationRequest** | [**CreateOAuthApplicationRequest**](CreateOAuthApplicationRequest.md)|  | [optional] 

### Return type

[**OAuthApplicationWithSecret**](OAuthApplicationWithSecret.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOAuthApplication**
> DeletedObject deleteOAuthApplication(oauthApplicationId)

Delete an OAuth application

Deletes the given OAuth application. This is not reversible.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OAuthApplicationsApi();
final oauthApplicationId = oauthApplicationId_example; // String | The ID of the OAuth application to delete

try {
    final result = api_instance.deleteOAuthApplication(oauthApplicationId);
    print(result);
} catch (e) {
    print('Exception when calling OAuthApplicationsApi->deleteOAuthApplication: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oauthApplicationId** | **String**| The ID of the OAuth application to delete | 

### Return type

[**DeletedObject**](DeletedObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOAuthApplication**
> OAuthApplication getOAuthApplication(oauthApplicationId)

Retrieve an OAuth application by ID

Fetches the OAuth application whose ID matches the provided `id` in the path.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OAuthApplicationsApi();
final oauthApplicationId = oauthApplicationId_example; // String | The ID of the OAuth application

try {
    final result = api_instance.getOAuthApplication(oauthApplicationId);
    print(result);
} catch (e) {
    print('Exception when calling OAuthApplicationsApi->getOAuthApplication: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oauthApplicationId** | **String**| The ID of the OAuth application | 

### Return type

[**OAuthApplication**](OAuthApplication.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listOAuthApplications**
> OAuthApplications listOAuthApplications(limit, offset)

Get a list of OAuth applications for an instance

This request returns the list of OAuth applications for an instance. Results can be paginated using the optional `limit` and `offset` query parameters. The OAuth applications are ordered by descending creation date. Most recent OAuth applications will be returned first.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OAuthApplicationsApi();
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.listOAuthApplications(limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling OAuthApplicationsApi->listOAuthApplications: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**OAuthApplications**](OAuthApplications.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **rotateOAuthApplicationSecret**
> OAuthApplicationWithSecret rotateOAuthApplicationSecret(oauthApplicationId)

Rotate the client secret of the given OAuth application

Rotates the OAuth application's client secret. When the client secret is rotated, make sure to update it in authorized OAuth clients.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OAuthApplicationsApi();
final oauthApplicationId = oauthApplicationId_example; // String | The ID of the OAuth application for which to rotate the client secret

try {
    final result = api_instance.rotateOAuthApplicationSecret(oauthApplicationId);
    print(result);
} catch (e) {
    print('Exception when calling OAuthApplicationsApi->rotateOAuthApplicationSecret: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oauthApplicationId** | **String**| The ID of the OAuth application for which to rotate the client secret | 

### Return type

[**OAuthApplicationWithSecret**](OAuthApplicationWithSecret.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOAuthApplication**
> OAuthApplication updateOAuthApplication(oauthApplicationId, updateOAuthApplicationRequest)

Update an OAuth application

Updates an existing OAuth application

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OAuthApplicationsApi();
final oauthApplicationId = oauthApplicationId_example; // String | The ID of the OAuth application to update
final updateOAuthApplicationRequest = UpdateOAuthApplicationRequest(); // UpdateOAuthApplicationRequest | 

try {
    final result = api_instance.updateOAuthApplication(oauthApplicationId, updateOAuthApplicationRequest);
    print(result);
} catch (e) {
    print('Exception when calling OAuthApplicationsApi->updateOAuthApplication: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oauthApplicationId** | **String**| The ID of the OAuth application to update | 
 **updateOAuthApplicationRequest** | [**UpdateOAuthApplicationRequest**](UpdateOAuthApplicationRequest.md)|  | 

### Return type

[**OAuthApplication**](OAuthApplication.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

