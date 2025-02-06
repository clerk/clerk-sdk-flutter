// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneNumber _$PhoneNumberFromJson(Map<String, dynamic> json) => PhoneNumber(
      id: json['id'] as String,
      verification: json['verification'] == null
          ? null
          : Verification.fromJson(json['verification'] as Map<String, dynamic>),
      phoneNumber: json['phone_number'] as String,
      reserved: json['reserved'] as bool,
      reservedForSecondFactor: json['reserved_for_second_factor'] as bool,
      defaultSecondFactor: json['default_second_factor'] as bool,
      updatedAt: intToDateTime(json['updated_at']),
      createdAt: intToDateTime(json['created_at']),
    );

Map<String, dynamic> _$PhoneNumberToJson(PhoneNumber instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('verification', instance.verification?.toJson());
  val['phone_number'] = instance.phoneNumber;
  val['reserved'] = instance.reserved;
  val['reserved_for_second_factor'] = instance.reservedForSecondFactor;
  val['default_second_factor'] = instance.defaultSecondFactor;
  val['updated_at'] = dateTimeToInt(instance.updatedAt);
  val['created_at'] = dateTimeToInt(instance.createdAt);
  return val;
}
