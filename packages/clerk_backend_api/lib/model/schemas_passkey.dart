//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SchemasPasskey {
  /// Returns a new [SchemasPasskey] instance.
  SchemasPasskey({
    this.id,
    required this.object,
    required this.name,
    required this.lastUsedAt,
    required this.verification,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// String representing the object's type. Objects of the same type share the same value.
  SchemasPasskeyObjectEnum object;

  String name;

  /// Unix timestamp of when the passkey was last used.
  int lastUsedAt;

  SchemasPasskeyVerification? verification;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SchemasPasskey &&
          other.id == id &&
          other.object == object &&
          other.name == name &&
          other.lastUsedAt == lastUsedAt &&
          other.verification == verification;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id == null ? 0 : id!.hashCode) +
      (object.hashCode) +
      (name.hashCode) +
      (lastUsedAt.hashCode) +
      (verification == null ? 0 : verification!.hashCode);

  @override
  String toString() =>
      'SchemasPasskey[id=$id, object=$object, name=$name, lastUsedAt=$lastUsedAt, verification=$verification]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    json[r'object'] = this.object;
    json[r'name'] = this.name;
    json[r'last_used_at'] = this.lastUsedAt;
    if (this.verification != null) {
      json[r'verification'] = this.verification;
    } else {
      json[r'verification'] = null;
    }
    return json;
  }

  /// Returns a new [SchemasPasskey] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SchemasPasskey? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SchemasPasskey[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SchemasPasskey[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SchemasPasskey(
        id: mapValueOfType<String>(json, r'id'),
        object: SchemasPasskeyObjectEnum.fromJson(json[r'object'])!,
        name: mapValueOfType<String>(json, r'name')!,
        lastUsedAt: mapValueOfType<int>(json, r'last_used_at')!,
        verification:
            SchemasPasskeyVerification.fromJson(json[r'verification']),
      );
    }
    return null;
  }

  static List<SchemasPasskey> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SchemasPasskey>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SchemasPasskey.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SchemasPasskey> mapFromJson(dynamic json) {
    final map = <String, SchemasPasskey>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SchemasPasskey.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SchemasPasskey-objects as value to a dart map
  static Map<String, List<SchemasPasskey>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SchemasPasskey>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SchemasPasskey.listFromJson(
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
    'name',
    'last_used_at',
    'verification',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class SchemasPasskeyObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const SchemasPasskeyObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const passkey = SchemasPasskeyObjectEnum._(r'passkey');

  /// List of all possible values in this [enum][SchemasPasskeyObjectEnum].
  static const values = <SchemasPasskeyObjectEnum>[
    passkey,
  ];

  static SchemasPasskeyObjectEnum? fromJson(dynamic value) =>
      SchemasPasskeyObjectEnumTypeTransformer().decode(value);

  static List<SchemasPasskeyObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SchemasPasskeyObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SchemasPasskeyObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SchemasPasskeyObjectEnum] to String,
/// and [decode] dynamic data back to [SchemasPasskeyObjectEnum].
class SchemasPasskeyObjectEnumTypeTransformer {
  factory SchemasPasskeyObjectEnumTypeTransformer() =>
      _instance ??= const SchemasPasskeyObjectEnumTypeTransformer._();

  const SchemasPasskeyObjectEnumTypeTransformer._();

  String encode(SchemasPasskeyObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SchemasPasskeyObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SchemasPasskeyObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'passkey':
          return SchemasPasskeyObjectEnum.passkey;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SchemasPasskeyObjectEnumTypeTransformer] instance.
  static SchemasPasskeyObjectEnumTypeTransformer? _instance;
}
