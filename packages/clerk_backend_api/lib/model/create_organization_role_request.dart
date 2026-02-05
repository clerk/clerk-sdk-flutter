//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateOrganizationRoleRequest {
  /// Returns a new [CreateOrganizationRoleRequest] instance.
  CreateOrganizationRoleRequest({
    required this.name,
    required this.key,
    this.description,
    this.permissions = const [],
    this.includeInInitialRoleSet,
  });

  /// The name of the new organization role
  String name;

  /// A unique key for the organization role. Must start with 'org:' and contain only lowercase alphanumeric characters and underscores.
  String key;

  /// Optional description for the role
  String? description;

  /// Array of permission IDs to assign to the role
  List<String>? permissions;

  /// Whether this role should be included in the initial role set
  bool? includeInInitialRoleSet;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateOrganizationRoleRequest &&
          other.name == name &&
          other.key == key &&
          other.description == description &&
          _deepEquality.equals(other.permissions, permissions) &&
          other.includeInInitialRoleSet == includeInInitialRoleSet;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name.hashCode) +
      (key.hashCode) +
      (description == null ? 0 : description!.hashCode) +
      (permissions == null ? 0 : permissions!.hashCode) +
      (includeInInitialRoleSet == null ? 0 : includeInInitialRoleSet!.hashCode);

  @override
  String toString() =>
      'CreateOrganizationRoleRequest[name=$name, key=$key, description=$description, permissions=$permissions, includeInInitialRoleSet=$includeInInitialRoleSet]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'name'] = this.name;
    json[r'key'] = this.key;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.permissions != null) {
      json[r'permissions'] = this.permissions;
    } else {
      json[r'permissions'] = null;
    }
    if (this.includeInInitialRoleSet != null) {
      json[r'include_in_initial_role_set'] = this.includeInInitialRoleSet;
    } else {
      json[r'include_in_initial_role_set'] = null;
    }
    return json;
  }

  /// Returns a new [CreateOrganizationRoleRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateOrganizationRoleRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateOrganizationRoleRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateOrganizationRoleRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateOrganizationRoleRequest(
        name: mapValueOfType<String>(json, r'name')!,
        key: mapValueOfType<String>(json, r'key')!,
        description: mapValueOfType<String>(json, r'description'),
        permissions: json[r'permissions'] is Iterable
            ? (json[r'permissions'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        includeInInitialRoleSet:
            mapValueOfType<bool>(json, r'include_in_initial_role_set'),
      );
    }
    return null;
  }

  static List<CreateOrganizationRoleRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateOrganizationRoleRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateOrganizationRoleRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateOrganizationRoleRequest> mapFromJson(dynamic json) {
    final map = <String, CreateOrganizationRoleRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateOrganizationRoleRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateOrganizationRoleRequest-objects as value to a dart map
  static Map<String, List<CreateOrganizationRoleRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateOrganizationRoleRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateOrganizationRoleRequest.listFromJson(
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
    'key',
  };
}
