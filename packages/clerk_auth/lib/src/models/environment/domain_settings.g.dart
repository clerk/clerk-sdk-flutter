// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DomainSettings _$DomainSettingsFromJson(Map<String, dynamic> json) =>
    DomainSettings(
      defaultRole: json['default_role'] as String? ?? '',
      enrollmentModes: (json['enrollment_modes'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$EnrollmentModeEnumMap, e))
              .toList() ??
          const [],
      isEnabled: json['enabled'] as bool? ?? false,
    );

Map<String, dynamic> _$DomainSettingsToJson(DomainSettings instance) =>
    <String, dynamic>{
      'default_role': instance.defaultRole,
      'enrollment_modes': instance.enrollmentModes
          .map((e) => _$EnrollmentModeEnumMap[e]!)
          .toList(),
      'enabled': instance.isEnabled,
    };

const _$EnrollmentModeEnumMap = {
  EnrollmentMode.automaticSuggestion: 'automatic_suggestion',
  EnrollmentMode.automaticInvitation: 'automatic_invitation',
  EnrollmentMode.manualInvitation: 'manual_invitation',
};
