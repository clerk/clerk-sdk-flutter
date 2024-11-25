import 'package:json_annotation/json_annotation.dart';

import 'auth_config.dart';
import 'display_config.dart';
import 'organization_settings.dart';
import 'user_settings.dart';

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

  /// fromJson
  static Environment fromJson(Map<String, dynamic> json) =>
      _$EnvironmentFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$EnvironmentToJson(this);
}
