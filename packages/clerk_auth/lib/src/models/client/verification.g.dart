// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Verification _$VerificationFromJson(Map<String, dynamic> json) => Verification(
      status: Status.fromJson(json['status'] as String),
      strategy: Strategy.fromJson(json['strategy'] as String),
      attempts: (json['attempts'] as num?)?.toInt(),
      expireAt: intToDateTime(json['expire_at']),
      externalVerificationRedirectUrl:
          json['external_verification_redirect_url'] as String?,
      errorMessage: _extractErrorMessage(json, 'error_message') as String?,
      nonce: _extractJsonIntoNonce(json['nonce']),
    );

Map<String, dynamic> _$VerificationToJson(Verification instance) {
  final val = <String, dynamic>{
    'status': instance.status.toJson(),
    'strategy': instance.strategy.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attempts', instance.attempts);
  writeNotNull('nonce', instance.nonce?.toJson());
  writeNotNull('external_verification_redirect_url',
      instance.externalVerificationRedirectUrl);
  val['expire_at'] = dateTimeToInt(instance.expireAt);
  writeNotNull('error_message', instance.errorMessage);
  return val;
}
