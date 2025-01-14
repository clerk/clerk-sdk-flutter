// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) => ApiError(
      message: json['message'] as String,
      code: json['code'] as String?,
      meta: (json['meta'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      longMessage: json['long_message'] as String?,
    );

Map<String, dynamic> _$ApiErrorToJson(ApiError instance) => <String, dynamic>{
      'message': instance.message,
      if (instance.code case final value?) 'code': value,
      if (instance.meta case final value?) 'meta': value,
      if (instance.longMessage case final value?) 'long_message': value,
    };
