// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web3_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Web3Wallet _$Web3WalletFromJson(Map<String, dynamic> json) => Web3Wallet(
      id: json['id'] as String,
      web2Wallet: json['web2_wallet'] as String,
      verification:
          Verification.fromJson(json['verification'] as Map<String, dynamic>),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$Web3WalletToJson(Web3Wallet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'web2_wallet': instance.web2Wallet,
      'verification': instance.verification,
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
    };
