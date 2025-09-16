import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:clerk_auth/src/utils/extensions.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'organization.g.dart';

/// [Organization] Clerk object
@immutable
@JsonSerializable()
class Organization with InformativeToStringMixin {
  /// Constructor
  const Organization({
    this.id = '',
    this.name = '',
    this.maxAllowedMemberships = 0,
    this.adminDeleteEnabled = false,
    this.slug = '',
    this.logoUrl = '',
    this.imageUrl = '',
    this.hasImage = false,
    this.membersCount = 0,
    this.pendingInvitationsCount = 0,
    this.publicMetadata = const {},
    this.updatedAt = DateTimeExt.epoch,
    this.createdAt = DateTimeExt.epoch,
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
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime updatedAt;

  /// created at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime createdAt;

  /// A dummy personal [Organization] used internally
  static const personal = Organization();

  /// fromJson
  static Organization fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$OrganizationToJson(this);

  /// Do we have unlimited membership?
  bool get hasUnlimitedMembership => maxAllowedMemberships == 0;

  /// Is this the personal account?
  bool get isPersonal => this == personal;
}
