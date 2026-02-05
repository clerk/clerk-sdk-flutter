//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ExternalAccountWithVerificationVerification {
  /// Returns a new [ExternalAccountWithVerificationVerification] instance.
  ExternalAccountWithVerificationVerification({
    this.object,
    required this.status,
    required this.strategy,
    this.externalVerificationRedirectUrl,
    this.error,
    required this.expireAt,
    required this.attempts,
    this.verifiedAtClient,
  });

  ExternalAccountWithVerificationVerificationObjectEnum? object;

  ExternalAccountWithVerificationVerificationStatusEnum status;

  ExternalAccountWithVerificationVerificationStrategyEnum strategy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? externalVerificationRedirectUrl;

  VerificationFromOauthError? error;

  int? expireAt;

  int? attempts;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExternalAccountWithVerificationVerification &&
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
      (expireAt == null ? 0 : expireAt!.hashCode) +
      (attempts == null ? 0 : attempts!.hashCode) +
      (verifiedAtClient == null ? 0 : verifiedAtClient!.hashCode);

  @override
  String toString() =>
      'ExternalAccountWithVerificationVerification[object=$object, status=$status, strategy=$strategy, externalVerificationRedirectUrl=$externalVerificationRedirectUrl, error=$error, expireAt=$expireAt, attempts=$attempts, verifiedAtClient=$verifiedAtClient]';

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
    if (this.expireAt != null) {
      json[r'expire_at'] = this.expireAt;
    } else {
      json[r'expire_at'] = null;
    }
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

  /// Returns a new [ExternalAccountWithVerificationVerification] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ExternalAccountWithVerificationVerification? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ExternalAccountWithVerificationVerification[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ExternalAccountWithVerificationVerification[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ExternalAccountWithVerificationVerification(
        object: ExternalAccountWithVerificationVerificationObjectEnum.fromJson(
            json[r'object']),
        status: ExternalAccountWithVerificationVerificationStatusEnum.fromJson(
            json[r'status'])!,
        strategy:
            ExternalAccountWithVerificationVerificationStrategyEnum.fromJson(
                json[r'strategy'])!,
        externalVerificationRedirectUrl:
            mapValueOfType<String>(json, r'external_verification_redirect_url'),
        error: VerificationFromOauthError.fromJson(json[r'error']),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        attempts: mapValueOfType<int>(json, r'attempts'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<ExternalAccountWithVerificationVerification> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ExternalAccountWithVerificationVerification>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ExternalAccountWithVerificationVerification.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ExternalAccountWithVerificationVerification> mapFromJson(
      dynamic json) {
    final map = <String, ExternalAccountWithVerificationVerification>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            ExternalAccountWithVerificationVerification.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ExternalAccountWithVerificationVerification-objects as value to a dart map
  static Map<String, List<ExternalAccountWithVerificationVerification>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ExternalAccountWithVerificationVerification>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            ExternalAccountWithVerificationVerification.listFromJson(
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

class ExternalAccountWithVerificationVerificationObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const ExternalAccountWithVerificationVerificationObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verificationGoogleOneTap =
      ExternalAccountWithVerificationVerificationObjectEnum._(
          r'verification_google_one_tap');

  /// List of all possible values in this [enum][ExternalAccountWithVerificationVerificationObjectEnum].
  static const values = <ExternalAccountWithVerificationVerificationObjectEnum>[
    verificationGoogleOneTap,
  ];

  static ExternalAccountWithVerificationVerificationObjectEnum? fromJson(
          dynamic value) =>
      ExternalAccountWithVerificationVerificationObjectEnumTypeTransformer()
          .decode(value);

  static List<ExternalAccountWithVerificationVerificationObjectEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ExternalAccountWithVerificationVerificationObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            ExternalAccountWithVerificationVerificationObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ExternalAccountWithVerificationVerificationObjectEnum] to String,
/// and [decode] dynamic data back to [ExternalAccountWithVerificationVerificationObjectEnum].
class ExternalAccountWithVerificationVerificationObjectEnumTypeTransformer {
  factory ExternalAccountWithVerificationVerificationObjectEnumTypeTransformer() =>
      _instance ??=
          const ExternalAccountWithVerificationVerificationObjectEnumTypeTransformer
              ._();

  const ExternalAccountWithVerificationVerificationObjectEnumTypeTransformer._();

  String encode(ExternalAccountWithVerificationVerificationObjectEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a ExternalAccountWithVerificationVerificationObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ExternalAccountWithVerificationVerificationObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verification_google_one_tap':
          return ExternalAccountWithVerificationVerificationObjectEnum
              .verificationGoogleOneTap;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ExternalAccountWithVerificationVerificationObjectEnumTypeTransformer] instance.
  static ExternalAccountWithVerificationVerificationObjectEnumTypeTransformer?
      _instance;
}

class ExternalAccountWithVerificationVerificationStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const ExternalAccountWithVerificationVerificationStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const unverified =
      ExternalAccountWithVerificationVerificationStatusEnum._(r'unverified');
  static const verified =
      ExternalAccountWithVerificationVerificationStatusEnum._(r'verified');

  /// List of all possible values in this [enum][ExternalAccountWithVerificationVerificationStatusEnum].
  static const values = <ExternalAccountWithVerificationVerificationStatusEnum>[
    unverified,
    verified,
  ];

  static ExternalAccountWithVerificationVerificationStatusEnum? fromJson(
          dynamic value) =>
      ExternalAccountWithVerificationVerificationStatusEnumTypeTransformer()
          .decode(value);

  static List<ExternalAccountWithVerificationVerificationStatusEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ExternalAccountWithVerificationVerificationStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            ExternalAccountWithVerificationVerificationStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ExternalAccountWithVerificationVerificationStatusEnum] to String,
/// and [decode] dynamic data back to [ExternalAccountWithVerificationVerificationStatusEnum].
class ExternalAccountWithVerificationVerificationStatusEnumTypeTransformer {
  factory ExternalAccountWithVerificationVerificationStatusEnumTypeTransformer() =>
      _instance ??=
          const ExternalAccountWithVerificationVerificationStatusEnumTypeTransformer
              ._();

  const ExternalAccountWithVerificationVerificationStatusEnumTypeTransformer._();

  String encode(ExternalAccountWithVerificationVerificationStatusEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a ExternalAccountWithVerificationVerificationStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ExternalAccountWithVerificationVerificationStatusEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'unverified':
          return ExternalAccountWithVerificationVerificationStatusEnum
              .unverified;
        case r'verified':
          return ExternalAccountWithVerificationVerificationStatusEnum.verified;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ExternalAccountWithVerificationVerificationStatusEnumTypeTransformer] instance.
  static ExternalAccountWithVerificationVerificationStatusEnumTypeTransformer?
      _instance;
}

class ExternalAccountWithVerificationVerificationStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const ExternalAccountWithVerificationVerificationStrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const googleOneTap =
      ExternalAccountWithVerificationVerificationStrategyEnum._(
          r'google_one_tap');

  /// List of all possible values in this [enum][ExternalAccountWithVerificationVerificationStrategyEnum].
  static const values =
      <ExternalAccountWithVerificationVerificationStrategyEnum>[
    googleOneTap,
  ];

  static ExternalAccountWithVerificationVerificationStrategyEnum? fromJson(
          dynamic value) =>
      ExternalAccountWithVerificationVerificationStrategyEnumTypeTransformer()
          .decode(value);

  static List<ExternalAccountWithVerificationVerificationStrategyEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ExternalAccountWithVerificationVerificationStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            ExternalAccountWithVerificationVerificationStrategyEnum.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ExternalAccountWithVerificationVerificationStrategyEnum] to String,
/// and [decode] dynamic data back to [ExternalAccountWithVerificationVerificationStrategyEnum].
class ExternalAccountWithVerificationVerificationStrategyEnumTypeTransformer {
  factory ExternalAccountWithVerificationVerificationStrategyEnumTypeTransformer() =>
      _instance ??=
          const ExternalAccountWithVerificationVerificationStrategyEnumTypeTransformer
              ._();

  const ExternalAccountWithVerificationVerificationStrategyEnumTypeTransformer._();

  String encode(ExternalAccountWithVerificationVerificationStrategyEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a ExternalAccountWithVerificationVerificationStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ExternalAccountWithVerificationVerificationStrategyEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'google_one_tap':
          return ExternalAccountWithVerificationVerificationStrategyEnum
              .googleOneTap;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ExternalAccountWithVerificationVerificationStrategyEnumTypeTransformer] instance.
  static ExternalAccountWithVerificationVerificationStrategyEnumTypeTransformer?
      _instance;
}
