# clerk_backend_api.model.CreatePhoneNumberRequest

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**userId** | **String** | The ID representing the user | 
**phoneNumber** | **String** | The new phone number. Must adhere to the E.164 standard for phone number format. | 
**verified** | **bool** | When created, the phone number will be marked as verified. | [optional] 
**primary** | **bool** | Create this phone number as the primary phone number for the user. Default: false, unless it is the first phone number. | [optional] 
**reservedForSecondFactor** | **bool** | Create this phone number as reserved for multi-factor authentication. The phone number must also be verified. If there are no other reserved second factors, the phone number will be set as the default second factor. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


