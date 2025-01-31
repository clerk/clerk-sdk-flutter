import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/enums.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verification.g.dart';

/// [Verification] Clerk object
@JsonSerializable()
class Verification {
  /// Constructor
  const Verification({
    required this.status,
    required this.strategy,
    required this.attempts,
    required this.expireAt,
    this.providerUrl,
    this.nonce,
  });

  /// status
  final Status status;

  /// strategy
  final Strategy strategy;

  /// attempts
  final int? attempts;

  /// nonce
  final String? nonce;

  /// provider url
  @JsonKey(name: 'external_verification_redirect_url')
  final String? providerUrl;

  /// expire at
  @JsonKey(fromJson: intToDateTime)
  final DateTime? expireAt;

  /// fromJson
  static Verification fromJson(Map<String, dynamic> json) =>
      _$VerificationFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$VerificationToJson(this);
}
