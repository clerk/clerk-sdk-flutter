//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CommerceSubscriptionCreditResponse {
  /// Returns a new [CommerceSubscriptionCreditResponse] instance.
  CommerceSubscriptionCreditResponse({
    this.amount,
    this.cycleRemainingPercent,
  });

  /// Credit amount.
  CommerceMoneyResponse? amount;

  /// Percentage of the billing cycle remaining.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? cycleRemainingPercent;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommerceSubscriptionCreditResponse &&
          other.amount == amount &&
          other.cycleRemainingPercent == cycleRemainingPercent;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (amount == null ? 0 : amount!.hashCode) +
      (cycleRemainingPercent == null ? 0 : cycleRemainingPercent!.hashCode);

  @override
  String toString() =>
      'CommerceSubscriptionCreditResponse[amount=$amount, cycleRemainingPercent=$cycleRemainingPercent]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.amount != null) {
      json[r'amount'] = this.amount;
    } else {
      json[r'amount'] = null;
    }
    if (this.cycleRemainingPercent != null) {
      json[r'cycle_remaining_percent'] = this.cycleRemainingPercent;
    } else {
      json[r'cycle_remaining_percent'] = null;
    }
    return json;
  }

  /// Returns a new [CommerceSubscriptionCreditResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CommerceSubscriptionCreditResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CommerceSubscriptionCreditResponse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CommerceSubscriptionCreditResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CommerceSubscriptionCreditResponse(
        amount: CommerceMoneyResponse.fromJson(json[r'amount']),
        cycleRemainingPercent:
            mapValueOfType<double>(json, r'cycle_remaining_percent'),
      );
    }
    return null;
  }

  static List<CommerceSubscriptionCreditResponse> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommerceSubscriptionCreditResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommerceSubscriptionCreditResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CommerceSubscriptionCreditResponse> mapFromJson(
      dynamic json) {
    final map = <String, CommerceSubscriptionCreditResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CommerceSubscriptionCreditResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CommerceSubscriptionCreditResponse-objects as value to a dart map
  static Map<String, List<CommerceSubscriptionCreditResponse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CommerceSubscriptionCreditResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CommerceSubscriptionCreditResponse.listFromJson(
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
