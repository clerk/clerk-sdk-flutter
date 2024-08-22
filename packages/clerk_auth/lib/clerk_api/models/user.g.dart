// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      identifier: json['identifier'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      profileImageUrl: json['profile_image_url'] as String,
      imageUrl: json['image_url'] as String,
      hasImage: json['has_image'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'identifier': instance.identifier,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'profile_image_url': instance.profileImageUrl,
      'image_url': instance.imageUrl,
      'has_image': instance.hasImage,
    };
