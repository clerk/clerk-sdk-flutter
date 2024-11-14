// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Verification _$VerificationFromJson(Map<String, dynamic> json) => Verification(
      status: $enumDecode(_$StatusEnumMap, json['status']),
      strategy: Strategy.fromJson(json['strategy'] as String),
      attempts: (json['attempts'] as num?)?.toInt(),
      expireAt: intToDateTime(json['expire_at']),
      providerUrl: json['external_verification_redirect_url'] as String?,
      nonce: json['nonce'] as String?,
    );

Map<String, dynamic> _$VerificationToJson(Verification instance) {
  final val = <String, dynamic>{
    'status': _$StatusEnumMap[instance.status]!,
    'strategy': instance.strategy.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attempts', instance.attempts);
  writeNotNull('nonce', instance.nonce);
  writeNotNull('external_verification_redirect_url', instance.providerUrl);
  writeNotNull('expire_at', instance.expireAt?.toIso8601String());
  return val;
}

const _$StatusEnumMap = {
  Status.abandoned: 'abandoned',
  Status.active: 'active',
  Status.missingRequirements: 'missingRequirements',
  Status.needsIdentifier: 'needsIdentifier',
  Status.needsFirstFactor: 'needsFirstFactor',
  Status.needsSecondFactor: 'needsSecondFactor',
  Status.transferable: 'transferable',
  Status.unverified: 'unverified',
  Status.verified: 'verified',
  Status.complete: 'complete',
};
