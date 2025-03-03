//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SAMLAccount {
  /// Returns a new [SAMLAccount] instance.
  SAMLAccount({
    required this.id,
    required this.object,
    required this.provider,
    required this.active,
    required this.emailAddress,
    this.firstName,
    this.lastName,
    this.providerUserId,
    this.publicMetadata = const {},
    required this.verification,
    this.samlConnection,
  });

  String id;

  /// String representing the object's type. Objects of the same type share the same value.
  SAMLAccountObjectEnum object;

  String provider;

  bool active;

  String emailAddress;

  String? firstName;

  String? lastName;

  String? providerUserId;

  Map<String, Object> publicMetadata;

  SAMLAccountVerification? verification;

  SAMLAccountSamlConnection? samlConnection;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SAMLAccount &&
          other.id == id &&
          other.object == object &&
          other.provider == provider &&
          other.active == active &&
          other.emailAddress == emailAddress &&
          other.firstName == firstName &&
          other.lastName == lastName &&
          other.providerUserId == providerUserId &&
          _deepEquality.equals(other.publicMetadata, publicMetadata) &&
          other.verification == verification &&
          other.samlConnection == samlConnection;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (object.hashCode) +
      (provider.hashCode) +
      (active.hashCode) +
      (emailAddress.hashCode) +
      (firstName == null ? 0 : firstName!.hashCode) +
      (lastName == null ? 0 : lastName!.hashCode) +
      (providerUserId == null ? 0 : providerUserId!.hashCode) +
      (publicMetadata.hashCode) +
      (verification == null ? 0 : verification!.hashCode) +
      (samlConnection == null ? 0 : samlConnection!.hashCode);

  @override
  String toString() =>
      'SAMLAccount[id=$id, object=$object, provider=$provider, active=$active, emailAddress=$emailAddress, firstName=$firstName, lastName=$lastName, providerUserId=$providerUserId, publicMetadata=$publicMetadata, verification=$verification, samlConnection=$samlConnection]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'object'] = this.object;
    json[r'provider'] = this.provider;
    json[r'active'] = this.active;
    json[r'email_address'] = this.emailAddress;
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
    if (this.providerUserId != null) {
      json[r'provider_user_id'] = this.providerUserId;
    } else {
      json[r'provider_user_id'] = null;
    }
    json[r'public_metadata'] = this.publicMetadata;
    if (this.verification != null) {
      json[r'verification'] = this.verification;
    } else {
      json[r'verification'] = null;
    }
    if (this.samlConnection != null) {
      json[r'saml_connection'] = this.samlConnection;
    } else {
      json[r'saml_connection'] = null;
    }
    return json;
  }

  /// Returns a new [SAMLAccount] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SAMLAccount? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SAMLAccount[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SAMLAccount[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SAMLAccount(
        id: mapValueOfType<String>(json, r'id')!,
        object: SAMLAccountObjectEnum.fromJson(json[r'object'])!,
        provider: mapValueOfType<String>(json, r'provider')!,
        active: mapValueOfType<bool>(json, r'active')!,
        emailAddress: mapValueOfType<String>(json, r'email_address')!,
        firstName: mapValueOfType<String>(json, r'first_name'),
        lastName: mapValueOfType<String>(json, r'last_name'),
        providerUserId: mapValueOfType<String>(json, r'provider_user_id'),
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata') ?? const {},
        verification: SAMLAccountVerification.fromJson(json[r'verification']),
        samlConnection:
            SAMLAccountSamlConnection.fromJson(json[r'saml_connection']),
      );
    }
    return null;
  }

  static List<SAMLAccount> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SAMLAccount>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SAMLAccount.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SAMLAccount> mapFromJson(dynamic json) {
    final map = <String, SAMLAccount>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SAMLAccount.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SAMLAccount-objects as value to a dart map
  static Map<String, List<SAMLAccount>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SAMLAccount>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SAMLAccount.listFromJson(
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
    'provider',
    'active',
    'email_address',
    'verification',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class SAMLAccountObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const SAMLAccountObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const samlAccount = SAMLAccountObjectEnum._(r'saml_account');

  /// List of all possible values in this [enum][SAMLAccountObjectEnum].
  static const values = <SAMLAccountObjectEnum>[
    samlAccount,
  ];

  static SAMLAccountObjectEnum? fromJson(dynamic value) =>
      SAMLAccountObjectEnumTypeTransformer().decode(value);

  static List<SAMLAccountObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SAMLAccountObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SAMLAccountObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SAMLAccountObjectEnum] to String,
/// and [decode] dynamic data back to [SAMLAccountObjectEnum].
class SAMLAccountObjectEnumTypeTransformer {
  factory SAMLAccountObjectEnumTypeTransformer() =>
      _instance ??= const SAMLAccountObjectEnumTypeTransformer._();

  const SAMLAccountObjectEnumTypeTransformer._();

  String encode(SAMLAccountObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SAMLAccountObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SAMLAccountObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'saml_account':
          return SAMLAccountObjectEnum.samlAccount;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SAMLAccountObjectEnumTypeTransformer] instance.
  static SAMLAccountObjectEnumTypeTransformer? _instance;
}
