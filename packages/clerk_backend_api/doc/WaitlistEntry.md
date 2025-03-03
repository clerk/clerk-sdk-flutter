# clerk_backend_api.model.WaitlistEntry

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** |  | 
**id** | **String** |  | 
**emailAddress** | **String** |  | 
**status** | **String** |  | 
**isLocked** | **bool** | Indicates if the waitlist entry is locked. Locked entries are being processed in a batch action and are unavailable for other actions.  | [optional] 
**createdAt** | **int** | Unix timestamp of creation.  | 
**updatedAt** | **int** | Unix timestamp of last update.  | 
**invitation** | [**WaitlistEntryInvitation**](WaitlistEntryInvitation.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


