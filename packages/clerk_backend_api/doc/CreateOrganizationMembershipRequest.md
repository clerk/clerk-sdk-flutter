# openapi.model.CreateOrganizationMembershipRequest

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**userId** | **String** | The ID of the user that will be added as a member in the organization. The user needs to exist in the same instance as the organization and must not be a member of the given organization already. | 
**role** | **String** | The role that the new member will have in the organization. | 
**publicMetadata** | [**Map<String, Object>**](Object.md) | Metadata saved on the organization membership, that is visible to both your frontend and backend. | [optional] [default to const {}]
**privateMetadata** | [**Map<String, Object>**](Object.md) | Metadata saved on the organization membership that is only visible to your backend. | [optional] [default to const {}]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


