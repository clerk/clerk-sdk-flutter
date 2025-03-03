//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateOrganizationInvitationRequest {
  /// Returns a new [CreateOrganizationInvitationRequest] instance.
  CreateOrganizationInvitationRequest({
    required this.emailAddress,
    this.inviterUserId,
    required this.role,
    this.publicMetadata = const {},
    this.privateMetadata = const {},
    this.redirectUrl,
    this.expiresInDays,
  });

  /// The email address of the new member that is going to be invited to the organization
  String emailAddress;

  /// The ID of the user that invites the new member to the organization. Must be an administrator in the organization.
  String? inviterUserId;

  /// The role of the new member in the organization
  String role;

  /// Metadata saved on the organization invitation, read-only from the Frontend API and fully accessible (read/write) from the Backend API. When the organization invitation is accepted, the metadata will be transferred to the newly created organization membership.
  Map<String, Object>? publicMetadata;

  /// Metadata saved on the organization invitation, fully accessible (read/write) from the Backend API but not visible from the Frontend API. When the organization invitation is accepted, the metadata will be transferred to the newly created organization membership.
  Map<String, Object>? privateMetadata;

  /// Optional URL that the invitee will be redirected to once they accept the invitation by clicking the join link in the invitation email.
  String? redirectUrl;

  /// The number of days the invitation will be valid for. By default, the invitation has a 30 days expire.
  ///
  /// Minimum value: 1
  /// Maximum value: 365
  int? expiresInDays;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateOrganizationInvitationRequest &&
          other.emailAddress == emailAddress &&
          other.inviterUserId == inviterUserId &&
          other.role == role &&
          _deepEquality.equals(other.publicMetadata, publicMetadata) &&
          _deepEquality.equals(other.privateMetadata, privateMetadata) &&
          other.redirectUrl == redirectUrl &&
          other.expiresInDays == expiresInDays;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (emailAddress.hashCode) +
      (inviterUserId == null ? 0 : inviterUserId!.hashCode) +
      (role.hashCode) +
      (publicMetadata == null ? 0 : publicMetadata!.hashCode) +
      (privateMetadata == null ? 0 : privateMetadata!.hashCode) +
      (redirectUrl == null ? 0 : redirectUrl!.hashCode) +
      (expiresInDays == null ? 0 : expiresInDays!.hashCode);

  @override
  String toString() =>
      'CreateOrganizationInvitationRequest[emailAddress=$emailAddress, inviterUserId=$inviterUserId, role=$role, publicMetadata=$publicMetadata, privateMetadata=$privateMetadata, redirectUrl=$redirectUrl, expiresInDays=$expiresInDays]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'email_address'] = this.emailAddress;
    if (this.inviterUserId != null) {
      json[r'inviter_user_id'] = this.inviterUserId;
    } else {
      json[r'inviter_user_id'] = null;
    }
    json[r'role'] = this.role;
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
    if (this.redirectUrl != null) {
      json[r'redirect_url'] = this.redirectUrl;
    } else {
      json[r'redirect_url'] = null;
    }
    if (this.expiresInDays != null) {
      json[r'expires_in_days'] = this.expiresInDays;
    } else {
      json[r'expires_in_days'] = null;
    }
    return json;
  }

  /// Returns a new [CreateOrganizationInvitationRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateOrganizationInvitationRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateOrganizationInvitationRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateOrganizationInvitationRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateOrganizationInvitationRequest(
        emailAddress: mapValueOfType<String>(json, r'email_address')!,
        inviterUserId: mapValueOfType<String>(json, r'inviter_user_id'),
        role: mapValueOfType<String>(json, r'role')!,
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata') ?? const {},
        privateMetadata:
            mapCastOfType<String, Object>(json, r'private_metadata') ??
                const {},
        redirectUrl: mapValueOfType<String>(json, r'redirect_url'),
        expiresInDays: mapValueOfType<int>(json, r'expires_in_days'),
      );
    }
    return null;
  }

  static List<CreateOrganizationInvitationRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateOrganizationInvitationRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateOrganizationInvitationRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateOrganizationInvitationRequest> mapFromJson(
      dynamic json) {
    final map = <String, CreateOrganizationInvitationRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateOrganizationInvitationRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateOrganizationInvitationRequest-objects as value to a dart map
  static Map<String, List<CreateOrganizationInvitationRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateOrganizationInvitationRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateOrganizationInvitationRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'email_address',
    'role',
  };
}
