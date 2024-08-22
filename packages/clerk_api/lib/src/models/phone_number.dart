import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'phone_number.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PhoneNumber {
  final String id;
  final String phoneNumber;
  final bool reserved;
  final bool reservedForSecondFactor;
  final bool defaultSecondFactor;
  final Verification verification;
  final DateTime updatedAt;
  final DateTime createdAt;

  PhoneNumber({
    required this.id,
    required this.phoneNumber,
    required this.reserved,
    required this.reservedForSecondFactor,
    required this.defaultSecondFactor,
    required this.verification,
    required this.updatedAt,
    required this.createdAt,
  });

  factory PhoneNumber.fromJson(Map<String, dynamic> json) => _$PhoneNumberFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneNumberToJson(this);
}
