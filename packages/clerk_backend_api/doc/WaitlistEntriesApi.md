# openapi.api.WaitlistEntriesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createBulkWaitlistEntries**](WaitlistEntriesApi.md#createbulkwaitlistentries) | **POST** /waitlist_entries/bulk | Create multiple waitlist entries
[**createWaitlistEntry**](WaitlistEntriesApi.md#createwaitlistentry) | **POST** /waitlist_entries | Create a waitlist entry
[**deleteWaitlistEntry**](WaitlistEntriesApi.md#deletewaitlistentry) | **DELETE** /waitlist_entries/{waitlist_entry_id} | Delete a pending waitlist entry
[**inviteWaitlistEntry**](WaitlistEntriesApi.md#invitewaitlistentry) | **POST** /waitlist_entries/{waitlist_entry_id}/invite | Invite a waitlist entry
[**listWaitlistEntries**](WaitlistEntriesApi.md#listwaitlistentries) | **GET** /waitlist_entries | List all waitlist entries
[**rejectWaitlistEntry**](WaitlistEntriesApi.md#rejectwaitlistentry) | **POST** /waitlist_entries/{waitlist_entry_id}/reject | Reject a waitlist entry


# **createBulkWaitlistEntries**
> List<WaitlistEntry> createBulkWaitlistEntries(createBulkWaitlistEntriesRequestInner)

Create multiple waitlist entries

Creates multiple waitlist entries for the provided email addresses. You can choose whether to send confirmation emails by setting the `notify` parameter to `true` or `false` for each entry. If the `notify` parameter is omitted, it defaults to `true`.  If an email address is already on the waitlist, no new entry will be created and the existing waitlist entry will be returned. Duplicate email addresses within the same request are not allowed.  This endpoint is limited to a maximum of 50 entries per API call. If you need to add more entries, please make multiple requests.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = WaitlistEntriesApi();
final createBulkWaitlistEntriesRequestInner = [List<CreateBulkWaitlistEntriesRequestInner>()]; // List<CreateBulkWaitlistEntriesRequestInner> | Required parameters

try {
    final result = api_instance.createBulkWaitlistEntries(createBulkWaitlistEntriesRequestInner);
    print(result);
} catch (e) {
    print('Exception when calling WaitlistEntriesApi->createBulkWaitlistEntries: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createBulkWaitlistEntriesRequestInner** | [**List<CreateBulkWaitlistEntriesRequestInner>**](CreateBulkWaitlistEntriesRequestInner.md)| Required parameters | [optional] 

### Return type

[**List<WaitlistEntry>**](WaitlistEntry.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createWaitlistEntry**
> WaitlistEntry createWaitlistEntry(createWaitlistEntryRequest)

Create a waitlist entry

Creates a new waitlist entry for the given email address. If the email address is already on the waitlist, no new entry will be created and the existing waitlist entry will be returned.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = WaitlistEntriesApi();
final createWaitlistEntryRequest = CreateWaitlistEntryRequest(); // CreateWaitlistEntryRequest | 

try {
    final result = api_instance.createWaitlistEntry(createWaitlistEntryRequest);
    print(result);
} catch (e) {
    print('Exception when calling WaitlistEntriesApi->createWaitlistEntry: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createWaitlistEntryRequest** | [**CreateWaitlistEntryRequest**](CreateWaitlistEntryRequest.md)|  | [optional] 

### Return type

[**WaitlistEntry**](WaitlistEntry.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteWaitlistEntry**
> DeletedObject deleteWaitlistEntry(waitlistEntryId)

Delete a pending waitlist entry

Delete a pending waitlist entry.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = WaitlistEntriesApi();
final waitlistEntryId = waitlistEntryId_example; // String | The ID of the waitlist entry to delete

try {
    final result = api_instance.deleteWaitlistEntry(waitlistEntryId);
    print(result);
} catch (e) {
    print('Exception when calling WaitlistEntriesApi->deleteWaitlistEntry: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **waitlistEntryId** | **String**| The ID of the waitlist entry to delete | 

### Return type

[**DeletedObject**](DeletedObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inviteWaitlistEntry**
> WaitlistEntry inviteWaitlistEntry(waitlistEntryId, inviteWaitlistEntryRequest)

Invite a waitlist entry

Send an invite to the email address in a waitlist entry.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = WaitlistEntriesApi();
final waitlistEntryId = waitlistEntryId_example; // String | The ID of the waitlist entry to invite
final inviteWaitlistEntryRequest = InviteWaitlistEntryRequest(); // InviteWaitlistEntryRequest | 

try {
    final result = api_instance.inviteWaitlistEntry(waitlistEntryId, inviteWaitlistEntryRequest);
    print(result);
} catch (e) {
    print('Exception when calling WaitlistEntriesApi->inviteWaitlistEntry: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **waitlistEntryId** | **String**| The ID of the waitlist entry to invite | 
 **inviteWaitlistEntryRequest** | [**InviteWaitlistEntryRequest**](InviteWaitlistEntryRequest.md)|  | [optional] 

### Return type

[**WaitlistEntry**](WaitlistEntry.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listWaitlistEntries**
> ListWaitlistEntries200Response listWaitlistEntries(limit, offset, query, status, orderBy)

List all waitlist entries

Retrieve a list of waitlist entries for the instance. Entries are ordered by creation date in descending order by default. Supports filtering by email address or status and pagination with limit and offset parameters.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = WaitlistEntriesApi();
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
final query = query_example; // String | Filter waitlist entries by `email_address` or `id`
final status = status_example; // String | Filter waitlist entries by their status
final orderBy = orderBy_example; // String | Specify the order of results. Supported values are: - `created_at` - `email_address` - `invited_at`  Use `+` for ascending or `-` for descending order. Defaults to `-created_at`.

try {
    final result = api_instance.listWaitlistEntries(limit, offset, query, status, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling WaitlistEntriesApi->listWaitlistEntries: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]
 **query** | **String**| Filter waitlist entries by `email_address` or `id` | [optional] 
 **status** | **String**| Filter waitlist entries by their status | [optional] 
 **orderBy** | **String**| Specify the order of results. Supported values are: - `created_at` - `email_address` - `invited_at`  Use `+` for ascending or `-` for descending order. Defaults to `-created_at`. | [optional] [default to '-created_at']

### Return type

[**ListWaitlistEntries200Response**](ListWaitlistEntries200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **rejectWaitlistEntry**
> WaitlistEntry rejectWaitlistEntry(waitlistEntryId)

Reject a waitlist entry

Reject a waitlist entry.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = WaitlistEntriesApi();
final waitlistEntryId = waitlistEntryId_example; // String | The ID of the waitlist entry to reject

try {
    final result = api_instance.rejectWaitlistEntry(waitlistEntryId);
    print(result);
} catch (e) {
    print('Exception when calling WaitlistEntriesApi->rejectWaitlistEntry: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **waitlistEntryId** | **String**| The ID of the waitlist entry to reject | 

### Return type

[**WaitlistEntry**](WaitlistEntry.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

