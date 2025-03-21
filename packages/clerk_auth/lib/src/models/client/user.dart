import 'package:clerk_auth/src/models/client/email.dart';
import 'package:clerk_auth/src/models/client/external_account.dart';
import 'package:clerk_auth/src/models/client/organization.dart';
import 'package:clerk_auth/src/models/client/organization_membership.dart';
import 'package:clerk_auth/src/models/client/passkey.dart';
import 'package:clerk_auth/src/models/client/phone_number.dart';
import 'package:clerk_auth/src/models/client/user_identifying_data.dart';
import 'package:clerk_auth/src/models/client/web3_wallet.dart';
import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:clerk_auth/src/utils/extensions.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

/// [User] Clerk object
@immutable
@JsonSerializable()
class User with InformativeToStringMixin {
  /// Constructor
  const User({
    required this.id,
    required this.username,
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
    required this.createOrganizationEnabled,
    required this.passwordEnabled,
    required this.twoFactorEnabled,
    required this.totpEnabled,
    required this.backupCodeEnabled,
    required this.lastSignInAt,
    required this.banned,
    required this.locked,
    required this.lockoutExpiresInSeconds,
    required this.verificationAttemptsRemaining,
    required this.externalAccounts,
    required this.updatedAt,
    required this.createdAt,
    required this.lastActiveAt,
    required this.deleteSelfEnabled,
  });

  /// id
  final String id;

  /// username
  final String? username;

  /// first name
  final String? firstName;

  /// last name
  final String? lastName;

  /// profile image url
  final String? profileImageUrl;

  /// image url
  final String? imageUrl;

  /// has image
  final bool? hasImage;

  /// primary email address id
  final String? primaryEmailAddressId;

  /// primary phone number id
  final String? primaryPhoneNumberId;

  /// primary web3 wallet id
  final String? primaryWeb3WalletId;

  /// public metadata
  final Map<String, dynamic>? publicMetadata;

  /// private metadata
  @JsonKey(defaultValue: <String, dynamic>{})
  final Map<String, dynamic> privateMetadata;

  /// unsafe metadata
  final Map<String, dynamic>? unsafeMetadata;

  /// email addresses
  final List<Email>? emailAddresses;

  /// phone numbers
  final List<PhoneNumber>? phoneNumbers;

  /// web3 wallets
  final List<Web3Wallet>? web3Wallets;

  /// passkeys
  final List<Passkey>? passkeys;

  /// organization memberships
  final List<OrganizationMembership>? organizationMemberships;

  /// can create organizations?
  final bool createOrganizationEnabled;

  /// external accounts
  final List<ExternalAccount>? externalAccounts;

  /// password enabled
  final bool? passwordEnabled;

  /// two factor enabled
  final bool? twoFactorEnabled;

  /// totp enabled
  final bool? totpEnabled;

  /// backup code enabled
  final bool? backupCodeEnabled;

  /// banned
  final bool? banned;

  /// locked
  final bool? locked;

  /// lockout expires in seconds
  final int? lockoutExpiresInSeconds;

  /// verification attempts remaining
  final int? verificationAttemptsRemaining;

  /// delete self enabled
  final bool? deleteSelfEnabled;

  /// last sign in at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime lastSignInAt;

  /// updated at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime updatedAt;

  /// created at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime createdAt;

  /// last active at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime lastActiveAt;

  /// Does this user have metadata?
  bool get hasMetadata => unsafeMetadata?.isNotEmpty == true;

  /// fromJson
  static User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  static const _kCurrentOrganization = r'$current-organization$';

  /// current organization
  OrganizationMembership? get currentOrganization =>
      privateMetadata[_kCurrentOrganization];

  set currentOrganization(OrganizationMembership? org) =>
      privateMetadata[_kCurrentOrganization] = org;

  /// The [nextOrganization], following the [currentOrganization]
  OrganizationMembership? get nextOrganization {
    if (organizationMemberships case List<OrganizationMembership> orgs
        when orgs.isNotEmpty) {
      if (currentOrganization case OrganizationMembership org) {
        final idx = orgs.indexOf(org);
        if (idx >= 0 && idx < orgs.length - 1) {
          return orgs[idx + 1];
        }
      } else {
        return orgs.first;
      }
    }
    return null;
  }

  /// do we have a name?
  bool get hasName =>
      firstName?.isNotEmpty == true || lastName?.isNotEmpty == true;

  /// name
  String get name =>
      [firstName?.orNullIfEmpty, lastName?.orNullIfEmpty].nonNulls.join(' ');

  /// test the [UserIdentifyingData] to see if it is
  /// one of the [User]'s primary identifiers
  bool isPrimary(UserIdentifyingData item) =>
      item.id == primaryEmailAddressId ||
      item.id == primaryPhoneNumberId ||
      item.id == primaryWeb3WalletId;

  /// Return an [UserIdentifyingData] for a given [identifier] if such exists
  UserIdentifyingData? identifierFrom(String identifier) {
    final identifiers = [...?emailAddresses, ...?phoneNumbers];
    for (final ident in identifiers) {
      if (ident.identifier == ident.type.sanitize(identifier)) return ident;
    }
    return null;
  }

  String? _persisted(String? id, List<UserIdentifyingData>? items) {
    if (id is String && items is List<UserIdentifyingData>) {
      for (final item in items) {
        if (item.id == id) return item.identifier;
      }
    }
    return null;
  }

  /// email
  String? get email => _persisted(primaryEmailAddressId, emailAddresses);

  /// phone number
  String? get phoneNumber => _persisted(primaryPhoneNumberId, phoneNumbers);

  /// web3 wallet id
  String? get web3WalletId => _persisted(primaryWeb3WalletId, web3Wallets);

  /// email is persisted?
  bool get emailIsPersisted =>
      email is String &&
      email == _persisted(primaryEmailAddressId, emailAddresses);

  /// phone number is persisted?
  bool get phoneNumberIsPersisted =>
      phoneNumber is String &&
      phoneNumber == _persisted(primaryPhoneNumberId, phoneNumbers);

  /// web3 wallet id is persisted?
  bool get web3WalletIdIsPersisted =>
      web3WalletId is String &&
      web3WalletId == _persisted(primaryWeb3WalletId, web3Wallets);

  /// do we have organizations?
  bool get hasOrganizations => organizationMemberships?.isNotEmpty == true;

  /// Find an [Organization] with a given [name]
  Organization? organizationNamed(String name) => organizationMemberships
      ?.firstWhereOrNull((o) => o.organization.name == name)
      ?.organization;

  /// copy this user with changed fields
  User copyWith({
    String? username,
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
    List<ExternalAccount>? externalAccounts,
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
    bool? createOrganizationEnabled,
  }) {
    return User(
      id: id,
      username: username ?? this.username,
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
      createOrganizationEnabled:
          createOrganizationEnabled ?? this.createOrganizationEnabled,
      externalAccounts: externalAccounts ?? this.externalAccounts,
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
}
