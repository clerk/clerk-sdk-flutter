// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      id: json['id'] as String,
      status: Status.fromJson(json['status'] as String),
      lastActiveAt: intToDateTime(json['last_active_at']),
      expireAt: intToDateTime(json['expire_at']),
      abandonAt: intToDateTime(json['abandon_at']),
      publicUserData:
          UserPublic.fromJson(json['public_user_data'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      lastActiveToken: json['last_active_token'] == null
          ? null
          : SessionToken.fromJson(
              json['last_active_token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionToJson(Session instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': instance.status.toJson(),
    'public_user_data': instance.publicUserData.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_active_token', instance.lastActiveToken?.toJson());
  val['user'] = instance.user.toJson();
  val['last_active_at'] = dateTimeToInt(instance.lastActiveAt);
  val['expire_at'] = dateTimeToInt(instance.expireAt);
  val['abandon_at'] = dateTimeToInt(instance.abandonAt);
  return val;
}
