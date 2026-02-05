//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class User {
  /// Returns a new [User] instance.
  User({
    required this.id,
    required this.object,
    required this.externalId,
    required this.primaryEmailAddressId,
    required this.primaryPhoneNumberId,
    required this.primaryWeb3WalletId,
    required this.username,
    required this.firstName,
    required this.lastName,
    this.locale,
    this.profileImageUrl,
    this.imageUrl,
    required this.hasImage,
    this.publicMetadata = const {},
    this.privateMetadata = const {},
    this.unsafeMetadata = const {},
    this.emailAddresses = const [],
    this.phoneNumbers = const [],
    this.web3Wallets = const [],
    this.passkeys = const [],
    required this.passwordEnabled,
    required this.twoFactorEnabled,
    required this.totpEnabled,
    required this.backupCodeEnabled,
    required this.mfaEnabledAt,
    required this.mfaDisabledAt,
    this.passwordLastUpdatedAt,
    this.externalAccounts = const [],
    this.samlAccounts = const [],
    this.enterpriseAccounts = const [],
    this.organizationMemberships = const [],
    required this.lastSignInAt,
    required this.banned,
    required this.locked,
    required this.lockoutExpiresInSeconds,
    required this.verificationAttemptsRemaining,
    required this.updatedAt,
    required this.createdAt,
    required this.deleteSelfEnabled,
    required this.createOrganizationEnabled,
    this.createOrganizationsLimit,
    required this.lastActiveAt,
    required this.legalAcceptedAt,
    this.bypassClientTrust = false,
  });

  String id;

  /// String representing the object's type. Objects of the same type share the same value.
  UserObjectEnum object;

  String? externalId;

  String? primaryEmailAddressId;

  String? primaryPhoneNumberId;

  String? primaryWeb3WalletId;

  String? username;

  String? firstName;

  String? lastName;

  String? locale;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? profileImageUrl;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? imageUrl;

  bool hasImage;

  Map<String, Object> publicMetadata;

  Map<String, Object>? privateMetadata;

  Map<String, Object> unsafeMetadata;

  List<EmailAddress> emailAddresses;

  List<PhoneNumber> phoneNumbers;

  List<Web3Wallet> web3Wallets;

  List<Passkey> passkeys;

  bool passwordEnabled;

  bool twoFactorEnabled;

  bool totpEnabled;

  bool backupCodeEnabled;

  /// Unix timestamp of when MFA was last enabled for this user. It should be noted that this field is not nullified if MFA is disabled.
  int? mfaEnabledAt;

  /// Unix timestamp of when MFA was last disabled for this user. It should be noted that this field is not nullified if MFA is enabled again.
  int? mfaDisabledAt;

  /// Unix timestamp of when the user's password was last updated.
  int? passwordLastUpdatedAt;

  List<ExternalAccountWithVerification> externalAccounts;

  List<SAMLAccount> samlAccounts;

  List<EnterpriseAccount> enterpriseAccounts;

  List<OrganizationMembership> organizationMemberships;

  /// Unix timestamp of last sign-in.
  int? lastSignInAt;

  /// Flag to denote whether user is banned or not.
  bool banned;

  /// Flag to denote whether user is currently locked, i.e. restricted from signing in or not.
  bool locked;

  /// The number of seconds remaining until the lockout period expires for a locked user. A null value for a locked user indicates that lockout never expires.
  int? lockoutExpiresInSeconds;

  /// The number of verification attempts remaining until the user is locked. Null if account lockout is not enabled. Note: if a user is locked explicitly via the Backend API, they may still have verification attempts remaining.
  int? verificationAttemptsRemaining;

  /// Unix timestamp of last update.
  int updatedAt;

  /// Unix timestamp of creation.
  int createdAt;

  /// If enabled, user can delete themselves via FAPI.
  bool deleteSelfEnabled;

  /// If enabled, user can create organizations via FAPI.
  bool createOrganizationEnabled;

  /// The maximum number of organizations the user can create. 0 means unlimited.
  int? createOrganizationsLimit;

  /// Unix timestamp of the latest session activity, with day precision.
  int? lastActiveAt;

  /// Unix timestamp of when the user accepted the legal requirements.
  int? legalAcceptedAt;

  /// When set to `true`, the user will bypass client trust checks during sign-in.
  bool bypassClientTrust;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          other.id == id &&
          other.object == object &&
          other.externalId == externalId &&
          other.primaryEmailAddressId == primaryEmailAddressId &&
          other.primaryPhoneNumberId == primaryPhoneNumberId &&
          other.primaryWeb3WalletId == primaryWeb3WalletId &&
          other.username == username &&
          other.firstName == firstName &&
          other.lastName == lastName &&
          other.locale == locale &&
          other.profileImageUrl == profileImageUrl &&
          other.imageUrl == imageUrl &&
          other.hasImage == hasImage &&
          _deepEquality.equals(other.publicMetadata, publicMetadata) &&
          _deepEquality.equals(other.privateMetadata, privateMetadata) &&
          _deepEquality.equals(other.unsafeMetadata, unsafeMetadata) &&
          _deepEquality.equals(other.emailAddresses, emailAddresses) &&
          _deepEquality.equals(other.phoneNumbers, phoneNumbers) &&
          _deepEquality.equals(other.web3Wallets, web3Wallets) &&
          _deepEquality.equals(other.passkeys, passkeys) &&
          other.passwordEnabled == passwordEnabled &&
          other.twoFactorEnabled == twoFactorEnabled &&
          other.totpEnabled == totpEnabled &&
          other.backupCodeEnabled == backupCodeEnabled &&
          other.mfaEnabledAt == mfaEnabledAt &&
          other.mfaDisabledAt == mfaDisabledAt &&
          other.passwordLastUpdatedAt == passwordLastUpdatedAt &&
          _deepEquality.equals(other.externalAccounts, externalAccounts) &&
          _deepEquality.equals(other.samlAccounts, samlAccounts) &&
          _deepEquality.equals(other.enterpriseAccounts, enterpriseAccounts) &&
          _deepEquality.equals(
              other.organizationMemberships, organizationMemberships) &&
          other.lastSignInAt == lastSignInAt &&
          other.banned == banned &&
          other.locked == locked &&
          other.lockoutExpiresInSeconds == lockoutExpiresInSeconds &&
          other.verificationAttemptsRemaining ==
              verificationAttemptsRemaining &&
          other.updatedAt == updatedAt &&
          other.createdAt == createdAt &&
          other.deleteSelfEnabled == deleteSelfEnabled &&
          other.createOrganizationEnabled == createOrganizationEnabled &&
          other.createOrganizationsLimit == createOrganizationsLimit &&
          other.lastActiveAt == lastActiveAt &&
          other.legalAcceptedAt == legalAcceptedAt &&
          other.bypassClientTrust == bypassClientTrust;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (object.hashCode) +
      (externalId == null ? 0 : externalId!.hashCode) +
      (primaryEmailAddressId == null ? 0 : primaryEmailAddressId!.hashCode) +
      (primaryPhoneNumberId == null ? 0 : primaryPhoneNumberId!.hashCode) +
      (primaryWeb3WalletId == null ? 0 : primaryWeb3WalletId!.hashCode) +
      (username == null ? 0 : username!.hashCode) +
      (firstName == null ? 0 : firstName!.hashCode) +
      (lastName == null ? 0 : lastName!.hashCode) +
      (locale == null ? 0 : locale!.hashCode) +
      (profileImageUrl == null ? 0 : profileImageUrl!.hashCode) +
      (imageUrl == null ? 0 : imageUrl!.hashCode) +
      (hasImage.hashCode) +
      (publicMetadata.hashCode) +
      (privateMetadata == null ? 0 : privateMetadata!.hashCode) +
      (unsafeMetadata.hashCode) +
      (emailAddresses.hashCode) +
      (phoneNumbers.hashCode) +
      (web3Wallets.hashCode) +
      (passkeys.hashCode) +
      (passwordEnabled.hashCode) +
      (twoFactorEnabled.hashCode) +
      (totpEnabled.hashCode) +
      (backupCodeEnabled.hashCode) +
      (mfaEnabledAt == null ? 0 : mfaEnabledAt!.hashCode) +
      (mfaDisabledAt == null ? 0 : mfaDisabledAt!.hashCode) +
      (passwordLastUpdatedAt == null ? 0 : passwordLastUpdatedAt!.hashCode) +
      (externalAccounts.hashCode) +
      (samlAccounts.hashCode) +
      (enterpriseAccounts.hashCode) +
      (organizationMemberships.hashCode) +
      (lastSignInAt == null ? 0 : lastSignInAt!.hashCode) +
      (banned.hashCode) +
      (locked.hashCode) +
      (lockoutExpiresInSeconds == null
          ? 0
          : lockoutExpiresInSeconds!.hashCode) +
      (verificationAttemptsRemaining == null
          ? 0
          : verificationAttemptsRemaining!.hashCode) +
      (updatedAt.hashCode) +
      (createdAt.hashCode) +
      (deleteSelfEnabled.hashCode) +
      (createOrganizationEnabled.hashCode) +
      (createOrganizationsLimit == null
          ? 0
          : createOrganizationsLimit!.hashCode) +
      (lastActiveAt == null ? 0 : lastActiveAt!.hashCode) +
      (legalAcceptedAt == null ? 0 : legalAcceptedAt!.hashCode) +
      (bypassClientTrust.hashCode);

  @override
  String toString() =>
      'User[id=$id, object=$object, externalId=$externalId, primaryEmailAddressId=$primaryEmailAddressId, primaryPhoneNumberId=$primaryPhoneNumberId, primaryWeb3WalletId=$primaryWeb3WalletId, username=$username, firstName=$firstName, lastName=$lastName, locale=$locale, profileImageUrl=$profileImageUrl, imageUrl=$imageUrl, hasImage=$hasImage, publicMetadata=$publicMetadata, privateMetadata=$privateMetadata, unsafeMetadata=$unsafeMetadata, emailAddresses=$emailAddresses, phoneNumbers=$phoneNumbers, web3Wallets=$web3Wallets, passkeys=$passkeys, passwordEnabled=$passwordEnabled, twoFactorEnabled=$twoFactorEnabled, totpEnabled=$totpEnabled, backupCodeEnabled=$backupCodeEnabled, mfaEnabledAt=$mfaEnabledAt, mfaDisabledAt=$mfaDisabledAt, passwordLastUpdatedAt=$passwordLastUpdatedAt, externalAccounts=$externalAccounts, samlAccounts=$samlAccounts, enterpriseAccounts=$enterpriseAccounts, organizationMemberships=$organizationMemberships, lastSignInAt=$lastSignInAt, banned=$banned, locked=$locked, lockoutExpiresInSeconds=$lockoutExpiresInSeconds, verificationAttemptsRemaining=$verificationAttemptsRemaining, updatedAt=$updatedAt, createdAt=$createdAt, deleteSelfEnabled=$deleteSelfEnabled, createOrganizationEnabled=$createOrganizationEnabled, createOrganizationsLimit=$createOrganizationsLimit, lastActiveAt=$lastActiveAt, legalAcceptedAt=$legalAcceptedAt, bypassClientTrust=$bypassClientTrust]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'object'] = this.object;
    if (this.externalId != null) {
      json[r'external_id'] = this.externalId;
    } else {
      json[r'external_id'] = null;
    }
    if (this.primaryEmailAddressId != null) {
      json[r'primary_email_address_id'] = this.primaryEmailAddressId;
    } else {
      json[r'primary_email_address_id'] = null;
    }
    if (this.primaryPhoneNumberId != null) {
      json[r'primary_phone_number_id'] = this.primaryPhoneNumberId;
    } else {
      json[r'primary_phone_number_id'] = null;
    }
    if (this.primaryWeb3WalletId != null) {
      json[r'primary_web3_wallet_id'] = this.primaryWeb3WalletId;
    } else {
      json[r'primary_web3_wallet_id'] = null;
    }
    if (this.username != null) {
      json[r'username'] = this.username;
    } else {
      json[r'username'] = null;
    }
    if (this.firstName != null) {
      json[r'first_name'] = this.firstName;
    } else {
      json[r'first_name'] = null;
    }
    if (this.lastName != null) {
      json[r'last_name'] = this.lastName;
    } else {
      json[r'last_name'] = null;
    }
    if (this.locale != null) {
      json[r'locale'] = this.locale;
    } else {
      json[r'locale'] = null;
    }
    if (this.profileImageUrl != null) {
      json[r'profile_image_url'] = this.profileImageUrl;
    } else {
      json[r'profile_image_url'] = null;
    }
    if (this.imageUrl != null) {
      json[r'image_url'] = this.imageUrl;
    } else {
      json[r'image_url'] = null;
    }
    json[r'has_image'] = this.hasImage;
    json[r'public_metadata'] = this.publicMetadata;
    if (this.privateMetadata != null) {
      json[r'private_metadata'] = this.privateMetadata;
    } else {
      json[r'private_metadata'] = null;
    }
    json[r'unsafe_metadata'] = this.unsafeMetadata;
    json[r'email_addresses'] = this.emailAddresses;
    json[r'phone_numbers'] = this.phoneNumbers;
    json[r'web3_wallets'] = this.web3Wallets;
    json[r'passkeys'] = this.passkeys;
    json[r'password_enabled'] = this.passwordEnabled;
    json[r'two_factor_enabled'] = this.twoFactorEnabled;
    json[r'totp_enabled'] = this.totpEnabled;
    json[r'backup_code_enabled'] = this.backupCodeEnabled;
    if (this.mfaEnabledAt != null) {
      json[r'mfa_enabled_at'] = this.mfaEnabledAt;
    } else {
      json[r'mfa_enabled_at'] = null;
    }
    if (this.mfaDisabledAt != null) {
      json[r'mfa_disabled_at'] = this.mfaDisabledAt;
    } else {
      json[r'mfa_disabled_at'] = null;
    }
    if (this.passwordLastUpdatedAt != null) {
      json[r'password_last_updated_at'] = this.passwordLastUpdatedAt;
    } else {
      json[r'password_last_updated_at'] = null;
    }
    json[r'external_accounts'] = this.externalAccounts;
    json[r'saml_accounts'] = this.samlAccounts;
    json[r'enterprise_accounts'] = this.enterpriseAccounts;
    json[r'organization_memberships'] = this.organizationMemberships;
    if (this.lastSignInAt != null) {
      json[r'last_sign_in_at'] = this.lastSignInAt;
    } else {
      json[r'last_sign_in_at'] = null;
    }
    json[r'banned'] = this.banned;
    json[r'locked'] = this.locked;
    if (this.lockoutExpiresInSeconds != null) {
      json[r'lockout_expires_in_seconds'] = this.lockoutExpiresInSeconds;
    } else {
      json[r'lockout_expires_in_seconds'] = null;
    }
    if (this.verificationAttemptsRemaining != null) {
      json[r'verification_attempts_remaining'] =
          this.verificationAttemptsRemaining;
    } else {
      json[r'verification_attempts_remaining'] = null;
    }
    json[r'updated_at'] = this.updatedAt;
    json[r'created_at'] = this.createdAt;
    json[r'delete_self_enabled'] = this.deleteSelfEnabled;
    json[r'create_organization_enabled'] = this.createOrganizationEnabled;
    if (this.createOrganizationsLimit != null) {
      json[r'create_organizations_limit'] = this.createOrganizationsLimit;
    } else {
      json[r'create_organizations_limit'] = null;
    }
    if (this.lastActiveAt != null) {
      json[r'last_active_at'] = this.lastActiveAt;
    } else {
      json[r'last_active_at'] = null;
    }
    if (this.legalAcceptedAt != null) {
      json[r'legal_accepted_at'] = this.legalAcceptedAt;
    } else {
      json[r'legal_accepted_at'] = null;
    }
    json[r'bypass_client_trust'] = this.bypassClientTrust;
    return json;
  }

  /// Returns a new [User] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static User? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "User[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "User[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return User(
        id: mapValueOfType<String>(json, r'id')!,
        object: UserObjectEnum.fromJson(json[r'object'])!,
        externalId: mapValueOfType<String>(json, r'external_id'),
        primaryEmailAddressId:
            mapValueOfType<String>(json, r'primary_email_address_id'),
        primaryPhoneNumberId:
            mapValueOfType<String>(json, r'primary_phone_number_id'),
        primaryWeb3WalletId:
            mapValueOfType<String>(json, r'primary_web3_wallet_id'),
        username: mapValueOfType<String>(json, r'username'),
        firstName: mapValueOfType<String>(json, r'first_name'),
        lastName: mapValueOfType<String>(json, r'last_name'),
        locale: mapValueOfType<String>(json, r'locale'),
        profileImageUrl: mapValueOfType<String>(json, r'profile_image_url'),
        imageUrl: mapValueOfType<String>(json, r'image_url'),
        hasImage: mapValueOfType<bool>(json, r'has_image')!,
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata')!,
        privateMetadata:
            mapCastOfType<String, Object>(json, r'private_metadata') ??
                const {},
        unsafeMetadata:
            mapCastOfType<String, Object>(json, r'unsafe_metadata') ?? const {},
        emailAddresses: EmailAddress.listFromJson(json[r'email_addresses']),
        phoneNumbers: PhoneNumber.listFromJson(json[r'phone_numbers']),
        web3Wallets: Web3Wallet.listFromJson(json[r'web3_wallets']),
        passkeys: Passkey.listFromJson(json[r'passkeys']),
        passwordEnabled: mapValueOfType<bool>(json, r'password_enabled')!,
        twoFactorEnabled: mapValueOfType<bool>(json, r'two_factor_enabled')!,
        totpEnabled: mapValueOfType<bool>(json, r'totp_enabled')!,
        backupCodeEnabled: mapValueOfType<bool>(json, r'backup_code_enabled')!,
        mfaEnabledAt: mapValueOfType<int>(json, r'mfa_enabled_at'),
        mfaDisabledAt: mapValueOfType<int>(json, r'mfa_disabled_at'),
        passwordLastUpdatedAt:
            mapValueOfType<int>(json, r'password_last_updated_at'),
        externalAccounts: ExternalAccountWithVerification.listFromJson(
            json[r'external_accounts']),
        samlAccounts: SAMLAccount.listFromJson(json[r'saml_accounts']),
        enterpriseAccounts:
            EnterpriseAccount.listFromJson(json[r'enterprise_accounts']),
        organizationMemberships: OrganizationMembership.listFromJson(
            json[r'organization_memberships']),
        lastSignInAt: mapValueOfType<int>(json, r'last_sign_in_at'),
        banned: mapValueOfType<bool>(json, r'banned')!,
        locked: mapValueOfType<bool>(json, r'locked')!,
        lockoutExpiresInSeconds:
            mapValueOfType<int>(json, r'lockout_expires_in_seconds'),
        verificationAttemptsRemaining:
            mapValueOfType<int>(json, r'verification_attempts_remaining'),
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        deleteSelfEnabled: mapValueOfType<bool>(json, r'delete_self_enabled')!,
        createOrganizationEnabled:
            mapValueOfType<bool>(json, r'create_organization_enabled')!,
        createOrganizationsLimit:
            mapValueOfType<int>(json, r'create_organizations_limit'),
        lastActiveAt: mapValueOfType<int>(json, r'last_active_at'),
        legalAcceptedAt: mapValueOfType<int>(json, r'legal_accepted_at'),
        bypassClientTrust:
            mapValueOfType<bool>(json, r'bypass_client_trust') ?? false,
      );
    }
    return null;
  }

  static List<User> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <User>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = User.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, User> mapFromJson(dynamic json) {
    final map = <String, User>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = User.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of User-objects as value to a dart map
  static Map<String, List<User>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<User>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = User.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'object',
    'external_id',
    'primary_email_address_id',
    'primary_phone_number_id',
    'primary_web3_wallet_id',
    'username',
    'first_name',
    'last_name',
    'has_image',
    'public_metadata',
    'email_addresses',
    'phone_numbers',
    'web3_wallets',
    'passkeys',
    'password_enabled',
    'two_factor_enabled',
    'totp_enabled',
    'backup_code_enabled',
    'mfa_enabled_at',
    'mfa_disabled_at',
    'external_accounts',
    'saml_accounts',
    'enterprise_accounts',
    'last_sign_in_at',
    'banned',
    'locked',
    'lockout_expires_in_seconds',
    'verification_attempts_remaining',
    'updated_at',
    'created_at',
    'delete_self_enabled',
    'create_organization_enabled',
    'last_active_at',
    'legal_accepted_at',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class UserObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const UserObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const user = UserObjectEnum._(r'user');

  /// List of all possible values in this [enum][UserObjectEnum].
  static const values = <UserObjectEnum>[
    user,
  ];

  static UserObjectEnum? fromJson(dynamic value) =>
      UserObjectEnumTypeTransformer().decode(value);

  static List<UserObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UserObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UserObjectEnum] to String,
/// and [decode] dynamic data back to [UserObjectEnum].
class UserObjectEnumTypeTransformer {
  factory UserObjectEnumTypeTransformer() =>
      _instance ??= const UserObjectEnumTypeTransformer._();

  const UserObjectEnumTypeTransformer._();

  String encode(UserObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a UserObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UserObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'user':
          return UserObjectEnum.user;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [UserObjectEnumTypeTransformer] instance.
  static UserObjectEnumTypeTransformer? _instance;
}
