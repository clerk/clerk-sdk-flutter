import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'email.g.dart';

@JsonSerializable()
class Email extends UserIdentifyingData {
  const Email({
    required super.id,
    required this.emailAddress,
    required this.reserved,
    required this.verification,
    required this.updatedAt,
    required this.createdAt,
  });

  final String emailAddress;
  final bool reserved;
  final Verification? verification;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? updatedAt;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? createdAt;

  @override
  String get identifier => emailAddress;

  static Email fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);

  Map<String, dynamic> toJson() => _$EmailToJson(this);
}
