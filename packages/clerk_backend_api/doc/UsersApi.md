# clerk_backend_api.api.UsersApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**banUser**](UsersApi.md#banuser) | **POST** /users/{user_id}/ban | Ban a user
[**createUser**](UsersApi.md#createuser) | **POST** /users | Create a new user
[**deleteBackupCode**](UsersApi.md#deletebackupcode) | **DELETE** /users/{user_id}/backup_code | Disable all user's Backup codes
[**deleteExternalAccount**](UsersApi.md#deleteexternalaccount) | **DELETE** /users/{user_id}/external_accounts/{external_account_id} | Delete External Account
[**deleteTOTP**](UsersApi.md#deletetotp) | **DELETE** /users/{user_id}/totp | Delete all the user's TOTPs
[**deleteUser**](UsersApi.md#deleteuser) | **DELETE** /users/{user_id} | Delete a user
[**deleteUserProfileImage**](UsersApi.md#deleteuserprofileimage) | **DELETE** /users/{user_id}/profile_image | Delete user profile image
[**disableMFA**](UsersApi.md#disablemfa) | **DELETE** /users/{user_id}/mfa | Disable a user's MFA methods
[**getOAuthAccessToken**](UsersApi.md#getoauthaccesstoken) | **GET** /users/{user_id}/oauth_access_tokens/{provider} | Retrieve the OAuth access token of a user
[**getUser**](UsersApi.md#getuser) | **GET** /users/{user_id} | Retrieve a user
[**getUserList**](UsersApi.md#getuserlist) | **GET** /users | List all users
[**getUsersCount**](UsersApi.md#getuserscount) | **GET** /users/count | Count users
[**lockUser**](UsersApi.md#lockuser) | **POST** /users/{user_id}/lock | Lock a user
[**setUserProfileImage**](UsersApi.md#setuserprofileimage) | **POST** /users/{user_id}/profile_image | Set user profile image
[**unbanUser**](UsersApi.md#unbanuser) | **POST** /users/{user_id}/unban | Unban a user
[**unlockUser**](UsersApi.md#unlockuser) | **POST** /users/{user_id}/unlock | Unlock a user
[**updateUser**](UsersApi.md#updateuser) | **PATCH** /users/{user_id} | Update a user
[**updateUserMetadata**](UsersApi.md#updateusermetadata) | **PATCH** /users/{user_id}/metadata | Merge and update a user's metadata
[**userPasskeyDelete**](UsersApi.md#userpasskeydelete) | **DELETE** /users/{user_id}/passkeys/{passkey_identification_id} | Delete a user passkey
[**userWeb3WalletDelete**](UsersApi.md#userweb3walletdelete) | **DELETE** /users/{user_id}/web3_wallets/{web3_wallet_identification_id} | Delete a user web3 wallet
[**usersGetOrganizationInvitations**](UsersApi.md#usersgetorganizationinvitations) | **GET** /users/{user_id}/organization_invitations | Retrieve all invitations for a user
[**usersGetOrganizationMemberships**](UsersApi.md#usersgetorganizationmemberships) | **GET** /users/{user_id}/organization_memberships | Retrieve all memberships for a user
[**verifyPassword**](UsersApi.md#verifypassword) | **POST** /users/{user_id}/verify_password | Verify the password of a user
[**verifyTOTP**](UsersApi.md#verifytotp) | **POST** /users/{user_id}/verify_totp | Verify a TOTP or backup code for a user


# **banUser**
> User banUser(userId)

Ban a user

Marks the given user as banned, which means that all their sessions are revoked and they are not allowed to sign in again.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user to ban

try {
    final result = api_instance.banUser(userId);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->banUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user to ban | 

### Return type

[**User**](User.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createUser**
> User createUser(createUserRequest)

Create a new user

Creates a new user. Your user management settings determine how you should setup your user model.  Any email address and phone number created using this method will be marked as verified.  Note: If you are performing a migration, check out our guide on [zero downtime migrations](https://clerk.com/docs/deployments/migrate-overview).  A rate limit rule of 20 requests per 10 seconds is applied to this endpoint.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final createUserRequest = CreateUserRequest(); // CreateUserRequest | 

try {
    final result = api_instance.createUser(createUserRequest);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->createUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createUserRequest** | [**CreateUserRequest**](CreateUserRequest.md)|  | 

### Return type

[**User**](User.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteBackupCode**
> DisableMFA200Response deleteBackupCode(userId)

Disable all user's Backup codes

Disable all of a user's backup codes.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user whose backup codes are to be deleted.

try {
    final result = api_instance.deleteBackupCode(userId);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->deleteBackupCode: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user whose backup codes are to be deleted. | 

### Return type

[**DisableMFA200Response**](DisableMFA200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteExternalAccount**
> DeletedObject deleteExternalAccount(userId, externalAccountId)

Delete External Account

Delete an external account by ID.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user's external account
final externalAccountId = externalAccountId_example; // String | The ID of the external account to delete

try {
    final result = api_instance.deleteExternalAccount(userId, externalAccountId);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->deleteExternalAccount: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user's external account | 
 **externalAccountId** | **String**| The ID of the external account to delete | 

### Return type

[**DeletedObject**](DeletedObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteTOTP**
> DisableMFA200Response deleteTOTP(userId)

Delete all the user's TOTPs

Deletes all of the user's TOTPs.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user whose TOTPs are to be deleted

try {
    final result = api_instance.deleteTOTP(userId);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->deleteTOTP: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user whose TOTPs are to be deleted | 

### Return type

[**DisableMFA200Response**](DisableMFA200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteUser**
> DeletedObject deleteUser(userId)

Delete a user

Delete the specified user

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user to delete

try {
    final result = api_instance.deleteUser(userId);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->deleteUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user to delete | 

### Return type

[**DeletedObject**](DeletedObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteUserProfileImage**
> User deleteUserProfileImage(userId)

Delete user profile image

Delete a user's profile image

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user to delete the profile image for

try {
    final result = api_instance.deleteUserProfileImage(userId);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->deleteUserProfileImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user to delete the profile image for | 

### Return type

[**User**](User.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **disableMFA**
> DisableMFA200Response disableMFA(userId)

Disable a user's MFA methods

Disable all of a user's MFA methods (e.g. OTP sent via SMS, TOTP on their authenticator app) at once.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user whose MFA methods are to be disabled

try {
    final result = api_instance.disableMFA(userId);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->disableMFA: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user whose MFA methods are to be disabled | 

### Return type

[**DisableMFA200Response**](DisableMFA200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOAuthAccessToken**
> List<GetOAuthAccessToken200ResponseInner> getOAuthAccessToken(userId, provider, paginated, limit, offset)

Retrieve the OAuth access token of a user

Fetch the corresponding OAuth access token for a user that has previously authenticated with a particular OAuth provider. For OAuth 2.0, if the access token has expired and we have a corresponding refresh token, the access token will be refreshed transparently the new one will be returned.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user for which to retrieve the OAuth access token
final provider = provider_example; // String | The ID of the OAuth provider (e.g. `oauth_google`)
final paginated = true; // bool | Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.getOAuthAccessToken(userId, provider, paginated, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->getOAuthAccessToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user for which to retrieve the OAuth access token | 
 **provider** | **String**| The ID of the OAuth provider (e.g. `oauth_google`) | 
 **paginated** | **bool**| Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated. | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**List<GetOAuthAccessToken200ResponseInner>**](GetOAuthAccessToken200ResponseInner.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUser**
> User getUser(userId)

Retrieve a user

Retrieve the details of a user

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user to retrieve

try {
    final result = api_instance.getUser(userId);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->getUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user to retrieve | 

### Return type

[**User**](User.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserList**
> List<User> getUserList(emailAddress, phoneNumber, externalId, username, web3Wallet, userId, organizationId, query, emailAddressQuery, phoneNumberQuery, usernameQuery, nameQuery, banned, lastActiveAtBefore, lastActiveAtAfter, lastActiveAtSince, createdAtBefore, createdAtAfter, limit, offset, orderBy)

List all users

Returns a list of all users. The users are returned sorted by creation date, with the newest users appearing first.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final emailAddress = []; // List<String> | Returns users with the specified email addresses. Accepts up to 100 email addresses. Any email addresses not found are ignored.
final phoneNumber = []; // List<String> | Returns users with the specified phone numbers. Accepts up to 100 phone numbers. Any phone numbers not found are ignored.
final externalId = []; // List<String> | Returns users with the specified external ids. For each external id, the `+` and `-` can be prepended to the id, which denote whether the respective external id should be included or excluded from the result set. Accepts up to 100 external ids. Any external ids not found are ignored.
final username = []; // List<String> | Returns users with the specified usernames. Accepts up to 100 usernames. Any usernames not found are ignored.
final web3Wallet = []; // List<String> | Returns users with the specified web3 wallet addresses. Accepts up to 100 web3 wallet addresses. Any web3 wallet addressed not found are ignored.
final userId = []; // List<String> | Returns users with the user ids specified. For each user id, the `+` and `-` can be prepended to the id, which denote whether the respective user id should be included or excluded from the result set. Accepts up to 100 user ids. Any user ids not found are ignored.
final organizationId = []; // List<String> | Returns users that have memberships to the given organizations. For each organization id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set. Accepts up to 100 organization ids.
final query = query_example; // String | Returns users that match the given query. For possible matches, we check the email addresses, phone numbers, usernames, web3 wallets, user ids, first and last names. The query value doesn't need to match the exact value you are looking for, it is capable of partial matches as well.
final emailAddressQuery = emailAddressQuery_example; // String | Returns users with emails that match the given query, via case-insensitive partial match. For example, `email_address_query=ello` will match a user with the email `HELLO@example.com`.
final phoneNumberQuery = phoneNumberQuery_example; // String | Returns users with phone numbers that match the given query, via case-insensitive partial match. For example, `phone_number_query=555` will match a user with the phone number `+1555xxxxxxx`.
final usernameQuery = usernameQuery_example; // String | Returns users with usernames that match the given query, via case-insensitive partial match. For example, `username_query=CoolUser` will match a user with the username `SomeCoolUser`.
final nameQuery = nameQuery_example; // String | Returns users with names that match the given query, via case-insensitive partial match.
final banned = true; // bool | Returns users which are either banned (`banned=true`) or not banned (`banned=false`).
final lastActiveAtBefore = 1700690400000; // int | Returns users whose last session activity was before the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was before 2023-11-23.
final lastActiveAtAfter = 1700690400000; // int | Returns users whose last session activity was after the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was after 2023-11-23.
final lastActiveAtSince = 1700690400000; // int | Returns users that had session activity since the given date. Example: use 1700690400000 to retrieve users that had session activity from 2023-11-23 until the current day. Deprecated in favor of `last_active_at_after`.
final createdAtBefore = 1730160000000; // int | Returns users who have been created before the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created before 2024-10-29.
final createdAtAfter = 1730160000000; // int | Returns users who have been created after the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created after 2024-10-29.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
final orderBy = orderBy_example; // String | Allows to return users in a particular order. At the moment, you can order the returned users by their `created_at`,`updated_at`,`email_address`,`web3wallet`,`first_name`,`last_name`,`phone_number`,`username`,`last_active_at`,`last_sign_in_at`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want users to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. We only support one `order_by` parameter, and if multiple `order_by` parameters are provided, we will only keep the first one. For example, if you pass `order_by=username&order_by=created_at`, we will consider only the first `order_by` parameter, which is `username`. The `created_at` parameter will be ignored in this case.

try {
    final result = api_instance.getUserList(emailAddress, phoneNumber, externalId, username, web3Wallet, userId, organizationId, query, emailAddressQuery, phoneNumberQuery, usernameQuery, nameQuery, banned, lastActiveAtBefore, lastActiveAtAfter, lastActiveAtSince, createdAtBefore, createdAtAfter, limit, offset, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->getUserList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailAddress** | [**List<String>**](String.md)| Returns users with the specified email addresses. Accepts up to 100 email addresses. Any email addresses not found are ignored. | [optional] [default to const []]
 **phoneNumber** | [**List<String>**](String.md)| Returns users with the specified phone numbers. Accepts up to 100 phone numbers. Any phone numbers not found are ignored. | [optional] [default to const []]
 **externalId** | [**List<String>**](String.md)| Returns users with the specified external ids. For each external id, the `+` and `-` can be prepended to the id, which denote whether the respective external id should be included or excluded from the result set. Accepts up to 100 external ids. Any external ids not found are ignored. | [optional] [default to const []]
 **username** | [**List<String>**](String.md)| Returns users with the specified usernames. Accepts up to 100 usernames. Any usernames not found are ignored. | [optional] [default to const []]
 **web3Wallet** | [**List<String>**](String.md)| Returns users with the specified web3 wallet addresses. Accepts up to 100 web3 wallet addresses. Any web3 wallet addressed not found are ignored. | [optional] [default to const []]
 **userId** | [**List<String>**](String.md)| Returns users with the user ids specified. For each user id, the `+` and `-` can be prepended to the id, which denote whether the respective user id should be included or excluded from the result set. Accepts up to 100 user ids. Any user ids not found are ignored. | [optional] [default to const []]
 **organizationId** | [**List<String>**](String.md)| Returns users that have memberships to the given organizations. For each organization id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set. Accepts up to 100 organization ids. | [optional] [default to const []]
 **query** | **String**| Returns users that match the given query. For possible matches, we check the email addresses, phone numbers, usernames, web3 wallets, user ids, first and last names. The query value doesn't need to match the exact value you are looking for, it is capable of partial matches as well. | [optional] 
 **emailAddressQuery** | **String**| Returns users with emails that match the given query, via case-insensitive partial match. For example, `email_address_query=ello` will match a user with the email `HELLO@example.com`. | [optional] 
 **phoneNumberQuery** | **String**| Returns users with phone numbers that match the given query, via case-insensitive partial match. For example, `phone_number_query=555` will match a user with the phone number `+1555xxxxxxx`. | [optional] 
 **usernameQuery** | **String**| Returns users with usernames that match the given query, via case-insensitive partial match. For example, `username_query=CoolUser` will match a user with the username `SomeCoolUser`. | [optional] 
 **nameQuery** | **String**| Returns users with names that match the given query, via case-insensitive partial match. | [optional] 
 **banned** | **bool**| Returns users which are either banned (`banned=true`) or not banned (`banned=false`). | [optional] 
 **lastActiveAtBefore** | **int**| Returns users whose last session activity was before the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was before 2023-11-23. | [optional] 
 **lastActiveAtAfter** | **int**| Returns users whose last session activity was after the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was after 2023-11-23. | [optional] 
 **lastActiveAtSince** | **int**| Returns users that had session activity since the given date. Example: use 1700690400000 to retrieve users that had session activity from 2023-11-23 until the current day. Deprecated in favor of `last_active_at_after`. | [optional] 
 **createdAtBefore** | **int**| Returns users who have been created before the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created before 2024-10-29. | [optional] 
 **createdAtAfter** | **int**| Returns users who have been created after the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created after 2024-10-29. | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]
 **orderBy** | **String**| Allows to return users in a particular order. At the moment, you can order the returned users by their `created_at`,`updated_at`,`email_address`,`web3wallet`,`first_name`,`last_name`,`phone_number`,`username`,`last_active_at`,`last_sign_in_at`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want users to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. We only support one `order_by` parameter, and if multiple `order_by` parameters are provided, we will only keep the first one. For example, if you pass `order_by=username&order_by=created_at`, we will consider only the first `order_by` parameter, which is `username`. The `created_at` parameter will be ignored in this case. | [optional] [default to '-created_at']

### Return type

[**List<User>**](User.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUsersCount**
> TotalCount getUsersCount(emailAddress, phoneNumber, externalId, username, web3Wallet, userId, organizationId, query, emailAddressQuery, phoneNumberQuery, usernameQuery, nameQuery, banned, lastActiveAtBefore, lastActiveAtAfter, lastActiveAtSince, createdAtBefore, createdAtAfter)

Count users

Returns a total count of all users that match the given filtering criteria.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final emailAddress = []; // List<String> | Counts users with the specified email addresses. Accepts up to 100 email addresses. Any email addresses not found are ignored.
final phoneNumber = []; // List<String> | Counts users with the specified phone numbers. Accepts up to 100 phone numbers. Any phone numbers not found are ignored.
final externalId = []; // List<String> | Counts users with the specified external ids. Accepts up to 100 external ids. Any external ids not found are ignored.
final username = []; // List<String> | Counts users with the specified usernames. Accepts up to 100 usernames. Any usernames not found are ignored.
final web3Wallet = []; // List<String> | Counts users with the specified web3 wallet addresses. Accepts up to 100 web3 wallet addresses. Any web3 wallet addressed not found are ignored.
final userId = []; // List<String> | Counts users with the user ids specified. Accepts up to 100 user ids. Any user ids not found are ignored.
final organizationId = []; // List<String> | Returns users that have memberships to the given organizations. For each organization id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set. Accepts up to 100 organization ids.
final query = query_example; // String | Counts users that match the given query. For possible matches, we check the email addresses, phone numbers, usernames, web3 wallets, user ids, first and last names. The query value doesn't need to match the exact value you are looking for, it is capable of partial matches as well.
final emailAddressQuery = emailAddressQuery_example; // String | Counts users with emails that match the given query, via case-insensitive partial match. For example, `email_address_query=ello` will match a user with the email `HELLO@example.com`, and will be included in the resulting count.
final phoneNumberQuery = phoneNumberQuery_example; // String | Counts users with phone numbers that match the given query, via case-insensitive partial match. For example, `phone_number_query=555` will match a user with the phone number `+1555xxxxxxx`, and will be included in the resulting count.
final usernameQuery = usernameQuery_example; // String | Counts users with usernames that match the given query, via case-insensitive partial match. For example, `username_query=CoolUser` will match a user with the username `SomeCoolUser`, and will be included in the resulting count.
final nameQuery = nameQuery_example; // String | Returns users with names that match the given query, via case-insensitive partial match.
final banned = true; // bool | Counts users which are either banned (`banned=true`) or not banned (`banned=false`).
final lastActiveAtBefore = 1700690400000; // int | Returns users whose last session activity was before the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was before 2023-11-23.
final lastActiveAtAfter = 1700690400000; // int | Returns users whose last session activity was after the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was after 2023-11-23.
final lastActiveAtSince = 1700690400000; // int | Returns users that had session activity since the given date. Example: use 1700690400000 to retrieve users that had session activity from 2023-11-23 until the current day. Deprecated in favor of `last_active_at_after`.
final createdAtBefore = 1730160000000; // int | Returns users who have been created before the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created before 2024-10-29.
final createdAtAfter = 1730160000000; // int | Returns users who have been created after the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created after 2024-10-29.

try {
    final result = api_instance.getUsersCount(emailAddress, phoneNumber, externalId, username, web3Wallet, userId, organizationId, query, emailAddressQuery, phoneNumberQuery, usernameQuery, nameQuery, banned, lastActiveAtBefore, lastActiveAtAfter, lastActiveAtSince, createdAtBefore, createdAtAfter);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->getUsersCount: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailAddress** | [**List<String>**](String.md)| Counts users with the specified email addresses. Accepts up to 100 email addresses. Any email addresses not found are ignored. | [optional] [default to const []]
 **phoneNumber** | [**List<String>**](String.md)| Counts users with the specified phone numbers. Accepts up to 100 phone numbers. Any phone numbers not found are ignored. | [optional] [default to const []]
 **externalId** | [**List<String>**](String.md)| Counts users with the specified external ids. Accepts up to 100 external ids. Any external ids not found are ignored. | [optional] [default to const []]
 **username** | [**List<String>**](String.md)| Counts users with the specified usernames. Accepts up to 100 usernames. Any usernames not found are ignored. | [optional] [default to const []]
 **web3Wallet** | [**List<String>**](String.md)| Counts users with the specified web3 wallet addresses. Accepts up to 100 web3 wallet addresses. Any web3 wallet addressed not found are ignored. | [optional] [default to const []]
 **userId** | [**List<String>**](String.md)| Counts users with the user ids specified. Accepts up to 100 user ids. Any user ids not found are ignored. | [optional] [default to const []]
 **organizationId** | [**List<String>**](String.md)| Returns users that have memberships to the given organizations. For each organization id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set. Accepts up to 100 organization ids. | [optional] [default to const []]
 **query** | **String**| Counts users that match the given query. For possible matches, we check the email addresses, phone numbers, usernames, web3 wallets, user ids, first and last names. The query value doesn't need to match the exact value you are looking for, it is capable of partial matches as well. | [optional] 
 **emailAddressQuery** | **String**| Counts users with emails that match the given query, via case-insensitive partial match. For example, `email_address_query=ello` will match a user with the email `HELLO@example.com`, and will be included in the resulting count. | [optional] 
 **phoneNumberQuery** | **String**| Counts users with phone numbers that match the given query, via case-insensitive partial match. For example, `phone_number_query=555` will match a user with the phone number `+1555xxxxxxx`, and will be included in the resulting count. | [optional] 
 **usernameQuery** | **String**| Counts users with usernames that match the given query, via case-insensitive partial match. For example, `username_query=CoolUser` will match a user with the username `SomeCoolUser`, and will be included in the resulting count. | [optional] 
 **nameQuery** | **String**| Returns users with names that match the given query, via case-insensitive partial match. | [optional] 
 **banned** | **bool**| Counts users which are either banned (`banned=true`) or not banned (`banned=false`). | [optional] 
 **lastActiveAtBefore** | **int**| Returns users whose last session activity was before the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was before 2023-11-23. | [optional] 
 **lastActiveAtAfter** | **int**| Returns users whose last session activity was after the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was after 2023-11-23. | [optional] 
 **lastActiveAtSince** | **int**| Returns users that had session activity since the given date. Example: use 1700690400000 to retrieve users that had session activity from 2023-11-23 until the current day. Deprecated in favor of `last_active_at_after`. | [optional] 
 **createdAtBefore** | **int**| Returns users who have been created before the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created before 2024-10-29. | [optional] 
 **createdAtAfter** | **int**| Returns users who have been created after the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created after 2024-10-29. | [optional] 

### Return type

[**TotalCount**](TotalCount.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **lockUser**
> User lockUser(userId)

Lock a user

Marks the given user as locked, which means they are not allowed to sign in again until the lock expires. Lock duration can be configured in the instance's restrictions settings.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user to lock

try {
    final result = api_instance.lockUser(userId);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->lockUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user to lock | 

### Return type

[**User**](User.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setUserProfileImage**
> User setUserProfileImage(userId, file)

Set user profile image

Update a user's profile image

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user to update the profile image for
final file = BINARY_DATA_HERE; // MultipartFile | 

try {
    final result = api_instance.setUserProfileImage(userId, file);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->setUserProfileImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user to update the profile image for | 
 **file** | **MultipartFile**|  | [optional] 

### Return type

[**User**](User.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **unbanUser**
> User unbanUser(userId)

Unban a user

Removes the ban mark from the given user.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user to unban

try {
    final result = api_instance.unbanUser(userId);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->unbanUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user to unban | 

### Return type

[**User**](User.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **unlockUser**
> User unlockUser(userId)

Unlock a user

Removes the lock from the given user.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user to unlock

try {
    final result = api_instance.unlockUser(userId);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->unlockUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user to unlock | 

### Return type

[**User**](User.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateUser**
> User updateUser(userId, updateUserRequest)

Update a user

Update a user's attributes.  You can set the user's primary contact identifiers (email address and phone numbers) by updating the `primary_email_address_id` and `primary_phone_number_id` attributes respectively. Both IDs should correspond to verified identifications that belong to the user.  You can remove a user's username by setting the username attribute to null or the blank string \"\". This is a destructive action; the identification will be deleted forever. Usernames can be removed only if they are optional in your instance settings and there's at least one other identifier which can be used for authentication.  This endpoint allows changing a user's password. When passing the `password` parameter directly you have two further options. You can ignore the password policy checks for your instance by setting the `skip_password_checks` parameter to `true`. You can also choose to sign the user out of all their active sessions on any device once the password is updated. Just set `sign_out_of_other_sessions` to `true`.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user to update
final updateUserRequest = UpdateUserRequest(); // UpdateUserRequest | 

try {
    final result = api_instance.updateUser(userId, updateUserRequest);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->updateUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user to update | 
 **updateUserRequest** | [**UpdateUserRequest**](UpdateUserRequest.md)|  | 

### Return type

[**User**](User.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateUserMetadata**
> User updateUserMetadata(userId, updateUserMetadataRequest)

Merge and update a user's metadata

Update a user's metadata attributes by merging existing values with the provided parameters.  This endpoint behaves differently than the *Update a user* endpoint. Metadata values will not be replaced entirely. Instead, a deep merge will be performed. Deep means that any nested JSON objects will be merged as well.  You can remove metadata keys at any level by setting their value to `null`.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user whose metadata will be updated and merged
final updateUserMetadataRequest = UpdateUserMetadataRequest(); // UpdateUserMetadataRequest | 

try {
    final result = api_instance.updateUserMetadata(userId, updateUserMetadataRequest);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->updateUserMetadata: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user whose metadata will be updated and merged | 
 **updateUserMetadataRequest** | [**UpdateUserMetadataRequest**](UpdateUserMetadataRequest.md)|  | [optional] 

### Return type

[**User**](User.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userPasskeyDelete**
> DeletedObject userPasskeyDelete(userId, passkeyIdentificationId)

Delete a user passkey

Delete the passkey identification for a given user and notify them through email.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user that owns the passkey identity
final passkeyIdentificationId = passkeyIdentificationId_example; // String | The ID of the passkey identity to be deleted

try {
    final result = api_instance.userPasskeyDelete(userId, passkeyIdentificationId);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->userPasskeyDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user that owns the passkey identity | 
 **passkeyIdentificationId** | **String**| The ID of the passkey identity to be deleted | 

### Return type

[**DeletedObject**](DeletedObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userWeb3WalletDelete**
> DeletedObject userWeb3WalletDelete(userId, web3WalletIdentificationId)

Delete a user web3 wallet

Delete the web3 wallet identification for a given user.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user that owns the web3 wallet
final web3WalletIdentificationId = web3WalletIdentificationId_example; // String | The ID of the web3 wallet identity to be deleted

try {
    final result = api_instance.userWeb3WalletDelete(userId, web3WalletIdentificationId);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->userWeb3WalletDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user that owns the web3 wallet | 
 **web3WalletIdentificationId** | **String**| The ID of the web3 wallet identity to be deleted | 

### Return type

[**DeletedObject**](DeletedObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersGetOrganizationInvitations**
> OrganizationInvitationsWithPublicOrganizationData usersGetOrganizationInvitations(userId, limit, offset, status)

Retrieve all invitations for a user

Retrieve a paginated list of the user's organization invitations

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user whose organization invitations we want to retrieve
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
final status = status_example; // String | Filter organization invitations based on their status

try {
    final result = api_instance.usersGetOrganizationInvitations(userId, limit, offset, status);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->usersGetOrganizationInvitations: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user whose organization invitations we want to retrieve | 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]
 **status** | **String**| Filter organization invitations based on their status | [optional] 

### Return type

[**OrganizationInvitationsWithPublicOrganizationData**](OrganizationInvitationsWithPublicOrganizationData.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersGetOrganizationMemberships**
> OrganizationMemberships usersGetOrganizationMemberships(userId, limit, offset)

Retrieve all memberships for a user

Retrieve a paginated list of the user's organization memberships

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user whose organization memberships we want to retrieve
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.usersGetOrganizationMemberships(userId, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->usersGetOrganizationMemberships: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user whose organization memberships we want to retrieve | 
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

# **verifyPassword**
> VerifyPassword200Response verifyPassword(userId, verifyPasswordRequest)

Verify the password of a user

Check that the user's password matches the supplied input. Useful for custom auth flows and re-verification.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user for whom to verify the password
final verifyPasswordRequest = VerifyPasswordRequest(); // VerifyPasswordRequest | 

try {
    final result = api_instance.verifyPassword(userId, verifyPasswordRequest);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->verifyPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user for whom to verify the password | 
 **verifyPasswordRequest** | [**VerifyPasswordRequest**](VerifyPasswordRequest.md)|  | [optional] 

### Return type

[**VerifyPassword200Response**](VerifyPassword200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifyTOTP**
> VerifyTOTP200Response verifyTOTP(userId, verifyTOTPRequest)

Verify a TOTP or backup code for a user

Verify that the provided TOTP or backup code is valid for the user. Verifying a backup code will result it in being consumed (i.e. it will become invalid). Useful for custom auth flows and re-verification.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final userId = userId_example; // String | The ID of the user for whom to verify the TOTP
final verifyTOTPRequest = VerifyTOTPRequest(); // VerifyTOTPRequest | 

try {
    final result = api_instance.verifyTOTP(userId, verifyTOTPRequest);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->verifyTOTP: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user for whom to verify the TOTP | 
 **verifyTOTPRequest** | [**VerifyTOTPRequest**](VerifyTOTPRequest.md)|  | [optional] 

### Return type

[**VerifyTOTP200Response**](VerifyTOTP200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

