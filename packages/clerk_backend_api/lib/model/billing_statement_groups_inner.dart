//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BillingStatementGroupsInner {
  /// Returns a new [BillingStatementGroupsInner] instance.
  BillingStatementGroupsInner({
    required this.object,
    required this.timestamp,
    this.items = const [],
  });

  /// String representing the object's type. Objects of the same type share the same value.
  BillingStatementGroupsInnerObjectEnum object;

  /// Unix timestamp (in milliseconds) of the date the group's payment attempts were created
  int timestamp;

  /// The payment attempts included in the group
  List<BillingPaymentAttempt> items;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillingStatementGroupsInner &&
          other.object == object &&
          other.timestamp == timestamp &&
          _deepEquality.equals(other.items, items);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) + (timestamp.hashCode) + (items.hashCode);

  @override
  String toString() =>
      'BillingStatementGroupsInner[object=$object, timestamp=$timestamp, items=$items]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'timestamp'] = this.timestamp;
    json[r'items'] = this.items;
    return json;
  }

  /// Returns a new [BillingStatementGroupsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BillingStatementGroupsInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "BillingStatementGroupsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "BillingStatementGroupsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return BillingStatementGroupsInner(
        object:
            BillingStatementGroupsInnerObjectEnum.fromJson(json[r'object'])!,
        timestamp: mapValueOfType<int>(json, r'timestamp')!,
        items: BillingPaymentAttempt.listFromJson(json[r'items']),
      );
    }
    return null;
  }

  static List<BillingStatementGroupsInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BillingStatementGroupsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BillingStatementGroupsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BillingStatementGroupsInner> mapFromJson(dynamic json) {
    final map = <String, BillingStatementGroupsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BillingStatementGroupsInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BillingStatementGroupsInner-objects as value to a dart map
  static Map<String, List<BillingStatementGroupsInner>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<BillingStatementGroupsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BillingStatementGroupsInner.listFromJson(
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
    'timestamp',
    'items',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class BillingStatementGroupsInnerObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const BillingStatementGroupsInnerObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const commerceStatementGroup =
      BillingStatementGroupsInnerObjectEnum._(r'commerce_statement_group');

  /// List of all possible values in this [enum][BillingStatementGroupsInnerObjectEnum].
  static const values = <BillingStatementGroupsInnerObjectEnum>[
    commerceStatementGroup,
  ];

  static BillingStatementGroupsInnerObjectEnum? fromJson(dynamic value) =>
      BillingStatementGroupsInnerObjectEnumTypeTransformer().decode(value);

  static List<BillingStatementGroupsInnerObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BillingStatementGroupsInnerObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BillingStatementGroupsInnerObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BillingStatementGroupsInnerObjectEnum] to String,
/// and [decode] dynamic data back to [BillingStatementGroupsInnerObjectEnum].
class BillingStatementGroupsInnerObjectEnumTypeTransformer {
  factory BillingStatementGroupsInnerObjectEnumTypeTransformer() =>
      _instance ??=
          const BillingStatementGroupsInnerObjectEnumTypeTransformer._();

  const BillingStatementGroupsInnerObjectEnumTypeTransformer._();

  String encode(BillingStatementGroupsInnerObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a BillingStatementGroupsInnerObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BillingStatementGroupsInnerObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'commerce_statement_group':
          return BillingStatementGroupsInnerObjectEnum.commerceStatementGroup;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [BillingStatementGroupsInnerObjectEnumTypeTransformer] instance.
  static BillingStatementGroupsInnerObjectEnumTypeTransformer? _instance;
}
