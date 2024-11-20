import 'package:json_annotation/json_annotation.dart';

import '../helpers.dart';
import '../strategy.dart';

part 'auth_config.g.dart';

@JsonSerializable()
class AuthConfig {
  const AuthConfig({
    this.id = '',
    this.singleSessionMode = false,
    this.enhancedEmailDeliverability = false,
    this.testMode = false,
    this.demo = false,
    this.cookielessDev = false,
    this.urlBasedSessionSyncing = false,
    this.identificationStrategies = const [],
    this.firstFactors = const [],
    this.secondFactors = const [],
    this.emailAddressVerificationStrategies = const [],
    this.usesFirstName = false,
    this.usesLastName = false,
    this.usesEmailAddress = false,
    this.usesPhoneNumber = false,
    this.usesUsername = false,
    this.usesPassword = false,
  });

  final String id;
  final bool singleSessionMode;
  final bool enhancedEmailDeliverability;
  final bool testMode;
  final bool demo;
  final bool cookielessDev;
  final bool urlBasedSessionSyncing;

  @JsonKey(fromJson: toStrategyList)
  final List<Strategy> identificationStrategies;

  @JsonKey(fromJson: toStrategyList)
  final List<Strategy> firstFactors;

  @JsonKey(fromJson: toStrategyList)
  final List<Strategy> secondFactors;

  @JsonKey(fromJson: toStrategyList)
  final List<Strategy> emailAddressVerificationStrategies;

  @JsonKey(name: 'first_name', fromJson: isOn)
  final bool usesFirstName;

  @JsonKey(name: 'last_name', fromJson: isOn)
  final bool usesLastName;

  @JsonKey(name: 'email_address', fromJson: isOn)
  final bool usesEmailAddress;

  @JsonKey(name: 'phone_number', fromJson: isOn)
  final bool usesPhoneNumber;

  @JsonKey(name: 'username', fromJson: isOn)
  final bool usesUsername;

  @JsonKey(name: 'password', fromJson: isOn)
  final bool usesPassword;

  static const empty = AuthConfig();

  static AuthConfig fromJson(Map<String, dynamic> json) =>
      _$AuthConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AuthConfigToJson(this);
}
