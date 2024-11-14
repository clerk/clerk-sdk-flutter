// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'factor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Factor _$FactorFromJson(Map<String, dynamic> json) => Factor(
      strategy: Strategy.fromJson(json['strategy'] as String),
      safeIdentifier: json['safe_identifier'] as String?,
      emailAddressId: json['email_address_id'] as String?,
      phoneNumberId: json['phone_number_id'] as String?,
      web3WalletId: json['web3_wallet_id'] as String?,
      passkeyId: json['passkey_id'] as String?,
      isPrimary: json['primary'] as bool? ?? false,
      isDefault: json['default'] as bool? ?? false,
    );

Map<String, dynamic> _$FactorToJson(Factor instance) {
  final val = <String, dynamic>{
    'strategy': instance.strategy.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('safe_identifier', instance.safeIdentifier);
  writeNotNull('email_address_id', instance.emailAddressId);
  writeNotNull('phone_number_id', instance.phoneNumberId);
  writeNotNull('web3_wallet_id', instance.web3WalletId);
  writeNotNull('passkey_id', instance.passkeyId);
  val['primary'] = instance.isPrimary;
  val['default'] = instance.isDefault;
  return val;
}
