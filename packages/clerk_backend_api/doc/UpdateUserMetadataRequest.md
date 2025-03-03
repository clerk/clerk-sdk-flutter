# clerk_backend_api.model.UpdateUserMetadataRequest

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**publicMetadata** | [**Map<String, Object>**](Object.md) | Metadata saved on the user, that is visible to both your frontend and backend. The new object will be merged with the existing value. | [optional] [default to const {}]
**privateMetadata** | [**Map<String, Object>**](Object.md) | Metadata saved on the user that is only visible to your backend. The new object will be merged with the existing value. | [optional] [default to const {}]
**unsafeMetadata** | [**Map<String, Object>**](Object.md) | Metadata saved on the user, that can be updated from both the Frontend and Backend APIs. The new object will be merged with the existing value.  Note: Since this data can be modified from the frontend, it is not guaranteed to be safe. | [optional] [default to const {}]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


