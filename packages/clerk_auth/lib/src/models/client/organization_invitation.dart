import 'package:clerk_auth/src/models/client/public_organization_data.dart';
import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'organization_invitation.g.dart';

/// [OrganizationInvitation] Clerk object
@immutable
@JsonSerializable()
class OrganizationInvitation with InformativeToStringMixin {
  /// Constructor
  const OrganizationInvitation({
    required this.id,
    required this.status,
    required this.roleName,
    required this.organizationData,
    required this.updatedAt,
    required this.createdAt,
  });

  /// id
  final String id;

  /// status
  final Status status;

  /// role
  final String roleName;

  /// organization data
  final PublicOrganizationData organizationData;

  /// updated at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime updatedAt;

  /// created at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime createdAt;

  /// fromJson
  static OrganizationInvitation fromJson(dynamic json) =>
      _$OrganizationInvitationFromJson(json as Map<String, dynamic>);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$OrganizationInvitationToJson(this);
}
