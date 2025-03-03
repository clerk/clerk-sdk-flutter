# clerk_backend_api.api.OrganizationMembershipsApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOrganizationMembership**](OrganizationMembershipsApi.md#createorganizationmembership) | **POST** /organizations/{organization_id}/memberships | Create a new organization membership
[**deleteOrganizationMembership**](OrganizationMembershipsApi.md#deleteorganizationmembership) | **DELETE** /organizations/{organization_id}/memberships/{user_id} | Remove a member from an organization
[**instanceGetOrganizationMemberships**](OrganizationMembershipsApi.md#instancegetorganizationmemberships) | **GET** /organization_memberships | Get a list of all organization memberships within an instance.
[**listOrganizationMemberships**](OrganizationMembershipsApi.md#listorganizationmemberships) | **GET** /organizations/{organization_id}/memberships | Get a list of all members of an organization
[**updateOrganizationMembership**](OrganizationMembershipsApi.md#updateorganizationmembership) | **PATCH** /organizations/{organization_id}/memberships/{user_id} | Update an organization membership
[**updateOrganizationMembershipMetadata**](OrganizationMembershipsApi.md#updateorganizationmembershipmetadata) | **PATCH** /organizations/{organization_id}/memberships/{user_id}/metadata | Merge and update organization membership metadata


# **createOrganizationMembership**
> OrganizationMembership createOrganizationMembership(organizationId, createOrganizationMembershipRequest)

Create a new organization membership

Adds a user as a member to the given organization. Only users in the same instance as the organization can be added as members.  This organization will be the user's [active organization] (https://clerk.com/docs/organizations/overview#active-organization) the next time they create a session, presuming they don't explicitly set a different organization as active before then.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationMembershipsApi();
final organizationId = organizationId_example; // String | The ID of the organization where the new membership will be created
final createOrganizationMembershipRequest = CreateOrganizationMembershipRequest(); // CreateOrganizationMembershipRequest | 

try {
    final result = api_instance.createOrganizationMembership(organizationId, createOrganizationMembershipRequest);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationMembershipsApi->createOrganizationMembership: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The ID of the organization where the new membership will be created | 
 **createOrganizationMembershipRequest** | [**CreateOrganizationMembershipRequest**](CreateOrganizationMembershipRequest.md)|  | 

### Return type

[**OrganizationMembership**](OrganizationMembership.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrganizationMembership**
> OrganizationMembership deleteOrganizationMembership(organizationId, userId)

Remove a member from an organization

Removes the given membership from the organization

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationMembershipsApi();
final organizationId = organizationId_example; // String | The ID of the organization the membership belongs to
final userId = userId_example; // String | The ID of the user that this membership belongs to

try {
    final result = api_instance.deleteOrganizationMembership(organizationId, userId);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationMembershipsApi->deleteOrganizationMembership: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The ID of the organization the membership belongs to | 
 **userId** | **String**| The ID of the user that this membership belongs to | 

### Return type

[**OrganizationMembership**](OrganizationMembership.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **instanceGetOrganizationMemberships**
> OrganizationMemberships instanceGetOrganizationMemberships(orderBy, limit, offset)

Get a list of all organization memberships within an instance.

Retrieves all organization user memberships for the given instance.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationMembershipsApi();
final orderBy = orderBy_example; // String | Sorts organizations memberships by phone_number, email_address, created_at, first_name, last_name or username. By prepending one of those values with + or -, we can choose to sort in ascending (ASC) or descending (DESC) order.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.instanceGetOrganizationMemberships(orderBy, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationMembershipsApi->instanceGetOrganizationMemberships: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderBy** | **String**| Sorts organizations memberships by phone_number, email_address, created_at, first_name, last_name or username. By prepending one of those values with + or -, we can choose to sort in ascending (ASC) or descending (DESC) order. | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**OrganizationMemberships**](OrganizationMemberships.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listOrganizationMemberships**
> OrganizationMemberships listOrganizationMemberships(organizationId, orderBy, userId, emailAddress, phoneNumber, username, web3Wallet, role, query, emailAddressQuery, phoneNumberQuery, usernameQuery, nameQuery, lastActiveAtBefore, lastActiveAtAfter, createdAtBefore, createdAtAfter, limit, offset)

Get a list of all members of an organization

Retrieves all user memberships for the given organization

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationMembershipsApi();
final organizationId = organizationId_example; // String | The organization ID.
final orderBy = orderBy_example; // String | Sorts organizations memberships by phone_number, email_address, created_at, first_name, last_name or username. By prepending one of those values with + or -, we can choose to sort in ascending (ASC) or descending (DESC) order.\"
final userId = []; // List<String> | Returns users with the user ids specified. For each user id, the `+` and `-` can be prepended to the id, which denote whether the respective user id should be included or excluded from the result set. Accepts up to 100 user ids. Any user ids not found are ignored.
final emailAddress = []; // List<String> | Returns users with the specified email addresses. Accepts up to 100 email addresses. Any email addresses not found are ignored.
final phoneNumber = []; // List<String> | Returns users with the specified phone numbers. Accepts up to 100 phone numbers. Any phone numbers not found are ignored.
final username = []; // List<String> | Returns users with the specified usernames. Accepts up to 100 usernames. Any usernames not found are ignored.
final web3Wallet = []; // List<String> | Returns users with the specified web3 wallet addresses. Accepts up to 100 web3 wallet addresses. Any web3 wallet addressed not found are ignored.
final role = []; // List<String> | Returns users with the specified roles. Accepts up to 100 roles. Any roles not found are ignored.
final query = query_example; // String | Returns users that match the given query. For possible matches, we check the email addresses, phone numbers, usernames, web3 wallets, user ids, first and last names. The query value doesn't need to match the exact value you are looking for, it is capable of partial matches as well.
final emailAddressQuery = emailAddressQuery_example; // String | Returns users with emails that match the given query, via case-insensitive partial match. For example, `email_address_query=ello` will match a user with the email `HELLO@example.com`.
final phoneNumberQuery = phoneNumberQuery_example; // String | Returns users with phone numbers that match the given query, via case-insensitive partial match. For example, `phone_number_query=555` will match a user with the phone number `+1555xxxxxxx`.
final usernameQuery = usernameQuery_example; // String | Returns users with usernames that match the given query, via case-insensitive partial match. For example, `username_query=CoolUser` will match a user with the username `SomeCoolUser`.
final nameQuery = nameQuery_example; // String | Returns users with names that match the given query, via case-insensitive partial match.
final lastActiveAtBefore = 1700690400000; // int | Returns users whose last session activity was before the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was before 2023-11-23.
final lastActiveAtAfter = 1700690400000; // int | Returns users whose last session activity was after the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was after 2023-11-23.
final createdAtBefore = 1730160000000; // int | Returns users who have been created before the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created before 2024-10-29.
final createdAtAfter = 1730160000000; // int | Returns users who have been created after the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created after 2024-10-29.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.listOrganizationMemberships(organizationId, orderBy, userId, emailAddress, phoneNumber, username, web3Wallet, role, query, emailAddressQuery, phoneNumberQuery, usernameQuery, nameQuery, lastActiveAtBefore, lastActiveAtAfter, createdAtBefore, createdAtAfter, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationMembershipsApi->listOrganizationMemberships: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The organization ID. | 
 **orderBy** | **String**| Sorts organizations memberships by phone_number, email_address, created_at, first_name, last_name or username. By prepending one of those values with + or -, we can choose to sort in ascending (ASC) or descending (DESC) order.\" | [optional] 
 **userId** | [**List<String>**](String.md)| Returns users with the user ids specified. For each user id, the `+` and `-` can be prepended to the id, which denote whether the respective user id should be included or excluded from the result set. Accepts up to 100 user ids. Any user ids not found are ignored. | [optional] [default to const []]
 **emailAddress** | [**List<String>**](String.md)| Returns users with the specified email addresses. Accepts up to 100 email addresses. Any email addresses not found are ignored. | [optional] [default to const []]
 **phoneNumber** | [**List<String>**](String.md)| Returns users with the specified phone numbers. Accepts up to 100 phone numbers. Any phone numbers not found are ignored. | [optional] [default to const []]
 **username** | [**List<String>**](String.md)| Returns users with the specified usernames. Accepts up to 100 usernames. Any usernames not found are ignored. | [optional] [default to const []]
 **web3Wallet** | [**List<String>**](String.md)| Returns users with the specified web3 wallet addresses. Accepts up to 100 web3 wallet addresses. Any web3 wallet addressed not found are ignored. | [optional] [default to const []]
 **role** | [**List<String>**](String.md)| Returns users with the specified roles. Accepts up to 100 roles. Any roles not found are ignored. | [optional] [default to const []]
 **query** | **String**| Returns users that match the given query. For possible matches, we check the email addresses, phone numbers, usernames, web3 wallets, user ids, first and last names. The query value doesn't need to match the exact value you are looking for, it is capable of partial matches as well. | [optional] 
 **emailAddressQuery** | **String**| Returns users with emails that match the given query, via case-insensitive partial match. For example, `email_address_query=ello` will match a user with the email `HELLO@example.com`. | [optional] 
 **phoneNumberQuery** | **String**| Returns users with phone numbers that match the given query, via case-insensitive partial match. For example, `phone_number_query=555` will match a user with the phone number `+1555xxxxxxx`. | [optional] 
 **usernameQuery** | **String**| Returns users with usernames that match the given query, via case-insensitive partial match. For example, `username_query=CoolUser` will match a user with the username `SomeCoolUser`. | [optional] 
 **nameQuery** | **String**| Returns users with names that match the given query, via case-insensitive partial match. | [optional] 
 **lastActiveAtBefore** | **int**| Returns users whose last session activity was before the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was before 2023-11-23. | [optional] 
 **lastActiveAtAfter** | **int**| Returns users whose last session activity was after the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was after 2023-11-23. | [optional] 
 **createdAtBefore** | **int**| Returns users who have been created before the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created before 2024-10-29. | [optional] 
 **createdAtAfter** | **int**| Returns users who have been created after the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created after 2024-10-29. | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**OrganizationMemberships**](OrganizationMemberships.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrganizationMembership**
> OrganizationMembership updateOrganizationMembership(organizationId, userId, updateOrganizationMembershipRequest)

Update an organization membership

Updates the properties of an existing organization membership

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationMembershipsApi();
final organizationId = organizationId_example; // String | The ID of the organization the membership belongs to
final userId = userId_example; // String | The ID of the user that this membership belongs to
final updateOrganizationMembershipRequest = UpdateOrganizationMembershipRequest(); // UpdateOrganizationMembershipRequest | 

try {
    final result = api_instance.updateOrganizationMembership(organizationId, userId, updateOrganizationMembershipRequest);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationMembershipsApi->updateOrganizationMembership: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The ID of the organization the membership belongs to | 
 **userId** | **String**| The ID of the user that this membership belongs to | 
 **updateOrganizationMembershipRequest** | [**UpdateOrganizationMembershipRequest**](UpdateOrganizationMembershipRequest.md)|  | 

### Return type

[**OrganizationMembership**](OrganizationMembership.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrganizationMembershipMetadata**
> OrganizationMembership updateOrganizationMembershipMetadata(organizationId, userId, updateOrganizationMembershipMetadataRequest)

Merge and update organization membership metadata

Update an organization membership's metadata attributes by merging existing values with the provided parameters. Metadata values will be updated via a deep merge. Deep means that any nested JSON objects will be merged as well. You can remove metadata keys at any level by setting their value to `null`.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OrganizationMembershipsApi();
final organizationId = organizationId_example; // String | The ID of the organization the membership belongs to
final userId = userId_example; // String | The ID of the user that this membership belongs to
final updateOrganizationMembershipMetadataRequest = UpdateOrganizationMembershipMetadataRequest(); // UpdateOrganizationMembershipMetadataRequest | 

try {
    final result = api_instance.updateOrganizationMembershipMetadata(organizationId, userId, updateOrganizationMembershipMetadataRequest);
    print(result);
} catch (e) {
    print('Exception when calling OrganizationMembershipsApi->updateOrganizationMembershipMetadata: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The ID of the organization the membership belongs to | 
 **userId** | **String**| The ID of the user that this membership belongs to | 
 **updateOrganizationMembershipMetadataRequest** | [**UpdateOrganizationMembershipMetadataRequest**](UpdateOrganizationMembershipMetadataRequest.md)|  | [optional] 

### Return type

[**OrganizationMembership**](OrganizationMembership.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

