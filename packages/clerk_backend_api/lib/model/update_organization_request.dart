//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateOrganizationRequest {
  /// Returns a new [UpdateOrganizationRequest] instance.
  UpdateOrganizationRequest({
    this.publicMetadata = const {},
    this.privateMetadata = const {},
    this.name,
    this.slug,
    this.maxAllowedMemberships,
    this.adminDeleteEnabled,
    this.createdAt,
  });

  /// Metadata saved on the organization, that is visible to both your frontend and backend.
  Map<String, Object>? publicMetadata;

  /// Metadata saved on the organization that is only visible to your backend.
  Map<String, Object>? privateMetadata;

  /// The new name of the organization. May not contain URLs or HTML. Max length: 256
  String? name;

  /// The new slug of the organization, which needs to be unique in the instance
  String? slug;

  /// The maximum number of memberships allowed for this organization
  ///
  /// Minimum value: 0
  int? maxAllowedMemberships;

  /// If true, an admin can delete this organization with the Frontend API.
  bool? adminDeleteEnabled;

  /// A custom date/time denoting _when_ the organization was created, specified in RFC3339 format (e.g. `2012-10-20T07:15:20.902Z`).
  String? createdAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateOrganizationRequest &&
          _deepEquality.equals(other.publicMetadata, publicMetadata) &&
          _deepEquality.equals(other.privateMetadata, privateMetadata) &&
          other.name == name &&
          other.slug == slug &&
          other.maxAllowedMemberships == maxAllowedMemberships &&
          other.adminDeleteEnabled == adminDeleteEnabled &&
          other.createdAt == createdAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (publicMetadata == null ? 0 : publicMetadata!.hashCode) +
      (privateMetadata == null ? 0 : privateMetadata!.hashCode) +
      (name == null ? 0 : name!.hashCode) +
      (slug == null ? 0 : slug!.hashCode) +
      (maxAllowedMemberships == null ? 0 : maxAllowedMemberships!.hashCode) +
      (adminDeleteEnabled == null ? 0 : adminDeleteEnabled!.hashCode) +
      (createdAt == null ? 0 : createdAt!.hashCode);

  @override
  String toString() =>
      'UpdateOrganizationRequest[publicMetadata=$publicMetadata, privateMetadata=$privateMetadata, name=$name, slug=$slug, maxAllowedMemberships=$maxAllowedMemberships, adminDeleteEnabled=$adminDeleteEnabled, createdAt=$createdAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.publicMetadata != null) {
      json[r'public_metadata'] = this.publicMetadata;
    } else {
      json[r'public_metadata'] = null;
    }
    if (this.privateMetadata != null) {
      json[r'private_metadata'] = this.privateMetadata;
    } else {
      json[r'private_metadata'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.slug != null) {
      json[r'slug'] = this.slug;
    } else {
      json[r'slug'] = null;
    }
    if (this.maxAllowedMemberships != null) {
      json[r'max_allowed_memberships'] = this.maxAllowedMemberships;
    } else {
      json[r'max_allowed_memberships'] = null;
    }
    if (this.adminDeleteEnabled != null) {
      json[r'admin_delete_enabled'] = this.adminDeleteEnabled;
    } else {
      json[r'admin_delete_enabled'] = null;
    }
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt;
    } else {
      json[r'created_at'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateOrganizationRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateOrganizationRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UpdateOrganizationRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UpdateOrganizationRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateOrganizationRequest(
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata') ?? const {},
        privateMetadata:
            mapCastOfType<String, Object>(json, r'private_metadata') ??
                const {},
        name: mapValueOfType<String>(json, r'name'),
        slug: mapValueOfType<String>(json, r'slug'),
        maxAllowedMemberships:
            mapValueOfType<int>(json, r'max_allowed_memberships'),
        adminDeleteEnabled: mapValueOfType<bool>(json, r'admin_delete_enabled'),
        createdAt: mapValueOfType<String>(json, r'created_at'),
      );
    }
    return null;
  }

  static List<UpdateOrganizationRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdateOrganizationRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateOrganizationRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateOrganizationRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateOrganizationRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateOrganizationRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateOrganizationRequest-objects as value to a dart map
  static Map<String, List<UpdateOrganizationRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UpdateOrganizationRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateOrganizationRequest.listFromJson(
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
