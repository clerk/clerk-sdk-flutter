//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BillingStatementTotals {
  /// Returns a new [BillingStatementTotals] instance.
  BillingStatementTotals({
    required this.grandTotal,
    required this.subtotal,
    required this.taxTotal,
  });

  CommerceMoneyResponse grandTotal;

  CommerceMoneyResponse subtotal;

  CommerceMoneyResponse taxTotal;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillingStatementTotals &&
          other.grandTotal == grandTotal &&
          other.subtotal == subtotal &&
          other.taxTotal == taxTotal;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (grandTotal.hashCode) + (subtotal.hashCode) + (taxTotal.hashCode);

  @override
  String toString() =>
      'BillingStatementTotals[grandTotal=$grandTotal, subtotal=$subtotal, taxTotal=$taxTotal]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'grand_total'] = this.grandTotal;
    json[r'subtotal'] = this.subtotal;
    json[r'tax_total'] = this.taxTotal;
    return json;
  }

  /// Returns a new [BillingStatementTotals] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BillingStatementTotals? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "BillingStatementTotals[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "BillingStatementTotals[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return BillingStatementTotals(
        grandTotal: CommerceMoneyResponse.fromJson(json[r'grand_total'])!,
        subtotal: CommerceMoneyResponse.fromJson(json[r'subtotal'])!,
        taxTotal: CommerceMoneyResponse.fromJson(json[r'tax_total'])!,
      );
    }
    return null;
  }

  static List<BillingStatementTotals> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BillingStatementTotals>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BillingStatementTotals.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BillingStatementTotals> mapFromJson(dynamic json) {
    final map = <String, BillingStatementTotals>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BillingStatementTotals.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BillingStatementTotals-objects as value to a dart map
  static Map<String, List<BillingStatementTotals>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<BillingStatementTotals>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BillingStatementTotals.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'grand_total',
    'subtotal',
    'tax_total',
  };
}
