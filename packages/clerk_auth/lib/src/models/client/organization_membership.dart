import 'package:clerk_auth/src/models/client/organization.dart';
import 'package:clerk_auth/src/models/client/user_public.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organization_membership.g.dart';

/// [OrganizationMembership] Clerk object
@JsonSerializable()
class OrganizationMembership {
  /// Constructor
  const OrganizationMembership({
    required this.id,
    required this.role,
    required this.roleName,
    required this.updatedAt,
    required this.createdAt,
    required this.organization,
    required this.publicUserData,
  });

  /// id
  final String id;

  /// role
  final String role;

  /// role name
  final String roleName;

  /// organization
  final Organization organization;

  /// public user data
  final UserPublic? publicUserData;

  /// updated at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime updatedAt;

  /// created at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime createdAt;

  /// fromJson
  static OrganizationMembership fromJson(Map<String, dynamic> json) =>
      _$OrganizationMembershipFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$OrganizationMembershipToJson(this);
}
