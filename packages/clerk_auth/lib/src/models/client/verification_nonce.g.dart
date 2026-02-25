// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_nonce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationNonce _$VerificationNonceFromJson(Map<String, dynamic> json) =>
    VerificationNonce(
      challenge: json['challenge'] as String,
      rpId: json['rpId'] as String,
      timeout: (json['timeout'] as num?)?.toInt() ?? 30000,
      userVerification: json['user_verification'] as String?,
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
  val['rpId'] = instance.rpId;
  return val;
}
