import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organization.g.dart';

/// [Organization] Clerk object
@JsonSerializable()
class Organization {
  /// Constructor
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

  /// id
  final String id;

  /// name
  final String name;

  /// max allowed memberships
  final int maxAllowedMemberships;

  /// admin delete enabled
  final bool adminDeleteEnabled;

  /// slug
  final String slug;

  /// logo url
  final String logoUrl;

  /// image url
  final String imageUrl;

  /// has image
  final bool hasImage;

  /// members count
  final int membersCount;

  /// pending invitations count
  final int pendingInvitationsCount;

  /// public metadata
  final Map<String, dynamic> publicMetadata;

  /// updated at
  @JsonKey(fromJson: intToDateTime)
  final DateTime? updatedAt;

  /// created at
  @JsonKey(fromJson: intToDateTime)
  final DateTime? createdAt;

  /// fromJson
  static Organization fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}
