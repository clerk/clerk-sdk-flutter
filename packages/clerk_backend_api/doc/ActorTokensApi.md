# clerk_backend_api.api.ActorTokensApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createActorToken**](ActorTokensApi.md#createactortoken) | **POST** /actor_tokens | Create actor token
[**revokeActorToken**](ActorTokensApi.md#revokeactortoken) | **POST** /actor_tokens/{actor_token_id}/revoke | Revoke actor token


# **createActorToken**
> ActorToken createActorToken(createActorTokenRequest)

Create actor token

Create an actor token that can be used to impersonate the given user. The `actor` parameter needs to include at least a \"sub\" key whose value is the ID of the actor (impersonating) user.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ActorTokensApi();
final createActorTokenRequest = CreateActorTokenRequest(); // CreateActorTokenRequest | 

try {
    final result = api_instance.createActorToken(createActorTokenRequest);
    print(result);
} catch (e) {
    print('Exception when calling ActorTokensApi->createActorToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createActorTokenRequest** | [**CreateActorTokenRequest**](CreateActorTokenRequest.md)|  | [optional] 

### Return type

[**ActorToken**](ActorToken.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeActorToken**
> ActorToken revokeActorToken(actorTokenId)

Revoke actor token

Revokes a pending actor token.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ActorTokensApi();
final actorTokenId = actorTokenId_example; // String | The ID of the actor token to be revoked.

try {
    final result = api_instance.revokeActorToken(actorTokenId);
    print(result);
} catch (e) {
    print('Exception when calling ActorTokensApi->revokeActorToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **actorTokenId** | **String**| The ID of the actor token to be revoked. | 

### Return type

[**ActorToken**](ActorToken.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

