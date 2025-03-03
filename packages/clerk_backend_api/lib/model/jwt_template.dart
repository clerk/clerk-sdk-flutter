//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JWTTemplate {
  /// Returns a new [JWTTemplate] instance.
  JWTTemplate({
    required this.object,
    required this.id,
    required this.name,
    required this.claims,
    required this.lifetime,
    required this.allowedClockSkew,
    required this.customSigningKey,
    required this.signingAlgorithm,
    required this.createdAt,
    required this.updatedAt,
  });

  JWTTemplateObjectEnum object;

  String id;

  String name;

  Object claims;

  int lifetime;

  int allowedClockSkew;

  bool customSigningKey;

  String signingAlgorithm;

  /// Unix timestamp of creation.
  int createdAt;

  /// Unix timestamp of last update.
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JWTTemplate &&
          other.object == object &&
          other.id == id &&
          other.name == name &&
          other.claims == claims &&
          other.lifetime == lifetime &&
          other.allowedClockSkew == allowedClockSkew &&
          other.customSigningKey == customSigningKey &&
          other.signingAlgorithm == signingAlgorithm &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (name.hashCode) +
      (claims.hashCode) +
      (lifetime.hashCode) +
      (allowedClockSkew.hashCode) +
      (customSigningKey.hashCode) +
      (signingAlgorithm.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'JWTTemplate[object=$object, id=$id, name=$name, claims=$claims, lifetime=$lifetime, allowedClockSkew=$allowedClockSkew, customSigningKey=$customSigningKey, signingAlgorithm=$signingAlgorithm, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    json[r'claims'] = this.claims;
    json[r'lifetime'] = this.lifetime;
    json[r'allowed_clock_skew'] = this.allowedClockSkew;
    json[r'custom_signing_key'] = this.customSigningKey;
    json[r'signing_algorithm'] = this.signingAlgorithm;
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [JWTTemplate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JWTTemplate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "JWTTemplate[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "JWTTemplate[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return JWTTemplate(
        object: JWTTemplateObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        claims: mapValueOfType<Object>(json, r'claims')!,
        lifetime: mapValueOfType<int>(json, r'lifetime')!,
        allowedClockSkew: mapValueOfType<int>(json, r'allowed_clock_skew')!,
        customSigningKey: mapValueOfType<bool>(json, r'custom_signing_key')!,
        signingAlgorithm: mapValueOfType<String>(json, r'signing_algorithm')!,
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<JWTTemplate> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <JWTTemplate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JWTTemplate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JWTTemplate> mapFromJson(dynamic json) {
    final map = <String, JWTTemplate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JWTTemplate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JWTTemplate-objects as value to a dart map
  static Map<String, List<JWTTemplate>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<JWTTemplate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JWTTemplate.listFromJson(
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
    'claims',
    'lifetime',
    'allowed_clock_skew',
    'custom_signing_key',
    'signing_algorithm',
    'created_at',
    'updated_at',
  };
}

class JWTTemplateObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const JWTTemplateObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const jwtTemplate = JWTTemplateObjectEnum._(r'jwt_template');

  /// List of all possible values in this [enum][JWTTemplateObjectEnum].
  static const values = <JWTTemplateObjectEnum>[
    jwtTemplate,
  ];

  static JWTTemplateObjectEnum? fromJson(dynamic value) =>
      JWTTemplateObjectEnumTypeTransformer().decode(value);

  static List<JWTTemplateObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <JWTTemplateObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JWTTemplateObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [JWTTemplateObjectEnum] to String,
/// and [decode] dynamic data back to [JWTTemplateObjectEnum].
class JWTTemplateObjectEnumTypeTransformer {
  factory JWTTemplateObjectEnumTypeTransformer() =>
      _instance ??= const JWTTemplateObjectEnumTypeTransformer._();

  const JWTTemplateObjectEnumTypeTransformer._();

  String encode(JWTTemplateObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a JWTTemplateObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  JWTTemplateObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'jwt_template':
          return JWTTemplateObjectEnum.jwtTemplate;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [JWTTemplateObjectEnumTypeTransformer] instance.
  static JWTTemplateObjectEnumTypeTransformer? _instance;
}
