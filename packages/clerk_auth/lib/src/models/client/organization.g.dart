// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organization _$OrganizationFromJson(Map<String, dynamic> json) => Organization(
      id: json['id'] as String,
      name: json['name'] as String,
      maxAllowedMemberships: (json['max_allowed_memberships'] as num).toInt(),
      adminDeleteEnabled: json['admin_delete_enabled'] as bool,
      slug: json['slug'] as String,
      logoUrl: json['logo_url'] as String,
      imageUrl: json['image_url'] as String,
      hasImage: json['has_image'] as bool,
      membersCount: (json['members_count'] as num).toInt(),
      pendingInvitationsCount:
          (json['pending_invitations_count'] as num).toInt(),
      publicMetadata: json['public_metadata'] as Map<String, dynamic>,
      updatedAt: intToDateTime(json['updated_at']),
      createdAt: intToDateTime(json['created_at']),
    );

Map<String, dynamic> _$OrganizationToJson(Organization instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'max_allowed_memberships': instance.maxAllowedMemberships,
    'admin_delete_enabled': instance.adminDeleteEnabled,
    'slug': instance.slug,
    'logo_url': instance.logoUrl,
    'image_url': instance.imageUrl,
    'has_image': instance.hasImage,
    'members_count': instance.membersCount,
    'pending_invitations_count': instance.pendingInvitationsCount,
    'public_metadata': instance.publicMetadata,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  return val;
}
