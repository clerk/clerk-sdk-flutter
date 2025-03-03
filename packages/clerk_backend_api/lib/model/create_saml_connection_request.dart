//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateSAMLConnectionRequest {
  /// Returns a new [CreateSAMLConnectionRequest] instance.
  CreateSAMLConnectionRequest({
    required this.name,
    required this.domain,
    required this.provider,
    this.idpEntityId,
    this.idpSsoUrl,
    this.idpCertificate,
    this.idpMetadataUrl,
    this.idpMetadata,
    this.organizationId,
    this.attributeMapping,
  });

  /// The name to use as a label for this SAML Connection
  String name;

  /// The domain of your organization. Sign in flows using an email with this domain, will use this SAML Connection.
  String domain;

  /// The IdP provider of the connection.
  CreateSAMLConnectionRequestProviderEnum provider;

  /// The Entity ID as provided by the IdP
  String? idpEntityId;

  /// The Single-Sign On URL as provided by the IdP
  String? idpSsoUrl;

  /// The X.509 certificate as provided by the IdP
  String? idpCertificate;

  /// The URL which serves the IdP metadata. If present, it takes priority over the corresponding individual properties
  String? idpMetadataUrl;

  /// The XML content of the IdP metadata file. If present, it takes priority over the corresponding individual properties
  String? idpMetadata;

  /// The ID of the organization to which users of this SAML Connection will be added
  String? organizationId;

  CreateSAMLConnectionRequestAttributeMapping? attributeMapping;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateSAMLConnectionRequest &&
          other.name == name &&
          other.domain == domain &&
          other.provider == provider &&
          other.idpEntityId == idpEntityId &&
          other.idpSsoUrl == idpSsoUrl &&
          other.idpCertificate == idpCertificate &&
          other.idpMetadataUrl == idpMetadataUrl &&
          other.idpMetadata == idpMetadata &&
          other.organizationId == organizationId &&
          other.attributeMapping == attributeMapping;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name.hashCode) +
      (domain.hashCode) +
      (provider.hashCode) +
      (idpEntityId == null ? 0 : idpEntityId!.hashCode) +
      (idpSsoUrl == null ? 0 : idpSsoUrl!.hashCode) +
      (idpCertificate == null ? 0 : idpCertificate!.hashCode) +
      (idpMetadataUrl == null ? 0 : idpMetadataUrl!.hashCode) +
      (idpMetadata == null ? 0 : idpMetadata!.hashCode) +
      (organizationId == null ? 0 : organizationId!.hashCode) +
      (attributeMapping == null ? 0 : attributeMapping!.hashCode);

  @override
  String toString() =>
      'CreateSAMLConnectionRequest[name=$name, domain=$domain, provider=$provider, idpEntityId=$idpEntityId, idpSsoUrl=$idpSsoUrl, idpCertificate=$idpCertificate, idpMetadataUrl=$idpMetadataUrl, idpMetadata=$idpMetadata, organizationId=$organizationId, attributeMapping=$attributeMapping]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'name'] = this.name;
    json[r'domain'] = this.domain;
    json[r'provider'] = this.provider;
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
    return json;
  }

  /// Returns a new [CreateSAMLConnectionRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateSAMLConnectionRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateSAMLConnectionRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateSAMLConnectionRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateSAMLConnectionRequest(
        name: mapValueOfType<String>(json, r'name')!,
        domain: mapValueOfType<String>(json, r'domain')!,
        provider: CreateSAMLConnectionRequestProviderEnum.fromJson(
            json[r'provider'])!,
        idpEntityId: mapValueOfType<String>(json, r'idp_entity_id'),
        idpSsoUrl: mapValueOfType<String>(json, r'idp_sso_url'),
        idpCertificate: mapValueOfType<String>(json, r'idp_certificate'),
        idpMetadataUrl: mapValueOfType<String>(json, r'idp_metadata_url'),
        idpMetadata: mapValueOfType<String>(json, r'idp_metadata'),
        organizationId: mapValueOfType<String>(json, r'organization_id'),
        attributeMapping: CreateSAMLConnectionRequestAttributeMapping.fromJson(
            json[r'attribute_mapping']),
      );
    }
    return null;
  }

  static List<CreateSAMLConnectionRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateSAMLConnectionRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateSAMLConnectionRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateSAMLConnectionRequest> mapFromJson(dynamic json) {
    final map = <String, CreateSAMLConnectionRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateSAMLConnectionRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateSAMLConnectionRequest-objects as value to a dart map
  static Map<String, List<CreateSAMLConnectionRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateSAMLConnectionRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateSAMLConnectionRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'domain',
    'provider',
  };
}

/// The IdP provider of the connection.
class CreateSAMLConnectionRequestProviderEnum {
  /// Instantiate a new enum with the provided [value].
  const CreateSAMLConnectionRequestProviderEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const custom =
      CreateSAMLConnectionRequestProviderEnum._(r'saml_custom');
  static const okta = CreateSAMLConnectionRequestProviderEnum._(r'saml_okta');
  static const google =
      CreateSAMLConnectionRequestProviderEnum._(r'saml_google');
  static const microsoft =
      CreateSAMLConnectionRequestProviderEnum._(r'saml_microsoft');

  /// List of all possible values in this [enum][CreateSAMLConnectionRequestProviderEnum].
  static const values = <CreateSAMLConnectionRequestProviderEnum>[
    custom,
    okta,
    google,
    microsoft,
  ];

  static CreateSAMLConnectionRequestProviderEnum? fromJson(dynamic value) =>
      CreateSAMLConnectionRequestProviderEnumTypeTransformer().decode(value);

  static List<CreateSAMLConnectionRequestProviderEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateSAMLConnectionRequestProviderEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateSAMLConnectionRequestProviderEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateSAMLConnectionRequestProviderEnum] to String,
/// and [decode] dynamic data back to [CreateSAMLConnectionRequestProviderEnum].
class CreateSAMLConnectionRequestProviderEnumTypeTransformer {
  factory CreateSAMLConnectionRequestProviderEnumTypeTransformer() =>
      _instance ??=
          const CreateSAMLConnectionRequestProviderEnumTypeTransformer._();

  const CreateSAMLConnectionRequestProviderEnumTypeTransformer._();

  String encode(CreateSAMLConnectionRequestProviderEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CreateSAMLConnectionRequestProviderEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateSAMLConnectionRequestProviderEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'saml_custom':
          return CreateSAMLConnectionRequestProviderEnum.custom;
        case r'saml_okta':
          return CreateSAMLConnectionRequestProviderEnum.okta;
        case r'saml_google':
          return CreateSAMLConnectionRequestProviderEnum.google;
        case r'saml_microsoft':
          return CreateSAMLConnectionRequestProviderEnum.microsoft;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CreateSAMLConnectionRequestProviderEnumTypeTransformer] instance.
  static CreateSAMLConnectionRequestProviderEnumTypeTransformer? _instance;
}
