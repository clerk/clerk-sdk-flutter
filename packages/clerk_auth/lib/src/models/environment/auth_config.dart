import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:json_annotation/json_annotation.dart';

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
    this.allowsFirstName = false,
    this.allowsLastName = false,
    this.allowsEmailAddress = false,
    this.allowsPhoneNumber = false,
    this.allowsUsername = false,
    this.allowsPassword = false,
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

  /// email address verification strategy
  @JsonKey(fromJson: toStrategyList)
  final List<Strategy> emailAddressVerificationStrategies;

  /// allows first name?
  @JsonKey(name: 'first_name', fromJson: isOn)
  final bool allowsFirstName;

  /// allows last name?
  @JsonKey(name: 'last_name', fromJson: isOn)
  final bool allowsLastName;

  /// allows email address?
  @JsonKey(name: 'email_address', fromJson: isOn)
  final bool allowsEmailAddress;

  /// allows phone number?
  @JsonKey(name: 'phone_number', fromJson: isOn)
  final bool allowsPhoneNumber;

  /// allows username?
  @JsonKey(name: 'username', fromJson: isOn)
  final bool allowsUsername;

  /// allows password?
  @JsonKey(name: 'password', fromJson: isOn)
  final bool allowsPassword;

  /// empty [AuthConfig]
  static const empty = AuthConfig();

  /// fromJson
  static AuthConfig fromJson(Map<String, dynamic> json) =>
      _$AuthConfigFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$AuthConfigToJson(this);
}
