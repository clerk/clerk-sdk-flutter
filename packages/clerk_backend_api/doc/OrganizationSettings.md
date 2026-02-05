# openapi.model.OrganizationSettings

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** | String representing the object's type. Objects of the same type share the same value. | 
**enabled** | **bool** |  | 
**maxAllowedMemberships** | **int** |  | 
**maxAllowedRoles** | **int** |  | 
**maxRoleSetsAllowed** | **int** |  | [optional] 
**maxAllowedPermissions** | **int** | max_allowed_permissions is now a no-op, as permissions are now unlimited | [optional] 
**creatorRole** | **String** | The role key that a user will be assigned after creating an organization. | 
**adminDeleteEnabled** | **bool** | The default for whether an admin can delete an organization with the Frontend API. | 
**domainsEnabled** | **bool** |  | 
**slugDisabled** | **bool** |  | [optional] 
**domainsEnrollmentModes** | **List<String>** |  | [default to const []]
**domainsDefaultRole** | **String** | The role key that it will be used in order to create an organization invitation or suggestion. | 
**initialRoleSetKey** | **String** | The role set key that it will be used to create new organizations. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


