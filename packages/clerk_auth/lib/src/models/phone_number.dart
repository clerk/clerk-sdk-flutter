import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'phone_number.g.dart';

@JsonSerializable()
class PhoneNumber extends UserIdentifyingData {
  const PhoneNumber({
    required super.id,
    required this.phoneNumber,
    required this.reserved,
    required this.reservedForSecondFactor,
    required this.defaultSecondFactor,
    required this.verification,
    required this.updatedAt,
    required this.createdAt,
  });

  final String phoneNumber;
  final bool reserved;
  final bool reservedForSecondFactor;
  final bool defaultSecondFactor;
  final Verification? verification;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? updatedAt;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? createdAt;

  @override
  String get identifier => phoneNumber;

  static PhoneNumber fromJson(Map<String, dynamic> json) => _$PhoneNumberFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneNumberToJson(this);
}
