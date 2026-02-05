//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Role {
  /// Returns a new [Role] instance.
  Role({
    required this.object,
    required this.id,
    required this.name,
    required this.key,
    required this.description,
    required this.isCreatorEligible,
    this.permissions = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  RoleObjectEnum object;

  String id;

  String name;

  String key;

  String? description;

  /// Whether this role is eligible to be an organization creator role
  bool isCreatorEligible;

  List<Permission> permissions;

  /// Unix timestamp of creation.
  int createdAt;

  /// Unix timestamp of last update.
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Role &&
          other.object == object &&
          other.id == id &&
          other.name == name &&
          other.key == key &&
          other.description == description &&
          other.isCreatorEligible == isCreatorEligible &&
          _deepEquality.equals(other.permissions, permissions) &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (name.hashCode) +
      (key.hashCode) +
      (description == null ? 0 : description!.hashCode) +
      (isCreatorEligible.hashCode) +
      (permissions.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'Role[object=$object, id=$id, name=$name, key=$key, description=$description, isCreatorEligible=$isCreatorEligible, permissions=$permissions, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    json[r'key'] = this.key;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    json[r'is_creator_eligible'] = this.isCreatorEligible;
    json[r'permissions'] = this.permissions;
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [Role] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Role? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Role[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Role[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Role(
        object: RoleObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        key: mapValueOfType<String>(json, r'key')!,
        description: mapValueOfType<String>(json, r'description'),
        isCreatorEligible: mapValueOfType<bool>(json, r'is_creator_eligible')!,
        permissions: Permission.listFromJson(json[r'permissions']),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<Role> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Role>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Role.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Role> mapFromJson(dynamic json) {
    final map = <String, Role>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Role.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Role-objects as value to a dart map
  static Map<String, List<Role>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Role>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Role.listFromJson(
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
    'is_creator_eligible',
    'permissions',
    'created_at',
    'updated_at',
  };
}

class RoleObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const RoleObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const role = RoleObjectEnum._(r'role');

  /// List of all possible values in this [enum][RoleObjectEnum].
  static const values = <RoleObjectEnum>[
    role,
  ];

  static RoleObjectEnum? fromJson(dynamic value) =>
      RoleObjectEnumTypeTransformer().decode(value);

  static List<RoleObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RoleObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RoleObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [RoleObjectEnum] to String,
/// and [decode] dynamic data back to [RoleObjectEnum].
class RoleObjectEnumTypeTransformer {
  factory RoleObjectEnumTypeTransformer() =>
      _instance ??= const RoleObjectEnumTypeTransformer._();

  const RoleObjectEnumTypeTransformer._();

  String encode(RoleObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a RoleObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RoleObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'role':
          return RoleObjectEnum.role;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [RoleObjectEnumTypeTransformer] instance.
  static RoleObjectEnumTypeTransformer? _instance;
}
