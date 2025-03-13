import 'package:clerk_auth/src/models/client/organization.dart';
import 'package:clerk_auth/src/models/client/permission.dart';
import 'package:clerk_auth/src/models/client/user_public.dart';
import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'organization_membership.g.dart';

/// [OrganizationMembership] Clerk object
@immutable
@JsonSerializable()
class OrganizationMembership with InformativeToStringMixin {
  /// Constructor
  const OrganizationMembership({
    required this.id,
    required this.role,
    required this.roleName,
    required this.updatedAt,
    required this.createdAt,
    required this.organization,
    required this.publicUserData,
    required this.permissions,
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

  /// permissions
  @JsonKey(fromJson: _fromPermissionsList)
  final List<Permission> permissions;

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
  @override
  Map<String, dynamic> toJson() => _$OrganizationMembershipToJson(this);

  /// Do we have a [Permission]?
  bool hasPermission(Permission permission) => permissions.contains(permission);
}

List<Permission> _fromPermissionsList(dynamic data) {
  if (data case List<dynamic> data) {
    return data.map(Permission.fromJson).toList(growable: false);
  }
  return const [];
}
