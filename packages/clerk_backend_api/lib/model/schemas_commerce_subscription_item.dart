//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SchemasCommerceSubscriptionItem {
  /// Returns a new [SchemasCommerceSubscriptionItem] instance.
  SchemasCommerceSubscriptionItem({
    required this.object,
    required this.id,
    required this.instanceId,
    required this.status,
    this.credit,
    required this.planId,
    this.priceId,
    required this.plan,
    required this.planPeriod,
    required this.paymentSourceId,
    this.paymentSource,
    this.lifetimePaid,
    this.amount,
    this.nextInvoice,
    this.nextPayment,
    required this.payerId,
    this.payer,
    required this.isFreeTrial,
    this.periodStart,
    this.periodEnd,
    required this.prorationDate,
    this.canceledAt,
    this.pastDueAt,
    this.endedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  SchemasCommerceSubscriptionItemObjectEnum object;

  /// Unique identifier for the subscription item.
  String id;

  /// Unique identifier for the Clerk instance.
  String instanceId;

  /// Current status of the subscription item.
  SchemasCommerceSubscriptionItemStatusEnum status;

  /// Credit information (only available in PaymentAttempt events).
  CommerceSubscriptionCreditResponse? credit;

  /// Unique identifier for the associated plan.
  String planId;

  /// Unique identifier for the associated price
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? priceId;

  /// The associated commerce plan.
  SchemasCommercePlan? plan;

  /// The billing period for this subscription.
  SchemasCommerceSubscriptionItemPlanPeriodEnum planPeriod;

  /// Unique identifier for the payment source.
  String paymentSourceId;

  /// The payment source associated with this subscription.
  CommercePaymentSourceResponse? paymentSource;

  /// Total amount paid over the lifetime of this subscription.
  CommerceMoneyResponse? lifetimePaid;

  /// Current amount for this subscription.
  CommerceMoneyResponse? amount;

  /// Information about the next invoice.
  CommerceSubscriptionItemNextPaymentResponse? nextInvoice;

  /// Information about the next payment.
  CommerceSubscriptionItemNextPaymentResponse? nextPayment;

  /// Unique identifier for the payer.
  String payerId;

  /// The payer associated with this subscription.
  SchemasCommercePayerResponse? payer;

  /// Whether this subscription is currently on a free trial.
  bool isFreeTrial;

  /// Unix timestamp (in milliseconds) when the current period started.
  int? periodStart;

  /// Unix timestamp (in milliseconds) when the current period ends.
  int? periodEnd;

  /// Date used for proration calculations.
  String prorationDate;

  /// Unix timestamp (in milliseconds) when the subscription was canceled.
  int? canceledAt;

  /// Unix timestamp (in milliseconds) when the subscription became past due.
  int? pastDueAt;

  /// Unix timestamp (in milliseconds) when the subscription ended.
  int? endedAt;

  /// Unix timestamp (in milliseconds) when the subscription was created.
  int createdAt;

  /// Unix timestamp (in milliseconds) when the subscription was last updated.
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SchemasCommerceSubscriptionItem &&
          other.object == object &&
          other.id == id &&
          other.instanceId == instanceId &&
          other.status == status &&
          other.credit == credit &&
          other.planId == planId &&
          other.priceId == priceId &&
          other.plan == plan &&
          other.planPeriod == planPeriod &&
          other.paymentSourceId == paymentSourceId &&
          other.paymentSource == paymentSource &&
          other.lifetimePaid == lifetimePaid &&
          other.amount == amount &&
          other.nextInvoice == nextInvoice &&
          other.nextPayment == nextPayment &&
          other.payerId == payerId &&
          other.payer == payer &&
          other.isFreeTrial == isFreeTrial &&
          other.periodStart == periodStart &&
          other.periodEnd == periodEnd &&
          other.prorationDate == prorationDate &&
          other.canceledAt == canceledAt &&
          other.pastDueAt == pastDueAt &&
          other.endedAt == endedAt &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (instanceId.hashCode) +
      (status.hashCode) +
      (credit == null ? 0 : credit!.hashCode) +
      (planId.hashCode) +
      (priceId == null ? 0 : priceId!.hashCode) +
      (plan == null ? 0 : plan!.hashCode) +
      (planPeriod.hashCode) +
      (paymentSourceId.hashCode) +
      (paymentSource == null ? 0 : paymentSource!.hashCode) +
      (lifetimePaid == null ? 0 : lifetimePaid!.hashCode) +
      (amount == null ? 0 : amount!.hashCode) +
      (nextInvoice == null ? 0 : nextInvoice!.hashCode) +
      (nextPayment == null ? 0 : nextPayment!.hashCode) +
      (payerId.hashCode) +
      (payer == null ? 0 : payer!.hashCode) +
      (isFreeTrial.hashCode) +
      (periodStart == null ? 0 : periodStart!.hashCode) +
      (periodEnd == null ? 0 : periodEnd!.hashCode) +
      (prorationDate.hashCode) +
      (canceledAt == null ? 0 : canceledAt!.hashCode) +
      (pastDueAt == null ? 0 : pastDueAt!.hashCode) +
      (endedAt == null ? 0 : endedAt!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'SchemasCommerceSubscriptionItem[object=$object, id=$id, instanceId=$instanceId, status=$status, credit=$credit, planId=$planId, priceId=$priceId, plan=$plan, planPeriod=$planPeriod, paymentSourceId=$paymentSourceId, paymentSource=$paymentSource, lifetimePaid=$lifetimePaid, amount=$amount, nextInvoice=$nextInvoice, nextPayment=$nextPayment, payerId=$payerId, payer=$payer, isFreeTrial=$isFreeTrial, periodStart=$periodStart, periodEnd=$periodEnd, prorationDate=$prorationDate, canceledAt=$canceledAt, pastDueAt=$pastDueAt, endedAt=$endedAt, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'instance_id'] = this.instanceId;
    json[r'status'] = this.status;
    if (this.credit != null) {
      json[r'credit'] = this.credit;
    } else {
      json[r'credit'] = null;
    }
    json[r'plan_id'] = this.planId;
    if (this.priceId != null) {
      json[r'price_id'] = this.priceId;
    } else {
      json[r'price_id'] = null;
    }
    if (this.plan != null) {
      json[r'plan'] = this.plan;
    } else {
      json[r'plan'] = null;
    }
    json[r'plan_period'] = this.planPeriod;
    json[r'payment_source_id'] = this.paymentSourceId;
    if (this.paymentSource != null) {
      json[r'payment_source'] = this.paymentSource;
    } else {
      json[r'payment_source'] = null;
    }
    if (this.lifetimePaid != null) {
      json[r'lifetime_paid'] = this.lifetimePaid;
    } else {
      json[r'lifetime_paid'] = null;
    }
    if (this.amount != null) {
      json[r'amount'] = this.amount;
    } else {
      json[r'amount'] = null;
    }
    if (this.nextInvoice != null) {
      json[r'next_invoice'] = this.nextInvoice;
    } else {
      json[r'next_invoice'] = null;
    }
    if (this.nextPayment != null) {
      json[r'next_payment'] = this.nextPayment;
    } else {
      json[r'next_payment'] = null;
    }
    json[r'payer_id'] = this.payerId;
    if (this.payer != null) {
      json[r'payer'] = this.payer;
    } else {
      json[r'payer'] = null;
    }
    json[r'is_free_trial'] = this.isFreeTrial;
    if (this.periodStart != null) {
      json[r'period_start'] = this.periodStart;
    } else {
      json[r'period_start'] = null;
    }
    if (this.periodEnd != null) {
      json[r'period_end'] = this.periodEnd;
    } else {
      json[r'period_end'] = null;
    }
    json[r'proration_date'] = this.prorationDate;
    if (this.canceledAt != null) {
      json[r'canceled_at'] = this.canceledAt;
    } else {
      json[r'canceled_at'] = null;
    }
    if (this.pastDueAt != null) {
      json[r'past_due_at'] = this.pastDueAt;
    } else {
      json[r'past_due_at'] = null;
    }
    if (this.endedAt != null) {
      json[r'ended_at'] = this.endedAt;
    } else {
      json[r'ended_at'] = null;
    }
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [SchemasCommerceSubscriptionItem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SchemasCommerceSubscriptionItem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SchemasCommerceSubscriptionItem[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SchemasCommerceSubscriptionItem[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SchemasCommerceSubscriptionItem(
        object: SchemasCommerceSubscriptionItemObjectEnum.fromJson(
            json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        instanceId: mapValueOfType<String>(json, r'instance_id')!,
        status: SchemasCommerceSubscriptionItemStatusEnum.fromJson(
            json[r'status'])!,
        credit: CommerceSubscriptionCreditResponse.fromJson(json[r'credit']),
        planId: mapValueOfType<String>(json, r'plan_id')!,
        priceId: mapValueOfType<String>(json, r'price_id'),
        plan: SchemasCommercePlan.fromJson(json[r'plan']),
        planPeriod: SchemasCommerceSubscriptionItemPlanPeriodEnum.fromJson(
            json[r'plan_period'])!,
        paymentSourceId: mapValueOfType<String>(json, r'payment_source_id')!,
        paymentSource:
            CommercePaymentSourceResponse.fromJson(json[r'payment_source']),
        lifetimePaid: CommerceMoneyResponse.fromJson(json[r'lifetime_paid']),
        amount: CommerceMoneyResponse.fromJson(json[r'amount']),
        nextInvoice: CommerceSubscriptionItemNextPaymentResponse.fromJson(
            json[r'next_invoice']),
        nextPayment: CommerceSubscriptionItemNextPaymentResponse.fromJson(
            json[r'next_payment']),
        payerId: mapValueOfType<String>(json, r'payer_id')!,
        payer: SchemasCommercePayerResponse.fromJson(json[r'payer']),
        isFreeTrial: mapValueOfType<bool>(json, r'is_free_trial')!,
        periodStart: mapValueOfType<int>(json, r'period_start'),
        periodEnd: mapValueOfType<int>(json, r'period_end'),
        prorationDate: mapValueOfType<String>(json, r'proration_date')!,
        canceledAt: mapValueOfType<int>(json, r'canceled_at'),
        pastDueAt: mapValueOfType<int>(json, r'past_due_at'),
        endedAt: mapValueOfType<int>(json, r'ended_at'),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<SchemasCommerceSubscriptionItem> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SchemasCommerceSubscriptionItem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SchemasCommerceSubscriptionItem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SchemasCommerceSubscriptionItem> mapFromJson(
      dynamic json) {
    final map = <String, SchemasCommerceSubscriptionItem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SchemasCommerceSubscriptionItem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SchemasCommerceSubscriptionItem-objects as value to a dart map
  static Map<String, List<SchemasCommerceSubscriptionItem>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SchemasCommerceSubscriptionItem>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SchemasCommerceSubscriptionItem.listFromJson(
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
    'instance_id',
    'status',
    'plan_id',
    'plan',
    'plan_period',
    'payment_source_id',
    'payer_id',
    'is_free_trial',
    'proration_date',
    'created_at',
    'updated_at',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class SchemasCommerceSubscriptionItemObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const SchemasCommerceSubscriptionItemObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const commerceSubscriptionItem =
      SchemasCommerceSubscriptionItemObjectEnum._(
          r'commerce_subscription_item');

  /// List of all possible values in this [enum][SchemasCommerceSubscriptionItemObjectEnum].
  static const values = <SchemasCommerceSubscriptionItemObjectEnum>[
    commerceSubscriptionItem,
  ];

  static SchemasCommerceSubscriptionItemObjectEnum? fromJson(dynamic value) =>
      SchemasCommerceSubscriptionItemObjectEnumTypeTransformer().decode(value);

  static List<SchemasCommerceSubscriptionItemObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SchemasCommerceSubscriptionItemObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SchemasCommerceSubscriptionItemObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SchemasCommerceSubscriptionItemObjectEnum] to String,
/// and [decode] dynamic data back to [SchemasCommerceSubscriptionItemObjectEnum].
class SchemasCommerceSubscriptionItemObjectEnumTypeTransformer {
  factory SchemasCommerceSubscriptionItemObjectEnumTypeTransformer() =>
      _instance ??=
          const SchemasCommerceSubscriptionItemObjectEnumTypeTransformer._();

  const SchemasCommerceSubscriptionItemObjectEnumTypeTransformer._();

  String encode(SchemasCommerceSubscriptionItemObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SchemasCommerceSubscriptionItemObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SchemasCommerceSubscriptionItemObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'commerce_subscription_item':
          return SchemasCommerceSubscriptionItemObjectEnum
              .commerceSubscriptionItem;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SchemasCommerceSubscriptionItemObjectEnumTypeTransformer] instance.
  static SchemasCommerceSubscriptionItemObjectEnumTypeTransformer? _instance;
}

/// Current status of the subscription item.
class SchemasCommerceSubscriptionItemStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const SchemasCommerceSubscriptionItemStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const active = SchemasCommerceSubscriptionItemStatusEnum._(r'active');
  static const ended = SchemasCommerceSubscriptionItemStatusEnum._(r'ended');
  static const pastDue =
      SchemasCommerceSubscriptionItemStatusEnum._(r'past_due');
  static const upcoming =
      SchemasCommerceSubscriptionItemStatusEnum._(r'upcoming');
  static const incomplete =
      SchemasCommerceSubscriptionItemStatusEnum._(r'incomplete');
  static const abandoned =
      SchemasCommerceSubscriptionItemStatusEnum._(r'abandoned');

  /// List of all possible values in this [enum][SchemasCommerceSubscriptionItemStatusEnum].
  static const values = <SchemasCommerceSubscriptionItemStatusEnum>[
    active,
    ended,
    pastDue,
    upcoming,
    incomplete,
    abandoned,
  ];

  static SchemasCommerceSubscriptionItemStatusEnum? fromJson(dynamic value) =>
      SchemasCommerceSubscriptionItemStatusEnumTypeTransformer().decode(value);

  static List<SchemasCommerceSubscriptionItemStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SchemasCommerceSubscriptionItemStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SchemasCommerceSubscriptionItemStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SchemasCommerceSubscriptionItemStatusEnum] to String,
/// and [decode] dynamic data back to [SchemasCommerceSubscriptionItemStatusEnum].
class SchemasCommerceSubscriptionItemStatusEnumTypeTransformer {
  factory SchemasCommerceSubscriptionItemStatusEnumTypeTransformer() =>
      _instance ??=
          const SchemasCommerceSubscriptionItemStatusEnumTypeTransformer._();

  const SchemasCommerceSubscriptionItemStatusEnumTypeTransformer._();

  String encode(SchemasCommerceSubscriptionItemStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SchemasCommerceSubscriptionItemStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SchemasCommerceSubscriptionItemStatusEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'active':
          return SchemasCommerceSubscriptionItemStatusEnum.active;
        case r'ended':
          return SchemasCommerceSubscriptionItemStatusEnum.ended;
        case r'past_due':
          return SchemasCommerceSubscriptionItemStatusEnum.pastDue;
        case r'upcoming':
          return SchemasCommerceSubscriptionItemStatusEnum.upcoming;
        case r'incomplete':
          return SchemasCommerceSubscriptionItemStatusEnum.incomplete;
        case r'abandoned':
          return SchemasCommerceSubscriptionItemStatusEnum.abandoned;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SchemasCommerceSubscriptionItemStatusEnumTypeTransformer] instance.
  static SchemasCommerceSubscriptionItemStatusEnumTypeTransformer? _instance;
}

/// The billing period for this subscription.
class SchemasCommerceSubscriptionItemPlanPeriodEnum {
  /// Instantiate a new enum with the provided [value].
  const SchemasCommerceSubscriptionItemPlanPeriodEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const month =
      SchemasCommerceSubscriptionItemPlanPeriodEnum._(r'month');
  static const annual =
      SchemasCommerceSubscriptionItemPlanPeriodEnum._(r'annual');

  /// List of all possible values in this [enum][SchemasCommerceSubscriptionItemPlanPeriodEnum].
  static const values = <SchemasCommerceSubscriptionItemPlanPeriodEnum>[
    month,
    annual,
  ];

  static SchemasCommerceSubscriptionItemPlanPeriodEnum? fromJson(
          dynamic value) =>
      SchemasCommerceSubscriptionItemPlanPeriodEnumTypeTransformer()
          .decode(value);

  static List<SchemasCommerceSubscriptionItemPlanPeriodEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SchemasCommerceSubscriptionItemPlanPeriodEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            SchemasCommerceSubscriptionItemPlanPeriodEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SchemasCommerceSubscriptionItemPlanPeriodEnum] to String,
/// and [decode] dynamic data back to [SchemasCommerceSubscriptionItemPlanPeriodEnum].
class SchemasCommerceSubscriptionItemPlanPeriodEnumTypeTransformer {
  factory SchemasCommerceSubscriptionItemPlanPeriodEnumTypeTransformer() =>
      _instance ??=
          const SchemasCommerceSubscriptionItemPlanPeriodEnumTypeTransformer
              ._();

  const SchemasCommerceSubscriptionItemPlanPeriodEnumTypeTransformer._();

  String encode(SchemasCommerceSubscriptionItemPlanPeriodEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a SchemasCommerceSubscriptionItemPlanPeriodEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SchemasCommerceSubscriptionItemPlanPeriodEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'month':
          return SchemasCommerceSubscriptionItemPlanPeriodEnum.month;
        case r'annual':
          return SchemasCommerceSubscriptionItemPlanPeriodEnum.annual;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SchemasCommerceSubscriptionItemPlanPeriodEnumTypeTransformer] instance.
  static SchemasCommerceSubscriptionItemPlanPeriodEnumTypeTransformer?
      _instance;
}
