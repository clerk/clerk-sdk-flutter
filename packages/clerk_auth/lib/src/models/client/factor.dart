import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'factor.g.dart';

/// [Factor] Clerk object
@immutable
@JsonSerializable()
class Factor with InformativeToStringMixin {
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
  @override
  Map<String, dynamic> toJson() => _$FactorToJson(this);
}
