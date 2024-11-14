import 'package:json_annotation/json_annotation.dart';

import 'helpers.dart';
import 'verification.dart';

part 'passkey.g.dart';

@JsonSerializable()
class Passkey {
  Passkey({
    required this.id,
    required this.name,
    required this.verification,
    required this.lastUsedAt,
    required this.updatedAt,
    required this.createdAt,
  });

  final String id;
  final String name;
  final Verification verification;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? updatedAt;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? createdAt;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? lastUsedAt;

  static Passkey fromJson(Map<String, dynamic> json) => _$PasskeyFromJson(json);

  Map<String, dynamic> toJson() => _$PasskeyToJson(this);
}
