//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SchemasPasskeyVerification {
  /// Returns a new [SchemasPasskeyVerification] instance.
  SchemasPasskeyVerification({
    required this.status,
    required this.strategy,
    this.nonce,
    this.message,
    required this.attempts,
    required this.expireAt,
    this.verifiedAtClient,
  });

  SchemasPasskeyVerificationStatusEnum status;

  SchemasPasskeyVerificationStrategyEnum strategy;

  SchemasPasskeyVerificationNonceEnum? nonce;

  String? message;

  int? attempts;

  int? expireAt;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SchemasPasskeyVerification &&
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
      'SchemasPasskeyVerification[status=$status, strategy=$strategy, nonce=$nonce, message=$message, attempts=$attempts, expireAt=$expireAt, verifiedAtClient=$verifiedAtClient]';

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

  /// Returns a new [SchemasPasskeyVerification] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SchemasPasskeyVerification? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SchemasPasskeyVerification[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SchemasPasskeyVerification[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SchemasPasskeyVerification(
        status: SchemasPasskeyVerificationStatusEnum.fromJson(json[r'status'])!,
        strategy:
            SchemasPasskeyVerificationStrategyEnum.fromJson(json[r'strategy'])!,
        nonce: SchemasPasskeyVerificationNonceEnum.fromJson(json[r'nonce']),
        message: mapValueOfType<String>(json, r'message'),
        attempts: mapValueOfType<int>(json, r'attempts'),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<SchemasPasskeyVerification> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SchemasPasskeyVerification>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SchemasPasskeyVerification.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SchemasPasskeyVerification> mapFromJson(dynamic json) {
    final map = <String, SchemasPasskeyVerification>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SchemasPasskeyVerification.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SchemasPasskeyVerification-objects as value to a dart map
  static Map<String, List<SchemasPasskeyVerification>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SchemasPasskeyVerification>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SchemasPasskeyVerification.listFromJson(
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

class SchemasPasskeyVerificationStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const SchemasPasskeyVerificationStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verified = SchemasPasskeyVerificationStatusEnum._(r'verified');

  /// List of all possible values in this [enum][SchemasPasskeyVerificationStatusEnum].
  static const values = <SchemasPasskeyVerificationStatusEnum>[
    verified,
  ];

  static SchemasPasskeyVerificationStatusEnum? fromJson(dynamic value) =>
      SchemasPasskeyVerificationStatusEnumTypeTransformer().decode(value);

  static List<SchemasPasskeyVerificationStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SchemasPasskeyVerificationStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SchemasPasskeyVerificationStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SchemasPasskeyVerificationStatusEnum] to String,
/// and [decode] dynamic data back to [SchemasPasskeyVerificationStatusEnum].
class SchemasPasskeyVerificationStatusEnumTypeTransformer {
  factory SchemasPasskeyVerificationStatusEnumTypeTransformer() => _instance ??=
      const SchemasPasskeyVerificationStatusEnumTypeTransformer._();

  const SchemasPasskeyVerificationStatusEnumTypeTransformer._();

  String encode(SchemasPasskeyVerificationStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SchemasPasskeyVerificationStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SchemasPasskeyVerificationStatusEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verified':
          return SchemasPasskeyVerificationStatusEnum.verified;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SchemasPasskeyVerificationStatusEnumTypeTransformer] instance.
  static SchemasPasskeyVerificationStatusEnumTypeTransformer? _instance;
}

class SchemasPasskeyVerificationStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const SchemasPasskeyVerificationStrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const passkey = SchemasPasskeyVerificationStrategyEnum._(r'passkey');

  /// List of all possible values in this [enum][SchemasPasskeyVerificationStrategyEnum].
  static const values = <SchemasPasskeyVerificationStrategyEnum>[
    passkey,
  ];

  static SchemasPasskeyVerificationStrategyEnum? fromJson(dynamic value) =>
      SchemasPasskeyVerificationStrategyEnumTypeTransformer().decode(value);

  static List<SchemasPasskeyVerificationStrategyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SchemasPasskeyVerificationStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SchemasPasskeyVerificationStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SchemasPasskeyVerificationStrategyEnum] to String,
/// and [decode] dynamic data back to [SchemasPasskeyVerificationStrategyEnum].
class SchemasPasskeyVerificationStrategyEnumTypeTransformer {
  factory SchemasPasskeyVerificationStrategyEnumTypeTransformer() =>
      _instance ??=
          const SchemasPasskeyVerificationStrategyEnumTypeTransformer._();

  const SchemasPasskeyVerificationStrategyEnumTypeTransformer._();

  String encode(SchemasPasskeyVerificationStrategyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SchemasPasskeyVerificationStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SchemasPasskeyVerificationStrategyEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'passkey':
          return SchemasPasskeyVerificationStrategyEnum.passkey;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SchemasPasskeyVerificationStrategyEnumTypeTransformer] instance.
  static SchemasPasskeyVerificationStrategyEnumTypeTransformer? _instance;
}

class SchemasPasskeyVerificationNonceEnum {
  /// Instantiate a new enum with the provided [value].
  const SchemasPasskeyVerificationNonceEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const nonce = SchemasPasskeyVerificationNonceEnum._(r'nonce');

  /// List of all possible values in this [enum][SchemasPasskeyVerificationNonceEnum].
  static const values = <SchemasPasskeyVerificationNonceEnum>[
    nonce,
  ];

  static SchemasPasskeyVerificationNonceEnum? fromJson(dynamic value) =>
      SchemasPasskeyVerificationNonceEnumTypeTransformer().decode(value);

  static List<SchemasPasskeyVerificationNonceEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SchemasPasskeyVerificationNonceEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SchemasPasskeyVerificationNonceEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SchemasPasskeyVerificationNonceEnum] to String,
/// and [decode] dynamic data back to [SchemasPasskeyVerificationNonceEnum].
class SchemasPasskeyVerificationNonceEnumTypeTransformer {
  factory SchemasPasskeyVerificationNonceEnumTypeTransformer() => _instance ??=
      const SchemasPasskeyVerificationNonceEnumTypeTransformer._();

  const SchemasPasskeyVerificationNonceEnumTypeTransformer._();

  String encode(SchemasPasskeyVerificationNonceEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SchemasPasskeyVerificationNonceEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SchemasPasskeyVerificationNonceEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'nonce':
          return SchemasPasskeyVerificationNonceEnum.nonce;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SchemasPasskeyVerificationNonceEnumTypeTransformer] instance.
  static SchemasPasskeyVerificationNonceEnumTypeTransformer? _instance;
}
