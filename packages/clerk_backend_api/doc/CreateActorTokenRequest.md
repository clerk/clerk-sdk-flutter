# clerk_backend_api.model.CreateActorTokenRequest

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**userId** | **String** | The ID of the user being impersonated. | 
**actor** | [**CreateActorTokenRequestActor**](CreateActorTokenRequestActor.md) |  | 
**expiresInSeconds** | **int** | Optional parameter to specify the life duration of the actor token in seconds. By default, the duration is 1 hour. | [optional] [default to 3600]
**sessionMaxDurationInSeconds** | **int** | The maximum duration that the session which will be created by the generated actor token should last. By default, the duration of a session created via an actor token, lasts 30 minutes. | [optional] [default to 1800]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


