import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'verification.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Verification {
  final Status status;
  final Strategy strategy;
  final int attempts;
  final int expireAt;
  final String? nonce;

  const Verification({
    required this.status,
    required this.strategy,
    required this.attempts,
    required this.expireAt,
    this.nonce,
  });

  factory Verification.fromJson(Map<String, dynamic> json) => _$VerificationFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationToJson(this);
}
