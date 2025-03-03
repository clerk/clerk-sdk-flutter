# clerk_backend_api.model.Session

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** | String representing the object's type. Objects of the same type share the same value.  | 
**id** | **String** |  | 
**userId** | **String** |  | 
**clientId** | **String** |  | 
**actor** | [**Object**](.md) |  | [optional] 
**status** | **String** |  | 
**lastActiveOrganizationId** | **String** |  | [optional] 
**lastActiveAt** | **int** |  | 
**latestActivity** | [**SessionActivityResponse**](SessionActivityResponse.md) |  | [optional] 
**expireAt** | **int** | Unix timestamp of expiration.  | 
**abandonAt** | **int** | Unix timestamp of abandonment.  | 
**updatedAt** | **int** | Unix timestamp of last update.  | 
**createdAt** | **int** | Unix timestamp of creation.  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


