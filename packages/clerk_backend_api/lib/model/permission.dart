//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Permission {
  /// Returns a new [Permission] instance.
  Permission({
    required this.object,
    required this.id,
    required this.name,
    required this.key,
    required this.description,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  PermissionObjectEnum object;

  String id;

  String name;

  String key;

  String description;

  String type;

  /// Unix timestamp of creation.
  int createdAt;

  /// Unix timestamp of last update.
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Permission &&
          other.object == object &&
          other.id == id &&
          other.name == name &&
          other.key == key &&
          other.description == description &&
          other.type == type &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (name.hashCode) +
      (key.hashCode) +
      (description.hashCode) +
      (type.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'Permission[object=$object, id=$id, name=$name, key=$key, description=$description, type=$type, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    json[r'key'] = this.key;
    json[r'description'] = this.description;
    json[r'type'] = this.type;
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [Permission] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Permission? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Permission[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Permission[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Permission(
        object: PermissionObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        key: mapValueOfType<String>(json, r'key')!,
        description: mapValueOfType<String>(json, r'description')!,
        type: mapValueOfType<String>(json, r'type')!,
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<Permission> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Permission>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Permission.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Permission> mapFromJson(dynamic json) {
    final map = <String, Permission>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Permission.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Permission-objects as value to a dart map
  static Map<String, List<Permission>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Permission>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Permission.listFromJson(
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
    'key',
    'description',
    'type',
    'created_at',
    'updated_at',
  };
}

class PermissionObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const PermissionObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const permission = PermissionObjectEnum._(r'permission');

  /// List of all possible values in this [enum][PermissionObjectEnum].
  static const values = <PermissionObjectEnum>[
    permission,
  ];

  static PermissionObjectEnum? fromJson(dynamic value) =>
      PermissionObjectEnumTypeTransformer().decode(value);

  static List<PermissionObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PermissionObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PermissionObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PermissionObjectEnum] to String,
/// and [decode] dynamic data back to [PermissionObjectEnum].
class PermissionObjectEnumTypeTransformer {
  factory PermissionObjectEnumTypeTransformer() =>
      _instance ??= const PermissionObjectEnumTypeTransformer._();

  const PermissionObjectEnumTypeTransformer._();

  String encode(PermissionObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PermissionObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PermissionObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'permission':
          return PermissionObjectEnum.permission;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PermissionObjectEnumTypeTransformer] instance.
  static PermissionObjectEnumTypeTransformer? _instance;
}
