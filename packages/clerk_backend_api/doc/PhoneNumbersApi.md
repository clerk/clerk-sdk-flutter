# clerk_backend_api.api.PhoneNumbersApi

## Load the API package
```dart
import 'package:clerk_backend_api/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createPhoneNumber**](PhoneNumbersApi.md#createphonenumber) | **POST** /phone_numbers | Create a phone number
[**deletePhoneNumber**](PhoneNumbersApi.md#deletephonenumber) | **DELETE** /phone_numbers/{phone_number_id} | Delete a phone number
[**getPhoneNumber**](PhoneNumbersApi.md#getphonenumber) | **GET** /phone_numbers/{phone_number_id} | Retrieve a phone number
[**updatePhoneNumber**](PhoneNumbersApi.md#updatephonenumber) | **PATCH** /phone_numbers/{phone_number_id} | Update a phone number


# **createPhoneNumber**
> PhoneNumber createPhoneNumber(createPhoneNumberRequest)

Create a phone number

Create a new phone number

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PhoneNumbersApi();
final createPhoneNumberRequest = CreatePhoneNumberRequest(); // CreatePhoneNumberRequest | 

try {
    final result = api_instance.createPhoneNumber(createPhoneNumberRequest);
    print(result);
} catch (e) {
    print('Exception when calling PhoneNumbersApi->createPhoneNumber: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createPhoneNumberRequest** | [**CreatePhoneNumberRequest**](CreatePhoneNumberRequest.md)|  | [optional] 

### Return type

[**PhoneNumber**](PhoneNumber.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deletePhoneNumber**
> DeletedObject deletePhoneNumber(phoneNumberId)

Delete a phone number

Delete the phone number with the given ID

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PhoneNumbersApi();
final phoneNumberId = phoneNumberId_example; // String | The ID of the phone number to delete

try {
    final result = api_instance.deletePhoneNumber(phoneNumberId);
    print(result);
} catch (e) {
    print('Exception when calling PhoneNumbersApi->deletePhoneNumber: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **phoneNumberId** | **String**| The ID of the phone number to delete | 

### Return type

[**DeletedObject**](DeletedObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPhoneNumber**
> PhoneNumber getPhoneNumber(phoneNumberId)

Retrieve a phone number

Returns the details of a phone number

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PhoneNumbersApi();
final phoneNumberId = phoneNumberId_example; // String | The ID of the phone number to retrieve

try {
    final result = api_instance.getPhoneNumber(phoneNumberId);
    print(result);
} catch (e) {
    print('Exception when calling PhoneNumbersApi->getPhoneNumber: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **phoneNumberId** | **String**| The ID of the phone number to retrieve | 

### Return type

[**PhoneNumber**](PhoneNumber.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePhoneNumber**
> PhoneNumber updatePhoneNumber(phoneNumberId, updatePhoneNumberRequest)

Update a phone number

Updates a phone number

### Example
```dart
import 'package:clerk_backend_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PhoneNumbersApi();
final phoneNumberId = phoneNumberId_example; // String | The ID of the phone number to update
final updatePhoneNumberRequest = UpdatePhoneNumberRequest(); // UpdatePhoneNumberRequest | 

try {
    final result = api_instance.updatePhoneNumber(phoneNumberId, updatePhoneNumberRequest);
    print(result);
} catch (e) {
    print('Exception when calling PhoneNumbersApi->updatePhoneNumber: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **phoneNumberId** | **String**| The ID of the phone number to update | 
 **updatePhoneNumberRequest** | [**UpdatePhoneNumberRequest**](UpdatePhoneNumberRequest.md)|  | [optional] 

### Return type

[**PhoneNumber**](PhoneNumber.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

