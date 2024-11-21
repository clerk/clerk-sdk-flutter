// ignore_for_file: public_member_api_docs
// See https://clerk.com/docs/reference/frontend-api for
// more details

import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'organization_membership.g.dart';

@JsonSerializable()
class OrganizationMembership {
  const OrganizationMembership({
    required this.id,
    required this.role,
    required this.updatedAt,
    required this.createdAt,
    required this.organization,
    required this.publicUserData,
  });

  final String id;
  final String role;
  final Organization organization;
  final UserPublic publicUserData;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? updatedAt;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? createdAt;

  static OrganizationMembership fromJson(Map<String, dynamic> json) =>
      _$OrganizationMembershipFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationMembershipToJson(this);
}
