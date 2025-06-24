// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_organization_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicOrganizationData _$PublicOrganizationDataFromJson(
        Map<String, dynamic> json) =>
    PublicOrganizationData(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      imageUrl: json['image_url'] as String,
      hasImage: json['has_image'] as bool,
    );

Map<String, dynamic> _$PublicOrganizationDataToJson(
        PublicOrganizationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image_url': instance.imageUrl,
      'has_image': instance.hasImage,
    };
