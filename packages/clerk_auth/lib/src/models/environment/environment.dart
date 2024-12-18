import 'package:clerk_auth/clerk_auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'environment.g.dart';

/// [Environment] Clerk object
@JsonSerializable()
class Environment {
  /// Construction
  const Environment({
    this.config = AuthConfig.empty,
    this.display = DisplayConfig.empty,
    this.user = UserSettings.empty,
    this.organization = OrganizationSettings.empty,
    this.maintenanceMode = false,
  });

  /// auth config
  @JsonKey(name: 'auth_config')
  final AuthConfig config;

  /// display config
  @JsonKey(name: 'display_config')
  final DisplayConfig display;

  /// user settings
  @JsonKey(name: 'user_settings')
  final UserSettings user;

  /// organization settings
  @JsonKey(name: 'organization_settings')
  final OrganizationSettings organization;

  /// maintenance mode?
  final bool maintenanceMode;

  /// isEmpty?
  bool get isEmpty => this == empty;

  /// empty [Environment]
  static const empty = Environment();

  /// Do we have [Strategy.password] configured?
  bool get hasPasswordStrategy =>
      config.firstFactors.contains(Strategy.password);

  /// [Iterable] of identification strategies
  Iterable<Strategy> get identificationStrategies =>
      config.identificationStrategies.where((i) => i.isOauth == false);

  /// Do we have identification strategies?
  bool get hasIdentificationStrategies => identificationStrategies.isNotEmpty;

  /// [Iterable] of oauth strategies
  Iterable<Strategy> get oauthStrategies =>
      config.identificationStrategies.where((i) => i.isOauth);

  /// Do we have oauth strategies?
  bool get hasOauthStrategies => oauthStrategies.isNotEmpty;

  /// [Iterable] of other strategies
  /// i.e. strategies that are neither oauth nor password-based
  Iterable<Strategy> get otherStrategies =>
      config.firstFactors.where((f) => f.isOtherStrategy);

  /// Do we have other strategies?
  bool get hasOtherStrategies => otherStrategies.isNotEmpty;

  /// fromJson
  static Environment fromJson(Map<String, dynamic> json) =>
      _$EnvironmentFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$EnvironmentToJson(this);
}
