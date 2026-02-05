//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SchemasCommercePlan {
  /// Returns a new [SchemasCommercePlan] instance.
  SchemasCommercePlan({
    required this.object,
    required this.id,
    required this.name,
    required this.fee,
    required this.annualMonthlyFee,
    required this.annualFee,
    required this.amount,
    required this.amountFormatted,
    required this.annualMonthlyAmount,
    required this.annualMonthlyAmountFormatted,
    required this.annualAmount,
    required this.annualAmountFormatted,
    required this.currencySymbol,
    required this.currency,
    required this.description,
    required this.productId,
    required this.isDefault,
    required this.isRecurring,
    required this.publiclyVisible,
    required this.hasBaseFee,
    this.payerType = const [],
    required this.forPayerType,
    required this.slug,
    required this.avatarUrl,
    this.period,
    this.interval,
    this.features = const [],
    this.freeTrialEnabled,
    this.freeTrialDays,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  SchemasCommercePlanObjectEnum object;

  /// Unique identifier for the commerce plan.
  String id;

  /// The name of the commerce plan.
  String name;

  CommerceMoneyResponse fee;

  CommerceMoneyResponse annualMonthlyFee;

  CommerceMoneyResponse annualFee;

  /// The amount in cents for the plan.
  int amount;

  /// The formatted amount as a string (e.g., \"$49.99\").
  String amountFormatted;

  /// The monthly amount in cents when billed annually.
  int annualMonthlyAmount;

  /// The formatted annual monthly amount as a string.
  String annualMonthlyAmountFormatted;

  /// The total annual amount in cents.
  int annualAmount;

  /// The formatted annual amount as a string.
  String annualAmountFormatted;

  /// The currency symbol (e.g., \"$\").
  String currencySymbol;

  /// The currency code (e.g., \"USD\").
  String currency;

  /// The description of the commerce plan.
  String description;

  /// The ID of the product this plan belongs to.
  String productId;

  /// Whether this is the default plan.
  bool isDefault;

  /// Whether this is a recurring plan.
  bool isRecurring;

  /// Whether this plan is publicly visible.
  bool publiclyVisible;

  /// Whether this plan has a base fee.
  bool hasBaseFee;

  /// The types of payers that can use this plan.
  List<String> payerType;

  /// The payer type this plan is designed for.
  String forPayerType;

  /// The URL-friendly slug for the plan.
  String slug;

  /// The URL of the plan's avatar image.
  String avatarUrl;

  /// The billing period for the plan.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? period;

  /// The billing interval.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? interval;

  /// The features included in this plan.
  List<SchemasFeatureResponse> features;

  /// Whether free trial is enabled for this plan.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? freeTrialEnabled;

  /// Number of free trial days for this plan.
  int? freeTrialDays;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SchemasCommercePlan &&
          other.object == object &&
          other.id == id &&
          other.name == name &&
          other.fee == fee &&
          other.annualMonthlyFee == annualMonthlyFee &&
          other.annualFee == annualFee &&
          other.amount == amount &&
          other.amountFormatted == amountFormatted &&
          other.annualMonthlyAmount == annualMonthlyAmount &&
          other.annualMonthlyAmountFormatted == annualMonthlyAmountFormatted &&
          other.annualAmount == annualAmount &&
          other.annualAmountFormatted == annualAmountFormatted &&
          other.currencySymbol == currencySymbol &&
          other.currency == currency &&
          other.description == description &&
          other.productId == productId &&
          other.isDefault == isDefault &&
          other.isRecurring == isRecurring &&
          other.publiclyVisible == publiclyVisible &&
          other.hasBaseFee == hasBaseFee &&
          _deepEquality.equals(other.payerType, payerType) &&
          other.forPayerType == forPayerType &&
          other.slug == slug &&
          other.avatarUrl == avatarUrl &&
          other.period == period &&
          other.interval == interval &&
          _deepEquality.equals(other.features, features) &&
          other.freeTrialEnabled == freeTrialEnabled &&
          other.freeTrialDays == freeTrialDays;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (name.hashCode) +
      (fee.hashCode) +
      (annualMonthlyFee.hashCode) +
      (annualFee.hashCode) +
      (amount.hashCode) +
      (amountFormatted.hashCode) +
      (annualMonthlyAmount.hashCode) +
      (annualMonthlyAmountFormatted.hashCode) +
      (annualAmount.hashCode) +
      (annualAmountFormatted.hashCode) +
      (currencySymbol.hashCode) +
      (currency.hashCode) +
      (description.hashCode) +
      (productId.hashCode) +
      (isDefault.hashCode) +
      (isRecurring.hashCode) +
      (publiclyVisible.hashCode) +
      (hasBaseFee.hashCode) +
      (payerType.hashCode) +
      (forPayerType.hashCode) +
      (slug.hashCode) +
      (avatarUrl.hashCode) +
      (period == null ? 0 : period!.hashCode) +
      (interval == null ? 0 : interval!.hashCode) +
      (features.hashCode) +
      (freeTrialEnabled == null ? 0 : freeTrialEnabled!.hashCode) +
      (freeTrialDays == null ? 0 : freeTrialDays!.hashCode);

  @override
  String toString() =>
      'SchemasCommercePlan[object=$object, id=$id, name=$name, fee=$fee, annualMonthlyFee=$annualMonthlyFee, annualFee=$annualFee, amount=$amount, amountFormatted=$amountFormatted, annualMonthlyAmount=$annualMonthlyAmount, annualMonthlyAmountFormatted=$annualMonthlyAmountFormatted, annualAmount=$annualAmount, annualAmountFormatted=$annualAmountFormatted, currencySymbol=$currencySymbol, currency=$currency, description=$description, productId=$productId, isDefault=$isDefault, isRecurring=$isRecurring, publiclyVisible=$publiclyVisible, hasBaseFee=$hasBaseFee, payerType=$payerType, forPayerType=$forPayerType, slug=$slug, avatarUrl=$avatarUrl, period=$period, interval=$interval, features=$features, freeTrialEnabled=$freeTrialEnabled, freeTrialDays=$freeTrialDays]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    json[r'fee'] = this.fee;
    json[r'annual_monthly_fee'] = this.annualMonthlyFee;
    json[r'annual_fee'] = this.annualFee;
    json[r'amount'] = this.amount;
    json[r'amount_formatted'] = this.amountFormatted;
    json[r'annual_monthly_amount'] = this.annualMonthlyAmount;
    json[r'annual_monthly_amount_formatted'] =
        this.annualMonthlyAmountFormatted;
    json[r'annual_amount'] = this.annualAmount;
    json[r'annual_amount_formatted'] = this.annualAmountFormatted;
    json[r'currency_symbol'] = this.currencySymbol;
    json[r'currency'] = this.currency;
    json[r'description'] = this.description;
    json[r'product_id'] = this.productId;
    json[r'is_default'] = this.isDefault;
    json[r'is_recurring'] = this.isRecurring;
    json[r'publicly_visible'] = this.publiclyVisible;
    json[r'has_base_fee'] = this.hasBaseFee;
    json[r'payer_type'] = this.payerType;
    json[r'for_payer_type'] = this.forPayerType;
    json[r'slug'] = this.slug;
    json[r'avatar_url'] = this.avatarUrl;
    if (this.period != null) {
      json[r'period'] = this.period;
    } else {
      json[r'period'] = null;
    }
    if (this.interval != null) {
      json[r'interval'] = this.interval;
    } else {
      json[r'interval'] = null;
    }
    json[r'features'] = this.features;
    if (this.freeTrialEnabled != null) {
      json[r'free_trial_enabled'] = this.freeTrialEnabled;
    } else {
      json[r'free_trial_enabled'] = null;
    }
    if (this.freeTrialDays != null) {
      json[r'free_trial_days'] = this.freeTrialDays;
    } else {
      json[r'free_trial_days'] = null;
    }
    return json;
  }

  /// Returns a new [SchemasCommercePlan] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SchemasCommercePlan? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SchemasCommercePlan[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SchemasCommercePlan[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SchemasCommercePlan(
        object: SchemasCommercePlanObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        fee: CommerceMoneyResponse.fromJson(json[r'fee'])!,
        annualMonthlyFee:
            CommerceMoneyResponse.fromJson(json[r'annual_monthly_fee'])!,
        annualFee: CommerceMoneyResponse.fromJson(json[r'annual_fee'])!,
        amount: mapValueOfType<int>(json, r'amount')!,
        amountFormatted: mapValueOfType<String>(json, r'amount_formatted')!,
        annualMonthlyAmount:
            mapValueOfType<int>(json, r'annual_monthly_amount')!,
        annualMonthlyAmountFormatted:
            mapValueOfType<String>(json, r'annual_monthly_amount_formatted')!,
        annualAmount: mapValueOfType<int>(json, r'annual_amount')!,
        annualAmountFormatted:
            mapValueOfType<String>(json, r'annual_amount_formatted')!,
        currencySymbol: mapValueOfType<String>(json, r'currency_symbol')!,
        currency: mapValueOfType<String>(json, r'currency')!,
        description: mapValueOfType<String>(json, r'description')!,
        productId: mapValueOfType<String>(json, r'product_id')!,
        isDefault: mapValueOfType<bool>(json, r'is_default')!,
        isRecurring: mapValueOfType<bool>(json, r'is_recurring')!,
        publiclyVisible: mapValueOfType<bool>(json, r'publicly_visible')!,
        hasBaseFee: mapValueOfType<bool>(json, r'has_base_fee')!,
        payerType: json[r'payer_type'] is Iterable
            ? (json[r'payer_type'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        forPayerType: mapValueOfType<String>(json, r'for_payer_type')!,
        slug: mapValueOfType<String>(json, r'slug')!,
        avatarUrl: mapValueOfType<String>(json, r'avatar_url')!,
        period: mapValueOfType<String>(json, r'period'),
        interval: mapValueOfType<int>(json, r'interval'),
        features: SchemasFeatureResponse.listFromJson(json[r'features']),
        freeTrialEnabled: mapValueOfType<bool>(json, r'free_trial_enabled'),
        freeTrialDays: mapValueOfType<int>(json, r'free_trial_days'),
      );
    }
    return null;
  }

  static List<SchemasCommercePlan> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SchemasCommercePlan>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SchemasCommercePlan.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SchemasCommercePlan> mapFromJson(dynamic json) {
    final map = <String, SchemasCommercePlan>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SchemasCommercePlan.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SchemasCommercePlan-objects as value to a dart map
  static Map<String, List<SchemasCommercePlan>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SchemasCommercePlan>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SchemasCommercePlan.listFromJson(
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
    'name',
    'fee',
    'annual_monthly_fee',
    'annual_fee',
    'amount',
    'amount_formatted',
    'annual_monthly_amount',
    'annual_monthly_amount_formatted',
    'annual_amount',
    'annual_amount_formatted',
    'currency_symbol',
    'currency',
    'description',
    'product_id',
    'is_default',
    'is_recurring',
    'publicly_visible',
    'has_base_fee',
    'payer_type',
    'for_payer_type',
    'slug',
    'avatar_url',
    'features',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class SchemasCommercePlanObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const SchemasCommercePlanObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const commercePlan = SchemasCommercePlanObjectEnum._(r'commerce_plan');

  /// List of all possible values in this [enum][SchemasCommercePlanObjectEnum].
  static const values = <SchemasCommercePlanObjectEnum>[
    commercePlan,
  ];

  static SchemasCommercePlanObjectEnum? fromJson(dynamic value) =>
      SchemasCommercePlanObjectEnumTypeTransformer().decode(value);

  static List<SchemasCommercePlanObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SchemasCommercePlanObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SchemasCommercePlanObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SchemasCommercePlanObjectEnum] to String,
/// and [decode] dynamic data back to [SchemasCommercePlanObjectEnum].
class SchemasCommercePlanObjectEnumTypeTransformer {
  factory SchemasCommercePlanObjectEnumTypeTransformer() =>
      _instance ??= const SchemasCommercePlanObjectEnumTypeTransformer._();

  const SchemasCommercePlanObjectEnumTypeTransformer._();

  String encode(SchemasCommercePlanObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SchemasCommercePlanObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SchemasCommercePlanObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'commerce_plan':
          return SchemasCommercePlanObjectEnum.commercePlan;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SchemasCommercePlanObjectEnumTypeTransformer] instance.
  static SchemasCommercePlanObjectEnumTypeTransformer? _instance;
}
