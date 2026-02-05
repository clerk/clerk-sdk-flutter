//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateOrganizationRoleRequest {
  /// Returns a new [UpdateOrganizationRoleRequest] instance.
  UpdateOrganizationRoleRequest({
    this.name,
    this.key,
    this.description,
    this.permissions = const [],
  });

  /// The new name for the organization role
  String? name;

  /// A unique key for the organization role. Must start with 'org:' and contain only lowercase alphanumeric characters and underscores.
  String? key;

  /// Optional description for the role
  String? description;

  /// Array of permission IDs to assign to the role. If provided, this will replace the existing permissions.
  List<String>? permissions;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateOrganizationRoleRequest &&
          other.name == name &&
          other.key == key &&
          other.description == description &&
          _deepEquality.equals(other.permissions, permissions);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name == null ? 0 : name!.hashCode) +
      (key == null ? 0 : key!.hashCode) +
      (description == null ? 0 : description!.hashCode) +
      (permissions == null ? 0 : permissions!.hashCode);

  @override
  String toString() =>
      'UpdateOrganizationRoleRequest[name=$name, key=$key, description=$description, permissions=$permissions]';

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
    if (this.permissions != null) {
      json[r'permissions'] = this.permissions;
    } else {
      json[r'permissions'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateOrganizationRoleRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateOrganizationRoleRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UpdateOrganizationRoleRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UpdateOrganizationRoleRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateOrganizationRoleRequest(
        name: mapValueOfType<String>(json, r'name'),
        key: mapValueOfType<String>(json, r'key'),
        description: mapValueOfType<String>(json, r'description'),
        permissions: json[r'permissions'] is Iterable
            ? (json[r'permissions'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<UpdateOrganizationRoleRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdateOrganizationRoleRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateOrganizationRoleRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateOrganizationRoleRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateOrganizationRoleRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateOrganizationRoleRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateOrganizationRoleRequest-objects as value to a dart map
  static Map<String, List<UpdateOrganizationRoleRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UpdateOrganizationRoleRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateOrganizationRoleRequest.listFromJson(
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
