// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'external_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExternalAccount _$ExternalAccountFromJson(Map<String, dynamic> json) =>
    ExternalAccount(
      id: json['id'] as String,
      provider: json['provider'] as String,
      providerUserId: json['provider_user_id'] as String,
      approvedScopes: json['approved_scopes'] as String,
      emailAddress: json['email_address'] as String,
      username: json['username'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      imageUrl: json['image_url'] as String?,
      label: json['label'] as String?,
      publicMetadata: json['public_metadata'] as Map<String, dynamic>?,
      verification:
          Verification.fromJson(json['verification'] as Map<String, dynamic>),
      updatedAt: intToDateTime(json['updated_at']),
      createdAt: intToDateTime(json['created_at']),
    );

Map<String, dynamic> _$ExternalAccountToJson(ExternalAccount instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'provider': instance.provider,
    'provider_user_id': instance.providerUserId,
    'approved_scopes': instance.approvedScopes,
    'email_address': instance.emailAddress,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('username', instance.username);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('avatar_url', instance.avatarUrl);
  writeNotNull('image_url', instance.imageUrl);
  writeNotNull('label', instance.label);
  writeNotNull('public_metadata', instance.publicMetadata);
  val['verification'] = instance.verification.toJson();
  val['updated_at'] = dateTimeToInt(instance.updatedAt);
  val['created_at'] = dateTimeToInt(instance.createdAt);
  return val;
}
