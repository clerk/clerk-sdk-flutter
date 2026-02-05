//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EnterpriseAccount {
  /// Returns a new [EnterpriseAccount] instance.
  EnterpriseAccount({
    required this.id,
    required this.object,
    this.protocol,
    required this.provider,
    required this.active,
    required this.emailAddress,
    this.firstName,
    this.lastName,
    this.providerUserId,
    this.enterpriseConnectionId,
    this.publicMetadata = const {},
    required this.verification,
    this.enterpriseConnection,
    this.lastAuthenticatedAt,
  });

  String id;

  /// String representing the object's type. Objects of the same type share the same value.
  EnterpriseAccountObjectEnum object;

  /// The authentication protocol used to sign in.
  EnterpriseAccountProtocolEnum? protocol;

  String provider;

  bool active;

  String emailAddress;

  String? firstName;

  String? lastName;

  /// The unique ID of the user in the external provider's system
  String? providerUserId;

  String? enterpriseConnectionId;

  Map<String, Object> publicMetadata;

  EnterpriseAccountVerification? verification;

  EnterpriseAccountEnterpriseConnection? enterpriseConnection;

  /// Unix timestamp of last authentication.
  int? lastAuthenticatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnterpriseAccount &&
          other.id == id &&
          other.object == object &&
          other.protocol == protocol &&
          other.provider == provider &&
          other.active == active &&
          other.emailAddress == emailAddress &&
          other.firstName == firstName &&
          other.lastName == lastName &&
          other.providerUserId == providerUserId &&
          other.enterpriseConnectionId == enterpriseConnectionId &&
          _deepEquality.equals(other.publicMetadata, publicMetadata) &&
          other.verification == verification &&
          other.enterpriseConnection == enterpriseConnection &&
          other.lastAuthenticatedAt == lastAuthenticatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (object.hashCode) +
      (protocol == null ? 0 : protocol!.hashCode) +
      (provider.hashCode) +
      (active.hashCode) +
      (emailAddress.hashCode) +
      (firstName == null ? 0 : firstName!.hashCode) +
      (lastName == null ? 0 : lastName!.hashCode) +
      (providerUserId == null ? 0 : providerUserId!.hashCode) +
      (enterpriseConnectionId == null ? 0 : enterpriseConnectionId!.hashCode) +
      (publicMetadata.hashCode) +
      (verification == null ? 0 : verification!.hashCode) +
      (enterpriseConnection == null ? 0 : enterpriseConnection!.hashCode) +
      (lastAuthenticatedAt == null ? 0 : lastAuthenticatedAt!.hashCode);

  @override
  String toString() =>
      'EnterpriseAccount[id=$id, object=$object, protocol=$protocol, provider=$provider, active=$active, emailAddress=$emailAddress, firstName=$firstName, lastName=$lastName, providerUserId=$providerUserId, enterpriseConnectionId=$enterpriseConnectionId, publicMetadata=$publicMetadata, verification=$verification, enterpriseConnection=$enterpriseConnection, lastAuthenticatedAt=$lastAuthenticatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'object'] = this.object;
    if (this.protocol != null) {
      json[r'protocol'] = this.protocol;
    } else {
      json[r'protocol'] = null;
    }
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
    if (this.enterpriseConnectionId != null) {
      json[r'enterprise_connection_id'] = this.enterpriseConnectionId;
    } else {
      json[r'enterprise_connection_id'] = null;
    }
    json[r'public_metadata'] = this.publicMetadata;
    if (this.verification != null) {
      json[r'verification'] = this.verification;
    } else {
      json[r'verification'] = null;
    }
    if (this.enterpriseConnection != null) {
      json[r'enterprise_connection'] = this.enterpriseConnection;
    } else {
      json[r'enterprise_connection'] = null;
    }
    if (this.lastAuthenticatedAt != null) {
      json[r'last_authenticated_at'] = this.lastAuthenticatedAt;
    } else {
      json[r'last_authenticated_at'] = null;
    }
    return json;
  }

  /// Returns a new [EnterpriseAccount] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EnterpriseAccount? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "EnterpriseAccount[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "EnterpriseAccount[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return EnterpriseAccount(
        id: mapValueOfType<String>(json, r'id')!,
        object: EnterpriseAccountObjectEnum.fromJson(json[r'object'])!,
        protocol: EnterpriseAccountProtocolEnum.fromJson(json[r'protocol']),
        provider: mapValueOfType<String>(json, r'provider')!,
        active: mapValueOfType<bool>(json, r'active')!,
        emailAddress: mapValueOfType<String>(json, r'email_address')!,
        firstName: mapValueOfType<String>(json, r'first_name'),
        lastName: mapValueOfType<String>(json, r'last_name'),
        providerUserId: mapValueOfType<String>(json, r'provider_user_id'),
        enterpriseConnectionId:
            mapValueOfType<String>(json, r'enterprise_connection_id'),
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata') ?? const {},
        verification:
            EnterpriseAccountVerification.fromJson(json[r'verification']),
        enterpriseConnection: EnterpriseAccountEnterpriseConnection.fromJson(
            json[r'enterprise_connection']),
        lastAuthenticatedAt:
            mapValueOfType<int>(json, r'last_authenticated_at'),
      );
    }
    return null;
  }

  static List<EnterpriseAccount> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <EnterpriseAccount>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EnterpriseAccount.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EnterpriseAccount> mapFromJson(dynamic json) {
    final map = <String, EnterpriseAccount>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EnterpriseAccount.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EnterpriseAccount-objects as value to a dart map
  static Map<String, List<EnterpriseAccount>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<EnterpriseAccount>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EnterpriseAccount.listFromJson(
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
class EnterpriseAccountObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const EnterpriseAccountObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const enterpriseAccount =
      EnterpriseAccountObjectEnum._(r'enterprise_account');

  /// List of all possible values in this [enum][EnterpriseAccountObjectEnum].
  static const values = <EnterpriseAccountObjectEnum>[
    enterpriseAccount,
  ];

  static EnterpriseAccountObjectEnum? fromJson(dynamic value) =>
      EnterpriseAccountObjectEnumTypeTransformer().decode(value);

  static List<EnterpriseAccountObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <EnterpriseAccountObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EnterpriseAccountObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [EnterpriseAccountObjectEnum] to String,
/// and [decode] dynamic data back to [EnterpriseAccountObjectEnum].
class EnterpriseAccountObjectEnumTypeTransformer {
  factory EnterpriseAccountObjectEnumTypeTransformer() =>
      _instance ??= const EnterpriseAccountObjectEnumTypeTransformer._();

  const EnterpriseAccountObjectEnumTypeTransformer._();

  String encode(EnterpriseAccountObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a EnterpriseAccountObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  EnterpriseAccountObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'enterprise_account':
          return EnterpriseAccountObjectEnum.enterpriseAccount;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [EnterpriseAccountObjectEnumTypeTransformer] instance.
  static EnterpriseAccountObjectEnumTypeTransformer? _instance;
}

/// The authentication protocol used to sign in.
class EnterpriseAccountProtocolEnum {
  /// Instantiate a new enum with the provided [value].
  const EnterpriseAccountProtocolEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const oauth = EnterpriseAccountProtocolEnum._(r'oauth');
  static const saml = EnterpriseAccountProtocolEnum._(r'saml');

  /// List of all possible values in this [enum][EnterpriseAccountProtocolEnum].
  static const values = <EnterpriseAccountProtocolEnum>[
    oauth,
    saml,
  ];

  static EnterpriseAccountProtocolEnum? fromJson(dynamic value) =>
      EnterpriseAccountProtocolEnumTypeTransformer().decode(value);

  static List<EnterpriseAccountProtocolEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <EnterpriseAccountProtocolEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EnterpriseAccountProtocolEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [EnterpriseAccountProtocolEnum] to String,
/// and [decode] dynamic data back to [EnterpriseAccountProtocolEnum].
class EnterpriseAccountProtocolEnumTypeTransformer {
  factory EnterpriseAccountProtocolEnumTypeTransformer() =>
      _instance ??= const EnterpriseAccountProtocolEnumTypeTransformer._();

  const EnterpriseAccountProtocolEnumTypeTransformer._();

  String encode(EnterpriseAccountProtocolEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a EnterpriseAccountProtocolEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  EnterpriseAccountProtocolEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'oauth':
          return EnterpriseAccountProtocolEnum.oauth;
        case r'saml':
          return EnterpriseAccountProtocolEnum.saml;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [EnterpriseAccountProtocolEnumTypeTransformer] instance.
  static EnterpriseAccountProtocolEnumTypeTransformer? _instance;
}
