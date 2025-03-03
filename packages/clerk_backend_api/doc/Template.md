# clerk_backend_api.model.Template

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**object** | **String** | String representing the object's type. Objects of the same type share the same value.  | [optional] 
**instanceId** | **String** | the id of the instance the template belongs to | [optional] 
**resourceType** | **String** | whether this is a system (default) or user overridden) template | [optional] 
**templateType** | **String** | whether this is an email or SMS template | [optional] 
**name** | **String** | user-friendly name of the template | [optional] 
**slug** | **String** | machine-friendly name of the template | [optional] 
**position** | **int** | position with the listing of templates | [optional] 
**canRevert** | **bool** | whether this template can be reverted to the corresponding system default | [optional] 
**canDelete** | **bool** | whether this template can be deleted | [optional] 
**canToggle** | **bool** | whether this template can be enabled or disabled, true only for notification SMS templates | [optional] 
**subject** | **String** | email subject | [optional] 
**markup** | **String** | the editor markup used to generate the body of the template | [optional] 
**body** | **String** | the template body before variable interpolation | [optional] 
**availableVariables** | **List<String>** | list of variables that are available for use in the template body | [optional] [default to const []]
**requiredVariables** | **List<String>** | list of variables that must be contained in the template body | [optional] [default to const []]
**fromEmailName** | **String** |  | [optional] 
**replyToEmailName** | **String** |  | [optional] 
**deliveredByClerk** | **bool** |  | [optional] 
**enabled** | **bool** |  | [optional] 
**updatedAt** | **int** | Unix timestamp of last update.  | [optional] 
**createdAt** | **int** | Unix timestamp of creation.  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


