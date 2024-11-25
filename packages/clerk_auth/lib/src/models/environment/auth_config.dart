import 'package:json_annotation/json_annotation.dart';

import '../helpers.dart';
import '../strategy.dart';

part 'auth_config.g.dart';

/// [AuthConfig] Clerk object
@JsonSerializable()
class AuthConfig {
  /// Constructor
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

  /// id
  final String id;

  /// single session mode?
  final bool singleSessionMode;

  /// enhanced email deliverability?
  final bool enhancedEmailDeliverability;

  /// test mode?
  final bool testMode;

  /// demo?
  final bool demo;

  /// cookieless dev?
  final bool cookielessDev;

  /// url based session syncing?
  final bool urlBasedSessionSyncing;

  /// identification strategies
  @JsonKey(fromJson: toStrategyList)
  final List<Strategy> identificationStrategies;

  /// first factors
  @JsonKey(fromJson: toStrategyList)
  final List<Strategy> firstFactors;

  /// second factors
  @JsonKey(fromJson: toStrategyList)
  final List<Strategy> secondFactors;

  @JsonKey(fromJson: toStrategyList)
  final List<Strategy> emailAddressVerificationStrategies;

  /// uses first name?
  @JsonKey(name: 'first_name', fromJson: isOn)
  final bool usesFirstName;

  /// uses last name?
  @JsonKey(name: 'last_name', fromJson: isOn)
  final bool usesLastName;

  /// uses email address?
  @JsonKey(name: 'email_address', fromJson: isOn)
  final bool usesEmailAddress;

  /// uses phone number?
  @JsonKey(name: 'phone_number', fromJson: isOn)
  final bool usesPhoneNumber;

  /// uses username?
  @JsonKey(name: 'username', fromJson: isOn)
  final bool usesUsername;

  /// uses password?
  @JsonKey(name: 'password', fromJson: isOn)
  final bool usesPassword;

  /// empty [AuthConfig]
  static const empty = AuthConfig();

  /// fromJson
  static AuthConfig fromJson(Map<String, dynamic> json) =>
      _$AuthConfigFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$AuthConfigToJson(this);
}
