//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerificationEmailLink {
  /// Returns a new [VerificationEmailLink] instance.
  VerificationEmailLink({
    this.object,
    required this.status,
    required this.strategy,
    required this.attempts,
    required this.expireAt,
    this.verifiedAtClient,
  });

  VerificationEmailLinkObjectEnum? object;

  VerificationEmailLinkStatusEnum status;

  VerificationEmailLinkStrategyEnum strategy;

  int? attempts;

  int? expireAt;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerificationEmailLink &&
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
      'VerificationEmailLink[object=$object, status=$status, strategy=$strategy, attempts=$attempts, expireAt=$expireAt, verifiedAtClient=$verifiedAtClient]';

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

  /// Returns a new [VerificationEmailLink] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VerificationEmailLink? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "VerificationEmailLink[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "VerificationEmailLink[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VerificationEmailLink(
        object: VerificationEmailLinkObjectEnum.fromJson(json[r'object']),
        status: VerificationEmailLinkStatusEnum.fromJson(json[r'status'])!,
        strategy:
            VerificationEmailLinkStrategyEnum.fromJson(json[r'strategy'])!,
        attempts: mapValueOfType<int>(json, r'attempts'),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<VerificationEmailLink> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationEmailLink>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationEmailLink.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VerificationEmailLink> mapFromJson(dynamic json) {
    final map = <String, VerificationEmailLink>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerificationEmailLink.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VerificationEmailLink-objects as value to a dart map
  static Map<String, List<VerificationEmailLink>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<VerificationEmailLink>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VerificationEmailLink.listFromJson(
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

class VerificationEmailLinkObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationEmailLinkObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verificationEmailLink =
      VerificationEmailLinkObjectEnum._(r'verification_email_link');

  /// List of all possible values in this [enum][VerificationEmailLinkObjectEnum].
  static const values = <VerificationEmailLinkObjectEnum>[
    verificationEmailLink,
  ];

  static VerificationEmailLinkObjectEnum? fromJson(dynamic value) =>
      VerificationEmailLinkObjectEnumTypeTransformer().decode(value);

  static List<VerificationEmailLinkObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationEmailLinkObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationEmailLinkObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationEmailLinkObjectEnum] to String,
/// and [decode] dynamic data back to [VerificationEmailLinkObjectEnum].
class VerificationEmailLinkObjectEnumTypeTransformer {
  factory VerificationEmailLinkObjectEnumTypeTransformer() =>
      _instance ??= const VerificationEmailLinkObjectEnumTypeTransformer._();

  const VerificationEmailLinkObjectEnumTypeTransformer._();

  String encode(VerificationEmailLinkObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationEmailLinkObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationEmailLinkObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verification_email_link':
          return VerificationEmailLinkObjectEnum.verificationEmailLink;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationEmailLinkObjectEnumTypeTransformer] instance.
  static VerificationEmailLinkObjectEnumTypeTransformer? _instance;
}

class VerificationEmailLinkStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationEmailLinkStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const unverified = VerificationEmailLinkStatusEnum._(r'unverified');
  static const verified = VerificationEmailLinkStatusEnum._(r'verified');
  static const failed = VerificationEmailLinkStatusEnum._(r'failed');
  static const expired = VerificationEmailLinkStatusEnum._(r'expired');

  /// List of all possible values in this [enum][VerificationEmailLinkStatusEnum].
  static const values = <VerificationEmailLinkStatusEnum>[
    unverified,
    verified,
    failed,
    expired,
  ];

  static VerificationEmailLinkStatusEnum? fromJson(dynamic value) =>
      VerificationEmailLinkStatusEnumTypeTransformer().decode(value);

  static List<VerificationEmailLinkStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationEmailLinkStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationEmailLinkStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationEmailLinkStatusEnum] to String,
/// and [decode] dynamic data back to [VerificationEmailLinkStatusEnum].
class VerificationEmailLinkStatusEnumTypeTransformer {
  factory VerificationEmailLinkStatusEnumTypeTransformer() =>
      _instance ??= const VerificationEmailLinkStatusEnumTypeTransformer._();

  const VerificationEmailLinkStatusEnumTypeTransformer._();

  String encode(VerificationEmailLinkStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationEmailLinkStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationEmailLinkStatusEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'unverified':
          return VerificationEmailLinkStatusEnum.unverified;
        case r'verified':
          return VerificationEmailLinkStatusEnum.verified;
        case r'failed':
          return VerificationEmailLinkStatusEnum.failed;
        case r'expired':
          return VerificationEmailLinkStatusEnum.expired;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationEmailLinkStatusEnumTypeTransformer] instance.
  static VerificationEmailLinkStatusEnumTypeTransformer? _instance;
}

class VerificationEmailLinkStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationEmailLinkStrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const emailLink = VerificationEmailLinkStrategyEnum._(r'email_link');

  /// List of all possible values in this [enum][VerificationEmailLinkStrategyEnum].
  static const values = <VerificationEmailLinkStrategyEnum>[
    emailLink,
  ];

  static VerificationEmailLinkStrategyEnum? fromJson(dynamic value) =>
      VerificationEmailLinkStrategyEnumTypeTransformer().decode(value);

  static List<VerificationEmailLinkStrategyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationEmailLinkStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationEmailLinkStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationEmailLinkStrategyEnum] to String,
/// and [decode] dynamic data back to [VerificationEmailLinkStrategyEnum].
class VerificationEmailLinkStrategyEnumTypeTransformer {
  factory VerificationEmailLinkStrategyEnumTypeTransformer() =>
      _instance ??= const VerificationEmailLinkStrategyEnumTypeTransformer._();

  const VerificationEmailLinkStrategyEnumTypeTransformer._();

  String encode(VerificationEmailLinkStrategyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationEmailLinkStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationEmailLinkStrategyEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'email_link':
          return VerificationEmailLinkStrategyEnum.emailLink;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationEmailLinkStrategyEnumTypeTransformer] instance.
  static VerificationEmailLinkStrategyEnumTypeTransformer? _instance;
}
