# clerk_backend_api.model.UpdateOrganizationMembershipMetadataRequest

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**publicMetadata** | [**Map<String, Object>**](Object.md) | Metadata saved on the organization membership, that is visible to both your frontend and backend. The new object will be merged with the existing value. | [optional] [default to const {}]
**privateMetadata** | [**Map<String, Object>**](Object.md) | Metadata saved on the organization membership that is only visible to your backend. The new object will be merged with the existing value. | [optional] [default to const {}]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


