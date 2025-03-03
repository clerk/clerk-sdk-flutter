# clerk_backend_api.model.UpdateOrganizationRequest

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**publicMetadata** | [**Map<String, Object>**](Object.md) | Metadata saved on the organization, that is visible to both your frontend and backend. | [optional] [default to const {}]
**privateMetadata** | [**Map<String, Object>**](Object.md) | Metadata saved on the organization that is only visible to your backend. | [optional] [default to const {}]
**name** | **String** | The new name of the organization. May not contain URLs or HTML. Max length: 256 | [optional] 
**slug** | **String** | The new slug of the organization, which needs to be unique in the instance | [optional] 
**maxAllowedMemberships** | **int** | The maximum number of memberships allowed for this organization | [optional] 
**adminDeleteEnabled** | **bool** | If true, an admin can delete this organization with the Frontend API. | [optional] 
**createdAt** | **String** | A custom date/time denoting _when_ the organization was created, specified in RFC3339 format (e.g. `2012-10-20T07:15:20.902Z`). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


