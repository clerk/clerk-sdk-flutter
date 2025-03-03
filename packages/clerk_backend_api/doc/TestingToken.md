# clerk_backend_api.model.TestingToken

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** |  | 
**token** | **String** | The actual token. This value is meant to be passed in the `__clerk_testing_token` query parameter with requests to the Frontend API. | 
**expiresAt** | **int** | Unix timestamp of the token's expiration time.  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


