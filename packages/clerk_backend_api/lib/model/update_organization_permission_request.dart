//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateOrganizationPermissionRequest {
  /// Returns a new [UpdateOrganizationPermissionRequest] instance.
  UpdateOrganizationPermissionRequest({
    this.name,
    this.key,
    this.description,
  });

  /// The name of the permission.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The key of the permission. Must have the format \"org:feature:action\" where feature and action are segments consisting of lowercase letters, digits, or underscores. Cannot begin with \"org:sys_\" as that prefix is reserved for system permissions.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// A description of the permission.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateOrganizationPermissionRequest &&
          other.name == name &&
          other.key == key &&
          other.description == description;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name == null ? 0 : name!.hashCode) +
      (key == null ? 0 : key!.hashCode) +
      (description == null ? 0 : description!.hashCode);

  @override
  String toString() =>
      'UpdateOrganizationPermissionRequest[name=$name, key=$key, description=$description]';

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
    return json;
  }

  /// Returns a new [UpdateOrganizationPermissionRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateOrganizationPermissionRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UpdateOrganizationPermissionRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UpdateOrganizationPermissionRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateOrganizationPermissionRequest(
        name: mapValueOfType<String>(json, r'name'),
        key: mapValueOfType<String>(json, r'key'),
        description: mapValueOfType<String>(json, r'description'),
      );
    }
    return null;
  }

  static List<UpdateOrganizationPermissionRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdateOrganizationPermissionRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateOrganizationPermissionRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateOrganizationPermissionRequest> mapFromJson(
      dynamic json) {
    final map = <String, UpdateOrganizationPermissionRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateOrganizationPermissionRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateOrganizationPermissionRequest-objects as value to a dart map
  static Map<String, List<UpdateOrganizationPermissionRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UpdateOrganizationPermissionRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateOrganizationPermissionRequest.listFromJson(
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
