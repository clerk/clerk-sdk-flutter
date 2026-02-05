//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CommerceSubscriptionItemNextPaymentResponse {
  /// Returns a new [CommerceSubscriptionItemNextPaymentResponse] instance.
  CommerceSubscriptionItemNextPaymentResponse({
    this.amount,
    this.date,
  });

  /// Amount for the next payment.
  CommerceMoneyResponse? amount;

  /// Unix timestamp (in milliseconds) for the next payment date.
  int? date;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommerceSubscriptionItemNextPaymentResponse &&
          other.amount == amount &&
          other.date == date;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (amount == null ? 0 : amount!.hashCode) +
      (date == null ? 0 : date!.hashCode);

  @override
  String toString() =>
      'CommerceSubscriptionItemNextPaymentResponse[amount=$amount, date=$date]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.amount != null) {
      json[r'amount'] = this.amount;
    } else {
      json[r'amount'] = null;
    }
    if (this.date != null) {
      json[r'date'] = this.date;
    } else {
      json[r'date'] = null;
    }
    return json;
  }

  /// Returns a new [CommerceSubscriptionItemNextPaymentResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CommerceSubscriptionItemNextPaymentResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CommerceSubscriptionItemNextPaymentResponse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CommerceSubscriptionItemNextPaymentResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CommerceSubscriptionItemNextPaymentResponse(
        amount: CommerceMoneyResponse.fromJson(json[r'amount']),
        date: mapValueOfType<int>(json, r'date'),
      );
    }
    return null;
  }

  static List<CommerceSubscriptionItemNextPaymentResponse> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommerceSubscriptionItemNextPaymentResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommerceSubscriptionItemNextPaymentResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CommerceSubscriptionItemNextPaymentResponse> mapFromJson(
      dynamic json) {
    final map = <String, CommerceSubscriptionItemNextPaymentResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            CommerceSubscriptionItemNextPaymentResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CommerceSubscriptionItemNextPaymentResponse-objects as value to a dart map
  static Map<String, List<CommerceSubscriptionItemNextPaymentResponse>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CommerceSubscriptionItemNextPaymentResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            CommerceSubscriptionItemNextPaymentResponse.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
