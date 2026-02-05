//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateRoleSetRequest {
  /// Returns a new [UpdateRoleSetRequest] instance.
  UpdateRoleSetRequest({
    this.name,
    this.key,
    this.description,
    this.type,
    this.defaultRoleKey,
    this.creatorRoleKey,
  });

  /// The new name for the role set
  String? name;

  /// A unique key for the role set. Must start with 'role_set:' and contain only lowercase alphanumeric characters and underscores.
  String? key;

  /// Optional description for the role set
  String? description;

  /// Set to \"initial\" to make this the default role set for new organizations. Only one role set can be \"initial\" per instance; setting this will change any existing initial role set to \"custom\".
  UpdateRoleSetRequestTypeEnum? type;

  /// The key of the role to use as the default role for new organization members. Must be an existing role in the role set.
  String? defaultRoleKey;

  /// The key of the role to assign to organization creators. Must be an existing role in the role set.
  String? creatorRoleKey;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateRoleSetRequest &&
          other.name == name &&
          other.key == key &&
          other.description == description &&
          other.type == type &&
          other.defaultRoleKey == defaultRoleKey &&
          other.creatorRoleKey == creatorRoleKey;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name == null ? 0 : name!.hashCode) +
      (key == null ? 0 : key!.hashCode) +
      (description == null ? 0 : description!.hashCode) +
      (type == null ? 0 : type!.hashCode) +
      (defaultRoleKey == null ? 0 : defaultRoleKey!.hashCode) +
      (creatorRoleKey == null ? 0 : creatorRoleKey!.hashCode);

  @override
  String toString() =>
      'UpdateRoleSetRequest[name=$name, key=$key, description=$description, type=$type, defaultRoleKey=$defaultRoleKey, creatorRoleKey=$creatorRoleKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.defaultRoleKey != null) {
      json[r'default_role_key'] = this.defaultRoleKey;
    } else {
      json[r'default_role_key'] = null;
    }
    if (this.creatorRoleKey != null) {
      json[r'creator_role_key'] = this.creatorRoleKey;
    } else {
      json[r'creator_role_key'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateRoleSetRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateRoleSetRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UpdateRoleSetRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UpdateRoleSetRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateRoleSetRequest(
        name: mapValueOfType<String>(json, r'name'),
        key: mapValueOfType<String>(json, r'key'),
        description: mapValueOfType<String>(json, r'description'),
        type: UpdateRoleSetRequestTypeEnum.fromJson(json[r'type']),
        defaultRoleKey: mapValueOfType<String>(json, r'default_role_key'),
        creatorRoleKey: mapValueOfType<String>(json, r'creator_role_key'),
      );
    }
    return null;
  }

  static List<UpdateRoleSetRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdateRoleSetRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateRoleSetRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateRoleSetRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateRoleSetRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateRoleSetRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateRoleSetRequest-objects as value to a dart map
  static Map<String, List<UpdateRoleSetRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UpdateRoleSetRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateRoleSetRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}

/// Set to \"initial\" to make this the default role set for new organizations. Only one role set can be \"initial\" per instance; setting this will change any existing initial role set to \"custom\".
class UpdateRoleSetRequestTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const UpdateRoleSetRequestTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const initial = UpdateRoleSetRequestTypeEnum._(r'initial');

  /// List of all possible values in this [enum][UpdateRoleSetRequestTypeEnum].
  static const values = <UpdateRoleSetRequestTypeEnum>[
    initial,
  ];

  static UpdateRoleSetRequestTypeEnum? fromJson(dynamic value) =>
      UpdateRoleSetRequestTypeEnumTypeTransformer().decode(value);

  static List<UpdateRoleSetRequestTypeEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdateRoleSetRequestTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateRoleSetRequestTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UpdateRoleSetRequestTypeEnum] to String,
/// and [decode] dynamic data back to [UpdateRoleSetRequestTypeEnum].
class UpdateRoleSetRequestTypeEnumTypeTransformer {
  factory UpdateRoleSetRequestTypeEnumTypeTransformer() =>
      _instance ??= const UpdateRoleSetRequestTypeEnumTypeTransformer._();

  const UpdateRoleSetRequestTypeEnumTypeTransformer._();

  String encode(UpdateRoleSetRequestTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a UpdateRoleSetRequestTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UpdateRoleSetRequestTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'initial':
          return UpdateRoleSetRequestTypeEnum.initial;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [UpdateRoleSetRequestTypeEnumTypeTransformer] instance.
  static UpdateRoleSetRequestTypeEnumTypeTransformer? _instance;
}
