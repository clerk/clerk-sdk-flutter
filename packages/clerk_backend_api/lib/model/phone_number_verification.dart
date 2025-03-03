//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PhoneNumberVerification {
  /// Returns a new [PhoneNumberVerification] instance.
  PhoneNumberVerification({
    required this.status,
    required this.strategy,
    required this.attempts,
    required this.expireAt,
    this.verifiedAtClient,
  });

  PhoneNumberVerificationStatusEnum status;

  PhoneNumberVerificationStrategyEnum strategy;

  int? attempts;

  int? expireAt;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhoneNumberVerification &&
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
      'PhoneNumberVerification[status=$status, strategy=$strategy, attempts=$attempts, expireAt=$expireAt, verifiedAtClient=$verifiedAtClient]';

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

  /// Returns a new [PhoneNumberVerification] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PhoneNumberVerification? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "PhoneNumberVerification[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "PhoneNumberVerification[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PhoneNumberVerification(
        status: PhoneNumberVerificationStatusEnum.fromJson(json[r'status'])!,
        strategy:
            PhoneNumberVerificationStrategyEnum.fromJson(json[r'strategy'])!,
        attempts: mapValueOfType<int>(json, r'attempts'),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<PhoneNumberVerification> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PhoneNumberVerification>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PhoneNumberVerification.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PhoneNumberVerification> mapFromJson(dynamic json) {
    final map = <String, PhoneNumberVerification>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PhoneNumberVerification.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PhoneNumberVerification-objects as value to a dart map
  static Map<String, List<PhoneNumberVerification>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<PhoneNumberVerification>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PhoneNumberVerification.listFromJson(
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

class PhoneNumberVerificationStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const PhoneNumberVerificationStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verified = PhoneNumberVerificationStatusEnum._(r'verified');

  /// List of all possible values in this [enum][PhoneNumberVerificationStatusEnum].
  static const values = <PhoneNumberVerificationStatusEnum>[
    verified,
  ];

  static PhoneNumberVerificationStatusEnum? fromJson(dynamic value) =>
      PhoneNumberVerificationStatusEnumTypeTransformer().decode(value);

  static List<PhoneNumberVerificationStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PhoneNumberVerificationStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PhoneNumberVerificationStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PhoneNumberVerificationStatusEnum] to String,
/// and [decode] dynamic data back to [PhoneNumberVerificationStatusEnum].
class PhoneNumberVerificationStatusEnumTypeTransformer {
  factory PhoneNumberVerificationStatusEnumTypeTransformer() =>
      _instance ??= const PhoneNumberVerificationStatusEnumTypeTransformer._();

  const PhoneNumberVerificationStatusEnumTypeTransformer._();

  String encode(PhoneNumberVerificationStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PhoneNumberVerificationStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PhoneNumberVerificationStatusEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verified':
          return PhoneNumberVerificationStatusEnum.verified;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PhoneNumberVerificationStatusEnumTypeTransformer] instance.
  static PhoneNumberVerificationStatusEnumTypeTransformer? _instance;
}

class PhoneNumberVerificationStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const PhoneNumberVerificationStrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const admin = PhoneNumberVerificationStrategyEnum._(r'admin');

  /// List of all possible values in this [enum][PhoneNumberVerificationStrategyEnum].
  static const values = <PhoneNumberVerificationStrategyEnum>[
    admin,
  ];

  static PhoneNumberVerificationStrategyEnum? fromJson(dynamic value) =>
      PhoneNumberVerificationStrategyEnumTypeTransformer().decode(value);

  static List<PhoneNumberVerificationStrategyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PhoneNumberVerificationStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PhoneNumberVerificationStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PhoneNumberVerificationStrategyEnum] to String,
/// and [decode] dynamic data back to [PhoneNumberVerificationStrategyEnum].
class PhoneNumberVerificationStrategyEnumTypeTransformer {
  factory PhoneNumberVerificationStrategyEnumTypeTransformer() => _instance ??=
      const PhoneNumberVerificationStrategyEnumTypeTransformer._();

  const PhoneNumberVerificationStrategyEnumTypeTransformer._();

  String encode(PhoneNumberVerificationStrategyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PhoneNumberVerificationStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PhoneNumberVerificationStrategyEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'admin':
          return PhoneNumberVerificationStrategyEnum.admin;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PhoneNumberVerificationStrategyEnumTypeTransformer] instance.
  static PhoneNumberVerificationStrategyEnumTypeTransformer? _instance;
}
