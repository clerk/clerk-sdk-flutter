//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CommercePlan {
  /// Returns a new [CommercePlan] instance.
  CommercePlan({
    required this.object,
    required this.id,
    required this.name,
    required this.fee,
    required this.annualMonthlyFee,
    required this.annualFee,
    required this.description,
    required this.productId,
    required this.isDefault,
    required this.isRecurring,
    required this.publiclyVisible,
    required this.hasBaseFee,
    required this.forPayerType,
    required this.slug,
    required this.avatarUrl,
    this.features = const [],
    required this.freeTrialEnabled,
    required this.freeTrialDays,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  CommercePlanObjectEnum object;

  /// Unique identifier for the plan.
  String id;

  /// The name of the plan.
  String name;

  CommerceMoneyResponse fee;

  CommerceMoneyResponse? annualMonthlyFee;

  CommerceMoneyResponse? annualFee;

  /// The description of the plan.
  String? description;

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

  /// The payer type this plan is designed for.
  String forPayerType;

  /// The URL-friendly slug for the plan.
  String slug;

  /// The URL of the plan's avatar image.
  String? avatarUrl;

  /// The features included in this plan.
  List<FeatureResponse> features;

  /// Whether free trial is enabled for this plan.
  bool freeTrialEnabled;

  /// Number of free trial days for this plan.
  int? freeTrialDays;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommercePlan &&
          other.object == object &&
          other.id == id &&
          other.name == name &&
          other.fee == fee &&
          other.annualMonthlyFee == annualMonthlyFee &&
          other.annualFee == annualFee &&
          other.description == description &&
          other.productId == productId &&
          other.isDefault == isDefault &&
          other.isRecurring == isRecurring &&
          other.publiclyVisible == publiclyVisible &&
          other.hasBaseFee == hasBaseFee &&
          other.forPayerType == forPayerType &&
          other.slug == slug &&
          other.avatarUrl == avatarUrl &&
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
      (annualMonthlyFee == null ? 0 : annualMonthlyFee!.hashCode) +
      (annualFee == null ? 0 : annualFee!.hashCode) +
      (description == null ? 0 : description!.hashCode) +
      (productId.hashCode) +
      (isDefault.hashCode) +
      (isRecurring.hashCode) +
      (publiclyVisible.hashCode) +
      (hasBaseFee.hashCode) +
      (forPayerType.hashCode) +
      (slug.hashCode) +
      (avatarUrl == null ? 0 : avatarUrl!.hashCode) +
      (features.hashCode) +
      (freeTrialEnabled.hashCode) +
      (freeTrialDays == null ? 0 : freeTrialDays!.hashCode);

  @override
  String toString() =>
      'CommercePlan[object=$object, id=$id, name=$name, fee=$fee, annualMonthlyFee=$annualMonthlyFee, annualFee=$annualFee, description=$description, productId=$productId, isDefault=$isDefault, isRecurring=$isRecurring, publiclyVisible=$publiclyVisible, hasBaseFee=$hasBaseFee, forPayerType=$forPayerType, slug=$slug, avatarUrl=$avatarUrl, features=$features, freeTrialEnabled=$freeTrialEnabled, freeTrialDays=$freeTrialDays]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    json[r'fee'] = this.fee;
    if (this.annualMonthlyFee != null) {
      json[r'annual_monthly_fee'] = this.annualMonthlyFee;
    } else {
      json[r'annual_monthly_fee'] = null;
    }
    if (this.annualFee != null) {
      json[r'annual_fee'] = this.annualFee;
    } else {
      json[r'annual_fee'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    json[r'product_id'] = this.productId;
    json[r'is_default'] = this.isDefault;
    json[r'is_recurring'] = this.isRecurring;
    json[r'publicly_visible'] = this.publiclyVisible;
    json[r'has_base_fee'] = this.hasBaseFee;
    json[r'for_payer_type'] = this.forPayerType;
    json[r'slug'] = this.slug;
    if (this.avatarUrl != null) {
      json[r'avatar_url'] = this.avatarUrl;
    } else {
      json[r'avatar_url'] = null;
    }
    json[r'features'] = this.features;
    json[r'free_trial_enabled'] = this.freeTrialEnabled;
    if (this.freeTrialDays != null) {
      json[r'free_trial_days'] = this.freeTrialDays;
    } else {
      json[r'free_trial_days'] = null;
    }
    return json;
  }

  /// Returns a new [CommercePlan] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CommercePlan? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CommercePlan[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CommercePlan[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CommercePlan(
        object: CommercePlanObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        fee: CommerceMoneyResponse.fromJson(json[r'fee'])!,
        annualMonthlyFee:
            CommerceMoneyResponse.fromJson(json[r'annual_monthly_fee']),
        annualFee: CommerceMoneyResponse.fromJson(json[r'annual_fee']),
        description: mapValueOfType<String>(json, r'description'),
        productId: mapValueOfType<String>(json, r'product_id')!,
        isDefault: mapValueOfType<bool>(json, r'is_default')!,
        isRecurring: mapValueOfType<bool>(json, r'is_recurring')!,
        publiclyVisible: mapValueOfType<bool>(json, r'publicly_visible')!,
        hasBaseFee: mapValueOfType<bool>(json, r'has_base_fee')!,
        forPayerType: mapValueOfType<String>(json, r'for_payer_type')!,
        slug: mapValueOfType<String>(json, r'slug')!,
        avatarUrl: mapValueOfType<String>(json, r'avatar_url'),
        features: FeatureResponse.listFromJson(json[r'features']),
        freeTrialEnabled: mapValueOfType<bool>(json, r'free_trial_enabled')!,
        freeTrialDays: mapValueOfType<int>(json, r'free_trial_days'),
      );
    }
    return null;
  }

  static List<CommercePlan> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommercePlan>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommercePlan.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CommercePlan> mapFromJson(dynamic json) {
    final map = <String, CommercePlan>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CommercePlan.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CommercePlan-objects as value to a dart map
  static Map<String, List<CommercePlan>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CommercePlan>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CommercePlan.listFromJson(
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
    'description',
    'product_id',
    'is_default',
    'is_recurring',
    'publicly_visible',
    'has_base_fee',
    'for_payer_type',
    'slug',
    'avatar_url',
    'free_trial_enabled',
    'free_trial_days',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class CommercePlanObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const CommercePlanObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const commercePlan = CommercePlanObjectEnum._(r'commerce_plan');

  /// List of all possible values in this [enum][CommercePlanObjectEnum].
  static const values = <CommercePlanObjectEnum>[
    commercePlan,
  ];

  static CommercePlanObjectEnum? fromJson(dynamic value) =>
      CommercePlanObjectEnumTypeTransformer().decode(value);

  static List<CommercePlanObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommercePlanObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommercePlanObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CommercePlanObjectEnum] to String,
/// and [decode] dynamic data back to [CommercePlanObjectEnum].
class CommercePlanObjectEnumTypeTransformer {
  factory CommercePlanObjectEnumTypeTransformer() =>
      _instance ??= const CommercePlanObjectEnumTypeTransformer._();

  const CommercePlanObjectEnumTypeTransformer._();

  String encode(CommercePlanObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CommercePlanObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CommercePlanObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'commerce_plan':
          return CommercePlanObjectEnum.commercePlan;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CommercePlanObjectEnumTypeTransformer] instance.
  static CommercePlanObjectEnumTypeTransformer? _instance;
}
