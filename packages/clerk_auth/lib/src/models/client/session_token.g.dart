// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionToken _$SessionTokenFromJson(Map<String, dynamic> json) => SessionToken(
      jwt: json['jwt'] as String,
      templateName: json['template_name'] as String?,
    );

Map<String, dynamic> _$SessionTokenToJson(SessionToken instance) {
  final val = <String, dynamic>{
    'jwt': instance.jwt,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('template_name', instance.templateName);
  return val;
}
