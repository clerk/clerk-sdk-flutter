import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'web3_wallet.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Web3Wallet {
  final String id;
  final String web2Wallet;
  final Verification verification;
  final DateTime updatedAt;
  final DateTime createdAt;

  Web3Wallet({
    required this.id,
    required this.web2Wallet,
    required this.verification,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Web3Wallet.fromJson(Map<String, dynamic> json) => _$Web3WalletFromJson(json);

  Map<String, dynamic> toJson() => _$Web3WalletToJson(this);
}
