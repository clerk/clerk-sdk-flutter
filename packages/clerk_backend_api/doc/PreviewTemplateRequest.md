# clerk_backend_api.model.PreviewTemplateRequest

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**subject** | **String** | The email subject. Applicable only to email templates. | [optional] 
**body** | **String** | The template body before variable interpolation | [optional] 
**fromEmailName** | **String** | The local part of the From email address that will be used for emails. For example, in the address 'hello@example.com', the local part is 'hello'. Applicable only to email templates. | [optional] 
**replyToEmailName** | **String** | The local part of the Reply To email address that will be used for emails. For example, in the address 'hello@example.com', the local part is 'hello'. Applicable only to email templates. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


