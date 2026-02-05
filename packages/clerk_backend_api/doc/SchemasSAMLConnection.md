# openapi.model.SchemasSAMLConnection

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** |  | 
**id** | **String** |  | 
**name** | **String** |  | 
**domain** | **String** |  | [optional] 
**domains** | **List<String>** |  | [optional] [default to const []]
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
**allowSubdomains** | **bool** |  | 
**allowIdpInitiated** | **bool** |  | 
**disableAdditionalIdentifications** | **bool** |  | 
**forceAuthn** | **bool** | Enable or deactivate ForceAuthn | 
**enterpriseConnectionId** | **String** |  | [optional] 
**createdAt** | **int** | Unix timestamp of creation.  | 
**updatedAt** | **int** | Unix timestamp of last update.  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


