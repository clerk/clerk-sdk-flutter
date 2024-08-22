import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'user_detail.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserDetail {
  final String id;
  final String firstName;
  final String lastName;
  final String profileImageUrl;
  final String imageUrl;
  final bool hasImage;
  final String primaryEmailAddressId;
  final String primaryPhoneNumberId;
  final String primaryWeb3WalletId;
  final Map<String, dynamic> publicMetadata;
  final Map<String, dynamic> privateMetadata;
  final Map<String, dynamic> unsafeMetadata;
  final List<Email> emailAddresses;
  final List<PhoneNumber> phoneNumbers;
  final List<Web3Wallet> web3Wallets;
  final List<Passkey> passkeys;
  final List<OrganizationMembership> organizationMemberships;
  final bool passwordEnabled;
  final bool twoFactorEnabled;
  final bool totpEnabled;
  final bool backupCodeEnabled;
  final DateTime lastSignInAt;
  final bool banned;
  final bool locked;
  final int lockoutExpiresInSeconds;
  final int verificationAttemptsRemaining;
  final DateTime updatedAt;
  final DateTime createdAt;
  final DateTime lastActiveAt;
  final bool deleteSelfEnabled;

  UserDetail({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.profileImageUrl,
    required this.imageUrl,
    required this.hasImage,
    required this.primaryEmailAddressId,
    required this.primaryPhoneNumberId,
    required this.primaryWeb3WalletId,
    required this.publicMetadata,
    required this.privateMetadata,
    required this.unsafeMetadata,
    required this.emailAddresses,
    required this.phoneNumbers,
    required this.web3Wallets,
    required this.passkeys,
    required this.organizationMemberships,
    required this.passwordEnabled,
    required this.twoFactorEnabled,
    required this.totpEnabled,
    required this.backupCodeEnabled,
    required this.lastSignInAt,
    required this.banned,
    required this.locked,
    required this.lockoutExpiresInSeconds,
    required this.verificationAttemptsRemaining,
    required this.updatedAt,
    required this.createdAt,
    required this.lastActiveAt,
    required this.deleteSelfEnabled,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) => _$UserDetailFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailToJson(this);
}
