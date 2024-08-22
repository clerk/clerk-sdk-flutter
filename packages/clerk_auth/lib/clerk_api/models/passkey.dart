import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'passkey.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Passkey {
  final String id;
  final String name;
  final Verification verification;
  final DateTime lastUsedAt;
  final DateTime updatedAt;
  final DateTime createdAt;

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
