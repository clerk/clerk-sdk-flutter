// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInSettings _$SignInSettingsFromJson(Map<String, dynamic> json) =>
    SignInSettings(
      secondFactorRequired:
          _readSecondFactorRequired(json, 'second_factor_required') as bool,
    );

Map<String, dynamic> _$SignInSettingsToJson(SignInSettings instance) =>
    <String, dynamic>{
      'second_factor_required': instance.secondFactorRequired,
    };
