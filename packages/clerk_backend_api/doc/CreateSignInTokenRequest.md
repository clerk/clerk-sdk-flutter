# clerk_backend_api.model.CreateSignInTokenRequest

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**userId** | **String** | The ID of the user that can use the newly created sign in token | 
**expiresInSeconds** | **int** | Optional parameter to specify the life duration of the sign in token in seconds. By default, the duration is 30 days. | [optional] [default to 2592000]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


