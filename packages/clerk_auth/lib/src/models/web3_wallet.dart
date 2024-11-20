import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'web3_wallet.g.dart';

@JsonSerializable()
class Web3Wallet extends UserIdentifyingData {
  const Web3Wallet({
    required super.id,
    required this.web3Wallet,
    required this.verification,
    required this.updatedAt,
    required this.createdAt,
  });

  final String web3Wallet;
  final Verification verification;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? updatedAt;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? createdAt;

  @override
  String get identifier => web3Wallet;

  static Web3Wallet fromJson(Map<String, dynamic> json) =>
      _$Web3WalletFromJson(json);

  Map<String, dynamic> toJson() => _$Web3WalletToJson(this);
}
