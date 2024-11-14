// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'username_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsernameSettings _$UsernameSettingsFromJson(Map<String, dynamic> json) =>
    UsernameSettings(
      minLength: (json['min_length'] as num?)?.toInt() ?? 0,
      maxLength: (json['max_length'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$UsernameSettingsToJson(UsernameSettings instance) =>
    <String, dynamic>{
      'min_length': instance.minLength,
      'max_length': instance.maxLength,
    };
