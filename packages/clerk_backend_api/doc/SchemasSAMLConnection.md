# clerk_backend_api.model.SchemasSAMLConnection

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** |  | 
**id** | **String** |  | 
**name** | **String** |  | 
**domain** | **String** |  | 
**idpEntityId** | **String** |  | 
**idpSsoUrl** | **String** |  | 
**idpCertificate** | **String** |  | 
**idpMetadataUrl** | **String** |  | [optional] 
**idpMetadata** | **String** |  | [optional] 
**acsUrl** | **String** |  | 
**spEntityId** | **String** |  | 
**spMetadataUrl** | **String** |  | 
**organizationId** | **String** |  | [optional] 
**attributeMapping** | [**SAMLConnectionAttributeMapping**](SAMLConnectionAttributeMapping.md) |  | [optional] 
**active** | **bool** |  | 
**provider** | **String** |  | 
**userCount** | **int** |  | 
**syncUserAttributes** | **bool** |  | 
**allowSubdomains** | **bool** |  | [optional] 
**allowIdpInitiated** | **bool** |  | [optional] 
**disableAdditionalIdentifications** | **bool** |  | [optional] 
**createdAt** | **int** | Unix timestamp of creation.  | 
**updatedAt** | **int** | Unix timestamp of last update.  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


