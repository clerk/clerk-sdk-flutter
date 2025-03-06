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
      orgId: _readOrgId(json, 'org_id') as String,
      name: _readString(json, 'name') as String,
      slug: _readString(json, 'slug') as String,
      imageUrl: _readString(json, 'image_url') as String,
      hasImage: _readBool(json, 'has_image') as bool,
      updatedAt: intToDateTime(json['updated_at']),
      createdAt: intToDateTime(json['created_at']),
    );

Map<String, dynamic> _$OrganizationInvitationToJson(
        OrganizationInvitation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status.toJson(),
      'role_name': instance.roleName,
      'org_id': instance.orgId,
      'name': instance.name,
      'slug': instance.slug,
      'image_url': instance.imageUrl,
      'has_image': instance.hasImage,
      'updated_at': dateTimeToInt(instance.updatedAt),
      'created_at': dateTimeToInt(instance.createdAt),
    };
