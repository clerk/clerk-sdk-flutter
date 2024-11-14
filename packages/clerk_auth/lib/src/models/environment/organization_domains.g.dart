// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_domains.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationDomains _$OrganizationDomainsFromJson(Map<String, dynamic> json) =>
    OrganizationDomains(
      defaultRole: json['default_role'] as String? ?? '',
      enrollmentModes: (json['enrollment_modes'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$EnrollmentModeEnumMap, e))
              .toList() ??
          const [],
      isEnabled: json['enabled'] as bool? ?? false,
    );

Map<String, dynamic> _$OrganizationDomainsToJson(
        OrganizationDomains instance) =>
    <String, dynamic>{
      'default_role': instance.defaultRole,
      'enrollment_modes': instance.enrollmentModes
          .map((e) => _$EnrollmentModeEnumMap[e]!)
          .toList(),
      'enabled': instance.isEnabled,
    };

const _$EnrollmentModeEnumMap = {
  EnrollmentMode.manualInvitation: 'manualInvitation',
};
