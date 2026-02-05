//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RoleSetItem {
  /// Returns a new [RoleSetItem] instance.
  RoleSetItem({
    required this.object,
    required this.id,
    required this.name,
    required this.key,
    required this.description,
    this.membersCount,
    this.hasMembers,
    required this.createdAt,
    required this.updatedAt,
  });

  RoleSetItemObjectEnum object;

  /// The unique identifier of the role
  String id;

  /// The name of the role
  String name;

  /// The key of the role (e.g., \"org:admin\", \"org:member\")
  String key;

  /// Optional description of the role
  String? description;

  /// The number of members assigned to this role within the role set
  int? membersCount;

  /// Whether this role has any members assigned within the role set
  bool? hasMembers;

  /// Unix timestamp of role creation
  int createdAt;

  /// Unix timestamp of last role update
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoleSetItem &&
          other.object == object &&
          other.id == id &&
          other.name == name &&
          other.key == key &&
          other.description == description &&
          other.membersCount == membersCount &&
          other.hasMembers == hasMembers &&
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
      (membersCount == null ? 0 : membersCount!.hashCode) +
      (hasMembers == null ? 0 : hasMembers!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'RoleSetItem[object=$object, id=$id, name=$name, key=$key, description=$description, membersCount=$membersCount, hasMembers=$hasMembers, createdAt=$createdAt, updatedAt=$updatedAt]';

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
    if (this.membersCount != null) {
      json[r'members_count'] = this.membersCount;
    } else {
      json[r'members_count'] = null;
    }
    if (this.hasMembers != null) {
      json[r'has_members'] = this.hasMembers;
    } else {
      json[r'has_members'] = null;
    }
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [RoleSetItem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RoleSetItem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "RoleSetItem[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "RoleSetItem[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RoleSetItem(
        object: RoleSetItemObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        key: mapValueOfType<String>(json, r'key')!,
        description: mapValueOfType<String>(json, r'description'),
        membersCount: mapValueOfType<int>(json, r'members_count'),
        hasMembers: mapValueOfType<bool>(json, r'has_members'),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<RoleSetItem> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RoleSetItem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RoleSetItem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RoleSetItem> mapFromJson(dynamic json) {
    final map = <String, RoleSetItem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RoleSetItem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RoleSetItem-objects as value to a dart map
  static Map<String, List<RoleSetItem>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<RoleSetItem>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RoleSetItem.listFromJson(
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
    'created_at',
    'updated_at',
  };
}

class RoleSetItemObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const RoleSetItemObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const roleSetItem = RoleSetItemObjectEnum._(r'role_set_item');

  /// List of all possible values in this [enum][RoleSetItemObjectEnum].
  static const values = <RoleSetItemObjectEnum>[
    roleSetItem,
  ];

  static RoleSetItemObjectEnum? fromJson(dynamic value) =>
      RoleSetItemObjectEnumTypeTransformer().decode(value);

  static List<RoleSetItemObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RoleSetItemObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RoleSetItemObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [RoleSetItemObjectEnum] to String,
/// and [decode] dynamic data back to [RoleSetItemObjectEnum].
class RoleSetItemObjectEnumTypeTransformer {
  factory RoleSetItemObjectEnumTypeTransformer() =>
      _instance ??= const RoleSetItemObjectEnumTypeTransformer._();

  const RoleSetItemObjectEnumTypeTransformer._();

  String encode(RoleSetItemObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a RoleSetItemObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RoleSetItemObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'role_set_item':
          return RoleSetItemObjectEnum.roleSetItem;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [RoleSetItemObjectEnumTypeTransformer] instance.
  static RoleSetItemObjectEnumTypeTransformer? _instance;
}
