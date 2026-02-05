//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerificationFromOauth {
  /// Returns a new [VerificationFromOauth] instance.
  VerificationFromOauth({
    this.object,
    required this.status,
    required this.strategy,
    this.error,
    required this.expireAt,
    required this.attempts,
    this.verifiedAtClient,
  });

  VerificationFromOauthObjectEnum? object;

  VerificationFromOauthStatusEnum status;

  String strategy;

  VerificationFromOauthError? error;

  int? expireAt;

  int? attempts;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerificationFromOauth &&
          other.object == object &&
          other.status == status &&
          other.strategy == strategy &&
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
      (error == null ? 0 : error!.hashCode) +
      (expireAt == null ? 0 : expireAt!.hashCode) +
      (attempts == null ? 0 : attempts!.hashCode) +
      (verifiedAtClient == null ? 0 : verifiedAtClient!.hashCode);

  @override
  String toString() =>
      'VerificationFromOauth[object=$object, status=$status, strategy=$strategy, error=$error, expireAt=$expireAt, attempts=$attempts, verifiedAtClient=$verifiedAtClient]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.object != null) {
      json[r'object'] = this.object;
    } else {
      json[r'object'] = null;
    }
    json[r'status'] = this.status;
    json[r'strategy'] = this.strategy;
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

  /// Returns a new [VerificationFromOauth] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VerificationFromOauth? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "VerificationFromOauth[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "VerificationFromOauth[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VerificationFromOauth(
        object: VerificationFromOauthObjectEnum.fromJson(json[r'object']),
        status: VerificationFromOauthStatusEnum.fromJson(json[r'status'])!,
        strategy: mapValueOfType<String>(json, r'strategy')!,
        error: VerificationFromOauthError.fromJson(json[r'error']),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        attempts: mapValueOfType<int>(json, r'attempts'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<VerificationFromOauth> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationFromOauth>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationFromOauth.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VerificationFromOauth> mapFromJson(dynamic json) {
    final map = <String, VerificationFromOauth>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerificationFromOauth.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VerificationFromOauth-objects as value to a dart map
  static Map<String, List<VerificationFromOauth>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<VerificationFromOauth>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VerificationFromOauth.listFromJson(
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
    'expire_at',
    'attempts',
  };
}

class VerificationFromOauthObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationFromOauthObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verificationFromOauth =
      VerificationFromOauthObjectEnum._(r'verification_from_oauth');

  /// List of all possible values in this [enum][VerificationFromOauthObjectEnum].
  static const values = <VerificationFromOauthObjectEnum>[
    verificationFromOauth,
  ];

  static VerificationFromOauthObjectEnum? fromJson(dynamic value) =>
      VerificationFromOauthObjectEnumTypeTransformer().decode(value);

  static List<VerificationFromOauthObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationFromOauthObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationFromOauthObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationFromOauthObjectEnum] to String,
/// and [decode] dynamic data back to [VerificationFromOauthObjectEnum].
class VerificationFromOauthObjectEnumTypeTransformer {
  factory VerificationFromOauthObjectEnumTypeTransformer() =>
      _instance ??= const VerificationFromOauthObjectEnumTypeTransformer._();

  const VerificationFromOauthObjectEnumTypeTransformer._();

  String encode(VerificationFromOauthObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationFromOauthObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationFromOauthObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verification_from_oauth':
          return VerificationFromOauthObjectEnum.verificationFromOauth;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationFromOauthObjectEnumTypeTransformer] instance.
  static VerificationFromOauthObjectEnumTypeTransformer? _instance;
}

class VerificationFromOauthStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationFromOauthStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const unverified = VerificationFromOauthStatusEnum._(r'unverified');
  static const verified = VerificationFromOauthStatusEnum._(r'verified');

  /// List of all possible values in this [enum][VerificationFromOauthStatusEnum].
  static const values = <VerificationFromOauthStatusEnum>[
    unverified,
    verified,
  ];

  static VerificationFromOauthStatusEnum? fromJson(dynamic value) =>
      VerificationFromOauthStatusEnumTypeTransformer().decode(value);

  static List<VerificationFromOauthStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationFromOauthStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationFromOauthStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationFromOauthStatusEnum] to String,
/// and [decode] dynamic data back to [VerificationFromOauthStatusEnum].
class VerificationFromOauthStatusEnumTypeTransformer {
  factory VerificationFromOauthStatusEnumTypeTransformer() =>
      _instance ??= const VerificationFromOauthStatusEnumTypeTransformer._();

  const VerificationFromOauthStatusEnumTypeTransformer._();

  String encode(VerificationFromOauthStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationFromOauthStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationFromOauthStatusEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'unverified':
          return VerificationFromOauthStatusEnum.unverified;
        case r'verified':
          return VerificationFromOauthStatusEnum.verified;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationFromOauthStatusEnumTypeTransformer] instance.
  static VerificationFromOauthStatusEnumTypeTransformer? _instance;
}
