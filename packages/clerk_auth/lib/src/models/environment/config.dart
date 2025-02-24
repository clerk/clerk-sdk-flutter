import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'config.g.dart';

/// [Config] Clerk object
@immutable
@JsonSerializable()
class Config {
  /// Constructor
  const Config({
    this.id = '',
    this.singleSessionMode = false,
    this.enhancedEmailDeliverability = false,
    this.testMode = false,
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

  /// cookieless dev?
  final bool cookielessDev;

  /// url based session syncing?
  final bool urlBasedSessionSyncing;

  /// identification strategies
  final List<Strategy> identificationStrategies;

  /// first factors
  final List<Strategy> firstFactors;

  /// second factors
  final List<Strategy> secondFactors;

  /// email address verification strategy
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

  /// empty [Config]
  static const empty = Config();

  /// fromJson
  static Config fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}
