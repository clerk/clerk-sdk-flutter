//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SignUp {
  /// Returns a new [SignUp] instance.
  SignUp({
    required this.object,
    required this.id,
    required this.status,
    this.requiredFields = const [],
    this.optionalFields = const [],
    this.missingFields = const [],
    this.unverifiedFields = const [],
    required this.verifications,
    required this.username,
    required this.emailAddress,
    required this.phoneNumber,
    required this.web3Wallet,
    required this.passwordEnabled,
    required this.firstName,
    required this.lastName,
    this.unsafeMetadata = const {},
    this.publicMetadata = const {},
    required this.customAction,
    required this.externalId,
    required this.createdSessionId,
    required this.createdUserId,
    required this.abandonAt,
    required this.legalAcceptedAt,
    this.externalAccount,
  });

  SignUpObjectEnum object;

  String id;

  SignUpStatusEnum status;

  List<String> requiredFields;

  List<String> optionalFields;

  List<String> missingFields;

  List<String> unverifiedFields;

  SignUpVerifications verifications;

  String? username;

  String? emailAddress;

  String? phoneNumber;

  String? web3Wallet;

  bool passwordEnabled;

  String? firstName;

  String? lastName;

  Map<String, Object> unsafeMetadata;

  Map<String, Object> publicMetadata;

  bool customAction;

  String? externalId;

  String? createdSessionId;

  String? createdUserId;

  /// Unix timestamp at which the user abandoned the sign up attempt.
  int abandonAt;

  /// Unix timestamp at which the user accepted the legal requirements.
  int? legalAcceptedAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? externalAccount;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignUp &&
          other.object == object &&
          other.id == id &&
          other.status == status &&
          _deepEquality.equals(other.requiredFields, requiredFields) &&
          _deepEquality.equals(other.optionalFields, optionalFields) &&
          _deepEquality.equals(other.missingFields, missingFields) &&
          _deepEquality.equals(other.unverifiedFields, unverifiedFields) &&
          other.verifications == verifications &&
          other.username == username &&
          other.emailAddress == emailAddress &&
          other.phoneNumber == phoneNumber &&
          other.web3Wallet == web3Wallet &&
          other.passwordEnabled == passwordEnabled &&
          other.firstName == firstName &&
          other.lastName == lastName &&
          _deepEquality.equals(other.unsafeMetadata, unsafeMetadata) &&
          _deepEquality.equals(other.publicMetadata, publicMetadata) &&
          other.customAction == customAction &&
          other.externalId == externalId &&
          other.createdSessionId == createdSessionId &&
          other.createdUserId == createdUserId &&
          other.abandonAt == abandonAt &&
          other.legalAcceptedAt == legalAcceptedAt &&
          other.externalAccount == externalAccount;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (status.hashCode) +
      (requiredFields.hashCode) +
      (optionalFields.hashCode) +
      (missingFields.hashCode) +
      (unverifiedFields.hashCode) +
      (verifications.hashCode) +
      (username == null ? 0 : username!.hashCode) +
      (emailAddress == null ? 0 : emailAddress!.hashCode) +
      (phoneNumber == null ? 0 : phoneNumber!.hashCode) +
      (web3Wallet == null ? 0 : web3Wallet!.hashCode) +
      (passwordEnabled.hashCode) +
      (firstName == null ? 0 : firstName!.hashCode) +
      (lastName == null ? 0 : lastName!.hashCode) +
      (unsafeMetadata.hashCode) +
      (publicMetadata.hashCode) +
      (customAction.hashCode) +
      (externalId == null ? 0 : externalId!.hashCode) +
      (createdSessionId == null ? 0 : createdSessionId!.hashCode) +
      (createdUserId == null ? 0 : createdUserId!.hashCode) +
      (abandonAt.hashCode) +
      (legalAcceptedAt == null ? 0 : legalAcceptedAt!.hashCode) +
      (externalAccount == null ? 0 : externalAccount!.hashCode);

  @override
  String toString() =>
      'SignUp[object=$object, id=$id, status=$status, requiredFields=$requiredFields, optionalFields=$optionalFields, missingFields=$missingFields, unverifiedFields=$unverifiedFields, verifications=$verifications, username=$username, emailAddress=$emailAddress, phoneNumber=$phoneNumber, web3Wallet=$web3Wallet, passwordEnabled=$passwordEnabled, firstName=$firstName, lastName=$lastName, unsafeMetadata=$unsafeMetadata, publicMetadata=$publicMetadata, customAction=$customAction, externalId=$externalId, createdSessionId=$createdSessionId, createdUserId=$createdUserId, abandonAt=$abandonAt, legalAcceptedAt=$legalAcceptedAt, externalAccount=$externalAccount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'status'] = this.status;
    json[r'required_fields'] = this.requiredFields;
    json[r'optional_fields'] = this.optionalFields;
    json[r'missing_fields'] = this.missingFields;
    json[r'unverified_fields'] = this.unverifiedFields;
    json[r'verifications'] = this.verifications;
    if (this.username != null) {
      json[r'username'] = this.username;
    } else {
      json[r'username'] = null;
    }
    if (this.emailAddress != null) {
      json[r'email_address'] = this.emailAddress;
    } else {
      json[r'email_address'] = null;
    }
    if (this.phoneNumber != null) {
      json[r'phone_number'] = this.phoneNumber;
    } else {
      json[r'phone_number'] = null;
    }
    if (this.web3Wallet != null) {
      json[r'web3_wallet'] = this.web3Wallet;
    } else {
      json[r'web3_wallet'] = null;
    }
    json[r'password_enabled'] = this.passwordEnabled;
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
    json[r'unsafe_metadata'] = this.unsafeMetadata;
    json[r'public_metadata'] = this.publicMetadata;
    json[r'custom_action'] = this.customAction;
    if (this.externalId != null) {
      json[r'external_id'] = this.externalId;
    } else {
      json[r'external_id'] = null;
    }
    if (this.createdSessionId != null) {
      json[r'created_session_id'] = this.createdSessionId;
    } else {
      json[r'created_session_id'] = null;
    }
    if (this.createdUserId != null) {
      json[r'created_user_id'] = this.createdUserId;
    } else {
      json[r'created_user_id'] = null;
    }
    json[r'abandon_at'] = this.abandonAt;
    if (this.legalAcceptedAt != null) {
      json[r'legal_accepted_at'] = this.legalAcceptedAt;
    } else {
      json[r'legal_accepted_at'] = null;
    }
    if (this.externalAccount != null) {
      json[r'external_account'] = this.externalAccount;
    } else {
      json[r'external_account'] = null;
    }
    return json;
  }

  /// Returns a new [SignUp] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SignUp? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SignUp[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SignUp[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SignUp(
        object: SignUpObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        status: SignUpStatusEnum.fromJson(json[r'status'])!,
        requiredFields: json[r'required_fields'] is Iterable
            ? (json[r'required_fields'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        optionalFields: json[r'optional_fields'] is Iterable
            ? (json[r'optional_fields'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        missingFields: json[r'missing_fields'] is Iterable
            ? (json[r'missing_fields'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        unverifiedFields: json[r'unverified_fields'] is Iterable
            ? (json[r'unverified_fields'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        verifications: SignUpVerifications.fromJson(json[r'verifications'])!,
        username: mapValueOfType<String>(json, r'username'),
        emailAddress: mapValueOfType<String>(json, r'email_address'),
        phoneNumber: mapValueOfType<String>(json, r'phone_number'),
        web3Wallet: mapValueOfType<String>(json, r'web3_wallet'),
        passwordEnabled: mapValueOfType<bool>(json, r'password_enabled')!,
        firstName: mapValueOfType<String>(json, r'first_name'),
        lastName: mapValueOfType<String>(json, r'last_name'),
        unsafeMetadata:
            mapCastOfType<String, Object>(json, r'unsafe_metadata') ?? const {},
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata') ?? const {},
        customAction: mapValueOfType<bool>(json, r'custom_action')!,
        externalId: mapValueOfType<String>(json, r'external_id'),
        createdSessionId: mapValueOfType<String>(json, r'created_session_id'),
        createdUserId: mapValueOfType<String>(json, r'created_user_id'),
        abandonAt: mapValueOfType<int>(json, r'abandon_at')!,
        legalAcceptedAt: mapValueOfType<int>(json, r'legal_accepted_at'),
        externalAccount: mapValueOfType<Object>(json, r'external_account'),
      );
    }
    return null;
  }

  static List<SignUp> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SignUp>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SignUp.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SignUp> mapFromJson(dynamic json) {
    final map = <String, SignUp>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SignUp.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SignUp-objects as value to a dart map
  static Map<String, List<SignUp>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SignUp>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SignUp.listFromJson(
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
    'status',
    'required_fields',
    'optional_fields',
    'missing_fields',
    'unverified_fields',
    'verifications',
    'username',
    'email_address',
    'phone_number',
    'web3_wallet',
    'password_enabled',
    'first_name',
    'last_name',
    'custom_action',
    'external_id',
    'created_session_id',
    'created_user_id',
    'abandon_at',
    'legal_accepted_at',
  };
}

class SignUpObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const SignUpObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const signUpAttempt = SignUpObjectEnum._(r'sign_up_attempt');

  /// List of all possible values in this [enum][SignUpObjectEnum].
  static const values = <SignUpObjectEnum>[
    signUpAttempt,
  ];

  static SignUpObjectEnum? fromJson(dynamic value) =>
      SignUpObjectEnumTypeTransformer().decode(value);

  static List<SignUpObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SignUpObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SignUpObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SignUpObjectEnum] to String,
/// and [decode] dynamic data back to [SignUpObjectEnum].
class SignUpObjectEnumTypeTransformer {
  factory SignUpObjectEnumTypeTransformer() =>
      _instance ??= const SignUpObjectEnumTypeTransformer._();

  const SignUpObjectEnumTypeTransformer._();

  String encode(SignUpObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SignUpObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SignUpObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'sign_up_attempt':
          return SignUpObjectEnum.signUpAttempt;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SignUpObjectEnumTypeTransformer] instance.
  static SignUpObjectEnumTypeTransformer? _instance;
}

class SignUpStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const SignUpStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const missingRequirements =
      SignUpStatusEnum._(r'missing_requirements');
  static const complete = SignUpStatusEnum._(r'complete');
  static const abandoned = SignUpStatusEnum._(r'abandoned');

  /// List of all possible values in this [enum][SignUpStatusEnum].
  static const values = <SignUpStatusEnum>[
    missingRequirements,
    complete,
    abandoned,
  ];

  static SignUpStatusEnum? fromJson(dynamic value) =>
      SignUpStatusEnumTypeTransformer().decode(value);

  static List<SignUpStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SignUpStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SignUpStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SignUpStatusEnum] to String,
/// and [decode] dynamic data back to [SignUpStatusEnum].
class SignUpStatusEnumTypeTransformer {
  factory SignUpStatusEnumTypeTransformer() =>
      _instance ??= const SignUpStatusEnumTypeTransformer._();

  const SignUpStatusEnumTypeTransformer._();

  String encode(SignUpStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SignUpStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SignUpStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'missing_requirements':
          return SignUpStatusEnum.missingRequirements;
        case r'complete':
          return SignUpStatusEnum.complete;
        case r'abandoned':
          return SignUpStatusEnum.abandoned;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SignUpStatusEnumTypeTransformer] instance.
  static SignUpStatusEnumTypeTransformer? _instance;
}
