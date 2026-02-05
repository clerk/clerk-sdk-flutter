//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerificationOauth {
  /// Returns a new [VerificationOauth] instance.
  VerificationOauth({
    this.object,
    required this.status,
    required this.strategy,
    this.externalVerificationRedirectUrl,
    this.error,
    required this.expireAt,
    required this.attempts,
    this.verifiedAtClient,
  });

  VerificationOauthObjectEnum? object;

  VerificationOauthStatusEnum status;

  String strategy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? externalVerificationRedirectUrl;

  VerificationFromOauthError? error;

  int expireAt;

  int? attempts;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerificationOauth &&
          other.object == object &&
          other.status == status &&
          other.strategy == strategy &&
          other.externalVerificationRedirectUrl ==
              externalVerificationRedirectUrl &&
          other.error == error &&
          other.expireAt == expireAt &&
          other.attempts == attempts &&
          other.verifiedAtClient == verifiedAtClient;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object == null ? 0 : object!.hashCode) +
      (status.hashCode) +
      (strategy.hashCode) +
      (externalVerificationRedirectUrl == null
          ? 0
          : externalVerificationRedirectUrl!.hashCode) +
      (error == null ? 0 : error!.hashCode) +
      (expireAt.hashCode) +
      (attempts == null ? 0 : attempts!.hashCode) +
      (verifiedAtClient == null ? 0 : verifiedAtClient!.hashCode);

  @override
  String toString() =>
      'VerificationOauth[object=$object, status=$status, strategy=$strategy, externalVerificationRedirectUrl=$externalVerificationRedirectUrl, error=$error, expireAt=$expireAt, attempts=$attempts, verifiedAtClient=$verifiedAtClient]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.object != null) {
      json[r'object'] = this.object;
    } else {
      json[r'object'] = null;
    }
    json[r'status'] = this.status;
    json[r'strategy'] = this.strategy;
    if (this.externalVerificationRedirectUrl != null) {
      json[r'external_verification_redirect_url'] =
          this.externalVerificationRedirectUrl;
    } else {
      json[r'external_verification_redirect_url'] = null;
    }
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
    json[r'expire_at'] = this.expireAt;
    if (this.attempts != null) {
      json[r'attempts'] = this.attempts;
    } else {
      json[r'attempts'] = null;
    }
    if (this.verifiedAtClient != null) {
      json[r'verified_at_client'] = this.verifiedAtClient;
    } else {
      json[r'verified_at_client'] = null;
    }
    return json;
  }

  /// Returns a new [VerificationOauth] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VerificationOauth? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "VerificationOauth[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "VerificationOauth[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VerificationOauth(
        object: VerificationOauthObjectEnum.fromJson(json[r'object']),
        status: VerificationOauthStatusEnum.fromJson(json[r'status'])!,
        strategy: mapValueOfType<String>(json, r'strategy')!,
        externalVerificationRedirectUrl:
            mapValueOfType<String>(json, r'external_verification_redirect_url'),
        error: VerificationFromOauthError.fromJson(json[r'error']),
        expireAt: mapValueOfType<int>(json, r'expire_at')!,
        attempts: mapValueOfType<int>(json, r'attempts'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<VerificationOauth> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationOauth>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationOauth.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VerificationOauth> mapFromJson(dynamic json) {
    final map = <String, VerificationOauth>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerificationOauth.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VerificationOauth-objects as value to a dart map
  static Map<String, List<VerificationOauth>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<VerificationOauth>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VerificationOauth.listFromJson(
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
    'expire_at',
    'attempts',
  };
}

class VerificationOauthObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationOauthObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verificationOauth =
      VerificationOauthObjectEnum._(r'verification_oauth');

  /// List of all possible values in this [enum][VerificationOauthObjectEnum].
  static const values = <VerificationOauthObjectEnum>[
    verificationOauth,
  ];

  static VerificationOauthObjectEnum? fromJson(dynamic value) =>
      VerificationOauthObjectEnumTypeTransformer().decode(value);

  static List<VerificationOauthObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationOauthObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationOauthObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationOauthObjectEnum] to String,
/// and [decode] dynamic data back to [VerificationOauthObjectEnum].
class VerificationOauthObjectEnumTypeTransformer {
  factory VerificationOauthObjectEnumTypeTransformer() =>
      _instance ??= const VerificationOauthObjectEnumTypeTransformer._();

  const VerificationOauthObjectEnumTypeTransformer._();

  String encode(VerificationOauthObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationOauthObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationOauthObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verification_oauth':
          return VerificationOauthObjectEnum.verificationOauth;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationOauthObjectEnumTypeTransformer] instance.
  static VerificationOauthObjectEnumTypeTransformer? _instance;
}

class VerificationOauthStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationOauthStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const unverified = VerificationOauthStatusEnum._(r'unverified');
  static const verified = VerificationOauthStatusEnum._(r'verified');
  static const failed = VerificationOauthStatusEnum._(r'failed');
  static const expired = VerificationOauthStatusEnum._(r'expired');
  static const transferable = VerificationOauthStatusEnum._(r'transferable');

  /// List of all possible values in this [enum][VerificationOauthStatusEnum].
  static const values = <VerificationOauthStatusEnum>[
    unverified,
    verified,
    failed,
    expired,
    transferable,
  ];

  static VerificationOauthStatusEnum? fromJson(dynamic value) =>
      VerificationOauthStatusEnumTypeTransformer().decode(value);

  static List<VerificationOauthStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationOauthStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationOauthStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationOauthStatusEnum] to String,
/// and [decode] dynamic data back to [VerificationOauthStatusEnum].
class VerificationOauthStatusEnumTypeTransformer {
  factory VerificationOauthStatusEnumTypeTransformer() =>
      _instance ??= const VerificationOauthStatusEnumTypeTransformer._();

  const VerificationOauthStatusEnumTypeTransformer._();

  String encode(VerificationOauthStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationOauthStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationOauthStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'unverified':
          return VerificationOauthStatusEnum.unverified;
        case r'verified':
          return VerificationOauthStatusEnum.verified;
        case r'failed':
          return VerificationOauthStatusEnum.failed;
        case r'expired':
          return VerificationOauthStatusEnum.expired;
        case r'transferable':
          return VerificationOauthStatusEnum.transferable;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationOauthStatusEnumTypeTransformer] instance.
  static VerificationOauthStatusEnumTypeTransformer? _instance;
}
