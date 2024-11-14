// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationSettings _$OrganizationSettingsFromJson(
        Map<String, dynamic> json) =>
    OrganizationSettings(
      maxAllowedMemberships:
          (json['max_allowed_memberships'] as num?)?.toInt() ?? 0,
      creatorRole: json['creator_role'] as String? ?? '',
      actions: json['actions'] == null
          ? OrganizationActions.empty
          : OrganizationActions.fromJson(
              json['actions'] as Map<String, dynamic>),
      domains: json['domains'] == null
          ? OrganizationDomains.empty
          : OrganizationDomains.fromJson(
              json['domains'] as Map<String, dynamic>),
      isEnabled: json['enabled'] as bool? ?? false,
    );

Map<String, dynamic> _$OrganizationSettingsToJson(
        OrganizationSettings instance) =>
    <String, dynamic>{
      'max_allowed_memberships': instance.maxAllowedMemberships,
      'creator_role': instance.creatorRole,
      'domains': instance.domains.toJson(),
      'actions': instance.actions.toJson(),
      'enabled': instance.isEnabled,
    };
