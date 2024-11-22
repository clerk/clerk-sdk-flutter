import 'package:json_annotation/json_annotation.dart';

import 'helpers.dart';
import 'verification.dart';

part 'passkey.g.dart';

/// [Passkey] Clerk object
@JsonSerializable()
class Passkey {
  /// Constructor
  const Passkey({
    required this.id,
    required this.name,
    required this.verification,
    required this.lastUsedAt,
    required this.updatedAt,
    required this.createdAt,
  });

  /// id
  final String id;

  /// name
  final String name;

  /// verification
  final Verification verification;

  /// updated at
  @JsonKey(fromJson: intToDateTime)
  final DateTime? updatedAt;

  /// created at
  @JsonKey(fromJson: intToDateTime)
  final DateTime? createdAt;

  /// last used at
  @JsonKey(fromJson: intToDateTime)
  final DateTime? lastUsedAt;

  /// fromJson
  static Passkey fromJson(Map<String, dynamic> json) => _$PasskeyFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$PasskeyToJson(this);
}
