//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateInstanceOrganizationSettingsRequest {
  /// Returns a new [UpdateInstanceOrganizationSettingsRequest] instance.
  UpdateInstanceOrganizationSettingsRequest({
    this.enabled,
    this.maxAllowedMemberships,
    this.adminDeleteEnabled,
    this.domainsEnabled,
    this.domainsEnrollmentModes = const [],
    this.creatorRoleId,
    this.domainsDefaultRoleId,
  });

  bool? enabled;

  int? maxAllowedMemberships;

  bool? adminDeleteEnabled;

  bool? domainsEnabled;

  /// Specify which enrollment modes to enable for your Organization Domains. Supported modes are 'automatic_invitation' & 'automatic_suggestion'.
  List<String> domainsEnrollmentModes;

  /// Specify what the default organization role is for an organization creator.
  String? creatorRoleId;

  /// Specify what the default organization role is for the organization domains.
  String? domainsDefaultRoleId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateInstanceOrganizationSettingsRequest &&
          other.enabled == enabled &&
          other.maxAllowedMemberships == maxAllowedMemberships &&
          other.adminDeleteEnabled == adminDeleteEnabled &&
          other.domainsEnabled == domainsEnabled &&
          _deepEquality.equals(
              other.domainsEnrollmentModes, domainsEnrollmentModes) &&
          other.creatorRoleId == creatorRoleId &&
          other.domainsDefaultRoleId == domainsDefaultRoleId;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (enabled == null ? 0 : enabled!.hashCode) +
      (maxAllowedMemberships == null ? 0 : maxAllowedMemberships!.hashCode) +
      (adminDeleteEnabled == null ? 0 : adminDeleteEnabled!.hashCode) +
      (domainsEnabled == null ? 0 : domainsEnabled!.hashCode) +
      (domainsEnrollmentModes.hashCode) +
      (creatorRoleId == null ? 0 : creatorRoleId!.hashCode) +
      (domainsDefaultRoleId == null ? 0 : domainsDefaultRoleId!.hashCode);

  @override
  String toString() =>
      'UpdateInstanceOrganizationSettingsRequest[enabled=$enabled, maxAllowedMemberships=$maxAllowedMemberships, adminDeleteEnabled=$adminDeleteEnabled, domainsEnabled=$domainsEnabled, domainsEnrollmentModes=$domainsEnrollmentModes, creatorRoleId=$creatorRoleId, domainsDefaultRoleId=$domainsDefaultRoleId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.enabled != null) {
      json[r'enabled'] = this.enabled;
    } else {
      json[r'enabled'] = null;
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
    if (this.domainsEnabled != null) {
      json[r'domains_enabled'] = this.domainsEnabled;
    } else {
      json[r'domains_enabled'] = null;
    }
    json[r'domains_enrollment_modes'] = this.domainsEnrollmentModes;
    if (this.creatorRoleId != null) {
      json[r'creator_role_id'] = this.creatorRoleId;
    } else {
      json[r'creator_role_id'] = null;
    }
    if (this.domainsDefaultRoleId != null) {
      json[r'domains_default_role_id'] = this.domainsDefaultRoleId;
    } else {
      json[r'domains_default_role_id'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateInstanceOrganizationSettingsRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateInstanceOrganizationSettingsRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UpdateInstanceOrganizationSettingsRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UpdateInstanceOrganizationSettingsRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateInstanceOrganizationSettingsRequest(
        enabled: mapValueOfType<bool>(json, r'enabled'),
        maxAllowedMemberships:
            mapValueOfType<int>(json, r'max_allowed_memberships'),
        adminDeleteEnabled: mapValueOfType<bool>(json, r'admin_delete_enabled'),
        domainsEnabled: mapValueOfType<bool>(json, r'domains_enabled'),
        domainsEnrollmentModes: json[r'domains_enrollment_modes'] is Iterable
            ? (json[r'domains_enrollment_modes'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        creatorRoleId: mapValueOfType<String>(json, r'creator_role_id'),
        domainsDefaultRoleId:
            mapValueOfType<String>(json, r'domains_default_role_id'),
      );
    }
    return null;
  }

  static List<UpdateInstanceOrganizationSettingsRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdateInstanceOrganizationSettingsRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateInstanceOrganizationSettingsRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateInstanceOrganizationSettingsRequest> mapFromJson(
      dynamic json) {
    final map = <String, UpdateInstanceOrganizationSettingsRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            UpdateInstanceOrganizationSettingsRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateInstanceOrganizationSettingsRequest-objects as value to a dart map
  static Map<String, List<UpdateInstanceOrganizationSettingsRequest>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UpdateInstanceOrganizationSettingsRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateInstanceOrganizationSettingsRequest.listFromJson(
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
