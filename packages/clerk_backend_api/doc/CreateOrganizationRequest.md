# clerk_backend_api.model.CreateOrganizationRequest

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | The name of the new organization. May not contain URLs or HTML. Max length: 256 | 
**createdBy** | **String** | The ID of the User who will become the administrator for the new organization | [optional] 
**privateMetadata** | [**Map<String, Object>**](Object.md) | Metadata saved on the organization, accessible only from the Backend API | [optional] [default to const {}]
**publicMetadata** | [**Map<String, Object>**](Object.md) | Metadata saved on the organization, read-only from the Frontend API and fully accessible (read/write) from the Backend API | [optional] [default to const {}]
**slug** | **String** | A slug for the new organization. Can contain only lowercase alphanumeric characters and the dash \"-\". Must be unique for the instance. | [optional] 
**maxAllowedMemberships** | **int** | The maximum number of memberships allowed for this organization | [optional] 
**createdAt** | **String** | A custom date/time denoting _when_ the organization was created, specified in RFC3339 format (e.g. `2012-10-20T07:15:20.902Z`). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


