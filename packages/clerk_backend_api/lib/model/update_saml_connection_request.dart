//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateSAMLConnectionRequest {
  /// Returns a new [UpdateSAMLConnectionRequest] instance.
  UpdateSAMLConnectionRequest({
    this.name,
    this.domain,
    this.idpEntityId,
    this.idpSsoUrl,
    this.idpCertificate,
    this.idpMetadataUrl,
    this.idpMetadata,
    this.organizationId,
    this.attributeMapping,
    this.active,
    this.syncUserAttributes,
    this.allowSubdomains,
    this.allowIdpInitiated,
    this.disableAdditionalIdentifications,
  });

  /// The name of the new SAML Connection
  String? name;

  /// The domain to use for the new SAML Connection
  String? domain;

  /// The entity id as provided by the IdP
  String? idpEntityId;

  /// The SSO url as provided by the IdP
  String? idpSsoUrl;

  /// The x509 certificated as provided by the IdP
  String? idpCertificate;

  /// The URL which serves the IdP metadata. If present, it takes priority over the corresponding individual properties and replaces them
  String? idpMetadataUrl;

  /// The XML content of the IdP metadata file. If present, it takes priority over the corresponding individual properties
  String? idpMetadata;

  /// The ID of the organization to which users of this SAML Connection will be added
  String? organizationId;

  UpdateSAMLConnectionRequestAttributeMapping? attributeMapping;

  /// Activate or de-activate the SAML Connection
  bool? active;

  /// Controls whether to update the user's attributes in each sign-in
  bool? syncUserAttributes;

  /// Allow users with an email address subdomain to use this connection in order to authenticate
  bool? allowSubdomains;

  /// Enable or deactivate IdP-initiated flows
  bool? allowIdpInitiated;

  /// Enable or deactivate additional identifications
  bool? disableAdditionalIdentifications;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateSAMLConnectionRequest &&
          other.name == name &&
          other.domain == domain &&
          other.idpEntityId == idpEntityId &&
          other.idpSsoUrl == idpSsoUrl &&
          other.idpCertificate == idpCertificate &&
          other.idpMetadataUrl == idpMetadataUrl &&
          other.idpMetadata == idpMetadata &&
          other.organizationId == organizationId &&
          other.attributeMapping == attributeMapping &&
          other.active == active &&
          other.syncUserAttributes == syncUserAttributes &&
          other.allowSubdomains == allowSubdomains &&
          other.allowIdpInitiated == allowIdpInitiated &&
          other.disableAdditionalIdentifications ==
              disableAdditionalIdentifications;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name == null ? 0 : name!.hashCode) +
      (domain == null ? 0 : domain!.hashCode) +
      (idpEntityId == null ? 0 : idpEntityId!.hashCode) +
      (idpSsoUrl == null ? 0 : idpSsoUrl!.hashCode) +
      (idpCertificate == null ? 0 : idpCertificate!.hashCode) +
      (idpMetadataUrl == null ? 0 : idpMetadataUrl!.hashCode) +
      (idpMetadata == null ? 0 : idpMetadata!.hashCode) +
      (organizationId == null ? 0 : organizationId!.hashCode) +
      (attributeMapping == null ? 0 : attributeMapping!.hashCode) +
      (active == null ? 0 : active!.hashCode) +
      (syncUserAttributes == null ? 0 : syncUserAttributes!.hashCode) +
      (allowSubdomains == null ? 0 : allowSubdomains!.hashCode) +
      (allowIdpInitiated == null ? 0 : allowIdpInitiated!.hashCode) +
      (disableAdditionalIdentifications == null
          ? 0
          : disableAdditionalIdentifications!.hashCode);

  @override
  String toString() =>
      'UpdateSAMLConnectionRequest[name=$name, domain=$domain, idpEntityId=$idpEntityId, idpSsoUrl=$idpSsoUrl, idpCertificate=$idpCertificate, idpMetadataUrl=$idpMetadataUrl, idpMetadata=$idpMetadata, organizationId=$organizationId, attributeMapping=$attributeMapping, active=$active, syncUserAttributes=$syncUserAttributes, allowSubdomains=$allowSubdomains, allowIdpInitiated=$allowIdpInitiated, disableAdditionalIdentifications=$disableAdditionalIdentifications]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.domain != null) {
      json[r'domain'] = this.domain;
    } else {
      json[r'domain'] = null;
    }
    if (this.idpEntityId != null) {
      json[r'idp_entity_id'] = this.idpEntityId;
    } else {
      json[r'idp_entity_id'] = null;
    }
    if (this.idpSsoUrl != null) {
      json[r'idp_sso_url'] = this.idpSsoUrl;
    } else {
      json[r'idp_sso_url'] = null;
    }
    if (this.idpCertificate != null) {
      json[r'idp_certificate'] = this.idpCertificate;
    } else {
      json[r'idp_certificate'] = null;
    }
    if (this.idpMetadataUrl != null) {
      json[r'idp_metadata_url'] = this.idpMetadataUrl;
    } else {
      json[r'idp_metadata_url'] = null;
    }
    if (this.idpMetadata != null) {
      json[r'idp_metadata'] = this.idpMetadata;
    } else {
      json[r'idp_metadata'] = null;
    }
    if (this.organizationId != null) {
      json[r'organization_id'] = this.organizationId;
    } else {
      json[r'organization_id'] = null;
    }
    if (this.attributeMapping != null) {
      json[r'attribute_mapping'] = this.attributeMapping;
    } else {
      json[r'attribute_mapping'] = null;
    }
    if (this.active != null) {
      json[r'active'] = this.active;
    } else {
      json[r'active'] = null;
    }
    if (this.syncUserAttributes != null) {
      json[r'sync_user_attributes'] = this.syncUserAttributes;
    } else {
      json[r'sync_user_attributes'] = null;
    }
    if (this.allowSubdomains != null) {
      json[r'allow_subdomains'] = this.allowSubdomains;
    } else {
      json[r'allow_subdomains'] = null;
    }
    if (this.allowIdpInitiated != null) {
      json[r'allow_idp_initiated'] = this.allowIdpInitiated;
    } else {
      json[r'allow_idp_initiated'] = null;
    }
    if (this.disableAdditionalIdentifications != null) {
      json[r'disable_additional_identifications'] =
          this.disableAdditionalIdentifications;
    } else {
      json[r'disable_additional_identifications'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateSAMLConnectionRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateSAMLConnectionRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UpdateSAMLConnectionRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UpdateSAMLConnectionRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateSAMLConnectionRequest(
        name: mapValueOfType<String>(json, r'name'),
        domain: mapValueOfType<String>(json, r'domain'),
        idpEntityId: mapValueOfType<String>(json, r'idp_entity_id'),
        idpSsoUrl: mapValueOfType<String>(json, r'idp_sso_url'),
        idpCertificate: mapValueOfType<String>(json, r'idp_certificate'),
        idpMetadataUrl: mapValueOfType<String>(json, r'idp_metadata_url'),
        idpMetadata: mapValueOfType<String>(json, r'idp_metadata'),
        organizationId: mapValueOfType<String>(json, r'organization_id'),
        attributeMapping: UpdateSAMLConnectionRequestAttributeMapping.fromJson(
            json[r'attribute_mapping']),
        active: mapValueOfType<bool>(json, r'active'),
        syncUserAttributes: mapValueOfType<bool>(json, r'sync_user_attributes'),
        allowSubdomains: mapValueOfType<bool>(json, r'allow_subdomains'),
        allowIdpInitiated: mapValueOfType<bool>(json, r'allow_idp_initiated'),
        disableAdditionalIdentifications:
            mapValueOfType<bool>(json, r'disable_additional_identifications'),
      );
    }
    return null;
  }

  static List<UpdateSAMLConnectionRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdateSAMLConnectionRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateSAMLConnectionRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateSAMLConnectionRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateSAMLConnectionRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateSAMLConnectionRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateSAMLConnectionRequest-objects as value to a dart map
  static Map<String, List<UpdateSAMLConnectionRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UpdateSAMLConnectionRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateSAMLConnectionRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
