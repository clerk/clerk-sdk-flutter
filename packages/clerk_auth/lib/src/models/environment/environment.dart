import 'package:json_annotation/json_annotation.dart';

import 'auth_config.dart';
import 'display_config.dart';
import 'organization_settings.dart';
import 'user_settings.dart';

part 'environment.g.dart';

@JsonSerializable()
class Environment {
  const Environment({
    this.config = AuthConfig.empty,
    this.display = DisplayConfig.empty,
    this.user = UserSettings.empty,
    this.organization = OrganizationSettings.empty,
    this.maintenanceMode = false,
  });

  @JsonKey(name: 'auth_config')
  final AuthConfig config;

  @JsonKey(name: 'display_config')
  final DisplayConfig display;

  @JsonKey(name: 'user_settings')
  final UserSettings user;

  @JsonKey(name: 'organization_settings')
  final OrganizationSettings organization;

  final bool maintenanceMode;

  bool get isEmpty => this == empty;

  static const empty = Environment();

  static Environment fromJson(Map<String, dynamic> json) =>
      _$EnvironmentFromJson(json);

  Map<String, dynamic> toJson() => _$EnvironmentToJson(this);
}
