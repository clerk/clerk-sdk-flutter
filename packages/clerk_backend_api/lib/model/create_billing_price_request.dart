//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateBillingPriceRequest {
  /// Returns a new [CreateBillingPriceRequest] instance.
  CreateBillingPriceRequest({
    required this.planId,
    this.currency = 'USD',
    required this.amount,
    this.annualMonthlyAmount,
    this.description,
  });

  /// The ID of the plan this price belongs to.
  String planId;

  /// The currency code (e.g., \"USD\"). Defaults to USD.
  String currency;

  /// The amount in cents for the price. Must be at least $1 (100 cents).
  int amount;

  /// The monthly amount in cents when billed annually. Optional.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? annualMonthlyAmount;

  /// An optional description for this custom price.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateBillingPriceRequest &&
          other.planId == planId &&
          other.currency == currency &&
          other.amount == amount &&
          other.annualMonthlyAmount == annualMonthlyAmount &&
          other.description == description;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (planId.hashCode) +
      (currency.hashCode) +
      (amount.hashCode) +
      (annualMonthlyAmount == null ? 0 : annualMonthlyAmount!.hashCode) +
      (description == null ? 0 : description!.hashCode);

  @override
  String toString() =>
      'CreateBillingPriceRequest[planId=$planId, currency=$currency, amount=$amount, annualMonthlyAmount=$annualMonthlyAmount, description=$description]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'plan_id'] = this.planId;
    json[r'currency'] = this.currency;
    json[r'amount'] = this.amount;
    if (this.annualMonthlyAmount != null) {
      json[r'annual_monthly_amount'] = this.annualMonthlyAmount;
    } else {
      json[r'annual_monthly_amount'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    return json;
  }

  /// Returns a new [CreateBillingPriceRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateBillingPriceRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateBillingPriceRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateBillingPriceRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateBillingPriceRequest(
        planId: mapValueOfType<String>(json, r'plan_id')!,
        currency: mapValueOfType<String>(json, r'currency') ?? 'USD',
        amount: mapValueOfType<int>(json, r'amount')!,
        annualMonthlyAmount:
            mapValueOfType<int>(json, r'annual_monthly_amount'),
        description: mapValueOfType<String>(json, r'description'),
      );
    }
    return null;
  }

  static List<CreateBillingPriceRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateBillingPriceRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateBillingPriceRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateBillingPriceRequest> mapFromJson(dynamic json) {
    final map = <String, CreateBillingPriceRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateBillingPriceRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateBillingPriceRequest-objects as value to a dart map
  static Map<String, List<CreateBillingPriceRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateBillingPriceRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateBillingPriceRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'plan_id',
    'amount',
  };
}
