import 'package:json_annotation/json_annotation.dart';

import 'helpers.dart';

part 'organization.g.dart';

@JsonSerializable()
class Organization {
  const Organization({
    required this.id,
    required this.name,
    required this.maxAllowedMemberships,
    required this.adminDeleteEnabled,
    required this.slug,
    required this.logoUrl,
    required this.imageUrl,
    required this.hasImage,
    required this.membersCount,
    required this.pendingInvitationsCount,
    required this.publicMetadata,
    required this.updatedAt,
    required this.createdAt,
  });

  final String id;
  final String name;
  final int maxAllowedMemberships;
  final bool adminDeleteEnabled;
  final String slug;
  final String logoUrl;
  final String imageUrl;
  final bool hasImage;
  final int membersCount;
  final int pendingInvitationsCount;
  final Map<String, dynamic> publicMetadata;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? updatedAt;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? createdAt;

  static Organization fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}
