//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateJWTTemplateRequest {
  /// Returns a new [CreateJWTTemplateRequest] instance.
  CreateJWTTemplateRequest({
    required this.name,
    required this.claims,
    this.lifetime,
    this.allowedClockSkew,
    this.customSigningKey,
    this.signingAlgorithm,
    this.signingKey,
  });

  /// JWT template name
  String name;

  /// JWT template claims in JSON format
  Object claims;

  /// JWT token lifetime
  ///
  /// Minimum value: 30
  /// Maximum value: 315360000
  num? lifetime;

  /// JWT token allowed clock skew
  ///
  /// Minimum value: 0
  /// Maximum value: 300
  num? allowedClockSkew;

  /// Whether a custom signing key/algorithm is also provided for this template
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? customSigningKey;

  /// The custom signing algorithm to use when minting JWTs. Required if `custom_signing_key` is `true`.
  String? signingAlgorithm;

  /// The custom signing private key to use when minting JWTs. Required if `custom_signing_key` is `true`.
  String? signingKey;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateJWTTemplateRequest &&
          other.name == name &&
          other.claims == claims &&
          other.lifetime == lifetime &&
          other.allowedClockSkew == allowedClockSkew &&
          other.customSigningKey == customSigningKey &&
          other.signingAlgorithm == signingAlgorithm &&
          other.signingKey == signingKey;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name.hashCode) +
      (claims.hashCode) +
      (lifetime == null ? 0 : lifetime!.hashCode) +
      (allowedClockSkew == null ? 0 : allowedClockSkew!.hashCode) +
      (customSigningKey == null ? 0 : customSigningKey!.hashCode) +
      (signingAlgorithm == null ? 0 : signingAlgorithm!.hashCode) +
      (signingKey == null ? 0 : signingKey!.hashCode);

  @override
  String toString() =>
      'CreateJWTTemplateRequest[name=$name, claims=$claims, lifetime=$lifetime, allowedClockSkew=$allowedClockSkew, customSigningKey=$customSigningKey, signingAlgorithm=$signingAlgorithm, signingKey=$signingKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'name'] = this.name;
    json[r'claims'] = this.claims;
    if (this.lifetime != null) {
      json[r'lifetime'] = this.lifetime;
    } else {
      json[r'lifetime'] = null;
    }
    if (this.allowedClockSkew != null) {
      json[r'allowed_clock_skew'] = this.allowedClockSkew;
    } else {
      json[r'allowed_clock_skew'] = null;
    }
    if (this.customSigningKey != null) {
      json[r'custom_signing_key'] = this.customSigningKey;
    } else {
      json[r'custom_signing_key'] = null;
    }
    if (this.signingAlgorithm != null) {
      json[r'signing_algorithm'] = this.signingAlgorithm;
    } else {
      json[r'signing_algorithm'] = null;
    }
    if (this.signingKey != null) {
      json[r'signing_key'] = this.signingKey;
    } else {
      json[r'signing_key'] = null;
    }
    return json;
  }

  /// Returns a new [CreateJWTTemplateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateJWTTemplateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateJWTTemplateRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateJWTTemplateRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateJWTTemplateRequest(
        name: mapValueOfType<String>(json, r'name')!,
        claims: mapValueOfType<Object>(json, r'claims')!,
        lifetime: json[r'lifetime'] == null
            ? null
            : num.parse('${json[r'lifetime']}'),
        allowedClockSkew: json[r'allowed_clock_skew'] == null
            ? null
            : num.parse('${json[r'allowed_clock_skew']}'),
        customSigningKey: mapValueOfType<bool>(json, r'custom_signing_key'),
        signingAlgorithm: mapValueOfType<String>(json, r'signing_algorithm'),
        signingKey: mapValueOfType<String>(json, r'signing_key'),
      );
    }
    return null;
  }

  static List<CreateJWTTemplateRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateJWTTemplateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateJWTTemplateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateJWTTemplateRequest> mapFromJson(dynamic json) {
    final map = <String, CreateJWTTemplateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateJWTTemplateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateJWTTemplateRequest-objects as value to a dart map
  static Map<String, List<CreateJWTTemplateRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateJWTTemplateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateJWTTemplateRequest.listFromJson(
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
    'claims',
  };
}
