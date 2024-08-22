import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'factor.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Factor {
  final Strategy strategy;
  final String safeIdentifier;
  final String emailAddressId;
  final String phoneNumberId;
  final String web3WalletId;
  final String passkeyId;
  final bool isPrimary;
  final bool isDefault;

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

  factory Factor.fromJson(Map<String, dynamic> json) => _$FactorFromJson(json);

  Map<String, dynamic> toJson() => _$FactorToJson(this);
}
