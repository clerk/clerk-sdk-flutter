//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BillingPriceResponse {
  /// Returns a new [BillingPriceResponse] instance.
  BillingPriceResponse({
    required this.object,
    required this.id,
    required this.planId,
    required this.instanceId,
    required this.currency,
    required this.currencySymbol,
    required this.amount,
    required this.annualMonthlyAmount,
    required this.fee,
    required this.annualMonthlyFee,
    this.description,
    required this.createdAt,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  BillingPriceResponseObjectEnum object;

  /// Unique identifier for the price.
  String id;

  /// Unique identifier for the associated plan.
  String planId;

  /// Unique identifier for the instance.
  String instanceId;

  /// The currency code (e.g., \"USD\").
  String currency;

  /// The currency symbol (e.g., \"$\").
  String currencySymbol;

  /// The amount in cents for the price.
  int amount;

  /// The monthly amount in cents when billed annually.
  int annualMonthlyAmount;

  CommerceMoneyResponse fee;

  CommerceMoneyResponse annualMonthlyFee;

  /// The description of the price.
  String? description;

  /// Unix timestamp (milliseconds) of creation.
  int createdAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillingPriceResponse &&
          other.object == object &&
          other.id == id &&
          other.planId == planId &&
          other.instanceId == instanceId &&
          other.currency == currency &&
          other.currencySymbol == currencySymbol &&
          other.amount == amount &&
          other.annualMonthlyAmount == annualMonthlyAmount &&
          other.fee == fee &&
          other.annualMonthlyFee == annualMonthlyFee &&
          other.description == description &&
          other.createdAt == createdAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (planId.hashCode) +
      (instanceId.hashCode) +
      (currency.hashCode) +
      (currencySymbol.hashCode) +
      (amount.hashCode) +
      (annualMonthlyAmount.hashCode) +
      (fee.hashCode) +
      (annualMonthlyFee.hashCode) +
      (description == null ? 0 : description!.hashCode) +
      (createdAt.hashCode);

  @override
  String toString() =>
      'BillingPriceResponse[object=$object, id=$id, planId=$planId, instanceId=$instanceId, currency=$currency, currencySymbol=$currencySymbol, amount=$amount, annualMonthlyAmount=$annualMonthlyAmount, fee=$fee, annualMonthlyFee=$annualMonthlyFee, description=$description, createdAt=$createdAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'plan_id'] = this.planId;
    json[r'instance_id'] = this.instanceId;
    json[r'currency'] = this.currency;
    json[r'currency_symbol'] = this.currencySymbol;
    json[r'amount'] = this.amount;
    json[r'annual_monthly_amount'] = this.annualMonthlyAmount;
    json[r'fee'] = this.fee;
    json[r'annual_monthly_fee'] = this.annualMonthlyFee;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    json[r'created_at'] = this.createdAt;
    return json;
  }

  /// Returns a new [BillingPriceResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BillingPriceResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "BillingPriceResponse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "BillingPriceResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return BillingPriceResponse(
        object: BillingPriceResponseObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        planId: mapValueOfType<String>(json, r'plan_id')!,
        instanceId: mapValueOfType<String>(json, r'instance_id')!,
        currency: mapValueOfType<String>(json, r'currency')!,
        currencySymbol: mapValueOfType<String>(json, r'currency_symbol')!,
        amount: mapValueOfType<int>(json, r'amount')!,
        annualMonthlyAmount:
            mapValueOfType<int>(json, r'annual_monthly_amount')!,
        fee: CommerceMoneyResponse.fromJson(json[r'fee'])!,
        annualMonthlyFee:
            CommerceMoneyResponse.fromJson(json[r'annual_monthly_fee'])!,
        description: mapValueOfType<String>(json, r'description'),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
      );
    }
    return null;
  }

  static List<BillingPriceResponse> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BillingPriceResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BillingPriceResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BillingPriceResponse> mapFromJson(dynamic json) {
    final map = <String, BillingPriceResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BillingPriceResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BillingPriceResponse-objects as value to a dart map
  static Map<String, List<BillingPriceResponse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<BillingPriceResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BillingPriceResponse.listFromJson(
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
    'plan_id',
    'instance_id',
    'currency',
    'currency_symbol',
    'amount',
    'annual_monthly_amount',
    'fee',
    'annual_monthly_fee',
    'created_at',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class BillingPriceResponseObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const BillingPriceResponseObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const commercePrice =
      BillingPriceResponseObjectEnum._(r'commerce_price');

  /// List of all possible values in this [enum][BillingPriceResponseObjectEnum].
  static const values = <BillingPriceResponseObjectEnum>[
    commercePrice,
  ];

  static BillingPriceResponseObjectEnum? fromJson(dynamic value) =>
      BillingPriceResponseObjectEnumTypeTransformer().decode(value);

  static List<BillingPriceResponseObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BillingPriceResponseObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BillingPriceResponseObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BillingPriceResponseObjectEnum] to String,
/// and [decode] dynamic data back to [BillingPriceResponseObjectEnum].
class BillingPriceResponseObjectEnumTypeTransformer {
  factory BillingPriceResponseObjectEnumTypeTransformer() =>
      _instance ??= const BillingPriceResponseObjectEnumTypeTransformer._();

  const BillingPriceResponseObjectEnumTypeTransformer._();

  String encode(BillingPriceResponseObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a BillingPriceResponseObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BillingPriceResponseObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'commerce_price':
          return BillingPriceResponseObjectEnum.commercePrice;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [BillingPriceResponseObjectEnumTypeTransformer] instance.
  static BillingPriceResponseObjectEnumTypeTransformer? _instance;
}
