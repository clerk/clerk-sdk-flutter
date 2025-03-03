//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class User {
  /// Returns a new [User] instance.
  User({
    this.id,
    this.object,
    this.externalId,
    this.primaryEmailAddressId,
    this.primaryPhoneNumberId,
    this.primaryWeb3WalletId,
    this.username,
    this.firstName,
    this.lastName,
    this.profileImageUrl,
    this.imageUrl,
    this.hasImage,
    this.publicMetadata = const {},
    this.privateMetadata = const {},
    this.unsafeMetadata = const {},
    this.emailAddresses = const [],
    this.phoneNumbers = const [],
    this.web3Wallets = const [],
    this.passkeys = const [],
    this.passwordEnabled,
    this.twoFactorEnabled,
    this.totpEnabled,
    this.backupCodeEnabled,
    this.mfaEnabledAt,
    this.mfaDisabledAt,
    this.externalAccounts = const [],
    this.samlAccounts = const [],
    this.lastSignInAt,
    this.banned,
    this.locked,
    this.lockoutExpiresInSeconds,
    this.verificationAttemptsRemaining,
    this.updatedAt,
    this.createdAt,
    this.deleteSelfEnabled,
    this.createOrganizationEnabled,
    this.createOrganizationsLimit,
    this.lastActiveAt,
    this.legalAcceptedAt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// String representing the object's type. Objects of the same type share the same value.
  UserObjectEnum? object;

  String? externalId;

  String? primaryEmailAddressId;

  String? primaryPhoneNumberId;

  String? primaryWeb3WalletId;

  String? username;

  String? firstName;

  String? lastName;

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

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? hasImage;

  Map<String, Object> publicMetadata;

  Map<String, Object>? privateMetadata;

  Map<String, Object> unsafeMetadata;

  List<EmailAddress> emailAddresses;

  List<PhoneNumber> phoneNumbers;

  List<Web3Wallet> web3Wallets;

  List<SchemasPasskey> passkeys;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? passwordEnabled;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? twoFactorEnabled;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? totpEnabled;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? backupCodeEnabled;

  /// Unix timestamp of when MFA was last enabled for this user. It should be noted that this field is not nullified if MFA is disabled.
  int? mfaEnabledAt;

  /// Unix timestamp of when MFA was last disabled for this user. It should be noted that this field is not nullified if MFA is enabled again.
  int? mfaDisabledAt;

  List<dynamic> externalAccounts;

  List<SAMLAccount> samlAccounts;

  /// Unix timestamp of last sign-in.
  int? lastSignInAt;

  /// Flag to denote whether user is banned or not.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? banned;

  /// Flag to denote whether user is currently locked, i.e. restricted from signing in or not.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? locked;

  /// The number of seconds remaining until the lockout period expires for a locked user. A null value for a locked user indicates that lockout never expires.
  int? lockoutExpiresInSeconds;

  /// The number of verification attempts remaining until the user is locked. Null if account lockout is not enabled. Note: if a user is locked explicitly via the Backend API, they may still have verification attempts remaining.
  int? verificationAttemptsRemaining;

  /// Unix timestamp of last update.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? updatedAt;

  /// Unix timestamp of creation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? createdAt;

  /// If enabled, user can delete themselves via FAPI.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? deleteSelfEnabled;

  /// If enabled, user can create organizations via FAPI.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? createOrganizationEnabled;

  /// The maximum number of organizations the user can create. 0 means unlimited.
  int? createOrganizationsLimit;

  /// Unix timestamp of the latest session activity, with day precision.
  int? lastActiveAt;

  /// Unix timestamp of when the user accepted the legal requirements.
  int? legalAcceptedAt;

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
          _deepEquality.equals(other.externalAccounts, externalAccounts) &&
          _deepEquality.equals(other.samlAccounts, samlAccounts) &&
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
          other.legalAcceptedAt == legalAcceptedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id == null ? 0 : id!.hashCode) +
      (object == null ? 0 : object!.hashCode) +
      (externalId == null ? 0 : externalId!.hashCode) +
      (primaryEmailAddressId == null ? 0 : primaryEmailAddressId!.hashCode) +
      (primaryPhoneNumberId == null ? 0 : primaryPhoneNumberId!.hashCode) +
      (primaryWeb3WalletId == null ? 0 : primaryWeb3WalletId!.hashCode) +
      (username == null ? 0 : username!.hashCode) +
      (firstName == null ? 0 : firstName!.hashCode) +
      (lastName == null ? 0 : lastName!.hashCode) +
      (profileImageUrl == null ? 0 : profileImageUrl!.hashCode) +
      (imageUrl == null ? 0 : imageUrl!.hashCode) +
      (hasImage == null ? 0 : hasImage!.hashCode) +
      (publicMetadata.hashCode) +
      (privateMetadata == null ? 0 : privateMetadata!.hashCode) +
      (unsafeMetadata.hashCode) +
      (emailAddresses.hashCode) +
      (phoneNumbers.hashCode) +
      (web3Wallets.hashCode) +
      (passkeys.hashCode) +
      (passwordEnabled == null ? 0 : passwordEnabled!.hashCode) +
      (twoFactorEnabled == null ? 0 : twoFactorEnabled!.hashCode) +
      (totpEnabled == null ? 0 : totpEnabled!.hashCode) +
      (backupCodeEnabled == null ? 0 : backupCodeEnabled!.hashCode) +
      (mfaEnabledAt == null ? 0 : mfaEnabledAt!.hashCode) +
      (mfaDisabledAt == null ? 0 : mfaDisabledAt!.hashCode) +
      (externalAccounts.hashCode) +
      (samlAccounts.hashCode) +
      (lastSignInAt == null ? 0 : lastSignInAt!.hashCode) +
      (banned == null ? 0 : banned!.hashCode) +
      (locked == null ? 0 : locked!.hashCode) +
      (lockoutExpiresInSeconds == null
          ? 0
          : lockoutExpiresInSeconds!.hashCode) +
      (verificationAttemptsRemaining == null
          ? 0
          : verificationAttemptsRemaining!.hashCode) +
      (updatedAt == null ? 0 : updatedAt!.hashCode) +
      (createdAt == null ? 0 : createdAt!.hashCode) +
      (deleteSelfEnabled == null ? 0 : deleteSelfEnabled!.hashCode) +
      (createOrganizationEnabled == null
          ? 0
          : createOrganizationEnabled!.hashCode) +
      (createOrganizationsLimit == null
          ? 0
          : createOrganizationsLimit!.hashCode) +
      (lastActiveAt == null ? 0 : lastActiveAt!.hashCode) +
      (legalAcceptedAt == null ? 0 : legalAcceptedAt!.hashCode);

  @override
  String toString() =>
      'User[id=$id, object=$object, externalId=$externalId, primaryEmailAddressId=$primaryEmailAddressId, primaryPhoneNumberId=$primaryPhoneNumberId, primaryWeb3WalletId=$primaryWeb3WalletId, username=$username, firstName=$firstName, lastName=$lastName, profileImageUrl=$profileImageUrl, imageUrl=$imageUrl, hasImage=$hasImage, publicMetadata=$publicMetadata, privateMetadata=$privateMetadata, unsafeMetadata=$unsafeMetadata, emailAddresses=$emailAddresses, phoneNumbers=$phoneNumbers, web3Wallets=$web3Wallets, passkeys=$passkeys, passwordEnabled=$passwordEnabled, twoFactorEnabled=$twoFactorEnabled, totpEnabled=$totpEnabled, backupCodeEnabled=$backupCodeEnabled, mfaEnabledAt=$mfaEnabledAt, mfaDisabledAt=$mfaDisabledAt, externalAccounts=$externalAccounts, samlAccounts=$samlAccounts, lastSignInAt=$lastSignInAt, banned=$banned, locked=$locked, lockoutExpiresInSeconds=$lockoutExpiresInSeconds, verificationAttemptsRemaining=$verificationAttemptsRemaining, updatedAt=$updatedAt, createdAt=$createdAt, deleteSelfEnabled=$deleteSelfEnabled, createOrganizationEnabled=$createOrganizationEnabled, createOrganizationsLimit=$createOrganizationsLimit, lastActiveAt=$lastActiveAt, legalAcceptedAt=$legalAcceptedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.object != null) {
      json[r'object'] = this.object;
    } else {
      json[r'object'] = null;
    }
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
    if (this.hasImage != null) {
      json[r'has_image'] = this.hasImage;
    } else {
      json[r'has_image'] = null;
    }
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
    if (this.passwordEnabled != null) {
      json[r'password_enabled'] = this.passwordEnabled;
    } else {
      json[r'password_enabled'] = null;
    }
    if (this.twoFactorEnabled != null) {
      json[r'two_factor_enabled'] = this.twoFactorEnabled;
    } else {
      json[r'two_factor_enabled'] = null;
    }
    if (this.totpEnabled != null) {
      json[r'totp_enabled'] = this.totpEnabled;
    } else {
      json[r'totp_enabled'] = null;
    }
    if (this.backupCodeEnabled != null) {
      json[r'backup_code_enabled'] = this.backupCodeEnabled;
    } else {
      json[r'backup_code_enabled'] = null;
    }
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
    json[r'external_accounts'] = this.externalAccounts;
    json[r'saml_accounts'] = this.samlAccounts;
    if (this.lastSignInAt != null) {
      json[r'last_sign_in_at'] = this.lastSignInAt;
    } else {
      json[r'last_sign_in_at'] = null;
    }
    if (this.banned != null) {
      json[r'banned'] = this.banned;
    } else {
      json[r'banned'] = null;
    }
    if (this.locked != null) {
      json[r'locked'] = this.locked;
    } else {
      json[r'locked'] = null;
    }
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
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt;
    } else {
      json[r'created_at'] = null;
    }
    if (this.deleteSelfEnabled != null) {
      json[r'delete_self_enabled'] = this.deleteSelfEnabled;
    } else {
      json[r'delete_self_enabled'] = null;
    }
    if (this.createOrganizationEnabled != null) {
      json[r'create_organization_enabled'] = this.createOrganizationEnabled;
    } else {
      json[r'create_organization_enabled'] = null;
    }
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
        id: mapValueOfType<String>(json, r'id'),
        object: UserObjectEnum.fromJson(json[r'object']),
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
        profileImageUrl: mapValueOfType<String>(json, r'profile_image_url'),
        imageUrl: mapValueOfType<String>(json, r'image_url'),
        hasImage: mapValueOfType<bool>(json, r'has_image'),
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata') ?? const {},
        privateMetadata:
            mapCastOfType<String, Object>(json, r'private_metadata') ??
                const {},
        unsafeMetadata:
            mapCastOfType<String, Object>(json, r'unsafe_metadata') ?? const {},
        emailAddresses: EmailAddress.listFromJson(json[r'email_addresses']),
        phoneNumbers: PhoneNumber.listFromJson(json[r'phone_numbers']),
        web3Wallets: Web3Wallet.listFromJson(json[r'web3_wallets']),
        passkeys: SchemasPasskey.listFromJson(json[r'passkeys']),
        passwordEnabled: mapValueOfType<bool>(json, r'password_enabled'),
        twoFactorEnabled: mapValueOfType<bool>(json, r'two_factor_enabled'),
        totpEnabled: mapValueOfType<bool>(json, r'totp_enabled'),
        backupCodeEnabled: mapValueOfType<bool>(json, r'backup_code_enabled'),
        mfaEnabledAt: mapValueOfType<int>(json, r'mfa_enabled_at'),
        mfaDisabledAt: mapValueOfType<int>(json, r'mfa_disabled_at'),
        externalAccounts: (json[r'external_accounts'] as List? ?? []),
        samlAccounts: SAMLAccount.listFromJson(json[r'saml_accounts']),
        lastSignInAt: mapValueOfType<int>(json, r'last_sign_in_at'),
        banned: mapValueOfType<bool>(json, r'banned'),
        locked: mapValueOfType<bool>(json, r'locked'),
        lockoutExpiresInSeconds:
            mapValueOfType<int>(json, r'lockout_expires_in_seconds'),
        verificationAttemptsRemaining:
            mapValueOfType<int>(json, r'verification_attempts_remaining'),
        updatedAt: mapValueOfType<int>(json, r'updated_at'),
        createdAt: mapValueOfType<int>(json, r'created_at'),
        deleteSelfEnabled: mapValueOfType<bool>(json, r'delete_self_enabled'),
        createOrganizationEnabled:
            mapValueOfType<bool>(json, r'create_organization_enabled'),
        createOrganizationsLimit:
            mapValueOfType<int>(json, r'create_organizations_limit'),
        lastActiveAt: mapValueOfType<int>(json, r'last_active_at'),
        legalAcceptedAt: mapValueOfType<int>(json, r'legal_accepted_at'),
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
  static const requiredKeys = <String>{};
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
