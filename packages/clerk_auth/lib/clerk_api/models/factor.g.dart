// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'factor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Factor _$FactorFromJson(Map<String, dynamic> json) => Factor(
      strategy: $enumDecode(_$StrategyEnumMap, json['strategy']),
      safeIdentifier: json['safe_identifier'] as String,
      emailAddressId: json['email_address_id'] as String,
      phoneNumberId: json['phone_number_id'] as String,
      web3WalletId: json['web3_wallet_id'] as String,
      passkeyId: json['passkey_id'] as String,
      isPrimary: json['is_primary'] as bool,
      isDefault: json['is_default'] as bool,
    );

Map<String, dynamic> _$FactorToJson(Factor instance) => <String, dynamic>{
      'strategy': _$StrategyEnumMap[instance.strategy]!,
      'safe_identifier': instance.safeIdentifier,
      'email_address_id': instance.emailAddressId,
      'phone_number_id': instance.phoneNumberId,
      'web3_wallet_id': instance.web3WalletId,
      'passkey_id': instance.passkeyId,
      'is_primary': instance.isPrimary,
      'is_default': instance.isDefault,
    };

const _$StrategyEnumMap = {
  Strategy.emailCode: 'email_code',
  Strategy.emailLink: 'email_link',
  Strategy.phoneCode: 'phone_code',
  Strategy.web3MetamaskSignature: 'web3_metamask_signature',
  Strategy.web3CoinbaseSignature: 'web3_coinbase_signature',
  Strategy.resetPasswordPhoneCode: 'reset_password_phone_code',
  Strategy.resetPasswordEmailCode: 'reset_password_email_code',
  Strategy.saml: 'saml',
  Strategy.passkey: 'passkey',
};
