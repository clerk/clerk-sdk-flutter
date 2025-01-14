// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_public.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPublic _$UserPublicFromJson(Map<String, dynamic> json) => UserPublic(
      identifier: json['identifier'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      profileImageUrl: json['profile_image_url'] as String?,
      imageUrl: json['image_url'] as String?,
      hasImage: json['has_image'] as bool? ?? false,
    );

Map<String, dynamic> _$UserPublicToJson(UserPublic instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      if (instance.firstName case final value?) 'first_name': value,
      if (instance.lastName case final value?) 'last_name': value,
      if (instance.profileImageUrl case final value?)
        'profile_image_url': value,
      if (instance.imageUrl case final value?) 'image_url': value,
      'has_image': instance.hasImage,
    };
