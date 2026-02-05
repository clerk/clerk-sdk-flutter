//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateUserRequest {
  /// Returns a new [CreateUserRequest] instance.
  CreateUserRequest({
    this.externalId,
    this.firstName,
    this.lastName,
    this.locale,
    this.emailAddress = const [],
    this.phoneNumber = const [],
    this.web3Wallet = const [],
    this.username,
    this.password,
    this.passwordDigest,
    this.passwordHasher,
    this.skipPasswordChecks,
    this.skipPasswordRequirement,
    this.totpSecret,
    this.backupCodes = const [],
    this.publicMetadata = const {},
    this.privateMetadata = const {},
    this.unsafeMetadata = const {},
    this.deleteSelfEnabled,
    this.legalAcceptedAt,
    this.skipLegalChecks,
    this.skipUserRequirement,
    this.createOrganizationEnabled,
    this.createOrganizationsLimit,
    this.createdAt,
    this.bypassClientTrust,
  });

  /// The ID of the user as used in your external systems or your previous authentication solution. Must be unique across your instance.
  String? externalId;

  /// The first name to assign to the user
  String? firstName;

  /// The last name to assign to the user
  String? lastName;

  /// The locale to assign to the user (e.g., \"en-US\", \"fr-FR\")
  String? locale;

  /// Email addresses to add to the user. Must be unique across your instance. The first email address will be set as the user's primary email address.
  List<String> emailAddress;

  /// Phone numbers to add to the user. Must be unique across your instance. The first phone number will be set as the user's primary phone number.
  List<String> phoneNumber;

  /// Web3 wallets to add to the user. Must be unique across your instance. The first wallet will be set as the user's primary wallet.
  List<String> web3Wallet;

  /// The username to give to the user. It must be unique across your instance.
  String? username;

  /// The plaintext password to give the user. Must be at least 8 characters long, and cannot be in any list of hacked passwords.
  String? password;

  /// In case you already have the password digests and not the passwords, you can use them for the newly created user via this property. The digests should be generated with one of the supported algorithms. The hashing algorithm can be specified using the `password_hasher` property.
  String? passwordDigest;

  /// The hashing algorithm that was used to generate the password digest.  The algorithms we support at the moment are [`bcrypt`](https://en.wikipedia.org/wiki/Bcrypt), [`bcrypt_sha256_django`](https://docs.djangoproject.com/en/4.0/topics/auth/passwords/), [`md5`](https://en.wikipedia.org/wiki/MD5), `pbkdf2_sha1`, `pbkdf2_sha256`, [`pbkdf2_sha256_django`](https://docs.djangoproject.com/en/4.0/topics/auth/passwords/), [`phpass`](https://www.openwall.com/phpass/), `md5_phpass`, [`scrypt_firebase`](https://firebaseopensource.com/projects/firebase/scrypt/), [`scrypt_werkzeug`](https://werkzeug.palletsprojects.com/en/3.0.x/utils/#werkzeug.security.generate_password_hash), [`sha256`](https://en.wikipedia.org/wiki/SHA-2), [`ldap_ssha`](https://www.openldap.org/faq/data/cache/347.html), the [`argon2`](https://argon2.online/) variants: `argon2i` and `argon2id`, and `sha512_symfony`, the SHA-512 variant of the [Symfony](https://symfony.com/doc/current/security/passwords.html) legacy hasher.  Each of the supported hashers expects the incoming digest to be in a particular format. See the [Clerk docs](https://clerk.com/docs/references/backend/user/create-user) for more information.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? passwordHasher;

  /// When set to `true` all password checks are skipped. It is recommended to use this method only when migrating plaintext passwords to Clerk. Upon migration the user base should be prompted to pick stronger password.
  bool? skipPasswordChecks;

  /// When set to `true`, `password` is not required anymore when creating the user and can be omitted. This is useful when you are trying to create a user that doesn't have a password, in an instance that is using passwords. Please note that you cannot use this flag if password is the only way for a user to sign into your instance.
  bool? skipPasswordRequirement;

  /// In case TOTP is configured on the instance, you can provide the secret to enable it on the newly created user without the need to reset it. Please note that currently the supported options are: * Period: 30 seconds * Code length: 6 digits * Algorithm: SHA1
  String? totpSecret;

  /// If Backup Codes are configured on the instance, you can provide them to enable it on the newly created user without the need to reset them. You must provide the backup codes in plain format or the corresponding bcrypt digest.
  List<String> backupCodes;

  /// Metadata saved on the user, that is visible to both your Frontend and Backend APIs
  Map<String, Object> publicMetadata;

  /// Metadata saved on the user, that is only visible to your Backend API
  Map<String, Object> privateMetadata;

  /// Metadata saved on the user, that can be updated from both the Frontend and Backend APIs. Note: Since this data can be modified from the frontend, it is not guaranteed to be safe.
  Map<String, Object> unsafeMetadata;

  /// If enabled, user can delete themselves via FAPI.
  bool? deleteSelfEnabled;

  /// A custom timestamp denoting _when_ the user accepted legal requirements, specified in RFC3339 format (e.g. `2012-10-20T07:15:20.902Z`).
  String? legalAcceptedAt;

  /// When set to `true` all legal checks are skipped. It is not recommended to skip legal checks unless you are migrating a user to Clerk.
  bool? skipLegalChecks;

  /// When set to `true`, identification types are not enforced. At least one identification type must be enabled and provided on your instance (email, phone, web3 wallet, or username). Users created without required identification types cannot use those authentication strategies It is not recommended to use this flag unless you need to allow Clerk UI components to prompt for required fields while BAPI creates users with minimal data, or for migration a user to Clerk.
  bool? skipUserRequirement;

  /// If enabled, user can create organizations via FAPI.
  bool? createOrganizationEnabled;

  /// The maximum number of organizations the user can create. 0 means unlimited.
  int? createOrganizationsLimit;

  /// A custom date/time denoting _when_ the user signed up to the application, specified in RFC3339 format (e.g. `2012-10-20T07:15:20.902Z`).
  String? createdAt;

  /// When set to `true`, the user will bypass client trust checks during sign-in.
  bool? bypassClientTrust;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateUserRequest &&
          other.externalId == externalId &&
          other.firstName == firstName &&
          other.lastName == lastName &&
          other.locale == locale &&
          _deepEquality.equals(other.emailAddress, emailAddress) &&
          _deepEquality.equals(other.phoneNumber, phoneNumber) &&
          _deepEquality.equals(other.web3Wallet, web3Wallet) &&
          other.username == username &&
          other.password == password &&
          other.passwordDigest == passwordDigest &&
          other.passwordHasher == passwordHasher &&
          other.skipPasswordChecks == skipPasswordChecks &&
          other.skipPasswordRequirement == skipPasswordRequirement &&
          other.totpSecret == totpSecret &&
          _deepEquality.equals(other.backupCodes, backupCodes) &&
          _deepEquality.equals(other.publicMetadata, publicMetadata) &&
          _deepEquality.equals(other.privateMetadata, privateMetadata) &&
          _deepEquality.equals(other.unsafeMetadata, unsafeMetadata) &&
          other.deleteSelfEnabled == deleteSelfEnabled &&
          other.legalAcceptedAt == legalAcceptedAt &&
          other.skipLegalChecks == skipLegalChecks &&
          other.skipUserRequirement == skipUserRequirement &&
          other.createOrganizationEnabled == createOrganizationEnabled &&
          other.createOrganizationsLimit == createOrganizationsLimit &&
          other.createdAt == createdAt &&
          other.bypassClientTrust == bypassClientTrust;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (externalId == null ? 0 : externalId!.hashCode) +
      (firstName == null ? 0 : firstName!.hashCode) +
      (lastName == null ? 0 : lastName!.hashCode) +
      (locale == null ? 0 : locale!.hashCode) +
      (emailAddress.hashCode) +
      (phoneNumber.hashCode) +
      (web3Wallet.hashCode) +
      (username == null ? 0 : username!.hashCode) +
      (password == null ? 0 : password!.hashCode) +
      (passwordDigest == null ? 0 : passwordDigest!.hashCode) +
      (passwordHasher == null ? 0 : passwordHasher!.hashCode) +
      (skipPasswordChecks == null ? 0 : skipPasswordChecks!.hashCode) +
      (skipPasswordRequirement == null
          ? 0
          : skipPasswordRequirement!.hashCode) +
      (totpSecret == null ? 0 : totpSecret!.hashCode) +
      (backupCodes.hashCode) +
      (publicMetadata.hashCode) +
      (privateMetadata.hashCode) +
      (unsafeMetadata.hashCode) +
      (deleteSelfEnabled == null ? 0 : deleteSelfEnabled!.hashCode) +
      (legalAcceptedAt == null ? 0 : legalAcceptedAt!.hashCode) +
      (skipLegalChecks == null ? 0 : skipLegalChecks!.hashCode) +
      (skipUserRequirement == null ? 0 : skipUserRequirement!.hashCode) +
      (createOrganizationEnabled == null
          ? 0
          : createOrganizationEnabled!.hashCode) +
      (createOrganizationsLimit == null
          ? 0
          : createOrganizationsLimit!.hashCode) +
      (createdAt == null ? 0 : createdAt!.hashCode) +
      (bypassClientTrust == null ? 0 : bypassClientTrust!.hashCode);

  @override
  String toString() =>
      'CreateUserRequest[externalId=$externalId, firstName=$firstName, lastName=$lastName, locale=$locale, emailAddress=$emailAddress, phoneNumber=$phoneNumber, web3Wallet=$web3Wallet, username=$username, password=$password, passwordDigest=$passwordDigest, passwordHasher=$passwordHasher, skipPasswordChecks=$skipPasswordChecks, skipPasswordRequirement=$skipPasswordRequirement, totpSecret=$totpSecret, backupCodes=$backupCodes, publicMetadata=$publicMetadata, privateMetadata=$privateMetadata, unsafeMetadata=$unsafeMetadata, deleteSelfEnabled=$deleteSelfEnabled, legalAcceptedAt=$legalAcceptedAt, skipLegalChecks=$skipLegalChecks, skipUserRequirement=$skipUserRequirement, createOrganizationEnabled=$createOrganizationEnabled, createOrganizationsLimit=$createOrganizationsLimit, createdAt=$createdAt, bypassClientTrust=$bypassClientTrust]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.externalId != null) {
      json[r'external_id'] = this.externalId;
    } else {
      json[r'external_id'] = null;
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
    json[r'email_address'] = this.emailAddress;
    json[r'phone_number'] = this.phoneNumber;
    json[r'web3_wallet'] = this.web3Wallet;
    if (this.username != null) {
      json[r'username'] = this.username;
    } else {
      json[r'username'] = null;
    }
    if (this.password != null) {
      json[r'password'] = this.password;
    } else {
      json[r'password'] = null;
    }
    if (this.passwordDigest != null) {
      json[r'password_digest'] = this.passwordDigest;
    } else {
      json[r'password_digest'] = null;
    }
    if (this.passwordHasher != null) {
      json[r'password_hasher'] = this.passwordHasher;
    } else {
      json[r'password_hasher'] = null;
    }
    if (this.skipPasswordChecks != null) {
      json[r'skip_password_checks'] = this.skipPasswordChecks;
    } else {
      json[r'skip_password_checks'] = null;
    }
    if (this.skipPasswordRequirement != null) {
      json[r'skip_password_requirement'] = this.skipPasswordRequirement;
    } else {
      json[r'skip_password_requirement'] = null;
    }
    if (this.totpSecret != null) {
      json[r'totp_secret'] = this.totpSecret;
    } else {
      json[r'totp_secret'] = null;
    }
    json[r'backup_codes'] = this.backupCodes;
    json[r'public_metadata'] = this.publicMetadata;
    json[r'private_metadata'] = this.privateMetadata;
    json[r'unsafe_metadata'] = this.unsafeMetadata;
    if (this.deleteSelfEnabled != null) {
      json[r'delete_self_enabled'] = this.deleteSelfEnabled;
    } else {
      json[r'delete_self_enabled'] = null;
    }
    if (this.legalAcceptedAt != null) {
      json[r'legal_accepted_at'] = this.legalAcceptedAt;
    } else {
      json[r'legal_accepted_at'] = null;
    }
    if (this.skipLegalChecks != null) {
      json[r'skip_legal_checks'] = this.skipLegalChecks;
    } else {
      json[r'skip_legal_checks'] = null;
    }
    if (this.skipUserRequirement != null) {
      json[r'skip_user_requirement'] = this.skipUserRequirement;
    } else {
      json[r'skip_user_requirement'] = null;
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
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt;
    } else {
      json[r'created_at'] = null;
    }
    if (this.bypassClientTrust != null) {
      json[r'bypass_client_trust'] = this.bypassClientTrust;
    } else {
      json[r'bypass_client_trust'] = null;
    }
    return json;
  }

  /// Returns a new [CreateUserRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateUserRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateUserRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateUserRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateUserRequest(
        externalId: mapValueOfType<String>(json, r'external_id'),
        firstName: mapValueOfType<String>(json, r'first_name'),
        lastName: mapValueOfType<String>(json, r'last_name'),
        locale: mapValueOfType<String>(json, r'locale'),
        emailAddress: json[r'email_address'] is Iterable
            ? (json[r'email_address'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        phoneNumber: json[r'phone_number'] is Iterable
            ? (json[r'phone_number'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        web3Wallet: json[r'web3_wallet'] is Iterable
            ? (json[r'web3_wallet'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        username: mapValueOfType<String>(json, r'username'),
        password: mapValueOfType<String>(json, r'password'),
        passwordDigest: mapValueOfType<String>(json, r'password_digest'),
        passwordHasher: mapValueOfType<String>(json, r'password_hasher'),
        skipPasswordChecks: mapValueOfType<bool>(json, r'skip_password_checks'),
        skipPasswordRequirement:
            mapValueOfType<bool>(json, r'skip_password_requirement'),
        totpSecret: mapValueOfType<String>(json, r'totp_secret'),
        backupCodes: json[r'backup_codes'] is Iterable
            ? (json[r'backup_codes'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata') ?? const {},
        privateMetadata:
            mapCastOfType<String, Object>(json, r'private_metadata') ??
                const {},
        unsafeMetadata:
            mapCastOfType<String, Object>(json, r'unsafe_metadata') ?? const {},
        deleteSelfEnabled: mapValueOfType<bool>(json, r'delete_self_enabled'),
        legalAcceptedAt: mapValueOfType<String>(json, r'legal_accepted_at'),
        skipLegalChecks: mapValueOfType<bool>(json, r'skip_legal_checks'),
        skipUserRequirement:
            mapValueOfType<bool>(json, r'skip_user_requirement'),
        createOrganizationEnabled:
            mapValueOfType<bool>(json, r'create_organization_enabled'),
        createOrganizationsLimit:
            mapValueOfType<int>(json, r'create_organizations_limit'),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        bypassClientTrust: mapValueOfType<bool>(json, r'bypass_client_trust'),
      );
    }
    return null;
  }

  static List<CreateUserRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateUserRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateUserRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateUserRequest> mapFromJson(dynamic json) {
    final map = <String, CreateUserRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateUserRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateUserRequest-objects as value to a dart map
  static Map<String, List<CreateUserRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateUserRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateUserRequest.listFromJson(
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
