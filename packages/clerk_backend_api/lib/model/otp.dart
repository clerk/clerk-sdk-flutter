//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OTP {
  /// Returns a new [OTP] instance.
  OTP({
    required this.status,
    required this.strategy,
    required this.attempts,
    required this.expireAt,
    this.verifiedAtClient,
  });

  OTPStatusEnum status;

  OTPStrategyEnum strategy;

  int? attempts;

  int? expireAt;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OTP &&
          other.status == status &&
          other.strategy == strategy &&
          other.attempts == attempts &&
          other.expireAt == expireAt &&
          other.verifiedAtClient == verifiedAtClient;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (status.hashCode) +
      (strategy.hashCode) +
      (attempts == null ? 0 : attempts!.hashCode) +
      (expireAt == null ? 0 : expireAt!.hashCode) +
      (verifiedAtClient == null ? 0 : verifiedAtClient!.hashCode);

  @override
  String toString() =>
      'OTP[status=$status, strategy=$strategy, attempts=$attempts, expireAt=$expireAt, verifiedAtClient=$verifiedAtClient]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'status'] = this.status;
    json[r'strategy'] = this.strategy;
    if (this.attempts != null) {
      json[r'attempts'] = this.attempts;
    } else {
      json[r'attempts'] = null;
    }
    if (this.expireAt != null) {
      json[r'expire_at'] = this.expireAt;
    } else {
      json[r'expire_at'] = null;
    }
    if (this.verifiedAtClient != null) {
      json[r'verified_at_client'] = this.verifiedAtClient;
    } else {
      json[r'verified_at_client'] = null;
    }
    return json;
  }

  /// Returns a new [OTP] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OTP? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "OTP[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "OTP[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OTP(
        status: OTPStatusEnum.fromJson(json[r'status'])!,
        strategy: OTPStrategyEnum.fromJson(json[r'strategy'])!,
        attempts: mapValueOfType<int>(json, r'attempts'),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<OTP> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OTP>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OTP.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OTP> mapFromJson(dynamic json) {
    final map = <String, OTP>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OTP.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OTP-objects as value to a dart map
  static Map<String, List<OTP>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<OTP>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OTP.listFromJson(
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
    'expire_at',
  };
}

class OTPStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const OTPStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const unverified = OTPStatusEnum._(r'unverified');
  static const verified = OTPStatusEnum._(r'verified');
  static const failed = OTPStatusEnum._(r'failed');
  static const expired = OTPStatusEnum._(r'expired');

  /// List of all possible values in this [enum][OTPStatusEnum].
  static const values = <OTPStatusEnum>[
    unverified,
    verified,
    failed,
    expired,
  ];

  static OTPStatusEnum? fromJson(dynamic value) =>
      OTPStatusEnumTypeTransformer().decode(value);

  static List<OTPStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OTPStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OTPStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [OTPStatusEnum] to String,
/// and [decode] dynamic data back to [OTPStatusEnum].
class OTPStatusEnumTypeTransformer {
  factory OTPStatusEnumTypeTransformer() =>
      _instance ??= const OTPStatusEnumTypeTransformer._();

  const OTPStatusEnumTypeTransformer._();

  String encode(OTPStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a OTPStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  OTPStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'unverified':
          return OTPStatusEnum.unverified;
        case r'verified':
          return OTPStatusEnum.verified;
        case r'failed':
          return OTPStatusEnum.failed;
        case r'expired':
          return OTPStatusEnum.expired;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [OTPStatusEnumTypeTransformer] instance.
  static OTPStatusEnumTypeTransformer? _instance;
}

class OTPStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const OTPStrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const phoneCode = OTPStrategyEnum._(r'phone_code');
  static const emailCode = OTPStrategyEnum._(r'email_code');
  static const resetPasswordEmailCode =
      OTPStrategyEnum._(r'reset_password_email_code');

  /// List of all possible values in this [enum][OTPStrategyEnum].
  static const values = <OTPStrategyEnum>[
    phoneCode,
    emailCode,
    resetPasswordEmailCode,
  ];

  static OTPStrategyEnum? fromJson(dynamic value) =>
      OTPStrategyEnumTypeTransformer().decode(value);

  static List<OTPStrategyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OTPStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OTPStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [OTPStrategyEnum] to String,
/// and [decode] dynamic data back to [OTPStrategyEnum].
class OTPStrategyEnumTypeTransformer {
  factory OTPStrategyEnumTypeTransformer() =>
      _instance ??= const OTPStrategyEnumTypeTransformer._();

  const OTPStrategyEnumTypeTransformer._();

  String encode(OTPStrategyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a OTPStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  OTPStrategyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'phone_code':
          return OTPStrategyEnum.phoneCode;
        case r'email_code':
          return OTPStrategyEnum.emailCode;
        case r'reset_password_email_code':
          return OTPStrategyEnum.resetPasswordEmailCode;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [OTPStrategyEnumTypeTransformer] instance.
  static OTPStrategyEnumTypeTransformer? _instance;
}
