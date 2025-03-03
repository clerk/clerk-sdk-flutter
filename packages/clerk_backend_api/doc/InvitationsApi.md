# clerk_backend_api.api.InvitationsApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createBulkInvitations**](InvitationsApi.md#createbulkinvitations) | **POST** /invitations/bulk | Create multiple invitations
[**createInvitation**](InvitationsApi.md#createinvitation) | **POST** /invitations | Create an invitation
[**listInvitations**](InvitationsApi.md#listinvitations) | **GET** /invitations | List all invitations
[**revokeInvitation**](InvitationsApi.md#revokeinvitation) | **POST** /invitations/{invitation_id}/revoke | Revokes an invitation


# **createBulkInvitations**
> List<Invitation> createBulkInvitations(createBulkInvitationsRequestInner)

Create multiple invitations

Use this API operation to create multiple invitations for the provided email addresses. You can choose to send the invitations as emails by setting the `notify` parameter to `true`. There cannot be an existing invitation for any of the email addresses you provide unless you set `ignore_existing` to `true` for specific email addresses. Please note that there must be no existing user for any of the email addresses you provide, and this rule cannot be bypassed.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InvitationsApi();
final createBulkInvitationsRequestInner = [List<CreateBulkInvitationsRequestInner>()]; // List<CreateBulkInvitationsRequestInner> | Required parameters

try {
    final result = api_instance.createBulkInvitations(createBulkInvitationsRequestInner);
    print(result);
} catch (e) {
    print('Exception when calling InvitationsApi->createBulkInvitations: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createBulkInvitationsRequestInner** | [**List<CreateBulkInvitationsRequestInner>**](CreateBulkInvitationsRequestInner.md)| Required parameters | [optional] 

### Return type

[**List<Invitation>**](Invitation.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createInvitation**
> Invitation createInvitation(createInvitationRequest)

Create an invitation

Creates a new invitation for the given email address and sends the invitation email. Keep in mind that you cannot create an invitation if there is already one for the given email address. Also, trying to create an invitation for an email address that already exists in your application will result to an error.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InvitationsApi();
final createInvitationRequest = CreateInvitationRequest(); // CreateInvitationRequest | Required parameters

try {
    final result = api_instance.createInvitation(createInvitationRequest);
    print(result);
} catch (e) {
    print('Exception when calling InvitationsApi->createInvitation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createInvitationRequest** | [**CreateInvitationRequest**](CreateInvitationRequest.md)| Required parameters | [optional] 

### Return type

[**Invitation**](Invitation.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listInvitations**
> List<Invitation> listInvitations(status, query, orderBy, paginated, limit, offset)

List all invitations

Returns all non-revoked invitations for your application, sorted by creation date

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InvitationsApi();
final status = status_example; // String | Filter invitations based on their status
final query = query_example; // String | Filter invitations based on their `email_address` or `id`
final orderBy = orderBy_example; // String | Allows to return organizations in a particular order. At the moment, you can order the returned organizations either by their `name`, `created_at` or `members_count`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want organizations to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied.
final paginated = true; // bool | Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.listInvitations(status, query, orderBy, paginated, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling InvitationsApi->listInvitations: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **status** | **String**| Filter invitations based on their status | [optional] 
 **query** | **String**| Filter invitations based on their `email_address` or `id` | [optional] 
 **orderBy** | **String**| Allows to return organizations in a particular order. At the moment, you can order the returned organizations either by their `name`, `created_at` or `members_count`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want organizations to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. | [optional] 
 **paginated** | **bool**| Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated. | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**List<Invitation>**](Invitation.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeInvitation**
> RevokeInvitation200Response revokeInvitation(invitationId)

Revokes an invitation

Revokes the given invitation. Revoking an invitation will prevent the user from using the invitation link that was sent to them. However, it doesn't prevent the user from signing up if they follow the sign up flow. Only active (i.e. non-revoked) invitations can be revoked.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InvitationsApi();
final invitationId = invitationId_example; // String | The ID of the invitation to be revoked

try {
    final result = api_instance.revokeInvitation(invitationId);
    print(result);
} catch (e) {
    print('Exception when calling InvitationsApi->revokeInvitation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invitationId** | **String**| The ID of the invitation to be revoked | 

### Return type

[**RevokeInvitation200Response**](RevokeInvitation200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

