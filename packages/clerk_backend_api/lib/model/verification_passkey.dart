//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerificationPasskey {
  /// Returns a new [VerificationPasskey] instance.
  VerificationPasskey({
    this.object,
    required this.status,
    required this.strategy,
    this.nonce,
    this.message,
    required this.attempts,
    required this.expireAt,
    this.verifiedAtClient,
  });

  VerificationPasskeyObjectEnum? object;

  VerificationPasskeyStatusEnum status;

  VerificationPasskeyStrategyEnum strategy;

  VerificationPasskeyNonceEnum? nonce;

  String? message;

  int? attempts;

  int? expireAt;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerificationPasskey &&
          other.object == object &&
          other.status == status &&
          other.strategy == strategy &&
          other.nonce == nonce &&
          other.message == message &&
          other.attempts == attempts &&
          other.expireAt == expireAt &&
          other.verifiedAtClient == verifiedAtClient;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object == null ? 0 : object!.hashCode) +
      (status.hashCode) +
      (strategy.hashCode) +
      (nonce == null ? 0 : nonce!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (attempts == null ? 0 : attempts!.hashCode) +
      (expireAt == null ? 0 : expireAt!.hashCode) +
      (verifiedAtClient == null ? 0 : verifiedAtClient!.hashCode);

  @override
  String toString() =>
      'VerificationPasskey[object=$object, status=$status, strategy=$strategy, nonce=$nonce, message=$message, attempts=$attempts, expireAt=$expireAt, verifiedAtClient=$verifiedAtClient]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.object != null) {
      json[r'object'] = this.object;
    } else {
      json[r'object'] = null;
    }
    json[r'status'] = this.status;
    json[r'strategy'] = this.strategy;
    if (this.nonce != null) {
      json[r'nonce'] = this.nonce;
    } else {
      json[r'nonce'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
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

  /// Returns a new [VerificationPasskey] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VerificationPasskey? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "VerificationPasskey[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "VerificationPasskey[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VerificationPasskey(
        object: VerificationPasskeyObjectEnum.fromJson(json[r'object']),
        status: VerificationPasskeyStatusEnum.fromJson(json[r'status'])!,
        strategy: VerificationPasskeyStrategyEnum.fromJson(json[r'strategy'])!,
        nonce: VerificationPasskeyNonceEnum.fromJson(json[r'nonce']),
        message: mapValueOfType<String>(json, r'message'),
        attempts: mapValueOfType<int>(json, r'attempts'),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<VerificationPasskey> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationPasskey>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationPasskey.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VerificationPasskey> mapFromJson(dynamic json) {
    final map = <String, VerificationPasskey>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerificationPasskey.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VerificationPasskey-objects as value to a dart map
  static Map<String, List<VerificationPasskey>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<VerificationPasskey>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VerificationPasskey.listFromJson(
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

class VerificationPasskeyObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationPasskeyObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verificationPasskey =
      VerificationPasskeyObjectEnum._(r'verification_passkey');

  /// List of all possible values in this [enum][VerificationPasskeyObjectEnum].
  static const values = <VerificationPasskeyObjectEnum>[
    verificationPasskey,
  ];

  static VerificationPasskeyObjectEnum? fromJson(dynamic value) =>
      VerificationPasskeyObjectEnumTypeTransformer().decode(value);

  static List<VerificationPasskeyObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationPasskeyObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationPasskeyObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationPasskeyObjectEnum] to String,
/// and [decode] dynamic data back to [VerificationPasskeyObjectEnum].
class VerificationPasskeyObjectEnumTypeTransformer {
  factory VerificationPasskeyObjectEnumTypeTransformer() =>
      _instance ??= const VerificationPasskeyObjectEnumTypeTransformer._();

  const VerificationPasskeyObjectEnumTypeTransformer._();

  String encode(VerificationPasskeyObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationPasskeyObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationPasskeyObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verification_passkey':
          return VerificationPasskeyObjectEnum.verificationPasskey;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationPasskeyObjectEnumTypeTransformer] instance.
  static VerificationPasskeyObjectEnumTypeTransformer? _instance;
}

class VerificationPasskeyStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationPasskeyStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verified = VerificationPasskeyStatusEnum._(r'verified');

  /// List of all possible values in this [enum][VerificationPasskeyStatusEnum].
  static const values = <VerificationPasskeyStatusEnum>[
    verified,
  ];

  static VerificationPasskeyStatusEnum? fromJson(dynamic value) =>
      VerificationPasskeyStatusEnumTypeTransformer().decode(value);

  static List<VerificationPasskeyStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationPasskeyStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationPasskeyStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationPasskeyStatusEnum] to String,
/// and [decode] dynamic data back to [VerificationPasskeyStatusEnum].
class VerificationPasskeyStatusEnumTypeTransformer {
  factory VerificationPasskeyStatusEnumTypeTransformer() =>
      _instance ??= const VerificationPasskeyStatusEnumTypeTransformer._();

  const VerificationPasskeyStatusEnumTypeTransformer._();

  String encode(VerificationPasskeyStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationPasskeyStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationPasskeyStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verified':
          return VerificationPasskeyStatusEnum.verified;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationPasskeyStatusEnumTypeTransformer] instance.
  static VerificationPasskeyStatusEnumTypeTransformer? _instance;
}

class VerificationPasskeyStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationPasskeyStrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const passkey = VerificationPasskeyStrategyEnum._(r'passkey');

  /// List of all possible values in this [enum][VerificationPasskeyStrategyEnum].
  static const values = <VerificationPasskeyStrategyEnum>[
    passkey,
  ];

  static VerificationPasskeyStrategyEnum? fromJson(dynamic value) =>
      VerificationPasskeyStrategyEnumTypeTransformer().decode(value);

  static List<VerificationPasskeyStrategyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationPasskeyStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationPasskeyStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationPasskeyStrategyEnum] to String,
/// and [decode] dynamic data back to [VerificationPasskeyStrategyEnum].
class VerificationPasskeyStrategyEnumTypeTransformer {
  factory VerificationPasskeyStrategyEnumTypeTransformer() =>
      _instance ??= const VerificationPasskeyStrategyEnumTypeTransformer._();

  const VerificationPasskeyStrategyEnumTypeTransformer._();

  String encode(VerificationPasskeyStrategyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationPasskeyStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationPasskeyStrategyEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'passkey':
          return VerificationPasskeyStrategyEnum.passkey;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationPasskeyStrategyEnumTypeTransformer] instance.
  static VerificationPasskeyStrategyEnumTypeTransformer? _instance;
}

class VerificationPasskeyNonceEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationPasskeyNonceEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const nonce = VerificationPasskeyNonceEnum._(r'nonce');

  /// List of all possible values in this [enum][VerificationPasskeyNonceEnum].
  static const values = <VerificationPasskeyNonceEnum>[
    nonce,
  ];

  static VerificationPasskeyNonceEnum? fromJson(dynamic value) =>
      VerificationPasskeyNonceEnumTypeTransformer().decode(value);

  static List<VerificationPasskeyNonceEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationPasskeyNonceEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationPasskeyNonceEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationPasskeyNonceEnum] to String,
/// and [decode] dynamic data back to [VerificationPasskeyNonceEnum].
class VerificationPasskeyNonceEnumTypeTransformer {
  factory VerificationPasskeyNonceEnumTypeTransformer() =>
      _instance ??= const VerificationPasskeyNonceEnumTypeTransformer._();

  const VerificationPasskeyNonceEnumTypeTransformer._();

  String encode(VerificationPasskeyNonceEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationPasskeyNonceEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationPasskeyNonceEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'nonce':
          return VerificationPasskeyNonceEnum.nonce;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationPasskeyNonceEnumTypeTransformer] instance.
  static VerificationPasskeyNonceEnumTypeTransformer? _instance;
}
