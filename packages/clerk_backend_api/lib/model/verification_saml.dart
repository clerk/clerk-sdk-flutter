//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerificationSaml {
  /// Returns a new [VerificationSaml] instance.
  VerificationSaml({
    this.object,
    required this.status,
    required this.strategy,
    this.externalVerificationRedirectUrl,
    this.error,
    this.expireAt,
    required this.attempts,
    this.verifiedAtClient,
  });

  VerificationSamlObjectEnum? object;

  VerificationSamlStatusEnum status;

  VerificationSamlStrategyEnum strategy;

  String? externalVerificationRedirectUrl;

  VerificationFromOauthError? error;

  int? expireAt;

  int? attempts;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerificationSaml &&
          other.object == object &&
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
      (object == null ? 0 : object!.hashCode) +
      (status.hashCode) +
      (strategy.hashCode) +
      (externalVerificationRedirectUrl == null
          ? 0
          : externalVerificationRedirectUrl!.hashCode) +
      (error == null ? 0 : error!.hashCode) +
      (expireAt == null ? 0 : expireAt!.hashCode) +
      (attempts == null ? 0 : attempts!.hashCode) +
      (verifiedAtClient == null ? 0 : verifiedAtClient!.hashCode);

  @override
  String toString() =>
      'VerificationSaml[object=$object, status=$status, strategy=$strategy, externalVerificationRedirectUrl=$externalVerificationRedirectUrl, error=$error, expireAt=$expireAt, attempts=$attempts, verifiedAtClient=$verifiedAtClient]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.object != null) {
      json[r'object'] = this.object;
    } else {
      json[r'object'] = null;
    }
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
    if (this.expireAt != null) {
      json[r'expire_at'] = this.expireAt;
    } else {
      json[r'expire_at'] = null;
    }
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

  /// Returns a new [VerificationSaml] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VerificationSaml? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "VerificationSaml[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "VerificationSaml[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VerificationSaml(
        object: VerificationSamlObjectEnum.fromJson(json[r'object']),
        status: VerificationSamlStatusEnum.fromJson(json[r'status'])!,
        strategy: VerificationSamlStrategyEnum.fromJson(json[r'strategy'])!,
        externalVerificationRedirectUrl:
            mapValueOfType<String>(json, r'external_verification_redirect_url'),
        error: VerificationFromOauthError.fromJson(json[r'error']),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        attempts: mapValueOfType<int>(json, r'attempts'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<VerificationSaml> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationSaml>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationSaml.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VerificationSaml> mapFromJson(dynamic json) {
    final map = <String, VerificationSaml>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerificationSaml.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VerificationSaml-objects as value to a dart map
  static Map<String, List<VerificationSaml>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<VerificationSaml>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VerificationSaml.listFromJson(
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
    'attempts',
  };
}

class VerificationSamlObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationSamlObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verificationSaml =
      VerificationSamlObjectEnum._(r'verification_saml');

  /// List of all possible values in this [enum][VerificationSamlObjectEnum].
  static const values = <VerificationSamlObjectEnum>[
    verificationSaml,
  ];

  static VerificationSamlObjectEnum? fromJson(dynamic value) =>
      VerificationSamlObjectEnumTypeTransformer().decode(value);

  static List<VerificationSamlObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationSamlObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationSamlObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationSamlObjectEnum] to String,
/// and [decode] dynamic data back to [VerificationSamlObjectEnum].
class VerificationSamlObjectEnumTypeTransformer {
  factory VerificationSamlObjectEnumTypeTransformer() =>
      _instance ??= const VerificationSamlObjectEnumTypeTransformer._();

  const VerificationSamlObjectEnumTypeTransformer._();

  String encode(VerificationSamlObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationSamlObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationSamlObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verification_saml':
          return VerificationSamlObjectEnum.verificationSaml;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationSamlObjectEnumTypeTransformer] instance.
  static VerificationSamlObjectEnumTypeTransformer? _instance;
}

class VerificationSamlStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationSamlStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const unverified = VerificationSamlStatusEnum._(r'unverified');
  static const verified = VerificationSamlStatusEnum._(r'verified');
  static const failed = VerificationSamlStatusEnum._(r'failed');
  static const expired = VerificationSamlStatusEnum._(r'expired');
  static const transferable = VerificationSamlStatusEnum._(r'transferable');

  /// List of all possible values in this [enum][VerificationSamlStatusEnum].
  static const values = <VerificationSamlStatusEnum>[
    unverified,
    verified,
    failed,
    expired,
    transferable,
  ];

  static VerificationSamlStatusEnum? fromJson(dynamic value) =>
      VerificationSamlStatusEnumTypeTransformer().decode(value);

  static List<VerificationSamlStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationSamlStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationSamlStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationSamlStatusEnum] to String,
/// and [decode] dynamic data back to [VerificationSamlStatusEnum].
class VerificationSamlStatusEnumTypeTransformer {
  factory VerificationSamlStatusEnumTypeTransformer() =>
      _instance ??= const VerificationSamlStatusEnumTypeTransformer._();

  const VerificationSamlStatusEnumTypeTransformer._();

  String encode(VerificationSamlStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationSamlStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationSamlStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'unverified':
          return VerificationSamlStatusEnum.unverified;
        case r'verified':
          return VerificationSamlStatusEnum.verified;
        case r'failed':
          return VerificationSamlStatusEnum.failed;
        case r'expired':
          return VerificationSamlStatusEnum.expired;
        case r'transferable':
          return VerificationSamlStatusEnum.transferable;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationSamlStatusEnumTypeTransformer] instance.
  static VerificationSamlStatusEnumTypeTransformer? _instance;
}

class VerificationSamlStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationSamlStrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const saml = VerificationSamlStrategyEnum._(r'saml');

  /// List of all possible values in this [enum][VerificationSamlStrategyEnum].
  static const values = <VerificationSamlStrategyEnum>[
    saml,
  ];

  static VerificationSamlStrategyEnum? fromJson(dynamic value) =>
      VerificationSamlStrategyEnumTypeTransformer().decode(value);

  static List<VerificationSamlStrategyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationSamlStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationSamlStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationSamlStrategyEnum] to String,
/// and [decode] dynamic data back to [VerificationSamlStrategyEnum].
class VerificationSamlStrategyEnumTypeTransformer {
  factory VerificationSamlStrategyEnumTypeTransformer() =>
      _instance ??= const VerificationSamlStrategyEnumTypeTransformer._();

  const VerificationSamlStrategyEnumTypeTransformer._();

  String encode(VerificationSamlStrategyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationSamlStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationSamlStrategyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'saml':
          return VerificationSamlStrategyEnum.saml;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationSamlStrategyEnumTypeTransformer] instance.
  static VerificationSamlStrategyEnumTypeTransformer? _instance;
}
