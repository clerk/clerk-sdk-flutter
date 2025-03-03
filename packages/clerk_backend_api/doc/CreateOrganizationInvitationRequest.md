# clerk_backend_api.model.CreateOrganizationInvitationRequest

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**emailAddress** | **String** | The email address of the new member that is going to be invited to the organization | 
**inviterUserId** | **String** | The ID of the user that invites the new member to the organization. Must be an administrator in the organization. | [optional] 
**role** | **String** | The role of the new member in the organization | 
**publicMetadata** | [**Map<String, Object>**](Object.md) | Metadata saved on the organization invitation, read-only from the Frontend API and fully accessible (read/write) from the Backend API. When the organization invitation is accepted, the metadata will be transferred to the newly created organization membership. | [optional] [default to const {}]
**privateMetadata** | [**Map<String, Object>**](Object.md) | Metadata saved on the organization invitation, fully accessible (read/write) from the Backend API but not visible from the Frontend API. When the organization invitation is accepted, the metadata will be transferred to the newly created organization membership. | [optional] [default to const {}]
**redirectUrl** | **String** | Optional URL that the invitee will be redirected to once they accept the invitation by clicking the join link in the invitation email. | [optional] 
**expiresInDays** | **int** | The number of days the invitation will be valid for. By default, the invitation has a 30 days expire. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


