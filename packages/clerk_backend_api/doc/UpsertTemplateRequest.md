# clerk_backend_api.model.UpsertTemplateRequest

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | The user-friendly name of the template | [optional] 
**subject** | **String** | The email subject. Applicable only to email templates. | [optional] 
**markup** | **String** | The editor markup used to generate the body of the template | [optional] 
**body** | **String** | The template body before variable interpolation | [optional] 
**deliveredByClerk** | **bool** | Whether Clerk should deliver emails or SMS messages based on the current template | [optional] 
**fromEmailName** | **String** | The local part of the From email address that will be used for emails. For example, in the address 'hello@example.com', the local part is 'hello'. Applicable only to email templates. | [optional] 
**replyToEmailName** | **String** | The local part of the Reply To email address that will be used for emails. For example, in the address 'hello@example.com', the local part is 'hello'. Applicable only to email templates. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


