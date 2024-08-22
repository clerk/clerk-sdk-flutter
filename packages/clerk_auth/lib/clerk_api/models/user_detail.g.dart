// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) => UserDetail(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      profileImageUrl: json['profile_image_url'] as String,
      imageUrl: json['image_url'] as String,
      hasImage: json['has_image'] as bool,
      primaryEmailAddressId: json['primary_email_address_id'] as String,
      primaryPhoneNumberId: json['primary_phone_number_id'] as String,
      primaryWeb3WalletId: json['primary_web3_wallet_id'] as String,
      publicMetadata: json['public_metadata'] as Map<String, dynamic>,
      privateMetadata: json['private_metadata'] as Map<String, dynamic>,
      unsafeMetadata: json['unsafe_metadata'] as Map<String, dynamic>,
      emailAddresses: (json['email_addresses'] as List<dynamic>)
          .map((e) => Email.fromJson(e as Map<String, dynamic>))
          .toList(),
      phoneNumbers: (json['phone_numbers'] as List<dynamic>)
          .map((e) => PhoneNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
      web3Wallets: (json['web3_wallets'] as List<dynamic>)
          .map((e) => Web3Wallet.fromJson(e as Map<String, dynamic>))
          .toList(),
      passkeys: (json['passkeys'] as List<dynamic>)
          .map((e) => Passkey.fromJson(e as Map<String, dynamic>))
          .toList(),
      organizationMemberships: (json['organization_memberships']
              as List<dynamic>)
          .map(
              (e) => OrganizationMembership.fromJson(e as Map<String, dynamic>))
          .toList(),
      passwordEnabled: json['password_enabled'] as bool,
      twoFactorEnabled: json['two_factor_enabled'] as bool,
      totpEnabled: json['totp_enabled'] as bool,
      backupCodeEnabled: json['backup_code_enabled'] as bool,
      lastSignInAt: DateTime.parse(json['last_sign_in_at'] as String),
      banned: json['banned'] as bool,
      locked: json['locked'] as bool,
      lockoutExpiresInSeconds:
          (json['lockout_expires_in_seconds'] as num).toInt(),
      verificationAttemptsRemaining:
          (json['verification_attempts_remaining'] as num).toInt(),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      lastActiveAt: DateTime.parse(json['last_active_at'] as String),
      deleteSelfEnabled: json['delete_self_enabled'] as bool,
    );

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'profile_image_url': instance.profileImageUrl,
      'image_url': instance.imageUrl,
      'has_image': instance.hasImage,
      'primary_email_address_id': instance.primaryEmailAddressId,
      'primary_phone_number_id': instance.primaryPhoneNumberId,
      'primary_web3_wallet_id': instance.primaryWeb3WalletId,
      'public_metadata': instance.publicMetadata,
      'private_metadata': instance.privateMetadata,
      'unsafe_metadata': instance.unsafeMetadata,
      'email_addresses': instance.emailAddresses,
      'phone_numbers': instance.phoneNumbers,
      'web3_wallets': instance.web3Wallets,
      'passkeys': instance.passkeys,
      'organization_memberships': instance.organizationMemberships,
      'password_enabled': instance.passwordEnabled,
      'two_factor_enabled': instance.twoFactorEnabled,
      'totp_enabled': instance.totpEnabled,
      'backup_code_enabled': instance.backupCodeEnabled,
      'last_sign_in_at': instance.lastSignInAt.toIso8601String(),
      'banned': instance.banned,
      'locked': instance.locked,
      'lockout_expires_in_seconds': instance.lockoutExpiresInSeconds,
      'verification_attempts_remaining': instance.verificationAttemptsRemaining,
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'last_active_at': instance.lastActiveAt.toIso8601String(),
      'delete_self_enabled': instance.deleteSelfEnabled,
    };
