//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EnterpriseAccountEnterpriseConnection {
  /// Returns a new [EnterpriseAccountEnterpriseConnection] instance.
  EnterpriseAccountEnterpriseConnection({
    required this.id,
    required this.protocol,
    required this.provider,
    required this.name,
    required this.logoPublicUrl,
    this.domain,
    this.domains = const [],
    required this.active,
    required this.syncUserAttributes,
    required this.allowSubdomains,
    required this.allowIdpInitiated,
    required this.disableAdditionalIdentifications,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;

  String protocol;

  String provider;

  String name;

  String? logoPublicUrl;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? domain;

  List<String> domains;

  bool active;

  bool syncUserAttributes;

  bool allowSubdomains;

  bool allowIdpInitiated;

  bool disableAdditionalIdentifications;

  /// Unix timestamp of creation.
  int createdAt;

  /// Unix timestamp of last update.
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnterpriseAccountEnterpriseConnection &&
          other.id == id &&
          other.protocol == protocol &&
          other.provider == provider &&
          other.name == name &&
          other.logoPublicUrl == logoPublicUrl &&
          other.domain == domain &&
          _deepEquality.equals(other.domains, domains) &&
          other.active == active &&
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
      (id.hashCode) +
      (protocol.hashCode) +
      (provider.hashCode) +
      (name.hashCode) +
      (logoPublicUrl == null ? 0 : logoPublicUrl!.hashCode) +
      (domain == null ? 0 : domain!.hashCode) +
      (domains.hashCode) +
      (active.hashCode) +
      (syncUserAttributes.hashCode) +
      (allowSubdomains.hashCode) +
      (allowIdpInitiated.hashCode) +
      (disableAdditionalIdentifications.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'EnterpriseAccountEnterpriseConnection[id=$id, protocol=$protocol, provider=$provider, name=$name, logoPublicUrl=$logoPublicUrl, domain=$domain, domains=$domains, active=$active, syncUserAttributes=$syncUserAttributes, allowSubdomains=$allowSubdomains, allowIdpInitiated=$allowIdpInitiated, disableAdditionalIdentifications=$disableAdditionalIdentifications, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'protocol'] = this.protocol;
    json[r'provider'] = this.provider;
    json[r'name'] = this.name;
    if (this.logoPublicUrl != null) {
      json[r'logo_public_url'] = this.logoPublicUrl;
    } else {
      json[r'logo_public_url'] = null;
    }
    if (this.domain != null) {
      json[r'domain'] = this.domain;
    } else {
      json[r'domain'] = null;
    }
    json[r'domains'] = this.domains;
    json[r'active'] = this.active;
    json[r'sync_user_attributes'] = this.syncUserAttributes;
    json[r'allow_subdomains'] = this.allowSubdomains;
    json[r'allow_idp_initiated'] = this.allowIdpInitiated;
    json[r'disable_additional_identifications'] =
        this.disableAdditionalIdentifications;
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [EnterpriseAccountEnterpriseConnection] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EnterpriseAccountEnterpriseConnection? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "EnterpriseAccountEnterpriseConnection[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "EnterpriseAccountEnterpriseConnection[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return EnterpriseAccountEnterpriseConnection(
        id: mapValueOfType<String>(json, r'id')!,
        protocol: mapValueOfType<String>(json, r'protocol')!,
        provider: mapValueOfType<String>(json, r'provider')!,
        name: mapValueOfType<String>(json, r'name')!,
        logoPublicUrl: mapValueOfType<String>(json, r'logo_public_url'),
        domain: mapValueOfType<String>(json, r'domain'),
        domains: json[r'domains'] is Iterable
            ? (json[r'domains'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        active: mapValueOfType<bool>(json, r'active')!,
        syncUserAttributes:
            mapValueOfType<bool>(json, r'sync_user_attributes')!,
        allowSubdomains: mapValueOfType<bool>(json, r'allow_subdomains')!,
        allowIdpInitiated: mapValueOfType<bool>(json, r'allow_idp_initiated')!,
        disableAdditionalIdentifications:
            mapValueOfType<bool>(json, r'disable_additional_identifications')!,
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<EnterpriseAccountEnterpriseConnection> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <EnterpriseAccountEnterpriseConnection>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EnterpriseAccountEnterpriseConnection.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EnterpriseAccountEnterpriseConnection> mapFromJson(
      dynamic json) {
    final map = <String, EnterpriseAccountEnterpriseConnection>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            EnterpriseAccountEnterpriseConnection.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EnterpriseAccountEnterpriseConnection-objects as value to a dart map
  static Map<String, List<EnterpriseAccountEnterpriseConnection>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<EnterpriseAccountEnterpriseConnection>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EnterpriseAccountEnterpriseConnection.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'protocol',
    'provider',
    'name',
    'logo_public_url',
    'active',
    'sync_user_attributes',
    'allow_subdomains',
    'allow_idp_initiated',
    'disable_additional_identifications',
    'created_at',
    'updated_at',
  };
}
