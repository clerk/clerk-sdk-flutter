//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerificationAdmin {
  /// Returns a new [VerificationAdmin] instance.
  VerificationAdmin({
    this.object,
    required this.status,
    required this.strategy,
    required this.attempts,
    required this.expireAt,
    this.verifiedAtClient,
  });

  VerificationAdminObjectEnum? object;

  VerificationAdminStatusEnum status;

  VerificationAdminStrategyEnum strategy;

  int? attempts;

  int? expireAt;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerificationAdmin &&
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
      'VerificationAdmin[object=$object, status=$status, strategy=$strategy, attempts=$attempts, expireAt=$expireAt, verifiedAtClient=$verifiedAtClient]';

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

  /// Returns a new [VerificationAdmin] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VerificationAdmin? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "VerificationAdmin[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "VerificationAdmin[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VerificationAdmin(
        object: VerificationAdminObjectEnum.fromJson(json[r'object']),
        status: VerificationAdminStatusEnum.fromJson(json[r'status'])!,
        strategy: VerificationAdminStrategyEnum.fromJson(json[r'strategy'])!,
        attempts: mapValueOfType<int>(json, r'attempts'),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<VerificationAdmin> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationAdmin>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationAdmin.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VerificationAdmin> mapFromJson(dynamic json) {
    final map = <String, VerificationAdmin>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerificationAdmin.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VerificationAdmin-objects as value to a dart map
  static Map<String, List<VerificationAdmin>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<VerificationAdmin>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VerificationAdmin.listFromJson(
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

class VerificationAdminObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationAdminObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verificationAdmin =
      VerificationAdminObjectEnum._(r'verification_admin');

  /// List of all possible values in this [enum][VerificationAdminObjectEnum].
  static const values = <VerificationAdminObjectEnum>[
    verificationAdmin,
  ];

  static VerificationAdminObjectEnum? fromJson(dynamic value) =>
      VerificationAdminObjectEnumTypeTransformer().decode(value);

  static List<VerificationAdminObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationAdminObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationAdminObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationAdminObjectEnum] to String,
/// and [decode] dynamic data back to [VerificationAdminObjectEnum].
class VerificationAdminObjectEnumTypeTransformer {
  factory VerificationAdminObjectEnumTypeTransformer() =>
      _instance ??= const VerificationAdminObjectEnumTypeTransformer._();

  const VerificationAdminObjectEnumTypeTransformer._();

  String encode(VerificationAdminObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationAdminObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationAdminObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verification_admin':
          return VerificationAdminObjectEnum.verificationAdmin;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationAdminObjectEnumTypeTransformer] instance.
  static VerificationAdminObjectEnumTypeTransformer? _instance;
}

class VerificationAdminStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationAdminStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verified = VerificationAdminStatusEnum._(r'verified');

  /// List of all possible values in this [enum][VerificationAdminStatusEnum].
  static const values = <VerificationAdminStatusEnum>[
    verified,
  ];

  static VerificationAdminStatusEnum? fromJson(dynamic value) =>
      VerificationAdminStatusEnumTypeTransformer().decode(value);

  static List<VerificationAdminStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationAdminStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationAdminStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationAdminStatusEnum] to String,
/// and [decode] dynamic data back to [VerificationAdminStatusEnum].
class VerificationAdminStatusEnumTypeTransformer {
  factory VerificationAdminStatusEnumTypeTransformer() =>
      _instance ??= const VerificationAdminStatusEnumTypeTransformer._();

  const VerificationAdminStatusEnumTypeTransformer._();

  String encode(VerificationAdminStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationAdminStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationAdminStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verified':
          return VerificationAdminStatusEnum.verified;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationAdminStatusEnumTypeTransformer] instance.
  static VerificationAdminStatusEnumTypeTransformer? _instance;
}

class VerificationAdminStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationAdminStrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const admin = VerificationAdminStrategyEnum._(r'admin');

  /// List of all possible values in this [enum][VerificationAdminStrategyEnum].
  static const values = <VerificationAdminStrategyEnum>[
    admin,
  ];

  static VerificationAdminStrategyEnum? fromJson(dynamic value) =>
      VerificationAdminStrategyEnumTypeTransformer().decode(value);

  static List<VerificationAdminStrategyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationAdminStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationAdminStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationAdminStrategyEnum] to String,
/// and [decode] dynamic data back to [VerificationAdminStrategyEnum].
class VerificationAdminStrategyEnumTypeTransformer {
  factory VerificationAdminStrategyEnumTypeTransformer() =>
      _instance ??= const VerificationAdminStrategyEnumTypeTransformer._();

  const VerificationAdminStrategyEnumTypeTransformer._();

  String encode(VerificationAdminStrategyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationAdminStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationAdminStrategyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'admin':
          return VerificationAdminStrategyEnum.admin;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationAdminStrategyEnumTypeTransformer] instance.
  static VerificationAdminStrategyEnumTypeTransformer? _instance;
}
