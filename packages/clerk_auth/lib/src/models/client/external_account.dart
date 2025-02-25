import 'package:clerk_auth/src/models/client/verification.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'external_account.g.dart';

/// [ExternalAccount] Clerk object
@immutable
@JsonSerializable()
class ExternalAccount {
  /// Constructor
  const ExternalAccount({
    required this.id,
    required this.provider,
    required this.providerUserId,
    required this.approvedScopes,
    required this.emailAddress,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.avatarUrl,
    required this.imageUrl,
    required this.label,
    required this.publicMetadata,
    required this.verification,
    required this.updatedAt,
    required this.createdAt,
  });

  /// id
  final String id;

  /// Provider
  final String provider;

  /// Provider user id
  final String providerUserId;

  /// Approved scopes
  final String approvedScopes;

  /// email address
  final String emailAddress;

  /// username
  final String? username;

  /// first name
  final String? firstName;

  /// last name
  final String? lastName;

  /// avatar url
  final String? avatarUrl;

  /// image url
  final String? imageUrl;

  /// label
  final String? label;

  /// public metadata
  final Map<String, dynamic>? publicMetadata;

  /// Verification
  final Verification verification;

  /// updated at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime updatedAt;

  /// created at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime createdAt;

  /// is verified?
  bool get isVerified => verification.status.isVerified;

  /// is in error?
  bool get isInError => verification.errorMessage is String;

  /// is expired?
  bool get isExpired => verification.status.isExpired;

  /// fromJson
  static ExternalAccount fromJson(Map<String, dynamic> json) =>
      _$ExternalAccountFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$ExternalAccountToJson(this);
}
