// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      username: json['username'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      profileImageUrl: json['profile_image_url'] as String?,
      imageUrl: json['image_url'] as String?,
      hasImage: json['has_image'] as bool?,
      primaryEmailAddressId: json['primary_email_address_id'] as String?,
      primaryPhoneNumberId: json['primary_phone_number_id'] as String?,
      primaryWeb3WalletId: json['primary_web3_wallet_id'] as String?,
      publicMetadata: json['public_metadata'] as Map<String, dynamic>?,
      privateMetadata: json['private_metadata'] as Map<String, dynamic>?,
      userMetadata: json['unsafe_metadata'] as Map<String, dynamic>?,
      emailAddresses: (json['email_addresses'] as List<dynamic>?)
          ?.map((e) => Email.fromJson(e as Map<String, dynamic>))
          .toList(),
      phoneNumbers: (json['phone_numbers'] as List<dynamic>?)
          ?.map((e) => PhoneNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
      web3Wallets: (json['web3_wallets'] as List<dynamic>?)
          ?.map((e) => Web3Wallet.fromJson(e as Map<String, dynamic>))
          .toList(),
      passkeys: (json['passkeys'] as List<dynamic>?)
          ?.map((e) => Passkey.fromJson(e as Map<String, dynamic>))
          .toList(),
      organizationMemberships: (json['organization_memberships']
              as List<dynamic>?)
          ?.map(
              (e) => OrganizationMembership.fromJson(e as Map<String, dynamic>))
          .toList(),
      passwordEnabled: json['password_enabled'] as bool?,
      twoFactorEnabled: json['two_factor_enabled'] as bool?,
      totpEnabled: json['totp_enabled'] as bool?,
      backupCodeEnabled: json['backup_code_enabled'] as bool?,
      lastSignInAt: intToDateTime(json['last_sign_in_at']),
      banned: json['banned'] as bool?,
      locked: json['locked'] as bool?,
      lockoutExpiresInSeconds:
          (json['lockout_expires_in_seconds'] as num?)?.toInt(),
      verificationAttemptsRemaining:
          (json['verification_attempts_remaining'] as num?)?.toInt(),
      externalAccounts: (json['external_accounts'] as List<dynamic>?)
          ?.map((e) => ExternalAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: intToDateTime(json['updated_at']),
      createdAt: intToDateTime(json['created_at']),
      lastActiveAt: intToDateTime(json['last_active_at']),
      deleteSelfEnabled: json['delete_self_enabled'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('username', instance.username);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('profile_image_url', instance.profileImageUrl);
  writeNotNull('image_url', instance.imageUrl);
  writeNotNull('has_image', instance.hasImage);
  writeNotNull('primary_email_address_id', instance.primaryEmailAddressId);
  writeNotNull('primary_phone_number_id', instance.primaryPhoneNumberId);
  writeNotNull('primary_web3_wallet_id', instance.primaryWeb3WalletId);
  writeNotNull('public_metadata', instance.publicMetadata);
  writeNotNull('private_metadata', instance.privateMetadata);
  writeNotNull('unsafe_metadata', instance.userMetadata);
  writeNotNull('email_addresses',
      instance.emailAddresses?.map((e) => e.toJson()).toList());
  writeNotNull(
      'phone_numbers', instance.phoneNumbers?.map((e) => e.toJson()).toList());
  writeNotNull(
      'web3_wallets', instance.web3Wallets?.map((e) => e.toJson()).toList());
  writeNotNull('passkeys', instance.passkeys?.map((e) => e.toJson()).toList());
  writeNotNull('organization_memberships',
      instance.organizationMemberships?.map((e) => e.toJson()).toList());
  writeNotNull('external_accounts',
      instance.externalAccounts?.map((e) => e.toJson()).toList());
  writeNotNull('password_enabled', instance.passwordEnabled);
  writeNotNull('two_factor_enabled', instance.twoFactorEnabled);
  writeNotNull('totp_enabled', instance.totpEnabled);
  writeNotNull('backup_code_enabled', instance.backupCodeEnabled);
  writeNotNull('banned', instance.banned);
  writeNotNull('locked', instance.locked);
  writeNotNull('lockout_expires_in_seconds', instance.lockoutExpiresInSeconds);
  writeNotNull('verification_attempts_remaining',
      instance.verificationAttemptsRemaining);
  writeNotNull('delete_self_enabled', instance.deleteSelfEnabled);
  val['last_sign_in_at'] = dateTimeToInt(instance.lastSignInAt);
  val['updated_at'] = dateTimeToInt(instance.updatedAt);
  val['created_at'] = dateTimeToInt(instance.createdAt);
  val['last_active_at'] = dateTimeToInt(instance.lastActiveAt);
  return val;
}
