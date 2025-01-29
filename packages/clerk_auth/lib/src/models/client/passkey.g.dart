// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Passkey _$PasskeyFromJson(Map<String, dynamic> json) => Passkey(
      id: json['id'] as String,
      name: json['name'] as String,
      verification:
          Verification.fromJson(json['verification'] as Map<String, dynamic>),
      lastUsedAt: intToDateTime(json['last_used_at']),
      updatedAt: intToDateTime(json['updated_at']),
      createdAt: intToDateTime(json['created_at']),
    );

Map<String, dynamic> _$PasskeyToJson(Passkey instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'verification': instance.verification.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('last_used_at', instance.lastUsedAt?.toIso8601String());
  return val;
}
