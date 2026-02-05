//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ExternalAccountWithVerification {
  /// Returns a new [ExternalAccountWithVerification] instance.
  ExternalAccountWithVerification({
    required this.object,
    required this.id,
    required this.provider,
    required this.identificationId,
    required this.providerUserId,
    required this.approvedScopes,
    required this.emailAddress,
    this.emailAddressVerified,
    required this.firstName,
    required this.lastName,
    this.avatarUrl,
    this.imageUrl,
    this.username,
    this.phoneNumber,
    this.publicMetadata = const {},
    this.label,
    required this.createdAt,
    required this.updatedAt,
    required this.verification,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  ExternalAccountWithVerificationObjectEnum object;

  String id;

  String provider;

  String identificationId;

  /// The unique ID of the user in the external provider's system
  String providerUserId;

  String approvedScopes;

  String emailAddress;

  /// Whether the email was verified by the OAuth provider at creation time. null = unknown (pre-migration data or custom OAuth providers), true = provider confirmed email was verified, false = provider confirmed email was NOT verified
  bool? emailAddressVerified;

  String firstName;

  String lastName;

  /// Please use `image_url` instead
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? avatarUrl;

  String? imageUrl;

  String? username;

  String? phoneNumber;

  Map<String, Object> publicMetadata;

  String? label;

  /// Unix timestamp of creation
  int createdAt;

  /// Unix timestamp of creation
  int updatedAt;

  ExternalAccountWithVerificationVerification? verification;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExternalAccountWithVerification &&
          other.object == object &&
          other.id == id &&
          other.provider == provider &&
          other.identificationId == identificationId &&
          other.providerUserId == providerUserId &&
          other.approvedScopes == approvedScopes &&
          other.emailAddress == emailAddress &&
          other.emailAddressVerified == emailAddressVerified &&
          other.firstName == firstName &&
          other.lastName == lastName &&
          other.avatarUrl == avatarUrl &&
          other.imageUrl == imageUrl &&
          other.username == username &&
          other.phoneNumber == phoneNumber &&
          _deepEquality.equals(other.publicMetadata, publicMetadata) &&
          other.label == label &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt &&
          other.verification == verification;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (provider.hashCode) +
      (identificationId.hashCode) +
      (providerUserId.hashCode) +
      (approvedScopes.hashCode) +
      (emailAddress.hashCode) +
      (emailAddressVerified == null ? 0 : emailAddressVerified!.hashCode) +
      (firstName.hashCode) +
      (lastName.hashCode) +
      (avatarUrl == null ? 0 : avatarUrl!.hashCode) +
      (imageUrl == null ? 0 : imageUrl!.hashCode) +
      (username == null ? 0 : username!.hashCode) +
      (phoneNumber == null ? 0 : phoneNumber!.hashCode) +
      (publicMetadata.hashCode) +
      (label == null ? 0 : label!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode) +
      (verification == null ? 0 : verification!.hashCode);

  @override
  String toString() =>
      'ExternalAccountWithVerification[object=$object, id=$id, provider=$provider, identificationId=$identificationId, providerUserId=$providerUserId, approvedScopes=$approvedScopes, emailAddress=$emailAddress, emailAddressVerified=$emailAddressVerified, firstName=$firstName, lastName=$lastName, avatarUrl=$avatarUrl, imageUrl=$imageUrl, username=$username, phoneNumber=$phoneNumber, publicMetadata=$publicMetadata, label=$label, createdAt=$createdAt, updatedAt=$updatedAt, verification=$verification]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'provider'] = this.provider;
    json[r'identification_id'] = this.identificationId;
    json[r'provider_user_id'] = this.providerUserId;
    json[r'approved_scopes'] = this.approvedScopes;
    json[r'email_address'] = this.emailAddress;
    if (this.emailAddressVerified != null) {
      json[r'email_address_verified'] = this.emailAddressVerified;
    } else {
      json[r'email_address_verified'] = null;
    }
    json[r'first_name'] = this.firstName;
    json[r'last_name'] = this.lastName;
    if (this.avatarUrl != null) {
      json[r'avatar_url'] = this.avatarUrl;
    } else {
      json[r'avatar_url'] = null;
    }
    if (this.imageUrl != null) {
      json[r'image_url'] = this.imageUrl;
    } else {
      json[r'image_url'] = null;
    }
    if (this.username != null) {
      json[r'username'] = this.username;
    } else {
      json[r'username'] = null;
    }
    if (this.phoneNumber != null) {
      json[r'phone_number'] = this.phoneNumber;
    } else {
      json[r'phone_number'] = null;
    }
    json[r'public_metadata'] = this.publicMetadata;
    if (this.label != null) {
      json[r'label'] = this.label;
    } else {
      json[r'label'] = null;
    }
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    if (this.verification != null) {
      json[r'verification'] = this.verification;
    } else {
      json[r'verification'] = null;
    }
    return json;
  }

  /// Returns a new [ExternalAccountWithVerification] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ExternalAccountWithVerification? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ExternalAccountWithVerification[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ExternalAccountWithVerification[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ExternalAccountWithVerification(
        object: ExternalAccountWithVerificationObjectEnum.fromJson(
            json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        provider: mapValueOfType<String>(json, r'provider')!,
        identificationId: mapValueOfType<String>(json, r'identification_id')!,
        providerUserId: mapValueOfType<String>(json, r'provider_user_id')!,
        approvedScopes: mapValueOfType<String>(json, r'approved_scopes')!,
        emailAddress: mapValueOfType<String>(json, r'email_address')!,
        emailAddressVerified:
            mapValueOfType<bool>(json, r'email_address_verified'),
        firstName: mapValueOfType<String>(json, r'first_name')!,
        lastName: mapValueOfType<String>(json, r'last_name')!,
        avatarUrl: mapValueOfType<String>(json, r'avatar_url'),
        imageUrl: mapValueOfType<String>(json, r'image_url'),
        username: mapValueOfType<String>(json, r'username'),
        phoneNumber: mapValueOfType<String>(json, r'phone_number'),
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata')!,
        label: mapValueOfType<String>(json, r'label'),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
        verification: ExternalAccountWithVerificationVerification.fromJson(
            json[r'verification']),
      );
    }
    return null;
  }

  static List<ExternalAccountWithVerification> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ExternalAccountWithVerification>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ExternalAccountWithVerification.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ExternalAccountWithVerification> mapFromJson(
      dynamic json) {
    final map = <String, ExternalAccountWithVerification>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ExternalAccountWithVerification.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ExternalAccountWithVerification-objects as value to a dart map
  static Map<String, List<ExternalAccountWithVerification>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ExternalAccountWithVerification>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ExternalAccountWithVerification.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'object',
    'id',
    'provider',
    'identification_id',
    'provider_user_id',
    'approved_scopes',
    'email_address',
    'first_name',
    'last_name',
    'public_metadata',
    'created_at',
    'updated_at',
    'verification',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class ExternalAccountWithVerificationObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const ExternalAccountWithVerificationObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const externalAccount =
      ExternalAccountWithVerificationObjectEnum._(r'external_account');
  static const facebookAccount =
      ExternalAccountWithVerificationObjectEnum._(r'facebook_account');
  static const googleAccount =
      ExternalAccountWithVerificationObjectEnum._(r'google_account');

  /// List of all possible values in this [enum][ExternalAccountWithVerificationObjectEnum].
  static const values = <ExternalAccountWithVerificationObjectEnum>[
    externalAccount,
    facebookAccount,
    googleAccount,
  ];

  static ExternalAccountWithVerificationObjectEnum? fromJson(dynamic value) =>
      ExternalAccountWithVerificationObjectEnumTypeTransformer().decode(value);

  static List<ExternalAccountWithVerificationObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ExternalAccountWithVerificationObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ExternalAccountWithVerificationObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ExternalAccountWithVerificationObjectEnum] to String,
/// and [decode] dynamic data back to [ExternalAccountWithVerificationObjectEnum].
class ExternalAccountWithVerificationObjectEnumTypeTransformer {
  factory ExternalAccountWithVerificationObjectEnumTypeTransformer() =>
      _instance ??=
          const ExternalAccountWithVerificationObjectEnumTypeTransformer._();

  const ExternalAccountWithVerificationObjectEnumTypeTransformer._();

  String encode(ExternalAccountWithVerificationObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ExternalAccountWithVerificationObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ExternalAccountWithVerificationObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'external_account':
          return ExternalAccountWithVerificationObjectEnum.externalAccount;
        case r'facebook_account':
          return ExternalAccountWithVerificationObjectEnum.facebookAccount;
        case r'google_account':
          return ExternalAccountWithVerificationObjectEnum.googleAccount;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ExternalAccountWithVerificationObjectEnumTypeTransformer] instance.
  static ExternalAccountWithVerificationObjectEnumTypeTransformer? _instance;
}
