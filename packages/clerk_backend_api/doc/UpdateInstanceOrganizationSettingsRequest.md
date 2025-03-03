# clerk_backend_api.model.UpdateInstanceOrganizationSettingsRequest

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**enabled** | **bool** |  | [optional] 
**maxAllowedMemberships** | **int** |  | [optional] 
**adminDeleteEnabled** | **bool** |  | [optional] 
**domainsEnabled** | **bool** |  | [optional] 
**domainsEnrollmentModes** | **List<String>** | Specify which enrollment modes to enable for your Organization Domains. Supported modes are 'automatic_invitation' & 'automatic_suggestion'. | [optional] [default to const []]
**creatorRoleId** | **String** | Specify what the default organization role is for an organization creator. | [optional] 
**domainsDefaultRoleId** | **String** | Specify what the default organization role is for the organization domains. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


