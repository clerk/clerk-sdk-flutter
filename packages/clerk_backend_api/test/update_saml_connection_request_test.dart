//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:clerk_backend_api/api.dart';
import 'package:test/test.dart';

// tests for UpdateSAMLConnectionRequest
void main() {
  // final instance = UpdateSAMLConnectionRequest();

  group('test UpdateSAMLConnectionRequest', () {
    // The name of the new SAML Connection
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // The domain to use for the new SAML Connection
    // String domain
    test('to test the property `domain`', () async {
      // TODO
    });

    // The entity id as provided by the IdP
    // String idpEntityId
    test('to test the property `idpEntityId`', () async {
      // TODO
    });

    // The SSO url as provided by the IdP
    // String idpSsoUrl
    test('to test the property `idpSsoUrl`', () async {
      // TODO
    });

    // The x509 certificated as provided by the IdP
    // String idpCertificate
    test('to test the property `idpCertificate`', () async {
      // TODO
    });

    // The URL which serves the IdP metadata. If present, it takes priority over the corresponding individual properties and replaces them
    // String idpMetadataUrl
    test('to test the property `idpMetadataUrl`', () async {
      // TODO
    });

    // The XML content of the IdP metadata file. If present, it takes priority over the corresponding individual properties
    // String idpMetadata
    test('to test the property `idpMetadata`', () async {
      // TODO
    });

    // The ID of the organization to which users of this SAML Connection will be added
    // String organizationId
    test('to test the property `organizationId`', () async {
      // TODO
    });

    // UpdateSAMLConnectionRequestAttributeMapping attributeMapping
    test('to test the property `attributeMapping`', () async {
      // TODO
    });

    // Activate or de-activate the SAML Connection
    // bool active
    test('to test the property `active`', () async {
      // TODO
    });

    // Controls whether to update the user's attributes in each sign-in
    // bool syncUserAttributes
    test('to test the property `syncUserAttributes`', () async {
      // TODO
    });

    // Allow users with an email address subdomain to use this connection in order to authenticate
    // bool allowSubdomains
    test('to test the property `allowSubdomains`', () async {
      // TODO
    });

    // Enable or deactivate IdP-initiated flows
    // bool allowIdpInitiated
    test('to test the property `allowIdpInitiated`', () async {
      // TODO
    });

    // Enable or deactivate additional identifications
    // bool disableAdditionalIdentifications
    test('to test the property `disableAdditionalIdentifications`', () async {
      // TODO
    });
  });
}
