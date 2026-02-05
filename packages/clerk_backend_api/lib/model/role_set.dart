//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RoleSet {
  /// Returns a new [RoleSet] instance.
  RoleSet({
    required this.object,
    required this.id,
    required this.name,
    required this.key,
    required this.description,
    this.roles = const [],
    this.defaultRole,
    this.creatorRole,
    required this.type,
    this.roleSetMigration,
    required this.createdAt,
    required this.updatedAt,
  });

  RoleSetObjectEnum object;

  /// The unique identifier of the role set
  String id;

  /// The name of the role set
  String name;

  /// A unique key for the role set (e.g., \"role_set:default\")
  String key;

  /// Optional description of the role set
  String? description;

  /// The list of roles in this role set
  List<RoleSetItem> roles;

  /// The default role assigned to new organization members
  RoleSetItem? defaultRole;

  /// The role assigned to the creator of an organization
  RoleSetItem? creatorRole;

  /// The type of the role set (\"initial\" or \"custom\")
  RoleSetTypeEnum type;

  /// Active migration information, only present when status is \"enqueued\" or \"in_progress\"
  RoleSetMigration? roleSetMigration;

  /// Unix timestamp of role set creation
  int createdAt;

  /// Unix timestamp of last role set update
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoleSet &&
          other.object == object &&
          other.id == id &&
          other.name == name &&
          other.key == key &&
          other.description == description &&
          _deepEquality.equals(other.roles, roles) &&
          other.defaultRole == defaultRole &&
          other.creatorRole == creatorRole &&
          other.type == type &&
          other.roleSetMigration == roleSetMigration &&
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
      (roles.hashCode) +
      (defaultRole == null ? 0 : defaultRole!.hashCode) +
      (creatorRole == null ? 0 : creatorRole!.hashCode) +
      (type.hashCode) +
      (roleSetMigration == null ? 0 : roleSetMigration!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'RoleSet[object=$object, id=$id, name=$name, key=$key, description=$description, roles=$roles, defaultRole=$defaultRole, creatorRole=$creatorRole, type=$type, roleSetMigration=$roleSetMigration, createdAt=$createdAt, updatedAt=$updatedAt]';

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
    json[r'roles'] = this.roles;
    if (this.defaultRole != null) {
      json[r'default_role'] = this.defaultRole;
    } else {
      json[r'default_role'] = null;
    }
    if (this.creatorRole != null) {
      json[r'creator_role'] = this.creatorRole;
    } else {
      json[r'creator_role'] = null;
    }
    json[r'type'] = this.type;
    if (this.roleSetMigration != null) {
      json[r'role_set_migration'] = this.roleSetMigration;
    } else {
      json[r'role_set_migration'] = null;
    }
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [RoleSet] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RoleSet? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "RoleSet[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "RoleSet[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RoleSet(
        object: RoleSetObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        key: mapValueOfType<String>(json, r'key')!,
        description: mapValueOfType<String>(json, r'description'),
        roles: RoleSetItem.listFromJson(json[r'roles']),
        defaultRole: RoleSetItem.fromJson(json[r'default_role']),
        creatorRole: RoleSetItem.fromJson(json[r'creator_role']),
        type: RoleSetTypeEnum.fromJson(json[r'type'])!,
        roleSetMigration:
            RoleSetMigration.fromJson(json[r'role_set_migration']),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<RoleSet> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RoleSet>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RoleSet.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RoleSet> mapFromJson(dynamic json) {
    final map = <String, RoleSet>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RoleSet.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RoleSet-objects as value to a dart map
  static Map<String, List<RoleSet>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<RoleSet>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RoleSet.listFromJson(
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
    'roles',
    'type',
    'created_at',
    'updated_at',
  };
}

class RoleSetObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const RoleSetObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const roleSet = RoleSetObjectEnum._(r'role_set');

  /// List of all possible values in this [enum][RoleSetObjectEnum].
  static const values = <RoleSetObjectEnum>[
    roleSet,
  ];

  static RoleSetObjectEnum? fromJson(dynamic value) =>
      RoleSetObjectEnumTypeTransformer().decode(value);

  static List<RoleSetObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RoleSetObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RoleSetObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [RoleSetObjectEnum] to String,
/// and [decode] dynamic data back to [RoleSetObjectEnum].
class RoleSetObjectEnumTypeTransformer {
  factory RoleSetObjectEnumTypeTransformer() =>
      _instance ??= const RoleSetObjectEnumTypeTransformer._();

  const RoleSetObjectEnumTypeTransformer._();

  String encode(RoleSetObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a RoleSetObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RoleSetObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'role_set':
          return RoleSetObjectEnum.roleSet;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [RoleSetObjectEnumTypeTransformer] instance.
  static RoleSetObjectEnumTypeTransformer? _instance;
}

/// The type of the role set (\"initial\" or \"custom\")
class RoleSetTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const RoleSetTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const initial = RoleSetTypeEnum._(r'initial');
  static const custom = RoleSetTypeEnum._(r'custom');

  /// List of all possible values in this [enum][RoleSetTypeEnum].
  static const values = <RoleSetTypeEnum>[
    initial,
    custom,
  ];

  static RoleSetTypeEnum? fromJson(dynamic value) =>
      RoleSetTypeEnumTypeTransformer().decode(value);

  static List<RoleSetTypeEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RoleSetTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RoleSetTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [RoleSetTypeEnum] to String,
/// and [decode] dynamic data back to [RoleSetTypeEnum].
class RoleSetTypeEnumTypeTransformer {
  factory RoleSetTypeEnumTypeTransformer() =>
      _instance ??= const RoleSetTypeEnumTypeTransformer._();

  const RoleSetTypeEnumTypeTransformer._();

  String encode(RoleSetTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a RoleSetTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RoleSetTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'initial':
          return RoleSetTypeEnum.initial;
        case r'custom':
          return RoleSetTypeEnum.custom;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [RoleSetTypeEnumTypeTransformer] instance.
  static RoleSetTypeEnumTypeTransformer? _instance;
}
