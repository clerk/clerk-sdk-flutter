# openapi.model.UpdateSAMLConnectionRequest

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | The name of the new SAML Connection | [optional] 
**domain** | **String** | The domain to use for the new SAML Connection | [optional] 
**domains** | **List<String>** | A list of the domains on use for the SAML connection | [optional] [default to const []]
**idpEntityId** | **String** | The Entity ID as provided by the IdP | [optional] 
**idpSsoUrl** | **String** | The SSO URL as provided by the IdP | [optional] 
**idpCertificate** | **String** | The x509 certificated as provided by the IdP | [optional] 
**idpMetadataUrl** | **String** | The URL which serves the IdP metadata. If present, it takes priority over the corresponding individual properties and replaces them | [optional] 
**idpMetadata** | **String** | The XML content of the IdP metadata file. If present, it takes priority over the corresponding individual properties | [optional] 
**organizationId** | **String** | The ID of the organization to which users of this SAML Connection will be added | [optional] 
**attributeMapping** | [**CreateSAMLConnectionRequestAttributeMapping**](CreateSAMLConnectionRequestAttributeMapping.md) |  | [optional] 
**active** | **bool** | Activate or de-activate the SAML Connection | [optional] 
**syncUserAttributes** | **bool** | Controls whether to update the user's attributes in each sign-in | [optional] 
**allowSubdomains** | **bool** | Allow users with an email address subdomain to use this connection in order to authenticate | [optional] 
**allowIdpInitiated** | **bool** | Enable or deactivate IdP-initiated flows | [optional] 
**disableAdditionalIdentifications** | **bool** | Enable or deactivate additional identifications | [optional] 
**forceAuthn** | **bool** | Enable or deactivate ForceAuthn | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


