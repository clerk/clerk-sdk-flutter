//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PasskeyVerification {
  /// Returns a new [PasskeyVerification] instance.
  PasskeyVerification({
    this.object,
    required this.status,
    required this.strategy,
    this.nonce,
    this.message,
    required this.attempts,
    required this.expireAt,
    this.verifiedAtClient,
  });

  PasskeyVerificationObjectEnum? object;

  PasskeyVerificationStatusEnum status;

  PasskeyVerificationStrategyEnum strategy;

  PasskeyVerificationNonceEnum? nonce;

  String? message;

  int? attempts;

  int? expireAt;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasskeyVerification &&
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
      'PasskeyVerification[object=$object, status=$status, strategy=$strategy, nonce=$nonce, message=$message, attempts=$attempts, expireAt=$expireAt, verifiedAtClient=$verifiedAtClient]';

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

  /// Returns a new [PasskeyVerification] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PasskeyVerification? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "PasskeyVerification[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "PasskeyVerification[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PasskeyVerification(
        object: PasskeyVerificationObjectEnum.fromJson(json[r'object']),
        status: PasskeyVerificationStatusEnum.fromJson(json[r'status'])!,
        strategy: PasskeyVerificationStrategyEnum.fromJson(json[r'strategy'])!,
        nonce: PasskeyVerificationNonceEnum.fromJson(json[r'nonce']),
        message: mapValueOfType<String>(json, r'message'),
        attempts: mapValueOfType<int>(json, r'attempts'),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<PasskeyVerification> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PasskeyVerification>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PasskeyVerification.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PasskeyVerification> mapFromJson(dynamic json) {
    final map = <String, PasskeyVerification>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PasskeyVerification.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PasskeyVerification-objects as value to a dart map
  static Map<String, List<PasskeyVerification>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<PasskeyVerification>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PasskeyVerification.listFromJson(
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

class PasskeyVerificationObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const PasskeyVerificationObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verificationPasskey =
      PasskeyVerificationObjectEnum._(r'verification_passkey');

  /// List of all possible values in this [enum][PasskeyVerificationObjectEnum].
  static const values = <PasskeyVerificationObjectEnum>[
    verificationPasskey,
  ];

  static PasskeyVerificationObjectEnum? fromJson(dynamic value) =>
      PasskeyVerificationObjectEnumTypeTransformer().decode(value);

  static List<PasskeyVerificationObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PasskeyVerificationObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PasskeyVerificationObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PasskeyVerificationObjectEnum] to String,
/// and [decode] dynamic data back to [PasskeyVerificationObjectEnum].
class PasskeyVerificationObjectEnumTypeTransformer {
  factory PasskeyVerificationObjectEnumTypeTransformer() =>
      _instance ??= const PasskeyVerificationObjectEnumTypeTransformer._();

  const PasskeyVerificationObjectEnumTypeTransformer._();

  String encode(PasskeyVerificationObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PasskeyVerificationObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PasskeyVerificationObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verification_passkey':
          return PasskeyVerificationObjectEnum.verificationPasskey;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PasskeyVerificationObjectEnumTypeTransformer] instance.
  static PasskeyVerificationObjectEnumTypeTransformer? _instance;
}

class PasskeyVerificationStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const PasskeyVerificationStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verified = PasskeyVerificationStatusEnum._(r'verified');

  /// List of all possible values in this [enum][PasskeyVerificationStatusEnum].
  static const values = <PasskeyVerificationStatusEnum>[
    verified,
  ];

  static PasskeyVerificationStatusEnum? fromJson(dynamic value) =>
      PasskeyVerificationStatusEnumTypeTransformer().decode(value);

  static List<PasskeyVerificationStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PasskeyVerificationStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PasskeyVerificationStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PasskeyVerificationStatusEnum] to String,
/// and [decode] dynamic data back to [PasskeyVerificationStatusEnum].
class PasskeyVerificationStatusEnumTypeTransformer {
  factory PasskeyVerificationStatusEnumTypeTransformer() =>
      _instance ??= const PasskeyVerificationStatusEnumTypeTransformer._();

  const PasskeyVerificationStatusEnumTypeTransformer._();

  String encode(PasskeyVerificationStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PasskeyVerificationStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PasskeyVerificationStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verified':
          return PasskeyVerificationStatusEnum.verified;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PasskeyVerificationStatusEnumTypeTransformer] instance.
  static PasskeyVerificationStatusEnumTypeTransformer? _instance;
}

class PasskeyVerificationStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const PasskeyVerificationStrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const passkey = PasskeyVerificationStrategyEnum._(r'passkey');

  /// List of all possible values in this [enum][PasskeyVerificationStrategyEnum].
  static const values = <PasskeyVerificationStrategyEnum>[
    passkey,
  ];

  static PasskeyVerificationStrategyEnum? fromJson(dynamic value) =>
      PasskeyVerificationStrategyEnumTypeTransformer().decode(value);

  static List<PasskeyVerificationStrategyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PasskeyVerificationStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PasskeyVerificationStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PasskeyVerificationStrategyEnum] to String,
/// and [decode] dynamic data back to [PasskeyVerificationStrategyEnum].
class PasskeyVerificationStrategyEnumTypeTransformer {
  factory PasskeyVerificationStrategyEnumTypeTransformer() =>
      _instance ??= const PasskeyVerificationStrategyEnumTypeTransformer._();

  const PasskeyVerificationStrategyEnumTypeTransformer._();

  String encode(PasskeyVerificationStrategyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PasskeyVerificationStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PasskeyVerificationStrategyEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'passkey':
          return PasskeyVerificationStrategyEnum.passkey;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PasskeyVerificationStrategyEnumTypeTransformer] instance.
  static PasskeyVerificationStrategyEnumTypeTransformer? _instance;
}

class PasskeyVerificationNonceEnum {
  /// Instantiate a new enum with the provided [value].
  const PasskeyVerificationNonceEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const nonce = PasskeyVerificationNonceEnum._(r'nonce');

  /// List of all possible values in this [enum][PasskeyVerificationNonceEnum].
  static const values = <PasskeyVerificationNonceEnum>[
    nonce,
  ];

  static PasskeyVerificationNonceEnum? fromJson(dynamic value) =>
      PasskeyVerificationNonceEnumTypeTransformer().decode(value);

  static List<PasskeyVerificationNonceEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PasskeyVerificationNonceEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PasskeyVerificationNonceEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PasskeyVerificationNonceEnum] to String,
/// and [decode] dynamic data back to [PasskeyVerificationNonceEnum].
class PasskeyVerificationNonceEnumTypeTransformer {
  factory PasskeyVerificationNonceEnumTypeTransformer() =>
      _instance ??= const PasskeyVerificationNonceEnumTypeTransformer._();

  const PasskeyVerificationNonceEnumTypeTransformer._();

  String encode(PasskeyVerificationNonceEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PasskeyVerificationNonceEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PasskeyVerificationNonceEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'nonce':
          return PasskeyVerificationNonceEnum.nonce;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PasskeyVerificationNonceEnumTypeTransformer] instance.
  static PasskeyVerificationNonceEnumTypeTransformer? _instance;
}
