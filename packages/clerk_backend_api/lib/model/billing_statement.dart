//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BillingStatement {
  /// Returns a new [BillingStatement] instance.
  BillingStatement({
    required this.object,
    required this.id,
    required this.instanceId,
    required this.timestamp,
    required this.payer,
    required this.status,
    required this.totals,
    this.groups = const [],
  });

  /// String representing the object's type. Objects of the same type share the same value.
  BillingStatementObjectEnum object;

  /// Unique identifier for the billing statement.
  String id;

  /// The ID of the instance this statement belongs to.
  String instanceId;

  /// Unix timestamp (in milliseconds) when the statement was created.
  int timestamp;

  CommercePayerResponse payer;

  /// The current status of the statement.
  BillingStatementStatusEnum status;

  BillingStatementTotals totals;

  /// Array of statement groups.
  List<BillingStatementGroupsInner> groups;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillingStatement &&
          other.object == object &&
          other.id == id &&
          other.instanceId == instanceId &&
          other.timestamp == timestamp &&
          other.payer == payer &&
          other.status == status &&
          other.totals == totals &&
          _deepEquality.equals(other.groups, groups);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (instanceId.hashCode) +
      (timestamp.hashCode) +
      (payer.hashCode) +
      (status.hashCode) +
      (totals.hashCode) +
      (groups.hashCode);

  @override
  String toString() =>
      'BillingStatement[object=$object, id=$id, instanceId=$instanceId, timestamp=$timestamp, payer=$payer, status=$status, totals=$totals, groups=$groups]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'instance_id'] = this.instanceId;
    json[r'timestamp'] = this.timestamp;
    json[r'payer'] = this.payer;
    json[r'status'] = this.status;
    json[r'totals'] = this.totals;
    json[r'groups'] = this.groups;
    return json;
  }

  /// Returns a new [BillingStatement] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BillingStatement? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "BillingStatement[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "BillingStatement[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return BillingStatement(
        object: BillingStatementObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        instanceId: mapValueOfType<String>(json, r'instance_id')!,
        timestamp: mapValueOfType<int>(json, r'timestamp')!,
        payer: CommercePayerResponse.fromJson(json[r'payer'])!,
        status: BillingStatementStatusEnum.fromJson(json[r'status'])!,
        totals: BillingStatementTotals.fromJson(json[r'totals'])!,
        groups: BillingStatementGroupsInner.listFromJson(json[r'groups']),
      );
    }
    return null;
  }

  static List<BillingStatement> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BillingStatement>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BillingStatement.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BillingStatement> mapFromJson(dynamic json) {
    final map = <String, BillingStatement>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BillingStatement.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BillingStatement-objects as value to a dart map
  static Map<String, List<BillingStatement>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<BillingStatement>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BillingStatement.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'object',
    'id',
    'instance_id',
    'timestamp',
    'payer',
    'status',
    'totals',
    'groups',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class BillingStatementObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const BillingStatementObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const commerceStatement =
      BillingStatementObjectEnum._(r'commerce_statement');

  /// List of all possible values in this [enum][BillingStatementObjectEnum].
  static const values = <BillingStatementObjectEnum>[
    commerceStatement,
  ];

  static BillingStatementObjectEnum? fromJson(dynamic value) =>
      BillingStatementObjectEnumTypeTransformer().decode(value);

  static List<BillingStatementObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BillingStatementObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BillingStatementObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BillingStatementObjectEnum] to String,
/// and [decode] dynamic data back to [BillingStatementObjectEnum].
class BillingStatementObjectEnumTypeTransformer {
  factory BillingStatementObjectEnumTypeTransformer() =>
      _instance ??= const BillingStatementObjectEnumTypeTransformer._();

  const BillingStatementObjectEnumTypeTransformer._();

  String encode(BillingStatementObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a BillingStatementObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BillingStatementObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'commerce_statement':
          return BillingStatementObjectEnum.commerceStatement;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [BillingStatementObjectEnumTypeTransformer] instance.
  static BillingStatementObjectEnumTypeTransformer? _instance;
}

/// The current status of the statement.
class BillingStatementStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const BillingStatementStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const open = BillingStatementStatusEnum._(r'open');
  static const closed = BillingStatementStatusEnum._(r'closed');

  /// List of all possible values in this [enum][BillingStatementStatusEnum].
  static const values = <BillingStatementStatusEnum>[
    open,
    closed,
  ];

  static BillingStatementStatusEnum? fromJson(dynamic value) =>
      BillingStatementStatusEnumTypeTransformer().decode(value);

  static List<BillingStatementStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BillingStatementStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BillingStatementStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BillingStatementStatusEnum] to String,
/// and [decode] dynamic data back to [BillingStatementStatusEnum].
class BillingStatementStatusEnumTypeTransformer {
  factory BillingStatementStatusEnumTypeTransformer() =>
      _instance ??= const BillingStatementStatusEnumTypeTransformer._();

  const BillingStatementStatusEnumTypeTransformer._();

  String encode(BillingStatementStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a BillingStatementStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BillingStatementStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'open':
          return BillingStatementStatusEnum.open;
        case r'closed':
          return BillingStatementStatusEnum.closed;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [BillingStatementStatusEnumTypeTransformer] instance.
  static BillingStatementStatusEnumTypeTransformer? _instance;
}
