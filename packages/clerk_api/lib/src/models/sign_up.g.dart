// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUp _$SignUpFromJson(Map<String, dynamic> json) => SignUp(
      id: json['id'] as String,
      status: $enumDecode(_$StatusEnumMap, json['status']),
      requiredFields: (json['required_fields'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      optionalFields: (json['optional_fields'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      missingFields: (json['missing_fields'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      unverifiedFields: (json['unverified_fields'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      username: json['username'] as String,
      emailAddress: json['email_address'] as String,
      phoneNumber: json['phone_number'] as String,
      web3Wallet: json['web3_wallet'] as String,
      passwordEnabled: json['password_enabled'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      unsafeMetadata: json['unsafe_metadata'] as Map<String, dynamic>,
      publicMetadata: json['public_metadata'] as Map<String, dynamic>,
      customAction: json['custom_action'] as bool,
      externalId: json['external_id'] as String,
      createdSessionId: json['created_session_id'] as String,
      createdUserId: json['created_user_id'] as String,
      abandonAt: (json['abandon_at'] as num).toInt(),
    );

Map<String, dynamic> _$SignUpToJson(SignUp instance) => <String, dynamic>{
      'id': instance.id,
      'status': _$StatusEnumMap[instance.status]!,
      'required_fields': instance.requiredFields,
      'optional_fields': instance.optionalFields,
      'missing_fields': instance.missingFields,
      'unverified_fields': instance.unverifiedFields,
      'username': instance.username,
      'email_address': instance.emailAddress,
      'phone_number': instance.phoneNumber,
      'web3_wallet': instance.web3Wallet,
      'password_enabled': instance.passwordEnabled,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'unsafe_metadata': instance.unsafeMetadata,
      'public_metadata': instance.publicMetadata,
      'custom_action': instance.customAction,
      'external_id': instance.externalId,
      'created_session_id': instance.createdSessionId,
      'created_user_id': instance.createdUserId,
      'abandon_at': instance.abandonAt,
    };

const _$StatusEnumMap = {
  Status.active: 'active',
  Status.abandoned: 'abandoned',
};
