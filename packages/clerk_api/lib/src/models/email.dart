import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'email.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Email {
  final String id;
  final String emailAddress;
  final bool reserved;
  final Verification verification;
  final DateTime updatedAt;
  final DateTime createdAt;

  Email({
    required this.id,
    required this.emailAddress,
    required this.reserved,
    required this.verification,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Email.fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);

  Map<String, dynamic> toJson() => _$EmailToJson(this);
}
