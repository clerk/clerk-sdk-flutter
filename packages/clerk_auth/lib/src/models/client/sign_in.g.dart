// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignIn _$SignInFromJson(Map<String, dynamic> json) => SignIn(
      id: json['id'] as String,
      status: Status.fromJson(json['status'] as String),
      identifier: json['identifier'] as String?,
      userData: json['user_data'] == null
          ? null
          : UserPublic.fromJson(json['user_data'] as Map<String, dynamic>),
      supportedIdentifiers: (json['supported_identifiers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      supportedFirstFactors: (json['supported_first_factors'] as List<dynamic>?)
              ?.map((e) => Factor.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      firstFactorVerification: json['first_factor_verification'] == null
          ? null
          : Verification.fromJson(
              json['first_factor_verification'] as Map<String, dynamic>),
      supportedSecondFactors:
          (json['supported_second_factors'] as List<dynamic>?)
                  ?.map((e) => Factor.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
      secondFactorVerification: json['second_factor_verification'] == null
          ? null
          : Verification.fromJson(
              json['second_factor_verification'] as Map<String, dynamic>),
      createdSessionId: json['created_session_id'] as String?,
      abandonAt: json['abandon_at'] == null
          ? DateTimeExt.epoch
          : intToDateTime(json['abandon_at']),
    );

Map<String, dynamic> _$SignInToJson(SignIn instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': instance.status.toJson(),
    'supported_identifiers': instance.supportedIdentifiers,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('identifier', instance.identifier);
  writeNotNull('user_data', instance.userData?.toJson());
  writeNotNull(
      'first_factor_verification', instance.firstFactorVerification?.toJson());
  writeNotNull('second_factor_verification',
      instance.secondFactorVerification?.toJson());
  writeNotNull('created_session_id', instance.createdSessionId);
  val['abandon_at'] = dateTimeToInt(instance.abandonAt);
  val['supported_first_factors'] =
      instance.supportedFirstFactors.map((e) => e.toJson()).toList();
  val['supported_second_factors'] =
      instance.supportedSecondFactors.map((e) => e.toJson()).toList();
  return val;
}
