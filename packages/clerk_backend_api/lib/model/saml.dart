//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SAML {
  /// Returns a new [SAML] instance.
  SAML({
    required this.status,
    required this.strategy,
    required this.externalVerificationRedirectUrl,
    this.error,
    required this.expireAt,
    required this.attempts,
    this.verifiedAtClient,
  });

  SAMLStatusEnum status;

  SAMLStrategyEnum strategy;

  String? externalVerificationRedirectUrl;

  FromOAuthError? error;

  int expireAt;

  int? attempts;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SAML &&
          other.status == status &&
          other.strategy == strategy &&
          other.externalVerificationRedirectUrl ==
              externalVerificationRedirectUrl &&
          other.error == error &&
          other.expireAt == expireAt &&
          other.attempts == attempts &&
          other.verifiedAtClient == verifiedAtClient;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (status.hashCode) +
      (strategy.hashCode) +
      (externalVerificationRedirectUrl == null
          ? 0
          : externalVerificationRedirectUrl!.hashCode) +
      (error == null ? 0 : error!.hashCode) +
      (expireAt.hashCode) +
      (attempts == null ? 0 : attempts!.hashCode) +
      (verifiedAtClient == null ? 0 : verifiedAtClient!.hashCode);

  @override
  String toString() =>
      'SAML[status=$status, strategy=$strategy, externalVerificationRedirectUrl=$externalVerificationRedirectUrl, error=$error, expireAt=$expireAt, attempts=$attempts, verifiedAtClient=$verifiedAtClient]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'status'] = this.status;
    json[r'strategy'] = this.strategy;
    if (this.externalVerificationRedirectUrl != null) {
      json[r'external_verification_redirect_url'] =
          this.externalVerificationRedirectUrl;
    } else {
      json[r'external_verification_redirect_url'] = null;
    }
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
    json[r'expire_at'] = this.expireAt;
    if (this.attempts != null) {
      json[r'attempts'] = this.attempts;
    } else {
      json[r'attempts'] = null;
    }
    if (this.verifiedAtClient != null) {
      json[r'verified_at_client'] = this.verifiedAtClient;
    } else {
      json[r'verified_at_client'] = null;
    }
    return json;
  }

  /// Returns a new [SAML] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SAML? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SAML[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SAML[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SAML(
        status: SAMLStatusEnum.fromJson(json[r'status'])!,
        strategy: SAMLStrategyEnum.fromJson(json[r'strategy'])!,
        externalVerificationRedirectUrl:
            mapValueOfType<String>(json, r'external_verification_redirect_url'),
        error: FromOAuthError.fromJson(json[r'error']),
        expireAt: mapValueOfType<int>(json, r'expire_at')!,
        attempts: mapValueOfType<int>(json, r'attempts'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<SAML> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SAML>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SAML.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SAML> mapFromJson(dynamic json) {
    final map = <String, SAML>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SAML.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SAML-objects as value to a dart map
  static Map<String, List<SAML>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SAML>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SAML.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'status',
    'strategy',
    'external_verification_redirect_url',
    'expire_at',
    'attempts',
  };
}

class SAMLStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const SAMLStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const unverified = SAMLStatusEnum._(r'unverified');
  static const verified = SAMLStatusEnum._(r'verified');
  static const failed = SAMLStatusEnum._(r'failed');
  static const expired = SAMLStatusEnum._(r'expired');
  static const transferable = SAMLStatusEnum._(r'transferable');

  /// List of all possible values in this [enum][SAMLStatusEnum].
  static const values = <SAMLStatusEnum>[
    unverified,
    verified,
    failed,
    expired,
    transferable,
  ];

  static SAMLStatusEnum? fromJson(dynamic value) =>
      SAMLStatusEnumTypeTransformer().decode(value);

  static List<SAMLStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SAMLStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SAMLStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SAMLStatusEnum] to String,
/// and [decode] dynamic data back to [SAMLStatusEnum].
class SAMLStatusEnumTypeTransformer {
  factory SAMLStatusEnumTypeTransformer() =>
      _instance ??= const SAMLStatusEnumTypeTransformer._();

  const SAMLStatusEnumTypeTransformer._();

  String encode(SAMLStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SAMLStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SAMLStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'unverified':
          return SAMLStatusEnum.unverified;
        case r'verified':
          return SAMLStatusEnum.verified;
        case r'failed':
          return SAMLStatusEnum.failed;
        case r'expired':
          return SAMLStatusEnum.expired;
        case r'transferable':
          return SAMLStatusEnum.transferable;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SAMLStatusEnumTypeTransformer] instance.
  static SAMLStatusEnumTypeTransformer? _instance;
}

class SAMLStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const SAMLStrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const saml = SAMLStrategyEnum._(r'saml');

  /// List of all possible values in this [enum][SAMLStrategyEnum].
  static const values = <SAMLStrategyEnum>[
    saml,
  ];

  static SAMLStrategyEnum? fromJson(dynamic value) =>
      SAMLStrategyEnumTypeTransformer().decode(value);

  static List<SAMLStrategyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SAMLStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SAMLStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SAMLStrategyEnum] to String,
/// and [decode] dynamic data back to [SAMLStrategyEnum].
class SAMLStrategyEnumTypeTransformer {
  factory SAMLStrategyEnumTypeTransformer() =>
      _instance ??= const SAMLStrategyEnumTypeTransformer._();

  const SAMLStrategyEnumTypeTransformer._();

  String encode(SAMLStrategyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SAMLStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SAMLStrategyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'saml':
          return SAMLStrategyEnum.saml;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SAMLStrategyEnumTypeTransformer] instance.
  static SAMLStrategyEnumTypeTransformer? _instance;
}
