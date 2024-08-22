// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      id: json['id'] as String,
      status: $enumDecode(_$StatusEnumMap, json['status']),
      lastActiveAt: (json['last_active_at'] as num).toInt(),
      expireAt: (json['expire_at'] as num).toInt(),
      abandonAt: (json['abandon_at'] as num).toInt(),
      publicUserData:
          User.fromJson(json['public_user_data'] as Map<String, dynamic>),
      lastActiveToken: json['last_active_token'] == null
          ? null
          : SessionToken.fromJson(
              json['last_active_token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'id': instance.id,
      'status': _$StatusEnumMap[instance.status]!,
      'last_active_at': instance.lastActiveAt,
      'expire_at': instance.expireAt,
      'abandon_at': instance.abandonAt,
      'public_user_data': instance.publicUserData,
      'last_active_token': instance.lastActiveToken,
    };

const _$StatusEnumMap = {
  Status.active: 'active',
  Status.abandoned: 'abandoned',
};
