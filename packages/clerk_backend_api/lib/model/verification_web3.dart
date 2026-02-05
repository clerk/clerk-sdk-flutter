//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerificationWeb3 {
  /// Returns a new [VerificationWeb3] instance.
  VerificationWeb3({
    this.object,
    required this.status,
    required this.strategy,
    this.nonce,
    this.message,
    required this.attempts,
    required this.expireAt,
    this.verifiedAtClient,
  });

  VerificationWeb3ObjectEnum? object;

  VerificationWeb3StatusEnum status;

  VerificationWeb3StrategyEnum strategy;

  String? nonce;

  String? message;

  int? attempts;

  int? expireAt;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerificationWeb3 &&
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
      'VerificationWeb3[object=$object, status=$status, strategy=$strategy, nonce=$nonce, message=$message, attempts=$attempts, expireAt=$expireAt, verifiedAtClient=$verifiedAtClient]';

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

  /// Returns a new [VerificationWeb3] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VerificationWeb3? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "VerificationWeb3[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "VerificationWeb3[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VerificationWeb3(
        object: VerificationWeb3ObjectEnum.fromJson(json[r'object']),
        status: VerificationWeb3StatusEnum.fromJson(json[r'status'])!,
        strategy: VerificationWeb3StrategyEnum.fromJson(json[r'strategy'])!,
        nonce: mapValueOfType<String>(json, r'nonce'),
        message: mapValueOfType<String>(json, r'message'),
        attempts: mapValueOfType<int>(json, r'attempts'),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<VerificationWeb3> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationWeb3>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationWeb3.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VerificationWeb3> mapFromJson(dynamic json) {
    final map = <String, VerificationWeb3>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerificationWeb3.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VerificationWeb3-objects as value to a dart map
  static Map<String, List<VerificationWeb3>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<VerificationWeb3>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VerificationWeb3.listFromJson(
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

class VerificationWeb3ObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationWeb3ObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verificationWeb3 =
      VerificationWeb3ObjectEnum._(r'verification_web3');

  /// List of all possible values in this [enum][VerificationWeb3ObjectEnum].
  static const values = <VerificationWeb3ObjectEnum>[
    verificationWeb3,
  ];

  static VerificationWeb3ObjectEnum? fromJson(dynamic value) =>
      VerificationWeb3ObjectEnumTypeTransformer().decode(value);

  static List<VerificationWeb3ObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationWeb3ObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationWeb3ObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationWeb3ObjectEnum] to String,
/// and [decode] dynamic data back to [VerificationWeb3ObjectEnum].
class VerificationWeb3ObjectEnumTypeTransformer {
  factory VerificationWeb3ObjectEnumTypeTransformer() =>
      _instance ??= const VerificationWeb3ObjectEnumTypeTransformer._();

  const VerificationWeb3ObjectEnumTypeTransformer._();

  String encode(VerificationWeb3ObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationWeb3ObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationWeb3ObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verification_web3':
          return VerificationWeb3ObjectEnum.verificationWeb3;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationWeb3ObjectEnumTypeTransformer] instance.
  static VerificationWeb3ObjectEnumTypeTransformer? _instance;
}

class VerificationWeb3StatusEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationWeb3StatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const unverified = VerificationWeb3StatusEnum._(r'unverified');
  static const verified = VerificationWeb3StatusEnum._(r'verified');
  static const failed = VerificationWeb3StatusEnum._(r'failed');
  static const expired = VerificationWeb3StatusEnum._(r'expired');

  /// List of all possible values in this [enum][VerificationWeb3StatusEnum].
  static const values = <VerificationWeb3StatusEnum>[
    unverified,
    verified,
    failed,
    expired,
  ];

  static VerificationWeb3StatusEnum? fromJson(dynamic value) =>
      VerificationWeb3StatusEnumTypeTransformer().decode(value);

  static List<VerificationWeb3StatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationWeb3StatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationWeb3StatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationWeb3StatusEnum] to String,
/// and [decode] dynamic data back to [VerificationWeb3StatusEnum].
class VerificationWeb3StatusEnumTypeTransformer {
  factory VerificationWeb3StatusEnumTypeTransformer() =>
      _instance ??= const VerificationWeb3StatusEnumTypeTransformer._();

  const VerificationWeb3StatusEnumTypeTransformer._();

  String encode(VerificationWeb3StatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationWeb3StatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationWeb3StatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'unverified':
          return VerificationWeb3StatusEnum.unverified;
        case r'verified':
          return VerificationWeb3StatusEnum.verified;
        case r'failed':
          return VerificationWeb3StatusEnum.failed;
        case r'expired':
          return VerificationWeb3StatusEnum.expired;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationWeb3StatusEnumTypeTransformer] instance.
  static VerificationWeb3StatusEnumTypeTransformer? _instance;
}

class VerificationWeb3StrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationWeb3StrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const metamaskSignature =
      VerificationWeb3StrategyEnum._(r'web3_metamask_signature');
  static const baseSignature =
      VerificationWeb3StrategyEnum._(r'web3_base_signature');
  static const coinbaseWalletSignature =
      VerificationWeb3StrategyEnum._(r'web3_coinbase_wallet_signature');
  static const okxWalletSignature =
      VerificationWeb3StrategyEnum._(r'web3_okx_wallet_signature');
  static const solanaSignature =
      VerificationWeb3StrategyEnum._(r'web3_solana_signature');

  /// List of all possible values in this [enum][VerificationWeb3StrategyEnum].
  static const values = <VerificationWeb3StrategyEnum>[
    metamaskSignature,
    baseSignature,
    coinbaseWalletSignature,
    okxWalletSignature,
    solanaSignature,
  ];

  static VerificationWeb3StrategyEnum? fromJson(dynamic value) =>
      VerificationWeb3StrategyEnumTypeTransformer().decode(value);

  static List<VerificationWeb3StrategyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationWeb3StrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationWeb3StrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationWeb3StrategyEnum] to String,
/// and [decode] dynamic data back to [VerificationWeb3StrategyEnum].
class VerificationWeb3StrategyEnumTypeTransformer {
  factory VerificationWeb3StrategyEnumTypeTransformer() =>
      _instance ??= const VerificationWeb3StrategyEnumTypeTransformer._();

  const VerificationWeb3StrategyEnumTypeTransformer._();

  String encode(VerificationWeb3StrategyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationWeb3StrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationWeb3StrategyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'web3_metamask_signature':
          return VerificationWeb3StrategyEnum.metamaskSignature;
        case r'web3_base_signature':
          return VerificationWeb3StrategyEnum.baseSignature;
        case r'web3_coinbase_wallet_signature':
          return VerificationWeb3StrategyEnum.coinbaseWalletSignature;
        case r'web3_okx_wallet_signature':
          return VerificationWeb3StrategyEnum.okxWalletSignature;
        case r'web3_solana_signature':
          return VerificationWeb3StrategyEnum.solanaSignature;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationWeb3StrategyEnumTypeTransformer] instance.
  static VerificationWeb3StrategyEnumTypeTransformer? _instance;
}
