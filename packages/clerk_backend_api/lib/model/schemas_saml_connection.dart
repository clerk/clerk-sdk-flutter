//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SchemasSAMLConnection {
  /// Returns a new [SchemasSAMLConnection] instance.
  SchemasSAMLConnection({
    required this.object,
    required this.id,
    required this.name,
    required this.domain,
    required this.idpEntityId,
    required this.idpSsoUrl,
    required this.idpCertificate,
    this.idpMetadataUrl,
    this.idpMetadata,
    required this.acsUrl,
    required this.spEntityId,
    required this.spMetadataUrl,
    this.organizationId,
    this.attributeMapping,
    required this.active,
    required this.provider,
    required this.userCount,
    required this.syncUserAttributes,
    this.allowSubdomains,
    this.allowIdpInitiated,
    this.disableAdditionalIdentifications,
    required this.createdAt,
    required this.updatedAt,
  });

  SchemasSAMLConnectionObjectEnum object;

  String id;

  String name;

  String domain;

  String? idpEntityId;

  String? idpSsoUrl;

  String? idpCertificate;

  String? idpMetadataUrl;

  String? idpMetadata;

  String acsUrl;

  String spEntityId;

  String spMetadataUrl;

  String? organizationId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  SAMLConnectionAttributeMapping? attributeMapping;

  bool active;

  String provider;

  int userCount;

  bool syncUserAttributes;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? allowSubdomains;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? allowIdpInitiated;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? disableAdditionalIdentifications;

  /// Unix timestamp of creation.
  int createdAt;

  /// Unix timestamp of last update.
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SchemasSAMLConnection &&
          other.object == object &&
          other.id == id &&
          other.name == name &&
          other.domain == domain &&
          other.idpEntityId == idpEntityId &&
          other.idpSsoUrl == idpSsoUrl &&
          other.idpCertificate == idpCertificate &&
          other.idpMetadataUrl == idpMetadataUrl &&
          other.idpMetadata == idpMetadata &&
          other.acsUrl == acsUrl &&
          other.spEntityId == spEntityId &&
          other.spMetadataUrl == spMetadataUrl &&
          other.organizationId == organizationId &&
          other.attributeMapping == attributeMapping &&
          other.active == active &&
          other.provider == provider &&
          other.userCount == userCount &&
          other.syncUserAttributes == syncUserAttributes &&
          other.allowSubdomains == allowSubdomains &&
          other.allowIdpInitiated == allowIdpInitiated &&
          other.disableAdditionalIdentifications ==
              disableAdditionalIdentifications &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (name.hashCode) +
      (domain.hashCode) +
      (idpEntityId == null ? 0 : idpEntityId!.hashCode) +
      (idpSsoUrl == null ? 0 : idpSsoUrl!.hashCode) +
      (idpCertificate == null ? 0 : idpCertificate!.hashCode) +
      (idpMetadataUrl == null ? 0 : idpMetadataUrl!.hashCode) +
      (idpMetadata == null ? 0 : idpMetadata!.hashCode) +
      (acsUrl.hashCode) +
      (spEntityId.hashCode) +
      (spMetadataUrl.hashCode) +
      (organizationId == null ? 0 : organizationId!.hashCode) +
      (attributeMapping == null ? 0 : attributeMapping!.hashCode) +
      (active.hashCode) +
      (provider.hashCode) +
      (userCount.hashCode) +
      (syncUserAttributes.hashCode) +
      (allowSubdomains == null ? 0 : allowSubdomains!.hashCode) +
      (allowIdpInitiated == null ? 0 : allowIdpInitiated!.hashCode) +
      (disableAdditionalIdentifications == null
          ? 0
          : disableAdditionalIdentifications!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'SchemasSAMLConnection[object=$object, id=$id, name=$name, domain=$domain, idpEntityId=$idpEntityId, idpSsoUrl=$idpSsoUrl, idpCertificate=$idpCertificate, idpMetadataUrl=$idpMetadataUrl, idpMetadata=$idpMetadata, acsUrl=$acsUrl, spEntityId=$spEntityId, spMetadataUrl=$spMetadataUrl, organizationId=$organizationId, attributeMapping=$attributeMapping, active=$active, provider=$provider, userCount=$userCount, syncUserAttributes=$syncUserAttributes, allowSubdomains=$allowSubdomains, allowIdpInitiated=$allowIdpInitiated, disableAdditionalIdentifications=$disableAdditionalIdentifications, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    json[r'domain'] = this.domain;
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
    json[r'acs_url'] = this.acsUrl;
    json[r'sp_entity_id'] = this.spEntityId;
    json[r'sp_metadata_url'] = this.spMetadataUrl;
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
    json[r'active'] = this.active;
    json[r'provider'] = this.provider;
    json[r'user_count'] = this.userCount;
    json[r'sync_user_attributes'] = this.syncUserAttributes;
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
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [SchemasSAMLConnection] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SchemasSAMLConnection? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SchemasSAMLConnection[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SchemasSAMLConnection[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SchemasSAMLConnection(
        object: SchemasSAMLConnectionObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        domain: mapValueOfType<String>(json, r'domain')!,
        idpEntityId: mapValueOfType<String>(json, r'idp_entity_id'),
        idpSsoUrl: mapValueOfType<String>(json, r'idp_sso_url'),
        idpCertificate: mapValueOfType<String>(json, r'idp_certificate'),
        idpMetadataUrl: mapValueOfType<String>(json, r'idp_metadata_url'),
        idpMetadata: mapValueOfType<String>(json, r'idp_metadata'),
        acsUrl: mapValueOfType<String>(json, r'acs_url')!,
        spEntityId: mapValueOfType<String>(json, r'sp_entity_id')!,
        spMetadataUrl: mapValueOfType<String>(json, r'sp_metadata_url')!,
        organizationId: mapValueOfType<String>(json, r'organization_id'),
        attributeMapping:
            SAMLConnectionAttributeMapping.fromJson(json[r'attribute_mapping']),
        active: mapValueOfType<bool>(json, r'active')!,
        provider: mapValueOfType<String>(json, r'provider')!,
        userCount: mapValueOfType<int>(json, r'user_count')!,
        syncUserAttributes:
            mapValueOfType<bool>(json, r'sync_user_attributes')!,
        allowSubdomains: mapValueOfType<bool>(json, r'allow_subdomains'),
        allowIdpInitiated: mapValueOfType<bool>(json, r'allow_idp_initiated'),
        disableAdditionalIdentifications:
            mapValueOfType<bool>(json, r'disable_additional_identifications'),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<SchemasSAMLConnection> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SchemasSAMLConnection>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SchemasSAMLConnection.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SchemasSAMLConnection> mapFromJson(dynamic json) {
    final map = <String, SchemasSAMLConnection>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SchemasSAMLConnection.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SchemasSAMLConnection-objects as value to a dart map
  static Map<String, List<SchemasSAMLConnection>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SchemasSAMLConnection>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SchemasSAMLConnection.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'object',
    'id',
    'name',
    'domain',
    'idp_entity_id',
    'idp_sso_url',
    'idp_certificate',
    'acs_url',
    'sp_entity_id',
    'sp_metadata_url',
    'active',
    'provider',
    'user_count',
    'sync_user_attributes',
    'created_at',
    'updated_at',
  };
}

class SchemasSAMLConnectionObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const SchemasSAMLConnectionObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const samlConnection =
      SchemasSAMLConnectionObjectEnum._(r'saml_connection');

  /// List of all possible values in this [enum][SchemasSAMLConnectionObjectEnum].
  static const values = <SchemasSAMLConnectionObjectEnum>[
    samlConnection,
  ];

  static SchemasSAMLConnectionObjectEnum? fromJson(dynamic value) =>
      SchemasSAMLConnectionObjectEnumTypeTransformer().decode(value);

  static List<SchemasSAMLConnectionObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SchemasSAMLConnectionObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SchemasSAMLConnectionObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SchemasSAMLConnectionObjectEnum] to String,
/// and [decode] dynamic data back to [SchemasSAMLConnectionObjectEnum].
class SchemasSAMLConnectionObjectEnumTypeTransformer {
  factory SchemasSAMLConnectionObjectEnumTypeTransformer() =>
      _instance ??= const SchemasSAMLConnectionObjectEnumTypeTransformer._();

  const SchemasSAMLConnectionObjectEnumTypeTransformer._();

  String encode(SchemasSAMLConnectionObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SchemasSAMLConnectionObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SchemasSAMLConnectionObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'saml_connection':
          return SchemasSAMLConnectionObjectEnum.samlConnection;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SchemasSAMLConnectionObjectEnumTypeTransformer] instance.
  static SchemasSAMLConnectionObjectEnumTypeTransformer? _instance;
}
