//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerificationTicket {
  /// Returns a new [VerificationTicket] instance.
  VerificationTicket({
    this.object,
    required this.status,
    required this.strategy,
    required this.attempts,
    required this.expireAt,
    this.verifiedAtClient,
  });

  VerificationTicketObjectEnum? object;

  VerificationTicketStatusEnum status;

  VerificationTicketStrategyEnum strategy;

  int? attempts;

  int? expireAt;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerificationTicket &&
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
      'VerificationTicket[object=$object, status=$status, strategy=$strategy, attempts=$attempts, expireAt=$expireAt, verifiedAtClient=$verifiedAtClient]';

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

  /// Returns a new [VerificationTicket] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VerificationTicket? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "VerificationTicket[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "VerificationTicket[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VerificationTicket(
        object: VerificationTicketObjectEnum.fromJson(json[r'object']),
        status: VerificationTicketStatusEnum.fromJson(json[r'status'])!,
        strategy: VerificationTicketStrategyEnum.fromJson(json[r'strategy'])!,
        attempts: mapValueOfType<int>(json, r'attempts'),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<VerificationTicket> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationTicket>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationTicket.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VerificationTicket> mapFromJson(dynamic json) {
    final map = <String, VerificationTicket>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerificationTicket.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VerificationTicket-objects as value to a dart map
  static Map<String, List<VerificationTicket>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<VerificationTicket>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VerificationTicket.listFromJson(
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

class VerificationTicketObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationTicketObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verificationTicket =
      VerificationTicketObjectEnum._(r'verification_ticket');

  /// List of all possible values in this [enum][VerificationTicketObjectEnum].
  static const values = <VerificationTicketObjectEnum>[
    verificationTicket,
  ];

  static VerificationTicketObjectEnum? fromJson(dynamic value) =>
      VerificationTicketObjectEnumTypeTransformer().decode(value);

  static List<VerificationTicketObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationTicketObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationTicketObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationTicketObjectEnum] to String,
/// and [decode] dynamic data back to [VerificationTicketObjectEnum].
class VerificationTicketObjectEnumTypeTransformer {
  factory VerificationTicketObjectEnumTypeTransformer() =>
      _instance ??= const VerificationTicketObjectEnumTypeTransformer._();

  const VerificationTicketObjectEnumTypeTransformer._();

  String encode(VerificationTicketObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationTicketObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationTicketObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verification_ticket':
          return VerificationTicketObjectEnum.verificationTicket;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationTicketObjectEnumTypeTransformer] instance.
  static VerificationTicketObjectEnumTypeTransformer? _instance;
}

class VerificationTicketStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationTicketStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const unverified = VerificationTicketStatusEnum._(r'unverified');
  static const verified = VerificationTicketStatusEnum._(r'verified');
  static const expired = VerificationTicketStatusEnum._(r'expired');

  /// List of all possible values in this [enum][VerificationTicketStatusEnum].
  static const values = <VerificationTicketStatusEnum>[
    unverified,
    verified,
    expired,
  ];

  static VerificationTicketStatusEnum? fromJson(dynamic value) =>
      VerificationTicketStatusEnumTypeTransformer().decode(value);

  static List<VerificationTicketStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationTicketStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationTicketStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationTicketStatusEnum] to String,
/// and [decode] dynamic data back to [VerificationTicketStatusEnum].
class VerificationTicketStatusEnumTypeTransformer {
  factory VerificationTicketStatusEnumTypeTransformer() =>
      _instance ??= const VerificationTicketStatusEnumTypeTransformer._();

  const VerificationTicketStatusEnumTypeTransformer._();

  String encode(VerificationTicketStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationTicketStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationTicketStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'unverified':
          return VerificationTicketStatusEnum.unverified;
        case r'verified':
          return VerificationTicketStatusEnum.verified;
        case r'expired':
          return VerificationTicketStatusEnum.expired;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationTicketStatusEnumTypeTransformer] instance.
  static VerificationTicketStatusEnumTypeTransformer? _instance;
}

class VerificationTicketStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const VerificationTicketStrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const ticket = VerificationTicketStrategyEnum._(r'ticket');

  /// List of all possible values in this [enum][VerificationTicketStrategyEnum].
  static const values = <VerificationTicketStrategyEnum>[
    ticket,
  ];

  static VerificationTicketStrategyEnum? fromJson(dynamic value) =>
      VerificationTicketStrategyEnumTypeTransformer().decode(value);

  static List<VerificationTicketStrategyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationTicketStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationTicketStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationTicketStrategyEnum] to String,
/// and [decode] dynamic data back to [VerificationTicketStrategyEnum].
class VerificationTicketStrategyEnumTypeTransformer {
  factory VerificationTicketStrategyEnumTypeTransformer() =>
      _instance ??= const VerificationTicketStrategyEnumTypeTransformer._();

  const VerificationTicketStrategyEnumTypeTransformer._();

  String encode(VerificationTicketStrategyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationTicketStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationTicketStrategyEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'ticket':
          return VerificationTicketStrategyEnum.ticket;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationTicketStrategyEnumTypeTransformer] instance.
  static VerificationTicketStrategyEnumTypeTransformer? _instance;
}
