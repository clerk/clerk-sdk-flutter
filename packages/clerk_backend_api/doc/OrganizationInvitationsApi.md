# clerk_backend_api.api.OrganizationInvitationsApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOrganizationInvitation**](OrganizationInvitationsApi.md#createorganizationinvitation) | **POST** /organizations/{organization_id}/invitations | Create and send an organization invitation
[**createOrganizationInvitationBulk**](OrganizationInvitationsApi.md#createorganizationinvitationbulk) | **POST** /organizations/{organization_id}/invitations/bulk | Bulk create and send organization invitations
[**getOrganizationInvitation**](OrganizationInvitationsApi.md#getorganizationinvitation) | **GET** /organizations/{organization_id}/invitations/{invitation_id} | Retrieve an organization invitation by ID
[**listInstanceOrganizationInvitations**](OrganizationInvitationsApi.md#listinstanceorganizationinvitations) | **GET** /organization_invitations | Get a list of organization invitations for the current instance
[**listOrganizationInvitations**](OrganizationInvitationsApi.md#listorganizationinvitations) | **GET** /organizations/{organization_id}/invitations | Get a list of organization invitations
[**listPendingOrganizationInvitations**](OrganizationInvitationsApi.md#listpendingorganizationinvitations) | **GET** /organizations/{organization_id}/invitations/pending | Get a list of pending organization invitations
[**revokeOrganizationInvitation**](OrganizationInvitationsApi.md#revokeorganizationinvitation) | **POST** /organizations/{organization_id}/invitations/{invitation_id}/revoke | Revoke a pending organization invitation


# **createOrganizationInvitation**
> OrganizationInvitation createOrganizationInvitation(organizationId, createOrganizationInvitationRequest)

Create and send an organization invitation

Creates a new organization invitation and sends an email to the provided `email_address` with a link to accept the invitation and join the organization. You can specify the `role` for the invited organization member.  New organization invitations get a \"pending\" status until they are revoked by an organization administrator or accepted by the invitee.  The request body supports passing an optional `redirect_url` parameter. When the invited user clicks the link to accept the invitation, they will be redirected to the URL provided. Use this parameter to implement a custom invitation acceptance flow.  You can specify the ID of the user that will send the invitation with the `inviter_user_id` parameter. That user must be a member with administrator privileges in the organization. Only \"admin\" members can create organization invitations.  You can optionally provide public and private metadata for the organization invitation. The public metadata are visible by both the Frontend and the Backend whereas the private ones only by the Backend. When the organization invitation is accepted, the metadata will be transferred to the newly created organization membership.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationInvitationsApi();
final organizationId = organizationId_example; // String | The ID of the organization for which to send the invitation
final createOrganizationInvitationRequest = CreateOrganizationInvitationRequest(); // CreateOrganizationInvitationRequest | 

try {
    final result = api_instance.createOrganizationInvitation(organizationId, createOrganizationInvitationRequest);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationInvitationsApi->createOrganizationInvitation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The ID of the organization for which to send the invitation | 
 **createOrganizationInvitationRequest** | [**CreateOrganizationInvitationRequest**](CreateOrganizationInvitationRequest.md)|  | [optional] 

### Return type

[**OrganizationInvitation**](OrganizationInvitation.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createOrganizationInvitationBulk**
> OrganizationInvitations createOrganizationInvitationBulk(organizationId, createOrganizationInvitationRequest)

Bulk create and send organization invitations

Creates new organization invitations in bulk and sends out emails to the provided email addresses with a link to accept the invitation and join the organization. You can specify a different `role` for each invited organization member. New organization invitations get a \"pending\" status until they are revoked by an organization administrator or accepted by the invitee. The request body supports passing an optional `redirect_url` parameter for each invitation. When the invited user clicks the link to accept the invitation, they will be redirected to the provided URL. Use this parameter to implement a custom invitation acceptance flow. You can specify the ID of the user that will send the invitation with the `inviter_user_id` parameter. Each invitation can have a different inviter user. Inviter users must be members with administrator privileges in the organization. Only \"admin\" members can create organization invitations. You can optionally provide public and private metadata for each organization invitation. The public metadata are visible by both the Frontend and the Backend, whereas the private metadata are only visible by the Backend. When the organization invitation is accepted, the metadata will be transferred to the newly created organization membership.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationInvitationsApi();
final organizationId = organizationId_example; // String | The organization ID.
final createOrganizationInvitationRequest = [List<CreateOrganizationInvitationRequest>()]; // List<CreateOrganizationInvitationRequest> | 

try {
    final result = api_instance.createOrganizationInvitationBulk(organizationId, createOrganizationInvitationRequest);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationInvitationsApi->createOrganizationInvitationBulk: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The organization ID. | 
 **createOrganizationInvitationRequest** | [**List<CreateOrganizationInvitationRequest>**](CreateOrganizationInvitationRequest.md)|  | 

### Return type

[**OrganizationInvitations**](OrganizationInvitations.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrganizationInvitation**
> OrganizationInvitation getOrganizationInvitation(organizationId, invitationId)

Retrieve an organization invitation by ID

Use this request to get an existing organization invitation by ID.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationInvitationsApi();
final organizationId = organizationId_example; // String | The organization ID.
final invitationId = invitationId_example; // String | The organization invitation ID.

try {
    final result = api_instance.getOrganizationInvitation(organizationId, invitationId);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationInvitationsApi->getOrganizationInvitation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The organization ID. | 
 **invitationId** | **String**| The organization invitation ID. | 

### Return type

[**OrganizationInvitation**](OrganizationInvitation.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listInstanceOrganizationInvitations**
> OrganizationInvitationsWithPublicOrganizationData listInstanceOrganizationInvitations(orderBy, status, query, limit, offset)

Get a list of organization invitations for the current instance

This request returns the list of organization invitations for the instance. Results can be paginated using the optional `limit` and `offset` query parameters. You can filter them by providing the 'status' query parameter, that accepts multiple values. You can change the order by providing the 'order' query parameter, that accepts multiple values. You can filter by the invited user email address providing the `query` query parameter. The organization invitations are ordered by descending creation date by default.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationInvitationsApi();
final orderBy = orderBy_example; // String | Allows to return organization invitations in a particular order. At the moment, you can order the returned organization invitations either by their `created_at` or `email_address`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want organization invitations to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`.
final status = status_example; // String | Filter organization invitations based on their status
final query = query_example; // String | Filter organization invitations based on their `email_address`
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.listInstanceOrganizationInvitations(orderBy, status, query, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationInvitationsApi->listInstanceOrganizationInvitations: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderBy** | **String**| Allows to return organization invitations in a particular order. At the moment, you can order the returned organization invitations either by their `created_at` or `email_address`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want organization invitations to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`. | [optional] [default to '-created_at']
 **status** | **String**| Filter organization invitations based on their status | [optional] 
 **query** | **String**| Filter organization invitations based on their `email_address` | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**OrganizationInvitationsWithPublicOrganizationData**](OrganizationInvitationsWithPublicOrganizationData.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listOrganizationInvitations**
> OrganizationInvitations listOrganizationInvitations(organizationId, status, limit, offset)

Get a list of organization invitations

This request returns the list of organization invitations. Results can be paginated using the optional `limit` and `offset` query parameters. You can filter them by providing the 'status' query parameter, that accepts multiple values. The organization invitations are ordered by descending creation date. Most recent invitations will be returned first. Any invitations created as a result of an Organization Domain are not included in the results.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationInvitationsApi();
final organizationId = organizationId_example; // String | The organization ID.
final status = status_example; // String | Filter organization invitations based on their status
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.listOrganizationInvitations(organizationId, status, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationInvitationsApi->listOrganizationInvitations: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The organization ID. | 
 **status** | **String**| Filter organization invitations based on their status | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**OrganizationInvitations**](OrganizationInvitations.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPendingOrganizationInvitations**
> OrganizationInvitations listPendingOrganizationInvitations(organizationId, limit, offset)

Get a list of pending organization invitations

This request returns the list of organization invitations with \"pending\" status. These are the organization invitations that can still be used to join the organization, but have not been accepted by the invited user yet. Results can be paginated using the optional `limit` and `offset` query parameters. The organization invitations are ordered by descending creation date. Most recent invitations will be returned first. Any invitations created as a result of an Organization Domain are not included in the results.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationInvitationsApi();
final organizationId = organizationId_example; // String | The organization ID.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.listPendingOrganizationInvitations(organizationId, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationInvitationsApi->listPendingOrganizationInvitations: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The organization ID. | 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**OrganizationInvitations**](OrganizationInvitations.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeOrganizationInvitation**
> OrganizationInvitation revokeOrganizationInvitation(organizationId, invitationId, revokeOrganizationInvitationRequest)

Revoke a pending organization invitation

Use this request to revoke a previously issued organization invitation. Revoking an organization invitation makes it invalid; the invited user will no longer be able to join the organization with the revoked invitation. Only organization invitations with \"pending\" status can be revoked. The request accepts the `requesting_user_id` parameter to specify the user which revokes the invitation. Only users with \"admin\" role can revoke invitations.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationInvitationsApi();
final organizationId = organizationId_example; // String | The organization ID.
final invitationId = invitationId_example; // String | The organization invitation ID.
final revokeOrganizationInvitationRequest = RevokeOrganizationInvitationRequest(); // RevokeOrganizationInvitationRequest | 

try {
    final result = api_instance.revokeOrganizationInvitation(organizationId, invitationId, revokeOrganizationInvitationRequest);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationInvitationsApi->revokeOrganizationInvitation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The organization ID. | 
 **invitationId** | **String**| The organization invitation ID. | 
 **revokeOrganizationInvitationRequest** | [**RevokeOrganizationInvitationRequest**](RevokeOrganizationInvitationRequest.md)|  | [optional] 

### Return type

[**OrganizationInvitation**](OrganizationInvitation.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

