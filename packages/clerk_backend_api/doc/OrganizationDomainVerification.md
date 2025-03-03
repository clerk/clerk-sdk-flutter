# clerk_backend_api.model.OrganizationDomainVerification

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**status** | **String** | Status of the verification. It can be `unverified` or `verified` | 
**strategy** | **String** | Name of the strategy used to verify the domain | 
**attempts** | **int** | How many attempts have been made to verify the domain | 
**expireAt** | **int** | Unix timestamp of when the verification will expire | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


