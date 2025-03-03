//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Web3WalletVerification {
  /// Returns a new [Web3WalletVerification] instance.
  Web3WalletVerification({
    required this.status,
    required this.strategy,
    this.nonce,
    this.message,
    required this.attempts,
    required this.expireAt,
    this.verifiedAtClient,
  });

  Web3WalletVerificationStatusEnum status;

  Web3WalletVerificationStrategyEnum strategy;

  String? nonce;

  String? message;

  int? attempts;

  int? expireAt;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Web3WalletVerification &&
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
      'Web3WalletVerification[status=$status, strategy=$strategy, nonce=$nonce, message=$message, attempts=$attempts, expireAt=$expireAt, verifiedAtClient=$verifiedAtClient]';

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

  /// Returns a new [Web3WalletVerification] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Web3WalletVerification? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Web3WalletVerification[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Web3WalletVerification[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Web3WalletVerification(
        status: Web3WalletVerificationStatusEnum.fromJson(json[r'status'])!,
        strategy:
            Web3WalletVerificationStrategyEnum.fromJson(json[r'strategy'])!,
        nonce: mapValueOfType<String>(json, r'nonce'),
        message: mapValueOfType<String>(json, r'message'),
        attempts: mapValueOfType<int>(json, r'attempts'),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<Web3WalletVerification> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Web3WalletVerification>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Web3WalletVerification.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Web3WalletVerification> mapFromJson(dynamic json) {
    final map = <String, Web3WalletVerification>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Web3WalletVerification.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Web3WalletVerification-objects as value to a dart map
  static Map<String, List<Web3WalletVerification>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Web3WalletVerification>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Web3WalletVerification.listFromJson(
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

class Web3WalletVerificationStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const Web3WalletVerificationStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verified = Web3WalletVerificationStatusEnum._(r'verified');

  /// List of all possible values in this [enum][Web3WalletVerificationStatusEnum].
  static const values = <Web3WalletVerificationStatusEnum>[
    verified,
  ];

  static Web3WalletVerificationStatusEnum? fromJson(dynamic value) =>
      Web3WalletVerificationStatusEnumTypeTransformer().decode(value);

  static List<Web3WalletVerificationStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Web3WalletVerificationStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Web3WalletVerificationStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [Web3WalletVerificationStatusEnum] to String,
/// and [decode] dynamic data back to [Web3WalletVerificationStatusEnum].
class Web3WalletVerificationStatusEnumTypeTransformer {
  factory Web3WalletVerificationStatusEnumTypeTransformer() =>
      _instance ??= const Web3WalletVerificationStatusEnumTypeTransformer._();

  const Web3WalletVerificationStatusEnumTypeTransformer._();

  String encode(Web3WalletVerificationStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a Web3WalletVerificationStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  Web3WalletVerificationStatusEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verified':
          return Web3WalletVerificationStatusEnum.verified;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [Web3WalletVerificationStatusEnumTypeTransformer] instance.
  static Web3WalletVerificationStatusEnumTypeTransformer? _instance;
}

class Web3WalletVerificationStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const Web3WalletVerificationStrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const admin = Web3WalletVerificationStrategyEnum._(r'admin');

  /// List of all possible values in this [enum][Web3WalletVerificationStrategyEnum].
  static const values = <Web3WalletVerificationStrategyEnum>[
    admin,
  ];

  static Web3WalletVerificationStrategyEnum? fromJson(dynamic value) =>
      Web3WalletVerificationStrategyEnumTypeTransformer().decode(value);

  static List<Web3WalletVerificationStrategyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Web3WalletVerificationStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Web3WalletVerificationStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [Web3WalletVerificationStrategyEnum] to String,
/// and [decode] dynamic data back to [Web3WalletVerificationStrategyEnum].
class Web3WalletVerificationStrategyEnumTypeTransformer {
  factory Web3WalletVerificationStrategyEnumTypeTransformer() =>
      _instance ??= const Web3WalletVerificationStrategyEnumTypeTransformer._();

  const Web3WalletVerificationStrategyEnumTypeTransformer._();

  String encode(Web3WalletVerificationStrategyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a Web3WalletVerificationStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  Web3WalletVerificationStrategyEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'admin':
          return Web3WalletVerificationStrategyEnum.admin;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [Web3WalletVerificationStrategyEnumTypeTransformer] instance.
  static Web3WalletVerificationStrategyEnumTypeTransformer? _instance;
}
