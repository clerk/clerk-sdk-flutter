//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SAMLConnection {
  /// Returns a new [SAMLConnection] instance.
  SAMLConnection({
    required this.id,
    required this.name,
    required this.domain,
    required this.active,
    required this.provider,
    required this.syncUserAttributes,
    this.allowSubdomains,
    this.allowIdpInitiated,
    this.disableAdditionalIdentifications,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;

  String name;

  String domain;

  bool active;

  String provider;

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
      other is SAMLConnection &&
          other.id == id &&
          other.name == name &&
          other.domain == domain &&
          other.active == active &&
          other.provider == provider &&
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
      (name.hashCode) +
      (domain.hashCode) +
      (active.hashCode) +
      (provider.hashCode) +
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
      'SAMLConnection[id=$id, name=$name, domain=$domain, active=$active, provider=$provider, syncUserAttributes=$syncUserAttributes, allowSubdomains=$allowSubdomains, allowIdpInitiated=$allowIdpInitiated, disableAdditionalIdentifications=$disableAdditionalIdentifications, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    json[r'domain'] = this.domain;
    json[r'active'] = this.active;
    json[r'provider'] = this.provider;
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

  /// Returns a new [SAMLConnection] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SAMLConnection? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SAMLConnection[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SAMLConnection[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SAMLConnection(
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        domain: mapValueOfType<String>(json, r'domain')!,
        active: mapValueOfType<bool>(json, r'active')!,
        provider: mapValueOfType<String>(json, r'provider')!,
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

  static List<SAMLConnection> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SAMLConnection>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SAMLConnection.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SAMLConnection> mapFromJson(dynamic json) {
    final map = <String, SAMLConnection>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SAMLConnection.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SAMLConnection-objects as value to a dart map
  static Map<String, List<SAMLConnection>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SAMLConnection>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SAMLConnection.listFromJson(
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
    'name',
    'domain',
    'active',
    'provider',
    'sync_user_attributes',
    'created_at',
    'updated_at',
  };
}
