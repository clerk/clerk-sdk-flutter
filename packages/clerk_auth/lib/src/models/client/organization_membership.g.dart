// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_membership.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationMembership _$OrganizationMembershipFromJson(
        Map<String, dynamic> json) =>
    OrganizationMembership(
      id: json['id'] as String,
      role: json['role'] as String,
      updatedAt: intToDateTime(json['updated_at']),
      createdAt: intToDateTime(json['created_at']),
      organization:
          Organization.fromJson(json['organization'] as Map<String, dynamic>),
      publicUserData:
          UserPublic.fromJson(json['public_user_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrganizationMembershipToJson(
        OrganizationMembership instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'organization': instance.organization.toJson(),
      'public_user_data': instance.publicUserData.toJson(),
      'updated_at': dateTimeToInt(instance.updatedAt),
      'created_at': dateTimeToInt(instance.createdAt),
    };
