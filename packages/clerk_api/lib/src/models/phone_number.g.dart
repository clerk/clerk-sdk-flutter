// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneNumber _$PhoneNumberFromJson(Map<String, dynamic> json) => PhoneNumber(
      id: json['id'] as String,
      phoneNumber: json['phone_number'] as String,
      reserved: json['reserved'] as bool,
      reservedForSecondFactor: json['reserved_for_second_factor'] as bool,
      defaultSecondFactor: json['default_second_factor'] as bool,
      verification:
          Verification.fromJson(json['verification'] as Map<String, dynamic>),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$PhoneNumberToJson(PhoneNumber instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone_number': instance.phoneNumber,
      'reserved': instance.reserved,
      'reserved_for_second_factor': instance.reservedForSecondFactor,
      'default_second_factor': instance.defaultSecondFactor,
      'verification': instance.verification,
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
    };
