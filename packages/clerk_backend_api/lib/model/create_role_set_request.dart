//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateRoleSetRequest {
  /// Returns a new [CreateRoleSetRequest] instance.
  CreateRoleSetRequest({
    required this.name,
    this.key,
    this.description,
    required this.defaultRoleKey,
    required this.creatorRoleKey,
    this.type,
    this.roles = const [],
  });

  /// The name of the new role set
  String name;

  /// A unique key for the role set. Must start with 'role_set:' and contain only lowercase alphanumeric characters and underscores. If not provided, a key will be generated from the name.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// Optional description for the role set
  String? description;

  /// The key of the role to use as the default role for new organization members. Must be one of the roles in the `roles` array.
  String defaultRoleKey;

  /// The key of the role to assign to organization creators. Must be one of the roles in the `roles` array.
  String creatorRoleKey;

  /// The type of the role set. \"initial\" role sets are the default for new organizations. Only one role set can be \"initial\" per instance.
  CreateRoleSetRequestTypeEnum? type;

  /// Array of role keys to include in the role set. Must contain at least one role and no more than 10 roles.
  List<String> roles;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateRoleSetRequest &&
          other.name == name &&
          other.key == key &&
          other.description == description &&
          other.defaultRoleKey == defaultRoleKey &&
          other.creatorRoleKey == creatorRoleKey &&
          other.type == type &&
          _deepEquality.equals(other.roles, roles);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name.hashCode) +
      (key == null ? 0 : key!.hashCode) +
      (description == null ? 0 : description!.hashCode) +
      (defaultRoleKey.hashCode) +
      (creatorRoleKey.hashCode) +
      (type == null ? 0 : type!.hashCode) +
      (roles.hashCode);

  @override
  String toString() =>
      'CreateRoleSetRequest[name=$name, key=$key, description=$description, defaultRoleKey=$defaultRoleKey, creatorRoleKey=$creatorRoleKey, type=$type, roles=$roles]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'name'] = this.name;
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
    json[r'default_role_key'] = this.defaultRoleKey;
    json[r'creator_role_key'] = this.creatorRoleKey;
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    json[r'roles'] = this.roles;
    return json;
  }

  /// Returns a new [CreateRoleSetRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateRoleSetRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateRoleSetRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateRoleSetRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateRoleSetRequest(
        name: mapValueOfType<String>(json, r'name')!,
        key: mapValueOfType<String>(json, r'key'),
        description: mapValueOfType<String>(json, r'description'),
        defaultRoleKey: mapValueOfType<String>(json, r'default_role_key')!,
        creatorRoleKey: mapValueOfType<String>(json, r'creator_role_key')!,
        type: CreateRoleSetRequestTypeEnum.fromJson(json[r'type']),
        roles: json[r'roles'] is Iterable
            ? (json[r'roles'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<CreateRoleSetRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateRoleSetRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateRoleSetRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateRoleSetRequest> mapFromJson(dynamic json) {
    final map = <String, CreateRoleSetRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateRoleSetRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateRoleSetRequest-objects as value to a dart map
  static Map<String, List<CreateRoleSetRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateRoleSetRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateRoleSetRequest.listFromJson(
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
    'default_role_key',
    'creator_role_key',
    'roles',
  };
}

/// The type of the role set. \"initial\" role sets are the default for new organizations. Only one role set can be \"initial\" per instance.
class CreateRoleSetRequestTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const CreateRoleSetRequestTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const initial = CreateRoleSetRequestTypeEnum._(r'initial');
  static const custom = CreateRoleSetRequestTypeEnum._(r'custom');

  /// List of all possible values in this [enum][CreateRoleSetRequestTypeEnum].
  static const values = <CreateRoleSetRequestTypeEnum>[
    initial,
    custom,
  ];

  static CreateRoleSetRequestTypeEnum? fromJson(dynamic value) =>
      CreateRoleSetRequestTypeEnumTypeTransformer().decode(value);

  static List<CreateRoleSetRequestTypeEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateRoleSetRequestTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateRoleSetRequestTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateRoleSetRequestTypeEnum] to String,
/// and [decode] dynamic data back to [CreateRoleSetRequestTypeEnum].
class CreateRoleSetRequestTypeEnumTypeTransformer {
  factory CreateRoleSetRequestTypeEnumTypeTransformer() =>
      _instance ??= const CreateRoleSetRequestTypeEnumTypeTransformer._();

  const CreateRoleSetRequestTypeEnumTypeTransformer._();

  String encode(CreateRoleSetRequestTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CreateRoleSetRequestTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateRoleSetRequestTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'initial':
          return CreateRoleSetRequestTypeEnum.initial;
        case r'custom':
          return CreateRoleSetRequestTypeEnum.custom;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CreateRoleSetRequestTypeEnumTypeTransformer] instance.
  static CreateRoleSetRequestTypeEnumTypeTransformer? _instance;
}
