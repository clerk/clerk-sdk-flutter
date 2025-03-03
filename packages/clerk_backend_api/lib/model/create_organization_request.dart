//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateOrganizationRequest {
  /// Returns a new [CreateOrganizationRequest] instance.
  CreateOrganizationRequest({
    required this.name,
    this.createdBy,
    this.privateMetadata = const {},
    this.publicMetadata = const {},
    this.slug,
    this.maxAllowedMemberships,
    this.createdAt,
  });

  /// The name of the new organization. May not contain URLs or HTML. Max length: 256
  String name;

  /// The ID of the User who will become the administrator for the new organization
  String? createdBy;

  /// Metadata saved on the organization, accessible only from the Backend API
  Map<String, Object>? privateMetadata;

  /// Metadata saved on the organization, read-only from the Frontend API and fully accessible (read/write) from the Backend API
  Map<String, Object>? publicMetadata;

  /// A slug for the new organization. Can contain only lowercase alphanumeric characters and the dash \"-\". Must be unique for the instance.
  String? slug;

  /// The maximum number of memberships allowed for this organization
  ///
  /// Minimum value: 0
  int? maxAllowedMemberships;

  /// A custom date/time denoting _when_ the organization was created, specified in RFC3339 format (e.g. `2012-10-20T07:15:20.902Z`).
  String? createdAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateOrganizationRequest &&
          other.name == name &&
          other.createdBy == createdBy &&
          _deepEquality.equals(other.privateMetadata, privateMetadata) &&
          _deepEquality.equals(other.publicMetadata, publicMetadata) &&
          other.slug == slug &&
          other.maxAllowedMemberships == maxAllowedMemberships &&
          other.createdAt == createdAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name.hashCode) +
      (createdBy == null ? 0 : createdBy!.hashCode) +
      (privateMetadata == null ? 0 : privateMetadata!.hashCode) +
      (publicMetadata == null ? 0 : publicMetadata!.hashCode) +
      (slug == null ? 0 : slug!.hashCode) +
      (maxAllowedMemberships == null ? 0 : maxAllowedMemberships!.hashCode) +
      (createdAt == null ? 0 : createdAt!.hashCode);

  @override
  String toString() =>
      'CreateOrganizationRequest[name=$name, createdBy=$createdBy, privateMetadata=$privateMetadata, publicMetadata=$publicMetadata, slug=$slug, maxAllowedMemberships=$maxAllowedMemberships, createdAt=$createdAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'name'] = this.name;
    if (this.createdBy != null) {
      json[r'created_by'] = this.createdBy;
    } else {
      json[r'created_by'] = null;
    }
    if (this.privateMetadata != null) {
      json[r'private_metadata'] = this.privateMetadata;
    } else {
      json[r'private_metadata'] = null;
    }
    if (this.publicMetadata != null) {
      json[r'public_metadata'] = this.publicMetadata;
    } else {
      json[r'public_metadata'] = null;
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
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt;
    } else {
      json[r'created_at'] = null;
    }
    return json;
  }

  /// Returns a new [CreateOrganizationRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateOrganizationRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateOrganizationRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateOrganizationRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateOrganizationRequest(
        name: mapValueOfType<String>(json, r'name')!,
        createdBy: mapValueOfType<String>(json, r'created_by'),
        privateMetadata:
            mapCastOfType<String, Object>(json, r'private_metadata') ??
                const {},
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata') ?? const {},
        slug: mapValueOfType<String>(json, r'slug'),
        maxAllowedMemberships:
            mapValueOfType<int>(json, r'max_allowed_memberships'),
        createdAt: mapValueOfType<String>(json, r'created_at'),
      );
    }
    return null;
  }

  static List<CreateOrganizationRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateOrganizationRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateOrganizationRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateOrganizationRequest> mapFromJson(dynamic json) {
    final map = <String, CreateOrganizationRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateOrganizationRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateOrganizationRequest-objects as value to a dart map
  static Map<String, List<CreateOrganizationRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateOrganizationRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateOrganizationRequest.listFromJson(
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
  };
}
