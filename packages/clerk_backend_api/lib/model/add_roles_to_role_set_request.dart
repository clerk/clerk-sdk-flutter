//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AddRolesToRoleSetRequest {
  /// Returns a new [AddRolesToRoleSetRequest] instance.
  AddRolesToRoleSetRequest({
    this.roleKeys = const [],
    this.defaultRoleKey,
    this.creatorRoleKey,
  });

  /// Array of role keys to add to the role set. Must contain at least one role and no more than 10 roles.
  List<String> roleKeys;

  /// Optionally update the default role to one of the newly added roles.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? defaultRoleKey;

  /// Optionally update the creator role to one of the newly added roles.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? creatorRoleKey;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddRolesToRoleSetRequest &&
          _deepEquality.equals(other.roleKeys, roleKeys) &&
          other.defaultRoleKey == defaultRoleKey &&
          other.creatorRoleKey == creatorRoleKey;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (roleKeys.hashCode) +
      (defaultRoleKey == null ? 0 : defaultRoleKey!.hashCode) +
      (creatorRoleKey == null ? 0 : creatorRoleKey!.hashCode);

  @override
  String toString() =>
      'AddRolesToRoleSetRequest[roleKeys=$roleKeys, defaultRoleKey=$defaultRoleKey, creatorRoleKey=$creatorRoleKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'role_keys'] = this.roleKeys;
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

  /// Returns a new [AddRolesToRoleSetRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AddRolesToRoleSetRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "AddRolesToRoleSetRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "AddRolesToRoleSetRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AddRolesToRoleSetRequest(
        roleKeys: json[r'role_keys'] is Iterable
            ? (json[r'role_keys'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        defaultRoleKey: mapValueOfType<String>(json, r'default_role_key'),
        creatorRoleKey: mapValueOfType<String>(json, r'creator_role_key'),
      );
    }
    return null;
  }

  static List<AddRolesToRoleSetRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <AddRolesToRoleSetRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AddRolesToRoleSetRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AddRolesToRoleSetRequest> mapFromJson(dynamic json) {
    final map = <String, AddRolesToRoleSetRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AddRolesToRoleSetRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AddRolesToRoleSetRequest-objects as value to a dart map
  static Map<String, List<AddRolesToRoleSetRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<AddRolesToRoleSetRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AddRolesToRoleSetRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'role_keys',
  };
}
