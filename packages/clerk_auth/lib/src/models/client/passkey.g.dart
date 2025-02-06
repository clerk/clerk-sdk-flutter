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

Map<String, dynamic> _$PasskeyToJson(Passkey instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'verification': instance.verification.toJson(),
      'updated_at': dateTimeToInt(instance.updatedAt),
      'created_at': dateTimeToInt(instance.createdAt),
      'last_used_at': dateTimeToInt(instance.lastUsedAt),
    };
