import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'verification.g.dart';

@JsonSerializable()
class Verification {
  const Verification({
    required this.status,
    required this.strategy,
    required this.attempts,
    required this.expireAt,
    this.providerUrl,
    this.nonce,
  });

  final Status status;
  final Strategy strategy;
  final int? attempts;
  final String? nonce;

  @JsonKey(name: 'external_verification_redirect_url')
  final String? providerUrl;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? expireAt;

  static Verification fromJson(Map<String, dynamic> json) =>
      _$VerificationFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationToJson(this);
}
