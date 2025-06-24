// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_invitation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationInvitation _$OrganizationInvitationFromJson(
        Map<String, dynamic> json) =>
    OrganizationInvitation(
      id: json['id'] as String,
      status: Status.fromJson(json['status'] as String),
      roleName: json['role_name'] as String,
      organizationData: PublicOrganizationData.fromJson(
          json['organization_data'] as Map<String, dynamic>),
      updatedAt: intToDateTime(json['updated_at']),
      createdAt: intToDateTime(json['created_at']),
    );

Map<String, dynamic> _$OrganizationInvitationToJson(
        OrganizationInvitation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status.toJson(),
      'role_name': instance.roleName,
      'organization_data': instance.organizationData.toJson(),
      'updated_at': dateTimeToInt(instance.updatedAt),
      'created_at': dateTimeToInt(instance.createdAt),
    };
