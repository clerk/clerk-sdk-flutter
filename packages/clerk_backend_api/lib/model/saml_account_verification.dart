//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SAMLAccountVerification {
  /// Returns a new [SAMLAccountVerification] instance.
  SAMLAccountVerification({
    required this.status,
    required this.strategy,
    required this.externalVerificationRedirectUrl,
    this.error,
    required this.expireAt,
    required this.attempts,
    this.verifiedAtClient,
  });

  SAMLAccountVerificationStatusEnum status;

  SAMLAccountVerificationStrategyEnum strategy;

  String? externalVerificationRedirectUrl;

  FromOAuthError? error;

  int? expireAt;

  int? attempts;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SAMLAccountVerification &&
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
      (expireAt == null ? 0 : expireAt!.hashCode) +
      (attempts == null ? 0 : attempts!.hashCode) +
      (verifiedAtClient == null ? 0 : verifiedAtClient!.hashCode);

  @override
  String toString() =>
      'SAMLAccountVerification[status=$status, strategy=$strategy, externalVerificationRedirectUrl=$externalVerificationRedirectUrl, error=$error, expireAt=$expireAt, attempts=$attempts, verifiedAtClient=$verifiedAtClient]';

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

  /// Returns a new [SAMLAccountVerification] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SAMLAccountVerification? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SAMLAccountVerification[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SAMLAccountVerification[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SAMLAccountVerification(
        status: SAMLAccountVerificationStatusEnum.fromJson(json[r'status'])!,
        strategy:
            SAMLAccountVerificationStrategyEnum.fromJson(json[r'strategy'])!,
        externalVerificationRedirectUrl:
            mapValueOfType<String>(json, r'external_verification_redirect_url'),
        error: FromOAuthError.fromJson(json[r'error']),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        attempts: mapValueOfType<int>(json, r'attempts'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<SAMLAccountVerification> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SAMLAccountVerification>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SAMLAccountVerification.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SAMLAccountVerification> mapFromJson(dynamic json) {
    final map = <String, SAMLAccountVerification>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SAMLAccountVerification.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SAMLAccountVerification-objects as value to a dart map
  static Map<String, List<SAMLAccountVerification>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SAMLAccountVerification>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SAMLAccountVerification.listFromJson(
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

class SAMLAccountVerificationStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const SAMLAccountVerificationStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const unverified = SAMLAccountVerificationStatusEnum._(r'unverified');
  static const verified = SAMLAccountVerificationStatusEnum._(r'verified');
  static const expired = SAMLAccountVerificationStatusEnum._(r'expired');

  /// List of all possible values in this [enum][SAMLAccountVerificationStatusEnum].
  static const values = <SAMLAccountVerificationStatusEnum>[
    unverified,
    verified,
    expired,
  ];

  static SAMLAccountVerificationStatusEnum? fromJson(dynamic value) =>
      SAMLAccountVerificationStatusEnumTypeTransformer().decode(value);

  static List<SAMLAccountVerificationStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SAMLAccountVerificationStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SAMLAccountVerificationStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SAMLAccountVerificationStatusEnum] to String,
/// and [decode] dynamic data back to [SAMLAccountVerificationStatusEnum].
class SAMLAccountVerificationStatusEnumTypeTransformer {
  factory SAMLAccountVerificationStatusEnumTypeTransformer() =>
      _instance ??= const SAMLAccountVerificationStatusEnumTypeTransformer._();

  const SAMLAccountVerificationStatusEnumTypeTransformer._();

  String encode(SAMLAccountVerificationStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SAMLAccountVerificationStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SAMLAccountVerificationStatusEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'unverified':
          return SAMLAccountVerificationStatusEnum.unverified;
        case r'verified':
          return SAMLAccountVerificationStatusEnum.verified;
        case r'expired':
          return SAMLAccountVerificationStatusEnum.expired;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SAMLAccountVerificationStatusEnumTypeTransformer] instance.
  static SAMLAccountVerificationStatusEnumTypeTransformer? _instance;
}

class SAMLAccountVerificationStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const SAMLAccountVerificationStrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const ticket = SAMLAccountVerificationStrategyEnum._(r'ticket');

  /// List of all possible values in this [enum][SAMLAccountVerificationStrategyEnum].
  static const values = <SAMLAccountVerificationStrategyEnum>[
    ticket,
  ];

  static SAMLAccountVerificationStrategyEnum? fromJson(dynamic value) =>
      SAMLAccountVerificationStrategyEnumTypeTransformer().decode(value);

  static List<SAMLAccountVerificationStrategyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SAMLAccountVerificationStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SAMLAccountVerificationStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SAMLAccountVerificationStrategyEnum] to String,
/// and [decode] dynamic data back to [SAMLAccountVerificationStrategyEnum].
class SAMLAccountVerificationStrategyEnumTypeTransformer {
  factory SAMLAccountVerificationStrategyEnumTypeTransformer() => _instance ??=
      const SAMLAccountVerificationStrategyEnumTypeTransformer._();

  const SAMLAccountVerificationStrategyEnumTypeTransformer._();

  String encode(SAMLAccountVerificationStrategyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SAMLAccountVerificationStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SAMLAccountVerificationStrategyEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'ticket':
          return SAMLAccountVerificationStrategyEnum.ticket;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SAMLAccountVerificationStrategyEnumTypeTransformer] instance.
  static SAMLAccountVerificationStrategyEnumTypeTransformer? _instance;
}
