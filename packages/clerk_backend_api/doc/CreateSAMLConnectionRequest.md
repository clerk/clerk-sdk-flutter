# clerk_backend_api.model.CreateSAMLConnectionRequest

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | The name to use as a label for this SAML Connection | 
**domain** | **String** | The domain of your organization. Sign in flows using an email with this domain, will use this SAML Connection. | 
**provider** | **String** | The IdP provider of the connection. | 
**idpEntityId** | **String** | The Entity ID as provided by the IdP | [optional] 
**idpSsoUrl** | **String** | The Single-Sign On URL as provided by the IdP | [optional] 
**idpCertificate** | **String** | The X.509 certificate as provided by the IdP | [optional] 
**idpMetadataUrl** | **String** | The URL which serves the IdP metadata. If present, it takes priority over the corresponding individual properties | [optional] 
**idpMetadata** | **String** | The XML content of the IdP metadata file. If present, it takes priority over the corresponding individual properties | [optional] 
**organizationId** | **String** | The ID of the organization to which users of this SAML Connection will be added | [optional] 
**attributeMapping** | [**CreateSAMLConnectionRequestAttributeMapping**](CreateSAMLConnectionRequestAttributeMapping.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


