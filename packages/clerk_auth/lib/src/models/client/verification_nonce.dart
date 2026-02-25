import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'verification_nonce.g.dart';

/// [Verification] Clerk object
@immutable
@JsonSerializable()
class VerificationNonce with InformativeToStringMixin {
  /// Constructor
  const VerificationNonce({
    required this.challenge,
    required this.rpId,
    required this.timeout,
    this.userVerification,
  });

  /// challenge
  final String challenge;

  /// strategy
  @JsonKey(defaultValue: 30000)
  final int timeout;

  /// is user verification required?
  final String? userVerification;

  /// rpid
  @JsonKey(name: 'rpId')
  final String rpId;

  /// fromJson
  static VerificationNonce fromJson(Map<String, dynamic> json) =>
      _$VerificationNonceFromJson(json);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$VerificationNonceToJson(this);
}
