# clerk_backend_api.model.Client

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** | String representing the object's type. Objects of the same type share the same value.  | 
**id** | **String** | String representing the identifier of the session.  | 
**sessionIds** | **List<String>** |  | [default to const []]
**sessions** | [**List<Session>**](Session.md) |  | [default to const []]
**signInId** | **String** |  | 
**signUpId** | **String** |  | 
**lastActiveSessionId** | **String** | Last active session_id.  | 
**updatedAt** | **int** | Unix timestamp of last update.  | 
**createdAt** | **int** | Unix timestamp of creation.  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


