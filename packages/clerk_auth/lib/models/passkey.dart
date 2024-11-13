import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'passkey.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Passkey {
  final String id;
  final String name;
  final Verification verification;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? updatedAt;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? createdAt;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? lastUsedAt;

  Passkey({
    required this.id,
    required this.name,
    required this.verification,
    required this.lastUsedAt,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Passkey.fromJson(Map<String, dynamic> json) => _$PasskeyFromJson(json);

  Map<String, dynamic> toJson() => _$PasskeyToJson(this);
}