// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_nonce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationNonce _$VerificationNonceFromJson(Map<String, dynamic> json) =>
    VerificationNonce(
      challenge: json['challenge'] as String,
      relyingParty: RelyingParty.fromJson(
          _readRelyingParty(json, 'relying_party') as Map<String, dynamic>),
      timeout: (json['timeout'] as num?)?.toInt() ?? 30000,
      userVerification: json['user_verification'] as String?,
      user: json['user'] == null
          ? null
          : PasskeyUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerificationNonceToJson(VerificationNonce instance) {
  final val = <String, dynamic>{
    'challenge': instance.challenge,
    'timeout': instance.timeout,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_verification', instance.userVerification);
  val['relying_party'] = instance.relyingParty.toJson();
  writeNotNull('user', instance.user?.toJson());
  return val;
}
