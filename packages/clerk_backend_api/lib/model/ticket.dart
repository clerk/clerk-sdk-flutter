//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Ticket {
  /// Returns a new [Ticket] instance.
  Ticket({
    required this.status,
    required this.strategy,
    required this.attempts,
    required this.expireAt,
    this.verifiedAtClient,
  });

  TicketStatusEnum status;

  TicketStrategyEnum strategy;

  int? attempts;

  int? expireAt;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Ticket &&
          other.status == status &&
          other.strategy == strategy &&
          other.attempts == attempts &&
          other.expireAt == expireAt &&
          other.verifiedAtClient == verifiedAtClient;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (status.hashCode) +
      (strategy.hashCode) +
      (attempts == null ? 0 : attempts!.hashCode) +
      (expireAt == null ? 0 : expireAt!.hashCode) +
      (verifiedAtClient == null ? 0 : verifiedAtClient!.hashCode);

  @override
  String toString() =>
      'Ticket[status=$status, strategy=$strategy, attempts=$attempts, expireAt=$expireAt, verifiedAtClient=$verifiedAtClient]';

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
    if (this.verifiedAtClient != null) {
      json[r'verified_at_client'] = this.verifiedAtClient;
    } else {
      json[r'verified_at_client'] = null;
    }
    return json;
  }

  /// Returns a new [Ticket] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Ticket? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Ticket[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Ticket[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Ticket(
        status: TicketStatusEnum.fromJson(json[r'status'])!,
        strategy: TicketStrategyEnum.fromJson(json[r'strategy'])!,
        attempts: mapValueOfType<int>(json, r'attempts'),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<Ticket> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Ticket>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Ticket.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Ticket> mapFromJson(dynamic json) {
    final map = <String, Ticket>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Ticket.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Ticket-objects as value to a dart map
  static Map<String, List<Ticket>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Ticket>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Ticket.listFromJson(
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

class TicketStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const TicketStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const unverified = TicketStatusEnum._(r'unverified');
  static const verified = TicketStatusEnum._(r'verified');
  static const expired = TicketStatusEnum._(r'expired');

  /// List of all possible values in this [enum][TicketStatusEnum].
  static const values = <TicketStatusEnum>[
    unverified,
    verified,
    expired,
  ];

  static TicketStatusEnum? fromJson(dynamic value) =>
      TicketStatusEnumTypeTransformer().decode(value);

  static List<TicketStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <TicketStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TicketStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TicketStatusEnum] to String,
/// and [decode] dynamic data back to [TicketStatusEnum].
class TicketStatusEnumTypeTransformer {
  factory TicketStatusEnumTypeTransformer() =>
      _instance ??= const TicketStatusEnumTypeTransformer._();

  const TicketStatusEnumTypeTransformer._();

  String encode(TicketStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a TicketStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TicketStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'unverified':
          return TicketStatusEnum.unverified;
        case r'verified':
          return TicketStatusEnum.verified;
        case r'expired':
          return TicketStatusEnum.expired;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [TicketStatusEnumTypeTransformer] instance.
  static TicketStatusEnumTypeTransformer? _instance;
}

class TicketStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const TicketStrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const ticket = TicketStrategyEnum._(r'ticket');

  /// List of all possible values in this [enum][TicketStrategyEnum].
  static const values = <TicketStrategyEnum>[
    ticket,
  ];

  static TicketStrategyEnum? fromJson(dynamic value) =>
      TicketStrategyEnumTypeTransformer().decode(value);

  static List<TicketStrategyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <TicketStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TicketStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TicketStrategyEnum] to String,
/// and [decode] dynamic data back to [TicketStrategyEnum].
class TicketStrategyEnumTypeTransformer {
  factory TicketStrategyEnumTypeTransformer() =>
      _instance ??= const TicketStrategyEnumTypeTransformer._();

  const TicketStrategyEnumTypeTransformer._();

  String encode(TicketStrategyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a TicketStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TicketStrategyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'ticket':
          return TicketStrategyEnum.ticket;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [TicketStrategyEnumTypeTransformer] instance.
  static TicketStrategyEnumTypeTransformer? _instance;
}
