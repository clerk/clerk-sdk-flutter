// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Environment _$EnvironmentFromJson(Map<String, dynamic> json) => Environment(
      config: json['auth_config'] == null
          ? Config.empty
          : Config.fromJson(json['auth_config'] as Map<String, dynamic>),
      display: json['display_config'] == null
          ? DisplayConfig.empty
          : DisplayConfig.fromJson(
              json['display_config'] as Map<String, dynamic>),
      user: json['user_settings'] == null
          ? UserSettings.empty
          : UserSettings.fromJson(
              json['user_settings'] as Map<String, dynamic>),
      organization: json['organization_settings'] == null
          ? OrganizationSettings.empty
          : OrganizationSettings.fromJson(
              json['organization_settings'] as Map<String, dynamic>),
      maintenanceMode: json['maintenance_mode'] as bool? ?? false,
    );

Map<String, dynamic> _$EnvironmentToJson(Environment instance) =>
    <String, dynamic>{
      'auth_config': instance.config.toJson(),
      'display_config': instance.display.toJson(),
      'user_settings': instance.user.toJson(),
      'organization_settings': instance.organization.toJson(),
      'maintenance_mode': instance.maintenanceMode,
    };
