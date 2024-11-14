// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_attribute_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAttributeData _$UserAttributeDataFromJson(Map<String, dynamic> json) =>
    UserAttributeData(
      isEnabled: json['enabled'] == null ? true : isTrue(json['enabled']),
      isRequired: json['required'] == null ? true : isTrue(json['required']),
      usedForFirstFactor: json['used_for_first_factor'] == null
          ? false
          : isTrue(json['used_for_first_factor']),
      firstFactors: json['first_factors'] == null
          ? const []
          : toStrategyList(json['first_factors']),
      userForSecondFactor: json['user_for_second_factor'] == null
          ? false
          : isTrue(json['user_for_second_factor']),
      secondFactors: json['second_factors'] == null
          ? const []
          : toStrategyList(json['second_factors']),
      verifyAtSignUp: json['verify_at_sign_up'] == null
          ? false
          : isTrue(json['verify_at_sign_up']),
      verifications: json['verifications'] == null
          ? const []
          : toStrategyList(json['verifications']),
    );

Map<String, dynamic> _$UserAttributeDataToJson(UserAttributeData instance) =>
    <String, dynamic>{
      'first_factors': instance.firstFactors.map((e) => e.toJson()).toList(),
      'second_factors': instance.secondFactors.map((e) => e.toJson()).toList(),
      'verifications': instance.verifications.map((e) => e.toJson()).toList(),
      'used_for_first_factor': instance.usedForFirstFactor,
      'user_for_second_factor': instance.userForSecondFactor,
      'verify_at_sign_up': instance.verifyAtSignUp,
      'enabled': instance.isEnabled,
      'required': instance.isRequired,
    };
