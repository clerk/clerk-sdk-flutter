# clerk_backend_api.api.EmailAddressesApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createEmailAddress**](EmailAddressesApi.md#createemailaddress) | **POST** /email_addresses | Create an email address
[**deleteEmailAddress**](EmailAddressesApi.md#deleteemailaddress) | **DELETE** /email_addresses/{email_address_id} | Delete an email address
[**getEmailAddress**](EmailAddressesApi.md#getemailaddress) | **GET** /email_addresses/{email_address_id} | Retrieve an email address
[**updateEmailAddress**](EmailAddressesApi.md#updateemailaddress) | **PATCH** /email_addresses/{email_address_id} | Update an email address


# **createEmailAddress**
> EmailAddress createEmailAddress(createEmailAddressRequest)

Create an email address

Create a new email address

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = EmailAddressesApi();
final createEmailAddressRequest = CreateEmailAddressRequest(); // CreateEmailAddressRequest | 

try {
    final result = api_instance.createEmailAddress(createEmailAddressRequest);
    print(result);
} catch (e) {
    print('Exception when calling EmailAddressesApi->createEmailAddress: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createEmailAddressRequest** | [**CreateEmailAddressRequest**](CreateEmailAddressRequest.md)|  | [optional] 

### Return type

[**EmailAddress**](EmailAddress.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteEmailAddress**
> DeletedObject deleteEmailAddress(emailAddressId)

Delete an email address

Delete the email address with the given ID

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = EmailAddressesApi();
final emailAddressId = emailAddressId_example; // String | The ID of the email address to delete

try {
    final result = api_instance.deleteEmailAddress(emailAddressId);
    print(result);
} catch (e) {
    print('Exception when calling EmailAddressesApi->deleteEmailAddress: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailAddressId** | **String**| The ID of the email address to delete | 

### Return type

[**DeletedObject**](DeletedObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEmailAddress**
> EmailAddress getEmailAddress(emailAddressId)

Retrieve an email address

Returns the details of an email address.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = EmailAddressesApi();
final emailAddressId = emailAddressId_example; // String | The ID of the email address to retrieve

try {
    final result = api_instance.getEmailAddress(emailAddressId);
    print(result);
} catch (e) {
    print('Exception when calling EmailAddressesApi->getEmailAddress: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailAddressId** | **String**| The ID of the email address to retrieve | 

### Return type

[**EmailAddress**](EmailAddress.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateEmailAddress**
> EmailAddress updateEmailAddress(emailAddressId, updateEmailAddressRequest)

Update an email address

Updates an email address.

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = EmailAddressesApi();
final emailAddressId = emailAddressId_example; // String | The ID of the email address to update
final updateEmailAddressRequest = UpdateEmailAddressRequest(); // UpdateEmailAddressRequest | 

try {
    final result = api_instance.updateEmailAddress(emailAddressId, updateEmailAddressRequest);
    print(result);
} catch (e) {
    print('Exception when calling EmailAddressesApi->updateEmailAddress: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailAddressId** | **String**| The ID of the email address to update | 
 **updateEmailAddressRequest** | [**UpdateEmailAddressRequest**](UpdateEmailAddressRequest.md)|  | [optional] 

### Return type

[**EmailAddress**](EmailAddress.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

