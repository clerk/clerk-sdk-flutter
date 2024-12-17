import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'phone_number.g.dart';

/// [PhoneNumber] Clerk object
@JsonSerializable()
class PhoneNumber extends UserIdentifyingData {
  /// Constructor
  const PhoneNumber({
    required super.id,
    required super.verification,
    required this.phoneNumber,
    required this.reserved,
    required this.reservedForSecondFactor,
    required this.defaultSecondFactor,
    required this.updatedAt,
    required this.createdAt,
  }) : super(type: IdentifierType.phoneNumber);

  /// phone number
  final String phoneNumber;

  /// reserved
  final bool reserved;

  /// reserved for second factor
  final bool reservedForSecondFactor;

  /// default second factor
  final bool defaultSecondFactor;

  /// updated at
  @JsonKey(fromJson: intToDateTime)
  final DateTime? updatedAt;

  /// created at
  @JsonKey(fromJson: intToDateTime)
  final DateTime? createdAt;

  @override
  String get identifier => phoneNumber;

  /// fromJson
  static PhoneNumber fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$PhoneNumberToJson(this);
}
