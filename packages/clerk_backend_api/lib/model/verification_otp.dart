//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerificationOtp {
  /// Returns a new [VerificationOtp] instance.
  VerificationOtp({
    this.object,
    required this.status,
    required this.strategy,
    required this.attempts,
    required this.expireAt,
    this.verifiedAtClient,
  });

  VerificationOtpObjectEnum? object;

  VerificationOtpStatusEnum status;

  VerificationOtpStrategyEnum strategy;

  int? attempts;

  int? expireAt;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerificationOtp &&
          other.object == object &&
          other.status == status &&
          other.strategy == strategy &&
          other.attempts == attempts &&
          other.expireAt == expireAt &&
          other.verifiedAtClient == verifiedAtClient;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object == null ? 0 : object!.hashCode) +
      (status.hashCode) +
      (strategy.hashCode) +
      (attempts == null ? 0 : attempts!.hashCode) +
      (expireAt == null ? 0 : expireAt!.hashCode) +
      (verifiedAtClient == null ? 0 : verifiedAtClient!.hashCode);

  @override
  String toString() =>
      'VerificationOtp[object=$object, status=$status, strategy=$strategy, attempts=$attempts, expireAt=$expireAt, verifiedAtClient=$verifiedAtClient]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.object != null) {
      json[r'object'] = this.object;
    } else {
      json[r'object'] = null;
    }
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

  /// Returns a new [VerificationOtp] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VerificationOtp? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "VerificationOtp[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "VerificationOtp[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VerificationOtp(
        object: VerificationOtpObjectEnum.fromJson(json[r'object']),
        status: VerificationOtpStatusEnum.fromJson(json[r'status'])!,
        strategy: VerificationOtpStrategyEnum.fromJson(json[r'strategy'])!,
        attempts: mapValueOfType<int>(json, r'attempts'),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<VerificationOtp> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationOtp>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationOtp.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VerificationOtp> mapFromJson(dynamic json) {
    final map = <String, VerificationOtp>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerificationOtp.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VerificationOtp-objects as value to a dart map
  static Map<String, List<VerificationOtp>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<VerificationOtp>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VerificationOtp.listFromJson(
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

class VerificationOtpObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationOtpObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verificationOtp =
      VerificationOtpObjectEnum._(r'verification_otp');

  /// List of all possible values in this [enum][VerificationOtpObjectEnum].
  static const values = <VerificationOtpObjectEnum>[
    verificationOtp,
  ];

  static VerificationOtpObjectEnum? fromJson(dynamic value) =>
      VerificationOtpObjectEnumTypeTransformer().decode(value);

  static List<VerificationOtpObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationOtpObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationOtpObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationOtpObjectEnum] to String,
/// and [decode] dynamic data back to [VerificationOtpObjectEnum].
class VerificationOtpObjectEnumTypeTransformer {
  factory VerificationOtpObjectEnumTypeTransformer() =>
      _instance ??= const VerificationOtpObjectEnumTypeTransformer._();

  const VerificationOtpObjectEnumTypeTransformer._();

  String encode(VerificationOtpObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationOtpObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationOtpObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verification_otp':
          return VerificationOtpObjectEnum.verificationOtp;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationOtpObjectEnumTypeTransformer] instance.
  static VerificationOtpObjectEnumTypeTransformer? _instance;
}

class VerificationOtpStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationOtpStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const unverified = VerificationOtpStatusEnum._(r'unverified');
  static const verified = VerificationOtpStatusEnum._(r'verified');
  static const failed = VerificationOtpStatusEnum._(r'failed');
  static const expired = VerificationOtpStatusEnum._(r'expired');

  /// List of all possible values in this [enum][VerificationOtpStatusEnum].
  static const values = <VerificationOtpStatusEnum>[
    unverified,
    verified,
    failed,
    expired,
  ];

  static VerificationOtpStatusEnum? fromJson(dynamic value) =>
      VerificationOtpStatusEnumTypeTransformer().decode(value);

  static List<VerificationOtpStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationOtpStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationOtpStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationOtpStatusEnum] to String,
/// and [decode] dynamic data back to [VerificationOtpStatusEnum].
class VerificationOtpStatusEnumTypeTransformer {
  factory VerificationOtpStatusEnumTypeTransformer() =>
      _instance ??= const VerificationOtpStatusEnumTypeTransformer._();

  const VerificationOtpStatusEnumTypeTransformer._();

  String encode(VerificationOtpStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationOtpStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationOtpStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'unverified':
          return VerificationOtpStatusEnum.unverified;
        case r'verified':
          return VerificationOtpStatusEnum.verified;
        case r'failed':
          return VerificationOtpStatusEnum.failed;
        case r'expired':
          return VerificationOtpStatusEnum.expired;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationOtpStatusEnumTypeTransformer] instance.
  static VerificationOtpStatusEnumTypeTransformer? _instance;
}

class VerificationOtpStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationOtpStrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const phoneCode = VerificationOtpStrategyEnum._(r'phone_code');
  static const emailCode = VerificationOtpStrategyEnum._(r'email_code');
  static const resetPasswordEmailCode =
      VerificationOtpStrategyEnum._(r'reset_password_email_code');

  /// List of all possible values in this [enum][VerificationOtpStrategyEnum].
  static const values = <VerificationOtpStrategyEnum>[
    phoneCode,
    emailCode,
    resetPasswordEmailCode,
  ];

  static VerificationOtpStrategyEnum? fromJson(dynamic value) =>
      VerificationOtpStrategyEnumTypeTransformer().decode(value);

  static List<VerificationOtpStrategyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationOtpStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationOtpStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationOtpStrategyEnum] to String,
/// and [decode] dynamic data back to [VerificationOtpStrategyEnum].
class VerificationOtpStrategyEnumTypeTransformer {
  factory VerificationOtpStrategyEnumTypeTransformer() =>
      _instance ??= const VerificationOtpStrategyEnumTypeTransformer._();

  const VerificationOtpStrategyEnumTypeTransformer._();

  String encode(VerificationOtpStrategyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationOtpStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationOtpStrategyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'phone_code':
          return VerificationOtpStrategyEnum.phoneCode;
        case r'email_code':
          return VerificationOtpStrategyEnum.emailCode;
        case r'reset_password_email_code':
          return VerificationOtpStrategyEnum.resetPasswordEmailCode;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationOtpStrategyEnumTypeTransformer] instance.
  static VerificationOtpStrategyEnumTypeTransformer? _instance;
}
