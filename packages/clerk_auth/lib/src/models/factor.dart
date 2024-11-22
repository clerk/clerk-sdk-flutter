import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'factor.g.dart';

/// [Factor] Clerk object
@JsonSerializable()
class Factor {
  /// Constructor
  const Factor({
    required this.strategy,
    required this.safeIdentifier,
    required this.emailAddressId,
    required this.phoneNumberId,
    required this.web3WalletId,
    required this.passkeyId,
    required this.isPrimary,
    required this.isDefault,
  });

  /// strategy
  final Strategy strategy;

  /// safe identifier
  final String? safeIdentifier;

  /// id of email address
  final String? emailAddressId;

  /// id of phone number
  final String? phoneNumberId;

  /// id of web3 wallet
  final String? web3WalletId;

  /// id of passkey
  final String? passkeyId;

  /// is primary?
  @JsonKey(name: 'primary', defaultValue: false)
  final bool isPrimary;

  /// is default?
  @JsonKey(name: 'default', defaultValue: false)
  final bool isDefault;

  /// fromJson
  static Factor fromJson(Map<String, dynamic> json) => _$FactorFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$FactorToJson(this);
}
