import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'email.g.dart';

/// [Email] Clerk object
@JsonSerializable()
class Email extends UserIdentifyingData {
  /// Constructor
  const Email({
    required super.id,
    required this.emailAddress,
    required this.reserved,
    required this.verification,
    required this.updatedAt,
    required this.createdAt,
  });

  /// email address
  final String emailAddress;

  /// reserved?
  final bool reserved;

  /// verification
  final Verification? verification;

  /// updated at
  @JsonKey(fromJson: intToDateTime)
  final DateTime? updatedAt;

  /// created at
  @JsonKey(fromJson: intToDateTime)
  final DateTime? createdAt;

  @override
  String get identifier => emailAddress;

  /// fromJson
  static Email fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$EmailToJson(this);
}
