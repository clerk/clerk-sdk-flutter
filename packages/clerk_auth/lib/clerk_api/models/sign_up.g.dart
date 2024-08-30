// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUp _$SignUpFromJson(Map<String, dynamic> json) => SignUp(
      id: json['id'] as String,
      status: $enumDecode(_$StatusEnumMap, json['status']),
      requiredFields: (json['required_fields'] as List<dynamic>)
          .map((e) => $enumDecode(_$FieldEnumMap, e))
          .toList(),
      optionalFields: (json['optional_fields'] as List<dynamic>)
          .map((e) => $enumDecode(_$FieldEnumMap, e))
          .toList(),
      missingFields: (json['missing_fields'] as List<dynamic>)
          .map((e) => $enumDecode(_$FieldEnumMap, e))
          .toList(),
      unverifiedFields: (json['unverified_fields'] as List<dynamic>)
          .map((e) => $enumDecode(_$FieldEnumMap, e))
          .toList(),
      username: json['username'] as String?,
      emailAddress: json['email_address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      web3Wallet: json['web3_wallet'] as String?,
      passwordEnabled: json['password_enabled'] as bool,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      unsafeMetadata: json['unsafe_metadata'] as Map<String, dynamic>,
      publicMetadata: json['public_metadata'] as Map<String, dynamic>,
      customAction: json['custom_action'] as bool,
      externalId: json['external_id'] as String?,
      createdSessionId: json['created_session_id'] as String?,
      createdUserId: json['created_user_id'] as String?,
      abandonAt: DateTime.fromMillisecondsSinceEpoch(
          (json['abandon_at'] as num).toInt()),
    );

Map<String, dynamic> _$SignUpToJson(SignUp instance) => <String, dynamic>{
      'id': instance.id,
      'status': _$StatusEnumMap[instance.status]!,
      'required_fields':
          instance.requiredFields.map((e) => _$FieldEnumMap[e]!).toList(),
      'optional_fields':
          instance.optionalFields.map((e) => _$FieldEnumMap[e]!).toList(),
      'missing_fields':
          instance.missingFields.map((e) => _$FieldEnumMap[e]!).toList(),
      'unverified_fields':
          instance.unverifiedFields.map((e) => _$FieldEnumMap[e]!).toList(),
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
      'abandon_at': instance.abandonAt.toIso8601String(),
    };

const _$StatusEnumMap = {
  Status.abandoned: 'abandoned',
  Status.active: 'active',
  Status.missingRequirements: 'missing_requirements',
  Status.needsFirstFactor: 'needs_first_factor',
  Status.unverified: 'unverified',
};

const _$FieldEnumMap = {
  Field.emailAddress: 'email_address',
  Field.externalAccount: 'external_account',
  Field.password: 'password',
  Field.phoneNumber: 'phone_number',
  Field.oauthApple: 'oauth_apple',
  Field.oauthGithub: 'oauth_github',
  Field.oauthGoogle: 'oauth_google',
  Field.username: 'username',
  Field.web3Wallet: 'web3_wallet',
};
