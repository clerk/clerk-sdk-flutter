# clerk_backend_api.api.SessionsApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createSession**](SessionsApi.md#createsession) | **POST** /sessions | Create a new active session
[**createSessionToken**](SessionsApi.md#createsessiontoken) | **POST** /sessions/{session_id}/tokens | Create a session token
[**createSessionTokenFromTemplate**](SessionsApi.md#createsessiontokenfromtemplate) | **POST** /sessions/{session_id}/tokens/{template_name} | Create a session token from a jwt template
[**getSession**](SessionsApi.md#getsession) | **GET** /sessions/{session_id} | Retrieve a session
[**getSessionList**](SessionsApi.md#getsessionlist) | **GET** /sessions | List all sessions
[**revokeSession**](SessionsApi.md#revokesession) | **POST** /sessions/{session_id}/revoke | Revoke a session
[**verifySession**](SessionsApi.md#verifysession) | **POST** /sessions/{session_id}/verify | Verify a session


# **createSession**
> Session createSession(createSessionRequest)

Create a new active session

Create a new active session for the provided user ID.  **This operation is intended only for use in testing, and is not available for production instances.** If you are looking to generate a user session from the backend, we recommend using the [Sign-in Tokens](https://clerk.com/docs/reference/backend-api/tag/Sign-in-Tokens#operation/CreateSignInToken) resource instead.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SessionsApi();
final createSessionRequest = CreateSessionRequest(); // CreateSessionRequest | 

try {
    final result = api_instance.createSession(createSessionRequest);
    print(result);
} catch (e) {
    print('Exception when calling SessionsApi->createSession: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createSessionRequest** | [**CreateSessionRequest**](CreateSessionRequest.md)|  | [optional] 

### Return type

[**Session**](Session.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createSessionToken**
> CreateSessionToken200Response createSessionToken(sessionId, createSessionTokenRequest)

Create a session token

Creates a session JSON Web Token (JWT) based on a session.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SessionsApi();
final sessionId = sessionId_example; // String | The ID of the session
final createSessionTokenRequest = CreateSessionTokenRequest(); // CreateSessionTokenRequest | 

try {
    final result = api_instance.createSessionToken(sessionId, createSessionTokenRequest);
    print(result);
} catch (e) {
    print('Exception when calling SessionsApi->createSessionToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String**| The ID of the session | 
 **createSessionTokenRequest** | [**CreateSessionTokenRequest**](CreateSessionTokenRequest.md)|  | [optional] 

### Return type

[**CreateSessionToken200Response**](CreateSessionToken200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createSessionTokenFromTemplate**
> CreateSessionToken200Response createSessionTokenFromTemplate(sessionId, templateName, createSessionTokenFromTemplateRequest)

Create a session token from a jwt template

Creates a JSON Web Token(JWT) based on a session and a JWT Template name defined for your instance

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SessionsApi();
final sessionId = sessionId_example; // String | The ID of the session
final templateName = templateName_example; // String | The name of the JWT Template defined in your instance (e.g. `custom_hasura`).
final createSessionTokenFromTemplateRequest = CreateSessionTokenFromTemplateRequest(); // CreateSessionTokenFromTemplateRequest | 

try {
    final result = api_instance.createSessionTokenFromTemplate(sessionId, templateName, createSessionTokenFromTemplateRequest);
    print(result);
} catch (e) {
    print('Exception when calling SessionsApi->createSessionTokenFromTemplate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String**| The ID of the session | 
 **templateName** | **String**| The name of the JWT Template defined in your instance (e.g. `custom_hasura`). | 
 **createSessionTokenFromTemplateRequest** | [**CreateSessionTokenFromTemplateRequest**](CreateSessionTokenFromTemplateRequest.md)|  | [optional] 

### Return type

[**CreateSessionToken200Response**](CreateSessionToken200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSession**
> Session getSession(sessionId)

Retrieve a session

Retrieve the details of a session

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SessionsApi();
final sessionId = sessionId_example; // String | The ID of the session

try {
    final result = api_instance.getSession(sessionId);
    print(result);
} catch (e) {
    print('Exception when calling SessionsApi->getSession: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String**| The ID of the session | 

### Return type

[**Session**](Session.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSessionList**
> List<Session> getSessionList(clientId, userId, status, paginated, limit, offset)

List all sessions

Returns a list of all sessions. The sessions are returned sorted by creation date, with the newest sessions appearing first. **Deprecation Notice (2024-01-01):** All parameters were initially considered optional, however moving forward at least one of `client_id` or `user_id` parameters should be provided.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SessionsApi();
final clientId = clientId_example; // String | List sessions for the given client
final userId = userId_example; // String | List sessions for the given user
final status = status_example; // String | Filter sessions by the provided status
final paginated = true; // bool | Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.getSessionList(clientId, userId, status, paginated, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling SessionsApi->getSessionList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **clientId** | **String**| List sessions for the given client | [optional] 
 **userId** | **String**| List sessions for the given user | [optional] 
 **status** | **String**| Filter sessions by the provided status | [optional] 
 **paginated** | **bool**| Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated. | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**List<Session>**](Session.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeSession**
> Session revokeSession(sessionId)

Revoke a session

Sets the status of a session as \"revoked\", which is an unauthenticated state. In multi-session mode, a revoked session will still be returned along with its client object, however the user will need to sign in again.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SessionsApi();
final sessionId = sessionId_example; // String | The ID of the session

try {
    final result = api_instance.revokeSession(sessionId);
    print(result);
} catch (e) {
    print('Exception when calling SessionsApi->revokeSession: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String**| The ID of the session | 

### Return type

[**Session**](Session.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifySession**
> Session verifySession(sessionId, verifySessionRequest)

Verify a session

Returns the session if it is authenticated, otherwise returns an error. WARNING: This endpoint is deprecated and will be removed in future versions. We strongly recommend switching to networkless verification using short-lived session tokens,          which is implemented transparently in all recent SDK versions (e.g. [NodeJS SDK](https://clerk.com/docs/backend-requests/handling/nodejs#clerk-express-require-auth)).          For more details on how networkless verification works, refer to our [Session Tokens documentation](https://clerk.com/docs/backend-requests/resources/session-tokens).

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SessionsApi();
final sessionId = sessionId_example; // String | The ID of the session
final verifySessionRequest = VerifySessionRequest(); // VerifySessionRequest | Parameters.

try {
    final result = api_instance.verifySession(sessionId, verifySessionRequest);
    print(result);
} catch (e) {
    print('Exception when calling SessionsApi->verifySession: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String**| The ID of the session | 
 **verifySessionRequest** | [**VerifySessionRequest**](VerifySessionRequest.md)| Parameters. | [optional] 

### Return type

[**Session**](Session.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

