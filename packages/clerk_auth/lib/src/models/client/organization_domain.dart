import 'package:clerk_auth/clerk_auth.dart';
import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'organization_domain.g.dart';

/// [OrganizationDomain] Clerk object
@immutable
@JsonSerializable()
class OrganizationDomain with InformativeToStringMixin {
  /// Constructor
  const OrganizationDomain({
    required this.id,
    required this.orgId,
    required this.name,
    required this.enrollmentMode,
    required this.affiliationEmailAddress,
    required this.verification,
    required this.totalPendingInvitations,
    required this.totalPendingSuggestions,
    required this.updatedAt,
    required this.createdAt,
  });

  /// id
  final String id;

  /// organization id
  @JsonKey(name: 'organization_id')
  final String orgId;

  /// name
  final String name;

  /// enrollment mode
  final EnrollmentMode enrollmentMode;

  /// affiliation email address
  final String? affiliationEmailAddress;

  /// verification
  final Verification? verification;

  /// total pending invitations
  final int totalPendingInvitations;

  /// total pending suggestions
  final int totalPendingSuggestions;

  /// updated at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime updatedAt;

  /// created at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime createdAt;

  /// fromJson
  static OrganizationDomain fromJson(dynamic json) =>
      _$OrganizationDomainFromJson(json as Map<String, dynamic>);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$OrganizationDomainToJson(this);

  /// has this domain been verified?
  bool get isVerified => verification?.status == Status.verified;

  @override
  bool operator ==(Object other) {
    if (other case OrganizationDomain other) {
      return id == other.id;
    }
    return false;
  }

  @override
  int get hashCode => id.hashCode;
}
