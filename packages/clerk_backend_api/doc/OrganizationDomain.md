# clerk_backend_api.model.OrganizationDomain

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** | String representing the object's type. Objects of the same type share the same value. Always `organization_domain`  | 
**id** | **String** | Unique identifier for the organization domain | 
**organizationId** | **String** | Unique identifier for the organization | 
**name** | **String** | Name of the organization domain | 
**enrollmentMode** | **String** | Mode of enrollment for the domain | 
**affiliationEmailAddress** | **String** | Affiliation email address for the domain, if available. | 
**verification** | [**OrganizationDomainVerification**](OrganizationDomainVerification.md) |  | 
**totalPendingInvitations** | **int** | Total number of pending invitations associated with this domain | 
**totalPendingSuggestions** | **int** | Total number of pending suggestions associated with this domain | 
**createdAt** | **int** | Unix timestamp when the domain was created | 
**updatedAt** | **int** | Unix timestamp of the last update to the domain | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


