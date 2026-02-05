//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CommercePriceTransitionDetails {
  /// Returns a new [CommercePriceTransitionDetails] instance.
  CommercePriceTransitionDetails({
    required this.previousPlan,
    required this.previousPrice,
    required this.effectiveAt,
    required this.effectiveMode,
    this.nextBillingDate,
    required this.chargedImmediately,
    this.immediateCharge,
    required this.previousSubscriptionItemStatus,
    required this.previousSubscriptionItemId,
  });

  SchemasCommercePlan previousPlan;

  BillingPriceResponse previousPrice;

  /// Unix timestamp (milliseconds) when the new price takes effect.
  int effectiveAt;

  /// When the new price takes effect.
  CommercePriceTransitionDetailsEffectiveModeEnum effectiveMode;

  /// Unix timestamp (milliseconds) for the next billing date.
  int? nextBillingDate;

  /// Whether an immediate charge was made.
  bool chargedImmediately;

  /// Amount charged immediately, if any.
  CommerceMoneyResponse? immediateCharge;

  /// The status of the previous subscription item after transition.
  CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum
      previousSubscriptionItemStatus;

  /// The ID of the previous subscription item.
  String previousSubscriptionItemId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommercePriceTransitionDetails &&
          other.previousPlan == previousPlan &&
          other.previousPrice == previousPrice &&
          other.effectiveAt == effectiveAt &&
          other.effectiveMode == effectiveMode &&
          other.nextBillingDate == nextBillingDate &&
          other.chargedImmediately == chargedImmediately &&
          other.immediateCharge == immediateCharge &&
          other.previousSubscriptionItemStatus ==
              previousSubscriptionItemStatus &&
          other.previousSubscriptionItemId == previousSubscriptionItemId;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (previousPlan.hashCode) +
      (previousPrice.hashCode) +
      (effectiveAt.hashCode) +
      (effectiveMode.hashCode) +
      (nextBillingDate == null ? 0 : nextBillingDate!.hashCode) +
      (chargedImmediately.hashCode) +
      (immediateCharge == null ? 0 : immediateCharge!.hashCode) +
      (previousSubscriptionItemStatus.hashCode) +
      (previousSubscriptionItemId.hashCode);

  @override
  String toString() =>
      'CommercePriceTransitionDetails[previousPlan=$previousPlan, previousPrice=$previousPrice, effectiveAt=$effectiveAt, effectiveMode=$effectiveMode, nextBillingDate=$nextBillingDate, chargedImmediately=$chargedImmediately, immediateCharge=$immediateCharge, previousSubscriptionItemStatus=$previousSubscriptionItemStatus, previousSubscriptionItemId=$previousSubscriptionItemId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'previous_plan'] = this.previousPlan;
    json[r'previous_price'] = this.previousPrice;
    json[r'effective_at'] = this.effectiveAt;
    json[r'effective_mode'] = this.effectiveMode;
    if (this.nextBillingDate != null) {
      json[r'next_billing_date'] = this.nextBillingDate;
    } else {
      json[r'next_billing_date'] = null;
    }
    json[r'charged_immediately'] = this.chargedImmediately;
    if (this.immediateCharge != null) {
      json[r'immediate_charge'] = this.immediateCharge;
    } else {
      json[r'immediate_charge'] = null;
    }
    json[r'previous_subscription_item_status'] =
        this.previousSubscriptionItemStatus;
    json[r'previous_subscription_item_id'] = this.previousSubscriptionItemId;
    return json;
  }

  /// Returns a new [CommercePriceTransitionDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CommercePriceTransitionDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CommercePriceTransitionDetails[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CommercePriceTransitionDetails[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CommercePriceTransitionDetails(
        previousPlan: SchemasCommercePlan.fromJson(json[r'previous_plan'])!,
        previousPrice: BillingPriceResponse.fromJson(json[r'previous_price'])!,
        effectiveAt: mapValueOfType<int>(json, r'effective_at')!,
        effectiveMode: CommercePriceTransitionDetailsEffectiveModeEnum.fromJson(
            json[r'effective_mode'])!,
        nextBillingDate: mapValueOfType<int>(json, r'next_billing_date'),
        chargedImmediately: mapValueOfType<bool>(json, r'charged_immediately')!,
        immediateCharge:
            CommerceMoneyResponse.fromJson(json[r'immediate_charge']),
        previousSubscriptionItemStatus:
            CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum
                .fromJson(json[r'previous_subscription_item_status'])!,
        previousSubscriptionItemId:
            mapValueOfType<String>(json, r'previous_subscription_item_id')!,
      );
    }
    return null;
  }

  static List<CommercePriceTransitionDetails> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommercePriceTransitionDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommercePriceTransitionDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CommercePriceTransitionDetails> mapFromJson(dynamic json) {
    final map = <String, CommercePriceTransitionDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CommercePriceTransitionDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CommercePriceTransitionDetails-objects as value to a dart map
  static Map<String, List<CommercePriceTransitionDetails>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CommercePriceTransitionDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CommercePriceTransitionDetails.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'previous_plan',
    'previous_price',
    'effective_at',
    'effective_mode',
    'charged_immediately',
    'previous_subscription_item_status',
    'previous_subscription_item_id',
  };
}

/// When the new price takes effect.
class CommercePriceTransitionDetailsEffectiveModeEnum {
  /// Instantiate a new enum with the provided [value].
  const CommercePriceTransitionDetailsEffectiveModeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const immediate =
      CommercePriceTransitionDetailsEffectiveModeEnum._(r'immediate');
  static const endOfPeriod =
      CommercePriceTransitionDetailsEffectiveModeEnum._(r'end_of_period');

  /// List of all possible values in this [enum][CommercePriceTransitionDetailsEffectiveModeEnum].
  static const values = <CommercePriceTransitionDetailsEffectiveModeEnum>[
    immediate,
    endOfPeriod,
  ];

  static CommercePriceTransitionDetailsEffectiveModeEnum? fromJson(
          dynamic value) =>
      CommercePriceTransitionDetailsEffectiveModeEnumTypeTransformer()
          .decode(value);

  static List<CommercePriceTransitionDetailsEffectiveModeEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommercePriceTransitionDetailsEffectiveModeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            CommercePriceTransitionDetailsEffectiveModeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CommercePriceTransitionDetailsEffectiveModeEnum] to String,
/// and [decode] dynamic data back to [CommercePriceTransitionDetailsEffectiveModeEnum].
class CommercePriceTransitionDetailsEffectiveModeEnumTypeTransformer {
  factory CommercePriceTransitionDetailsEffectiveModeEnumTypeTransformer() =>
      _instance ??=
          const CommercePriceTransitionDetailsEffectiveModeEnumTypeTransformer
              ._();

  const CommercePriceTransitionDetailsEffectiveModeEnumTypeTransformer._();

  String encode(CommercePriceTransitionDetailsEffectiveModeEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a CommercePriceTransitionDetailsEffectiveModeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CommercePriceTransitionDetailsEffectiveModeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'immediate':
          return CommercePriceTransitionDetailsEffectiveModeEnum.immediate;
        case r'end_of_period':
          return CommercePriceTransitionDetailsEffectiveModeEnum.endOfPeriod;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CommercePriceTransitionDetailsEffectiveModeEnumTypeTransformer] instance.
  static CommercePriceTransitionDetailsEffectiveModeEnumTypeTransformer?
      _instance;
}

/// The status of the previous subscription item after transition.
class CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const canceled =
      CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum._(
          r'canceled');
  static const ended =
      CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum._(
          r'ended');
  static const abandoned =
      CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum._(
          r'abandoned');

  /// List of all possible values in this [enum][CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum].
  static const values =
      <CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum>[
    canceled,
    ended,
    abandoned,
  ];

  static CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum? fromJson(
          dynamic value) =>
      CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnumTypeTransformer()
          .decode(value);

  static List<CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum] to String,
/// and [decode] dynamic data back to [CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum].
class CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnumTypeTransformer {
  factory CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnumTypeTransformer() =>
      _instance ??=
          const CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnumTypeTransformer
              ._();

  const CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnumTypeTransformer._();

  String encode(
          CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'canceled':
          return CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum
              .canceled;
        case r'ended':
          return CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum
              .ended;
        case r'abandoned':
          return CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnum
              .abandoned;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnumTypeTransformer] instance.
  static CommercePriceTransitionDetailsPreviousSubscriptionItemStatusEnumTypeTransformer?
      _instance;
}
