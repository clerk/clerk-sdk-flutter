//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EnterpriseAccountVerification {
  /// Returns a new [EnterpriseAccountVerification] instance.
  EnterpriseAccountVerification({
    this.object,
    required this.status,
    required this.strategy,
    required this.attempts,
    required this.expireAt,
    this.verifiedAtClient,
    this.externalVerificationRedirectUrl,
    this.error,
  });

  EnterpriseAccountVerificationObjectEnum? object;

  EnterpriseAccountVerificationStatusEnum status;

  String strategy;

  int? attempts;

  int expireAt;

  String? verifiedAtClient;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? externalVerificationRedirectUrl;

  VerificationFromOauthError? error;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnterpriseAccountVerification &&
          other.object == object &&
          other.status == status &&
          other.strategy == strategy &&
          other.attempts == attempts &&
          other.expireAt == expireAt &&
          other.verifiedAtClient == verifiedAtClient &&
          other.externalVerificationRedirectUrl ==
              externalVerificationRedirectUrl &&
          other.error == error;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object == null ? 0 : object!.hashCode) +
      (status.hashCode) +
      (strategy.hashCode) +
      (attempts == null ? 0 : attempts!.hashCode) +
      (expireAt.hashCode) +
      (verifiedAtClient == null ? 0 : verifiedAtClient!.hashCode) +
      (externalVerificationRedirectUrl == null
          ? 0
          : externalVerificationRedirectUrl!.hashCode) +
      (error == null ? 0 : error!.hashCode);

  @override
  String toString() =>
      'EnterpriseAccountVerification[object=$object, status=$status, strategy=$strategy, attempts=$attempts, expireAt=$expireAt, verifiedAtClient=$verifiedAtClient, externalVerificationRedirectUrl=$externalVerificationRedirectUrl, error=$error]';

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
    json[r'expire_at'] = this.expireAt;
    if (this.verifiedAtClient != null) {
      json[r'verified_at_client'] = this.verifiedAtClient;
    } else {
      json[r'verified_at_client'] = null;
    }
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
    return json;
  }

  /// Returns a new [EnterpriseAccountVerification] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EnterpriseAccountVerification? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "EnterpriseAccountVerification[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "EnterpriseAccountVerification[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return EnterpriseAccountVerification(
        object:
            EnterpriseAccountVerificationObjectEnum.fromJson(json[r'object']),
        status:
            EnterpriseAccountVerificationStatusEnum.fromJson(json[r'status'])!,
        strategy: mapValueOfType<String>(json, r'strategy')!,
        attempts: mapValueOfType<int>(json, r'attempts'),
        expireAt: mapValueOfType<int>(json, r'expire_at')!,
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
        externalVerificationRedirectUrl:
            mapValueOfType<String>(json, r'external_verification_redirect_url'),
        error: VerificationFromOauthError.fromJson(json[r'error']),
      );
    }
    return null;
  }

  static List<EnterpriseAccountVerification> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <EnterpriseAccountVerification>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EnterpriseAccountVerification.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EnterpriseAccountVerification> mapFromJson(dynamic json) {
    final map = <String, EnterpriseAccountVerification>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EnterpriseAccountVerification.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EnterpriseAccountVerification-objects as value to a dart map
  static Map<String, List<EnterpriseAccountVerification>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<EnterpriseAccountVerification>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EnterpriseAccountVerification.listFromJson(
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

class EnterpriseAccountVerificationObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const EnterpriseAccountVerificationObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verificationOauth =
      EnterpriseAccountVerificationObjectEnum._(r'verification_oauth');

  /// List of all possible values in this [enum][EnterpriseAccountVerificationObjectEnum].
  static const values = <EnterpriseAccountVerificationObjectEnum>[
    verificationOauth,
  ];

  static EnterpriseAccountVerificationObjectEnum? fromJson(dynamic value) =>
      EnterpriseAccountVerificationObjectEnumTypeTransformer().decode(value);

  static List<EnterpriseAccountVerificationObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <EnterpriseAccountVerificationObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EnterpriseAccountVerificationObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [EnterpriseAccountVerificationObjectEnum] to String,
/// and [decode] dynamic data back to [EnterpriseAccountVerificationObjectEnum].
class EnterpriseAccountVerificationObjectEnumTypeTransformer {
  factory EnterpriseAccountVerificationObjectEnumTypeTransformer() =>
      _instance ??=
          const EnterpriseAccountVerificationObjectEnumTypeTransformer._();

  const EnterpriseAccountVerificationObjectEnumTypeTransformer._();

  String encode(EnterpriseAccountVerificationObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a EnterpriseAccountVerificationObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  EnterpriseAccountVerificationObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verification_oauth':
          return EnterpriseAccountVerificationObjectEnum.verificationOauth;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [EnterpriseAccountVerificationObjectEnumTypeTransformer] instance.
  static EnterpriseAccountVerificationObjectEnumTypeTransformer? _instance;
}

class EnterpriseAccountVerificationStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const EnterpriseAccountVerificationStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const unverified =
      EnterpriseAccountVerificationStatusEnum._(r'unverified');
  static const verified =
      EnterpriseAccountVerificationStatusEnum._(r'verified');
  static const failed = EnterpriseAccountVerificationStatusEnum._(r'failed');
  static const expired = EnterpriseAccountVerificationStatusEnum._(r'expired');
  static const transferable =
      EnterpriseAccountVerificationStatusEnum._(r'transferable');

  /// List of all possible values in this [enum][EnterpriseAccountVerificationStatusEnum].
  static const values = <EnterpriseAccountVerificationStatusEnum>[
    unverified,
    verified,
    failed,
    expired,
    transferable,
  ];

  static EnterpriseAccountVerificationStatusEnum? fromJson(dynamic value) =>
      EnterpriseAccountVerificationStatusEnumTypeTransformer().decode(value);

  static List<EnterpriseAccountVerificationStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <EnterpriseAccountVerificationStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EnterpriseAccountVerificationStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [EnterpriseAccountVerificationStatusEnum] to String,
/// and [decode] dynamic data back to [EnterpriseAccountVerificationStatusEnum].
class EnterpriseAccountVerificationStatusEnumTypeTransformer {
  factory EnterpriseAccountVerificationStatusEnumTypeTransformer() =>
      _instance ??=
          const EnterpriseAccountVerificationStatusEnumTypeTransformer._();

  const EnterpriseAccountVerificationStatusEnumTypeTransformer._();

  String encode(EnterpriseAccountVerificationStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a EnterpriseAccountVerificationStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  EnterpriseAccountVerificationStatusEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'unverified':
          return EnterpriseAccountVerificationStatusEnum.unverified;
        case r'verified':
          return EnterpriseAccountVerificationStatusEnum.verified;
        case r'failed':
          return EnterpriseAccountVerificationStatusEnum.failed;
        case r'expired':
          return EnterpriseAccountVerificationStatusEnum.expired;
        case r'transferable':
          return EnterpriseAccountVerificationStatusEnum.transferable;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [EnterpriseAccountVerificationStatusEnumTypeTransformer] instance.
  static EnterpriseAccountVerificationStatusEnumTypeTransformer? _instance;
}
