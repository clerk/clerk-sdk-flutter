//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CommerceSubscriptionNextPayment {
  /// Returns a new [CommerceSubscriptionNextPayment] instance.
  CommerceSubscriptionNextPayment({
    required this.date,
    required this.amount,
  });

  /// Unix timestamp (milliseconds) of the next payment date.
  int date;

  CommerceMoneyResponse amount;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommerceSubscriptionNextPayment &&
          other.date == date &&
          other.amount == amount;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (date.hashCode) + (amount.hashCode);

  @override
  String toString() =>
      'CommerceSubscriptionNextPayment[date=$date, amount=$amount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'date'] = this.date;
    json[r'amount'] = this.amount;
    return json;
  }

  /// Returns a new [CommerceSubscriptionNextPayment] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CommerceSubscriptionNextPayment? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CommerceSubscriptionNextPayment[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CommerceSubscriptionNextPayment[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CommerceSubscriptionNextPayment(
        date: mapValueOfType<int>(json, r'date')!,
        amount: CommerceMoneyResponse.fromJson(json[r'amount'])!,
      );
    }
    return null;
  }

  static List<CommerceSubscriptionNextPayment> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommerceSubscriptionNextPayment>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommerceSubscriptionNextPayment.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CommerceSubscriptionNextPayment> mapFromJson(
      dynamic json) {
    final map = <String, CommerceSubscriptionNextPayment>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CommerceSubscriptionNextPayment.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CommerceSubscriptionNextPayment-objects as value to a dart map
  static Map<String, List<CommerceSubscriptionNextPayment>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CommerceSubscriptionNextPayment>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CommerceSubscriptionNextPayment.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'date',
    'amount',
  };
}
