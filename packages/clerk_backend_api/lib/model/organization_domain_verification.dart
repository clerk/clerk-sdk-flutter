//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrganizationDomainVerification {
  /// Returns a new [OrganizationDomainVerification] instance.
  OrganizationDomainVerification({
    required this.status,
    required this.strategy,
    required this.attempts,
    required this.expireAt,
  });

  /// Status of the verification. It can be `unverified` or `verified`
  OrganizationDomainVerificationStatusEnum status;

  /// Name of the strategy used to verify the domain
  String strategy;

  /// How many attempts have been made to verify the domain
  int? attempts;

  /// Unix timestamp of when the verification will expire
  int? expireAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrganizationDomainVerification &&
          other.status == status &&
          other.strategy == strategy &&
          other.attempts == attempts &&
          other.expireAt == expireAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (status.hashCode) +
      (strategy.hashCode) +
      (attempts == null ? 0 : attempts!.hashCode) +
      (expireAt == null ? 0 : expireAt!.hashCode);

  @override
  String toString() =>
      'OrganizationDomainVerification[status=$status, strategy=$strategy, attempts=$attempts, expireAt=$expireAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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
    return json;
  }

  /// Returns a new [OrganizationDomainVerification] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OrganizationDomainVerification? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "OrganizationDomainVerification[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "OrganizationDomainVerification[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OrganizationDomainVerification(
        status:
            OrganizationDomainVerificationStatusEnum.fromJson(json[r'status'])!,
        strategy: mapValueOfType<String>(json, r'strategy')!,
        attempts: mapValueOfType<int>(json, r'attempts'),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
      );
    }
    return null;
  }

  static List<OrganizationDomainVerification> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OrganizationDomainVerification>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrganizationDomainVerification.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OrganizationDomainVerification> mapFromJson(dynamic json) {
    final map = <String, OrganizationDomainVerification>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OrganizationDomainVerification.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OrganizationDomainVerification-objects as value to a dart map
  static Map<String, List<OrganizationDomainVerification>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<OrganizationDomainVerification>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OrganizationDomainVerification.listFromJson(
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

/// Status of the verification. It can be `unverified` or `verified`
class OrganizationDomainVerificationStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const OrganizationDomainVerificationStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const unverified =
      OrganizationDomainVerificationStatusEnum._(r'unverified');
  static const verified =
      OrganizationDomainVerificationStatusEnum._(r'verified');

  /// List of all possible values in this [enum][OrganizationDomainVerificationStatusEnum].
  static const values = <OrganizationDomainVerificationStatusEnum>[
    unverified,
    verified,
  ];

  static OrganizationDomainVerificationStatusEnum? fromJson(dynamic value) =>
      OrganizationDomainVerificationStatusEnumTypeTransformer().decode(value);

  static List<OrganizationDomainVerificationStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OrganizationDomainVerificationStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrganizationDomainVerificationStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [OrganizationDomainVerificationStatusEnum] to String,
/// and [decode] dynamic data back to [OrganizationDomainVerificationStatusEnum].
class OrganizationDomainVerificationStatusEnumTypeTransformer {
  factory OrganizationDomainVerificationStatusEnumTypeTransformer() =>
      _instance ??=
          const OrganizationDomainVerificationStatusEnumTypeTransformer._();

  const OrganizationDomainVerificationStatusEnumTypeTransformer._();

  String encode(OrganizationDomainVerificationStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a OrganizationDomainVerificationStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  OrganizationDomainVerificationStatusEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'unverified':
          return OrganizationDomainVerificationStatusEnum.unverified;
        case r'verified':
          return OrganizationDomainVerificationStatusEnum.verified;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [OrganizationDomainVerificationStatusEnumTypeTransformer] instance.
  static OrganizationDomainVerificationStatusEnumTypeTransformer? _instance;
}
