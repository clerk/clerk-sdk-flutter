import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
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

  final String id;
  final String? firstName;
  final String? lastName;
  final String? profileImageUrl;
  final String? imageUrl;
  final bool? hasImage;
  final String? primaryEmailAddressId;
  final String? primaryPhoneNumberId;
  final String? primaryWeb3WalletId;
  final Map<String, dynamic>? publicMetadata;
  final Map<String, dynamic>? privateMetadata;
  final Map<String, dynamic>? unsafeMetadata;
  final List<Email>? emailAddresses;
  final List<PhoneNumber>? phoneNumbers;
  final List<Web3Wallet>? web3Wallets;
  final List<Passkey>? passkeys;
  final List<OrganizationMembership>? organizationMemberships;
  final bool? passwordEnabled;
  final bool? twoFactorEnabled;
  final bool? totpEnabled;
  final bool? backupCodeEnabled;
  final bool? banned;
  final bool? locked;
  final int? lockoutExpiresInSeconds;
  final int? verificationAttemptsRemaining;
  final bool? deleteSelfEnabled;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? lastSignInAt;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? updatedAt;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? createdAt;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? lastActiveAt;

  static User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String? _persisted(String? id, List<UserIdentifyingData>? items) {
    if (id is String && items is List<UserIdentifyingData>) {
      for (final item in items) {
        if (item.id == id) return item.identifier;
      }
    }
    return null;
  }

  String get name => '$firstName $lastName';

  String? get email => _persisted(primaryEmailAddressId, emailAddresses);

  String? get phoneNumber => _persisted(primaryPhoneNumberId, phoneNumbers);

  String? get web3WalletId => _persisted(primaryWeb3WalletId, web3Wallets);

  bool get emailIsPersisted =>
      email is String &&
      email == _persisted(primaryEmailAddressId, emailAddresses);

  bool get phoneNumberIsPersisted =>
      phoneNumber is String &&
      phoneNumber == _persisted(primaryPhoneNumberId, phoneNumbers);

  bool get web3WalletIdIsPersisted =>
      web3WalletId is String &&
      web3WalletId == _persisted(primaryWeb3WalletId, web3Wallets);

  User copyWith({
    String? firstName,
    String? lastName,
    String? profileImageUrl,
    String? imageUrl,
    bool? hasImage,
    String? primaryEmailAddressId,
    String? primaryPhoneNumberId,
    String? primaryWeb3WalletId,
    Map<String, dynamic>? publicMetadata,
    Map<String, dynamic>? privateMetadata,
    Map<String, dynamic>? unsafeMetadata,
    List<Email>? emailAddresses,
    List<PhoneNumber>? phoneNumbers,
    List<Web3Wallet>? web3Wallets,
    List<Passkey>? passkeys,
    List<OrganizationMembership>? organizationMemberships,
    bool? passwordEnabled,
    bool? twoFactorEnabled,
    bool? totpEnabled,
    bool? backupCodeEnabled,
    DateTime? lastSignInAt,
    bool? banned,
    bool? locked,
    int? lockoutExpiresInSeconds,
    int? verificationAttemptsRemaining,
    DateTime? updatedAt,
    DateTime? createdAt,
    DateTime? lastActiveAt,
    bool? deleteSelfEnabled,
  }) =>
      User(
        id: id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        profileImageUrl: profileImageUrl ?? this.profileImageUrl,
        imageUrl: imageUrl ?? this.imageUrl,
        hasImage: hasImage ?? this.hasImage,
        primaryEmailAddressId:
            primaryEmailAddressId ?? this.primaryEmailAddressId,
        primaryPhoneNumberId: primaryPhoneNumberId ?? this.primaryPhoneNumberId,
        primaryWeb3WalletId: primaryWeb3WalletId ?? this.primaryWeb3WalletId,
        publicMetadata: publicMetadata ?? this.publicMetadata,
        privateMetadata: privateMetadata ?? this.privateMetadata,
        unsafeMetadata: unsafeMetadata ?? this.unsafeMetadata,
        emailAddresses: emailAddresses ?? this.emailAddresses,
        phoneNumbers: phoneNumbers ?? this.phoneNumbers,
        web3Wallets: web3Wallets ?? this.web3Wallets,
        passkeys: passkeys ?? this.passkeys,
        organizationMemberships:
            organizationMemberships ?? this.organizationMemberships,
        passwordEnabled: passwordEnabled ?? this.passwordEnabled,
        twoFactorEnabled: twoFactorEnabled ?? this.twoFactorEnabled,
        totpEnabled: totpEnabled ?? this.totpEnabled,
        backupCodeEnabled: backupCodeEnabled ?? this.backupCodeEnabled,
        lastSignInAt: lastSignInAt ?? this.lastSignInAt,
        banned: banned ?? this.banned,
        locked: locked ?? this.locked,
        lockoutExpiresInSeconds:
            lockoutExpiresInSeconds ?? this.lockoutExpiresInSeconds,
        verificationAttemptsRemaining:
            verificationAttemptsRemaining ?? this.verificationAttemptsRemaining,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        lastActiveAt: lastActiveAt ?? this.lastActiveAt,
        deleteSelfEnabled: deleteSelfEnabled ?? this.deleteSelfEnabled,
      );
}
