import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'web3_wallet.g.dart';

/// [Web3Wallet] Clerk object
@JsonSerializable()
class Web3Wallet extends UserIdentifyingData {
  /// Constructor
  const Web3Wallet({
    required super.id,
    required this.web3Wallet,
    required this.verification,
    required this.updatedAt,
    required this.createdAt,
  });

  /// web3 wallet
  final String web3Wallet;

  /// verification
  final Verification verification;

  /// updated at
  @JsonKey(fromJson: intToDateTime)
  final DateTime? updatedAt;

  /// created at
  @JsonKey(fromJson: intToDateTime)
  final DateTime? createdAt;

  @override
  String get identifier => web3Wallet;

  /// fromJson
  static Web3Wallet fromJson(Map<String, dynamic> json) =>
      _$Web3WalletFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$Web3WalletToJson(this);
}
