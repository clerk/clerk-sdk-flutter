// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationDomain _$OrganizationDomainFromJson(Map<String, dynamic> json) =>
    OrganizationDomain(
      id: json['id'] as String,
      orgId: json['organization_id'] as String,
      name: json['name'] as String,
      enrollmentMode:
          $enumDecode(_$EnrollmentModeEnumMap, json['enrollment_mode']),
      affiliationEmailAddress: json['affiliation_email_address'] as String?,
      verification: json['verification'] == null
          ? null
          : Verification.fromJson(json['verification'] as Map<String, dynamic>),
      totalPendingInvitations:
          (json['total_pending_invitations'] as num).toInt(),
      totalPendingSuggestions:
          (json['total_pending_suggestions'] as num).toInt(),
      updatedAt: intToDateTime(json['updated_at']),
      createdAt: intToDateTime(json['created_at']),
    );

Map<String, dynamic> _$OrganizationDomainToJson(OrganizationDomain instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'organization_id': instance.orgId,
    'name': instance.name,
    'enrollment_mode': _$EnrollmentModeEnumMap[instance.enrollmentMode]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('affiliation_email_address', instance.affiliationEmailAddress);
  writeNotNull('verification', instance.verification?.toJson());
  val['total_pending_invitations'] = instance.totalPendingInvitations;
  val['total_pending_suggestions'] = instance.totalPendingSuggestions;
  val['updated_at'] = dateTimeToInt(instance.updatedAt);
  val['created_at'] = dateTimeToInt(instance.createdAt);
  return val;
}

const _$EnrollmentModeEnumMap = {
  EnrollmentMode.automaticSuggestion: 'automatic_suggestion',
  EnrollmentMode.automaticInvitation: 'automatic_invitation',
  EnrollmentMode.manualInvitation: 'manual_invitation',
};
