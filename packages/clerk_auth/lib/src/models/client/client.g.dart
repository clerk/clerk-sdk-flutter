// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      id: json['id'] as String?,
      signIn: json['sign_in'] == null
          ? null
          : SignIn.fromJson(json['sign_in'] as Map<String, dynamic>),
      signUp: json['sign_up'] == null
          ? null
          : SignUp.fromJson(json['sign_up'] as Map<String, dynamic>),
      sessions: (json['sessions'] as List<dynamic>?)
              ?.map((e) => Session.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lastActiveSessionId: json['last_active_session_id'] as String?,
      updatedAt: json['updated_at'] == null
          ? DateTimeExt.epoch
          : intToDateTime(json['updated_at']),
      createdAt: json['created_at'] == null
          ? DateTimeExt.epoch
          : intToDateTime(json['created_at']),
    );

Map<String, dynamic> _$ClientToJson(Client instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('sign_in', instance.signIn?.toJson());
  writeNotNull('sign_up', instance.signUp?.toJson());
  writeNotNull('last_active_session_id', instance.lastActiveSessionId);
  val['sessions'] = instance.sessions.map((e) => e.toJson()).toList();
  val['updated_at'] = dateTimeToInt(instance.updatedAt);
  val['created_at'] = dateTimeToInt(instance.createdAt);
  return val;
}
