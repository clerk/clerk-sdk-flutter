// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) => UserSettings(
      attributes: json['attributes'] == null
          ? const {}
          : _toAttributeMap(json['attributes']),
      signIn: json['sign_in'] == null
          ? SignInSettings.empty
          : SignInSettings.fromJson(json['sign_in'] as Map<String, dynamic>),
      signUp: json['sign_up'] == null
          ? SignUpSettings.empty
          : SignUpSettings.fromJson(json['sign_up'] as Map<String, dynamic>),
      restrictions: json['restrictions'] == null
          ? Restrictions.empty
          : Restrictions.fromJson(json['restrictions'] as Map<String, dynamic>),
      usernameSettings: json['username_settings'] == null
          ? UsernameSettings.empty
          : UsernameSettings.fromJson(
              json['username_settings'] as Map<String, dynamic>),
      actions: json['actions'] == null
          ? Actions.empty
          : Actions.fromJson(json['actions'] as Map<String, dynamic>),
      attackProtection: json['attack_protection'] == null
          ? AttackProtection.empty
          : AttackProtection.fromJson(
              json['attack_protection'] as Map<String, dynamic>),
      passkeySettings: json['passkey_settings'] == null
          ? PasskeySettings.empty
          : PasskeySettings.fromJson(
              json['passkey_settings'] as Map<String, dynamic>),
      passwordSettings: json['password_settings'] == null
          ? PasswordSettings.empty
          : PasswordSettings.fromJson(
              json['password_settings'] as Map<String, dynamic>),
      socialSettings: (json['social'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, SocialConnection.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      saml: _readSamlEnabled(json, 'saml') as bool? ?? false,
    );

Map<String, dynamic> _$UserSettingsToJson(UserSettings instance) =>
    <String, dynamic>{
      'sign_in': instance.signIn.toJson(),
      'sign_up': instance.signUp.toJson(),
      'restrictions': instance.restrictions.toJson(),
      'username_settings': instance.usernameSettings.toJson(),
      'actions': instance.actions.toJson(),
      'attack_protection': instance.attackProtection.toJson(),
      'passkey_settings': instance.passkeySettings.toJson(),
      'password_settings': instance.passwordSettings.toJson(),
      'attributes': instance.attributes
          .map((k, e) => MapEntry(_$UserAttributeEnumMap[k]!, e.toJson())),
      'saml': instance.saml,
      'social': instance.socialSettings.map((k, e) => MapEntry(k, e.toJson())),
    };

const _$UserAttributeEnumMap = {
  UserAttribute.username: 'username',
  UserAttribute.emailAddress: 'emailAddress',
  UserAttribute.phoneNumber: 'phoneNumber',
  UserAttribute.firstName: 'firstName',
  UserAttribute.lastName: 'lastName',
  UserAttribute.password: 'password',
  UserAttribute.passwordConfirmation: 'passwordConfirmation',
  UserAttribute.web3Wallet: 'web3Wallet',
  UserAttribute.authenticatorApp: 'authenticatorApp',
  UserAttribute.backupCode: 'backupCode',
  UserAttribute.passkey: 'passkey',
};
