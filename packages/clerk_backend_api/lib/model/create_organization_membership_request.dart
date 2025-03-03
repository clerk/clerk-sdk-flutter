//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateOrganizationMembershipRequest {
  /// Returns a new [CreateOrganizationMembershipRequest] instance.
  CreateOrganizationMembershipRequest({
    required this.userId,
    required this.role,
  });

  /// The ID of the user that will be added as a member in the organization. The user needs to exist in the same instance as the organization and must not be a member of the given organization already.
  String userId;

  /// The role that the new member will have in the organization.
  String role;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateOrganizationMembershipRequest &&
          other.userId == userId &&
          other.role == role;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (userId.hashCode) + (role.hashCode);

  @override
  String toString() =>
      'CreateOrganizationMembershipRequest[userId=$userId, role=$role]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'user_id'] = this.userId;
    json[r'role'] = this.role;
    return json;
  }

  /// Returns a new [CreateOrganizationMembershipRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateOrganizationMembershipRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateOrganizationMembershipRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateOrganizationMembershipRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateOrganizationMembershipRequest(
        userId: mapValueOfType<String>(json, r'user_id')!,
        role: mapValueOfType<String>(json, r'role')!,
      );
    }
    return null;
  }

  static List<CreateOrganizationMembershipRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateOrganizationMembershipRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateOrganizationMembershipRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateOrganizationMembershipRequest> mapFromJson(
      dynamic json) {
    final map = <String, CreateOrganizationMembershipRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateOrganizationMembershipRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateOrganizationMembershipRequest-objects as value to a dart map
  static Map<String, List<CreateOrganizationMembershipRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateOrganizationMembershipRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateOrganizationMembershipRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'user_id',
    'role',
  };
}
