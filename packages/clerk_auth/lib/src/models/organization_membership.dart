import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'organization_membership.g.dart';

/// [OrganizationMembership] Clerk object
@JsonSerializable()
class OrganizationMembership {
  /// Constructor
  const OrganizationMembership({
    required this.id,
    required this.role,
    required this.updatedAt,
    required this.createdAt,
    required this.organization,
    required this.publicUserData,
  });

  /// id
  final String id;

  /// role
  final String role;

  /// organization
  final Organization organization;

  /// public user data
  final UserPublic publicUserData;

  /// updated at
  @JsonKey(fromJson: intToDateTime)
  final DateTime? updatedAt;

  /// created at
  @JsonKey(fromJson: intToDateTime)
  final DateTime? createdAt;

  /// fromJson
  static OrganizationMembership fromJson(Map<String, dynamic> json) =>
      _$OrganizationMembershipFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$OrganizationMembershipToJson(this);
}
