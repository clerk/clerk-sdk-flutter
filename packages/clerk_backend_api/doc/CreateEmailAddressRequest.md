# clerk_backend_api.model.CreateEmailAddressRequest

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**userId** | **String** | The ID representing the user | 
**emailAddress** | **String** | The new email address. Must adhere to the RFC 5322 specification for email address format. | 
**verified** | **bool** | When created, the email address will be marked as verified. | [optional] 
**primary** | **bool** | Create this email address as the primary email address for the user. Default: false, unless it is the first email address. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


