//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Web3Signature {
  /// Returns a new [Web3Signature] instance.
  Web3Signature({
    required this.status,
    required this.strategy,
    this.nonce,
    this.message,
    required this.attempts,
    required this.expireAt,
    this.verifiedAtClient,
  });

  Web3SignatureStatusEnum status;

  Web3SignatureStrategyEnum strategy;

  String? nonce;

  String? message;

  int? attempts;

  int? expireAt;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Web3Signature &&
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
      (status.hashCode) +
      (strategy.hashCode) +
      (nonce == null ? 0 : nonce!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (attempts == null ? 0 : attempts!.hashCode) +
      (expireAt == null ? 0 : expireAt!.hashCode) +
      (verifiedAtClient == null ? 0 : verifiedAtClient!.hashCode);

  @override
  String toString() =>
      'Web3Signature[status=$status, strategy=$strategy, nonce=$nonce, message=$message, attempts=$attempts, expireAt=$expireAt, verifiedAtClient=$verifiedAtClient]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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

  /// Returns a new [Web3Signature] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Web3Signature? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Web3Signature[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Web3Signature[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Web3Signature(
        status: Web3SignatureStatusEnum.fromJson(json[r'status'])!,
        strategy: Web3SignatureStrategyEnum.fromJson(json[r'strategy'])!,
        nonce: mapValueOfType<String>(json, r'nonce'),
        message: mapValueOfType<String>(json, r'message'),
        attempts: mapValueOfType<int>(json, r'attempts'),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<Web3Signature> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Web3Signature>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Web3Signature.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Web3Signature> mapFromJson(dynamic json) {
    final map = <String, Web3Signature>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Web3Signature.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Web3Signature-objects as value to a dart map
  static Map<String, List<Web3Signature>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Web3Signature>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Web3Signature.listFromJson(
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

class Web3SignatureStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const Web3SignatureStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const unverified = Web3SignatureStatusEnum._(r'unverified');
  static const verified = Web3SignatureStatusEnum._(r'verified');
  static const failed = Web3SignatureStatusEnum._(r'failed');
  static const expired = Web3SignatureStatusEnum._(r'expired');

  /// List of all possible values in this [enum][Web3SignatureStatusEnum].
  static const values = <Web3SignatureStatusEnum>[
    unverified,
    verified,
    failed,
    expired,
  ];

  static Web3SignatureStatusEnum? fromJson(dynamic value) =>
      Web3SignatureStatusEnumTypeTransformer().decode(value);

  static List<Web3SignatureStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Web3SignatureStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Web3SignatureStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [Web3SignatureStatusEnum] to String,
/// and [decode] dynamic data back to [Web3SignatureStatusEnum].
class Web3SignatureStatusEnumTypeTransformer {
  factory Web3SignatureStatusEnumTypeTransformer() =>
      _instance ??= const Web3SignatureStatusEnumTypeTransformer._();

  const Web3SignatureStatusEnumTypeTransformer._();

  String encode(Web3SignatureStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a Web3SignatureStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  Web3SignatureStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'unverified':
          return Web3SignatureStatusEnum.unverified;
        case r'verified':
          return Web3SignatureStatusEnum.verified;
        case r'failed':
          return Web3SignatureStatusEnum.failed;
        case r'expired':
          return Web3SignatureStatusEnum.expired;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [Web3SignatureStatusEnumTypeTransformer] instance.
  static Web3SignatureStatusEnumTypeTransformer? _instance;
}

class Web3SignatureStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const Web3SignatureStrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const metamaskSignature =
      Web3SignatureStrategyEnum._(r'web3_metamask_signature');
  static const coinbaseWalletSignature =
      Web3SignatureStrategyEnum._(r'web3_coinbase_wallet_signature');
  static const okxWalletSignature =
      Web3SignatureStrategyEnum._(r'web3_okx_wallet_signature');

  /// List of all possible values in this [enum][Web3SignatureStrategyEnum].
  static const values = <Web3SignatureStrategyEnum>[
    metamaskSignature,
    coinbaseWalletSignature,
    okxWalletSignature,
  ];

  static Web3SignatureStrategyEnum? fromJson(dynamic value) =>
      Web3SignatureStrategyEnumTypeTransformer().decode(value);

  static List<Web3SignatureStrategyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Web3SignatureStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Web3SignatureStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [Web3SignatureStrategyEnum] to String,
/// and [decode] dynamic data back to [Web3SignatureStrategyEnum].
class Web3SignatureStrategyEnumTypeTransformer {
  factory Web3SignatureStrategyEnumTypeTransformer() =>
      _instance ??= const Web3SignatureStrategyEnumTypeTransformer._();

  const Web3SignatureStrategyEnumTypeTransformer._();

  String encode(Web3SignatureStrategyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a Web3SignatureStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  Web3SignatureStrategyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'web3_metamask_signature':
          return Web3SignatureStrategyEnum.metamaskSignature;
        case r'web3_coinbase_wallet_signature':
          return Web3SignatureStrategyEnum.coinbaseWalletSignature;
        case r'web3_okx_wallet_signature':
          return Web3SignatureStrategyEnum.okxWalletSignature;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [Web3SignatureStrategyEnumTypeTransformer] instance.
  static Web3SignatureStrategyEnumTypeTransformer? _instance;
}
