// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Verification _$VerificationFromJson(Map<String, dynamic> json) => Verification(
      status: $enumDecode(_$StatusEnumMap, json['status']),
      strategy: $enumDecode(_$StrategyEnumMap, json['strategy']),
      attempts: (json['attempts'] as num?)?.toInt(),
      expireAt: (json['expire_at'] as num).toInt(),
      nonce: json['nonce'] as String?,
    );

Map<String, dynamic> _$VerificationToJson(Verification instance) =>
    <String, dynamic>{
      'status': _$StatusEnumMap[instance.status]!,
      'strategy': _$StrategyEnumMap[instance.strategy]!,
      'attempts': instance.attempts,
      'expire_at': instance.expireAt,
      'nonce': instance.nonce,
    };

const _$StatusEnumMap = {
  Status.abandoned: 'abandoned',
  Status.active: 'active',
  Status.missingRequirements: 'missing_requirements',
  Status.needsFirstFactor: 'needs_first_factor',
  Status.unverified: 'unverified',
};

const _$StrategyEnumMap = {
  Strategy.emailCode: 'email_code',
  Strategy.emailLink: 'email_link',
  Strategy.password: 'password',
  Strategy.phoneCode: 'phone_code',
  Strategy.web3MetamaskSignature: 'web3_metamask_signature',
  Strategy.web3CoinbaseSignature: 'web3_coinbase_signature',
  Strategy.resetPasswordPhoneCode: 'reset_password_phone_code',
  Strategy.resetPasswordEmailCode: 'reset_password_email_code',
  Strategy.saml: 'saml',
  Strategy.passkey: 'passkey',
};
