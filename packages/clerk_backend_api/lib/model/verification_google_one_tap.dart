//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerificationGoogleOneTap {
  /// Returns a new [VerificationGoogleOneTap] instance.
  VerificationGoogleOneTap({
    this.object,
    required this.status,
    required this.strategy,
    required this.expireAt,
    required this.attempts,
    this.verifiedAtClient,
    this.error,
  });

  VerificationGoogleOneTapObjectEnum? object;

  VerificationGoogleOneTapStatusEnum status;

  VerificationGoogleOneTapStrategyEnum strategy;

  int? expireAt;

  int? attempts;

  String? verifiedAtClient;

  VerificationFromOauthError? error;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerificationGoogleOneTap &&
          other.object == object &&
          other.status == status &&
          other.strategy == strategy &&
          other.expireAt == expireAt &&
          other.attempts == attempts &&
          other.verifiedAtClient == verifiedAtClient &&
          other.error == error;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object == null ? 0 : object!.hashCode) +
      (status.hashCode) +
      (strategy.hashCode) +
      (expireAt == null ? 0 : expireAt!.hashCode) +
      (attempts == null ? 0 : attempts!.hashCode) +
      (verifiedAtClient == null ? 0 : verifiedAtClient!.hashCode) +
      (error == null ? 0 : error!.hashCode);

  @override
  String toString() =>
      'VerificationGoogleOneTap[object=$object, status=$status, strategy=$strategy, expireAt=$expireAt, attempts=$attempts, verifiedAtClient=$verifiedAtClient, error=$error]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.object != null) {
      json[r'object'] = this.object;
    } else {
      json[r'object'] = null;
    }
    json[r'status'] = this.status;
    json[r'strategy'] = this.strategy;
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
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
    return json;
  }

  /// Returns a new [VerificationGoogleOneTap] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VerificationGoogleOneTap? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "VerificationGoogleOneTap[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "VerificationGoogleOneTap[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VerificationGoogleOneTap(
        object: VerificationGoogleOneTapObjectEnum.fromJson(json[r'object']),
        status: VerificationGoogleOneTapStatusEnum.fromJson(json[r'status'])!,
        strategy:
            VerificationGoogleOneTapStrategyEnum.fromJson(json[r'strategy'])!,
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        attempts: mapValueOfType<int>(json, r'attempts'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
        error: VerificationFromOauthError.fromJson(json[r'error']),
      );
    }
    return null;
  }

  static List<VerificationGoogleOneTap> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationGoogleOneTap>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationGoogleOneTap.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VerificationGoogleOneTap> mapFromJson(dynamic json) {
    final map = <String, VerificationGoogleOneTap>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerificationGoogleOneTap.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VerificationGoogleOneTap-objects as value to a dart map
  static Map<String, List<VerificationGoogleOneTap>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<VerificationGoogleOneTap>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VerificationGoogleOneTap.listFromJson(
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

class VerificationGoogleOneTapObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationGoogleOneTapObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verificationGoogleOneTap =
      VerificationGoogleOneTapObjectEnum._(r'verification_google_one_tap');

  /// List of all possible values in this [enum][VerificationGoogleOneTapObjectEnum].
  static const values = <VerificationGoogleOneTapObjectEnum>[
    verificationGoogleOneTap,
  ];

  static VerificationGoogleOneTapObjectEnum? fromJson(dynamic value) =>
      VerificationGoogleOneTapObjectEnumTypeTransformer().decode(value);

  static List<VerificationGoogleOneTapObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationGoogleOneTapObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationGoogleOneTapObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationGoogleOneTapObjectEnum] to String,
/// and [decode] dynamic data back to [VerificationGoogleOneTapObjectEnum].
class VerificationGoogleOneTapObjectEnumTypeTransformer {
  factory VerificationGoogleOneTapObjectEnumTypeTransformer() =>
      _instance ??= const VerificationGoogleOneTapObjectEnumTypeTransformer._();

  const VerificationGoogleOneTapObjectEnumTypeTransformer._();

  String encode(VerificationGoogleOneTapObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationGoogleOneTapObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationGoogleOneTapObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verification_google_one_tap':
          return VerificationGoogleOneTapObjectEnum.verificationGoogleOneTap;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationGoogleOneTapObjectEnumTypeTransformer] instance.
  static VerificationGoogleOneTapObjectEnumTypeTransformer? _instance;
}

class VerificationGoogleOneTapStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationGoogleOneTapStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const unverified = VerificationGoogleOneTapStatusEnum._(r'unverified');
  static const verified = VerificationGoogleOneTapStatusEnum._(r'verified');

  /// List of all possible values in this [enum][VerificationGoogleOneTapStatusEnum].
  static const values = <VerificationGoogleOneTapStatusEnum>[
    unverified,
    verified,
  ];

  static VerificationGoogleOneTapStatusEnum? fromJson(dynamic value) =>
      VerificationGoogleOneTapStatusEnumTypeTransformer().decode(value);

  static List<VerificationGoogleOneTapStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationGoogleOneTapStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationGoogleOneTapStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationGoogleOneTapStatusEnum] to String,
/// and [decode] dynamic data back to [VerificationGoogleOneTapStatusEnum].
class VerificationGoogleOneTapStatusEnumTypeTransformer {
  factory VerificationGoogleOneTapStatusEnumTypeTransformer() =>
      _instance ??= const VerificationGoogleOneTapStatusEnumTypeTransformer._();

  const VerificationGoogleOneTapStatusEnumTypeTransformer._();

  String encode(VerificationGoogleOneTapStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationGoogleOneTapStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationGoogleOneTapStatusEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'unverified':
          return VerificationGoogleOneTapStatusEnum.unverified;
        case r'verified':
          return VerificationGoogleOneTapStatusEnum.verified;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationGoogleOneTapStatusEnumTypeTransformer] instance.
  static VerificationGoogleOneTapStatusEnumTypeTransformer? _instance;
}

class VerificationGoogleOneTapStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationGoogleOneTapStrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const googleOneTap =
      VerificationGoogleOneTapStrategyEnum._(r'google_one_tap');

  /// List of all possible values in this [enum][VerificationGoogleOneTapStrategyEnum].
  static const values = <VerificationGoogleOneTapStrategyEnum>[
    googleOneTap,
  ];

  static VerificationGoogleOneTapStrategyEnum? fromJson(dynamic value) =>
      VerificationGoogleOneTapStrategyEnumTypeTransformer().decode(value);

  static List<VerificationGoogleOneTapStrategyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationGoogleOneTapStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationGoogleOneTapStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationGoogleOneTapStrategyEnum] to String,
/// and [decode] dynamic data back to [VerificationGoogleOneTapStrategyEnum].
class VerificationGoogleOneTapStrategyEnumTypeTransformer {
  factory VerificationGoogleOneTapStrategyEnumTypeTransformer() => _instance ??=
      const VerificationGoogleOneTapStrategyEnumTypeTransformer._();

  const VerificationGoogleOneTapStrategyEnumTypeTransformer._();

  String encode(VerificationGoogleOneTapStrategyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationGoogleOneTapStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationGoogleOneTapStrategyEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'google_one_tap':
          return VerificationGoogleOneTapStrategyEnum.googleOneTap;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationGoogleOneTapStrategyEnumTypeTransformer] instance.
  static VerificationGoogleOneTapStrategyEnumTypeTransformer? _instance;
}
