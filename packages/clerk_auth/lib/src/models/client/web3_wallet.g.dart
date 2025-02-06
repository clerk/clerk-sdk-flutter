// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web3_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Web3Wallet _$Web3WalletFromJson(Map<String, dynamic> json) => Web3Wallet(
      id: json['id'] as String,
      verification: json['verification'] == null
          ? null
          : Verification.fromJson(json['verification'] as Map<String, dynamic>),
      web3Wallet: json['web3_wallet'] as String,
      updatedAt: intToDateTime(json['updated_at']),
      createdAt: intToDateTime(json['created_at']),
    );

Map<String, dynamic> _$Web3WalletToJson(Web3Wallet instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('verification', instance.verification?.toJson());
  val['web3_wallet'] = instance.web3Wallet;
  val['updated_at'] = dateTimeToInt(instance.updatedAt);
  val['created_at'] = dateTimeToInt(instance.createdAt);
  return val;
}
