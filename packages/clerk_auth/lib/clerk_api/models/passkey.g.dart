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
      lastUsedAt: DateTime.parse(json['last_used_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$PasskeyToJson(Passkey instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'verification': instance.verification,
      'last_used_at': instance.lastUsedAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
    };
