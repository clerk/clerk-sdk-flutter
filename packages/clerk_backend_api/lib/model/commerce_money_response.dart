//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CommerceMoneyResponse {
  /// Returns a new [CommerceMoneyResponse] instance.
  CommerceMoneyResponse({
    required this.amount,
    required this.amountFormatted,
    required this.currency,
    required this.currencySymbol,
  });

  /// The amount in cents.
  int amount;

  /// The formatted amount as a string (e.g., \"$49.99\").
  String amountFormatted;

  /// The currency code (e.g., \"USD\").
  String currency;

  /// The currency symbol (e.g., \"$\").
  String currencySymbol;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommerceMoneyResponse &&
          other.amount == amount &&
          other.amountFormatted == amountFormatted &&
          other.currency == currency &&
          other.currencySymbol == currencySymbol;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (amount.hashCode) +
      (amountFormatted.hashCode) +
      (currency.hashCode) +
      (currencySymbol.hashCode);

  @override
  String toString() =>
      'CommerceMoneyResponse[amount=$amount, amountFormatted=$amountFormatted, currency=$currency, currencySymbol=$currencySymbol]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'amount'] = this.amount;
    json[r'amount_formatted'] = this.amountFormatted;
    json[r'currency'] = this.currency;
    json[r'currency_symbol'] = this.currencySymbol;
    return json;
  }

  /// Returns a new [CommerceMoneyResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CommerceMoneyResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CommerceMoneyResponse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CommerceMoneyResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CommerceMoneyResponse(
        amount: mapValueOfType<int>(json, r'amount')!,
        amountFormatted: mapValueOfType<String>(json, r'amount_formatted')!,
        currency: mapValueOfType<String>(json, r'currency')!,
        currencySymbol: mapValueOfType<String>(json, r'currency_symbol')!,
      );
    }
    return null;
  }

  static List<CommerceMoneyResponse> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommerceMoneyResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommerceMoneyResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CommerceMoneyResponse> mapFromJson(dynamic json) {
    final map = <String, CommerceMoneyResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CommerceMoneyResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CommerceMoneyResponse-objects as value to a dart map
  static Map<String, List<CommerceMoneyResponse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CommerceMoneyResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CommerceMoneyResponse.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'amount',
    'amount_formatted',
    'currency',
    'currency_symbol',
  };
}
