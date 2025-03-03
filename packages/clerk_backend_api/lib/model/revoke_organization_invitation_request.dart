//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RevokeOrganizationInvitationRequest {
  /// Returns a new [RevokeOrganizationInvitationRequest] instance.
  RevokeOrganizationInvitationRequest({
    this.requestingUserId,
  });

  /// The ID of the user that revokes the invitation. Must be an administrator in the organization.
  String? requestingUserId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RevokeOrganizationInvitationRequest &&
          other.requestingUserId == requestingUserId;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (requestingUserId == null ? 0 : requestingUserId!.hashCode);

  @override
  String toString() =>
      'RevokeOrganizationInvitationRequest[requestingUserId=$requestingUserId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.requestingUserId != null) {
      json[r'requesting_user_id'] = this.requestingUserId;
    } else {
      json[r'requesting_user_id'] = null;
    }
    return json;
  }

  /// Returns a new [RevokeOrganizationInvitationRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RevokeOrganizationInvitationRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "RevokeOrganizationInvitationRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "RevokeOrganizationInvitationRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RevokeOrganizationInvitationRequest(
        requestingUserId: mapValueOfType<String>(json, r'requesting_user_id'),
      );
    }
    return null;
  }

  static List<RevokeOrganizationInvitationRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RevokeOrganizationInvitationRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RevokeOrganizationInvitationRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RevokeOrganizationInvitationRequest> mapFromJson(
      dynamic json) {
    final map = <String, RevokeOrganizationInvitationRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RevokeOrganizationInvitationRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RevokeOrganizationInvitationRequest-objects as value to a dart map
  static Map<String, List<RevokeOrganizationInvitationRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<RevokeOrganizationInvitationRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RevokeOrganizationInvitationRequest.listFromJson(
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
