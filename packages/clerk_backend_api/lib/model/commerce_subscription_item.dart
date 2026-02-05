//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CommerceSubscriptionItem {
  /// Returns a new [CommerceSubscriptionItem] instance.
  CommerceSubscriptionItem({
    required this.object,
    required this.id,
    required this.instanceId,
    required this.status,
    this.credit,
    required this.planId,
    this.priceId,
    this.plan,
    required this.planPeriod,
    this.paymentMethod,
    this.lifetimePaid,
    this.nextPayment,
    required this.payerId,
    this.payer,
    required this.isFreeTrial,
    required this.periodStart,
    required this.periodEnd,
    this.prorationDate,
    required this.canceledAt,
    required this.pastDueAt,
    required this.endedAt,
    this.createdAt,
    this.updatedAt,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  CommerceSubscriptionItemObjectEnum object;

  /// Unique identifier for the subscription item.
  String id;

  /// Unique identifier for the Clerk instance.
  String instanceId;

  /// Current status of the subscription item.
  CommerceSubscriptionItemStatusEnum status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CommerceSubscriptionCreditResponse? credit;

  /// Unique identifier for the associated plan.
  String? planId;

  /// Unique identifier for the associated price
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? priceId;

  /// The associated plan.
  CommercePlan? plan;

  /// The billing period for this subscription item.
  CommerceSubscriptionItemPlanPeriodEnum planPeriod;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CommercePaymentMethodResponse? paymentMethod;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CommerceMoneyResponse? lifetimePaid;

  /// Information about the next payment.
  CommerceSubscriptionItemNextPaymentResponse? nextPayment;

  /// Unique identifier for the payer.
  String payerId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CommercePayerResponse? payer;

  /// Whether this subscription item includes a free trial.
  bool isFreeTrial;

  /// Unix timestamp (in milliseconds) when the current period started.
  int periodStart;

  /// Unix timestamp (in milliseconds) when the current period ends.
  int? periodEnd;

  /// The day the subscription item was prorated from. Only available in some responses.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? prorationDate;

  /// Unix timestamp (in milliseconds) when the subscription item was canceled.
  int? canceledAt;

  /// Unix timestamp (in milliseconds) when the subscription item became past due.
  int? pastDueAt;

  /// Unix timestamp (in milliseconds) when the subscription item ended.
  int? endedAt;

  /// Unix timestamp (in milliseconds) when the subscription item was created.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? createdAt;

  /// Unix timestamp (in milliseconds) when the subscription item was last updated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommerceSubscriptionItem &&
          other.object == object &&
          other.id == id &&
          other.instanceId == instanceId &&
          other.status == status &&
          other.credit == credit &&
          other.planId == planId &&
          other.priceId == priceId &&
          other.plan == plan &&
          other.planPeriod == planPeriod &&
          other.paymentMethod == paymentMethod &&
          other.lifetimePaid == lifetimePaid &&
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
      (planId == null ? 0 : planId!.hashCode) +
      (priceId == null ? 0 : priceId!.hashCode) +
      (plan == null ? 0 : plan!.hashCode) +
      (planPeriod.hashCode) +
      (paymentMethod == null ? 0 : paymentMethod!.hashCode) +
      (lifetimePaid == null ? 0 : lifetimePaid!.hashCode) +
      (nextPayment == null ? 0 : nextPayment!.hashCode) +
      (payerId.hashCode) +
      (payer == null ? 0 : payer!.hashCode) +
      (isFreeTrial.hashCode) +
      (periodStart.hashCode) +
      (periodEnd == null ? 0 : periodEnd!.hashCode) +
      (prorationDate == null ? 0 : prorationDate!.hashCode) +
      (canceledAt == null ? 0 : canceledAt!.hashCode) +
      (pastDueAt == null ? 0 : pastDueAt!.hashCode) +
      (endedAt == null ? 0 : endedAt!.hashCode) +
      (createdAt == null ? 0 : createdAt!.hashCode) +
      (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() =>
      'CommerceSubscriptionItem[object=$object, id=$id, instanceId=$instanceId, status=$status, credit=$credit, planId=$planId, priceId=$priceId, plan=$plan, planPeriod=$planPeriod, paymentMethod=$paymentMethod, lifetimePaid=$lifetimePaid, nextPayment=$nextPayment, payerId=$payerId, payer=$payer, isFreeTrial=$isFreeTrial, periodStart=$periodStart, periodEnd=$periodEnd, prorationDate=$prorationDate, canceledAt=$canceledAt, pastDueAt=$pastDueAt, endedAt=$endedAt, createdAt=$createdAt, updatedAt=$updatedAt]';

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
    if (this.planId != null) {
      json[r'plan_id'] = this.planId;
    } else {
      json[r'plan_id'] = null;
    }
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
    if (this.paymentMethod != null) {
      json[r'payment_method'] = this.paymentMethod;
    } else {
      json[r'payment_method'] = null;
    }
    if (this.lifetimePaid != null) {
      json[r'lifetime_paid'] = this.lifetimePaid;
    } else {
      json[r'lifetime_paid'] = null;
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
    json[r'period_start'] = this.periodStart;
    if (this.periodEnd != null) {
      json[r'period_end'] = this.periodEnd;
    } else {
      json[r'period_end'] = null;
    }
    if (this.prorationDate != null) {
      json[r'proration_date'] =
          _dateFormatter.format(this.prorationDate!.toUtc());
    } else {
      json[r'proration_date'] = null;
    }
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
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt;
    } else {
      json[r'created_at'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    return json;
  }

  /// Returns a new [CommerceSubscriptionItem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CommerceSubscriptionItem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CommerceSubscriptionItem[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CommerceSubscriptionItem[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CommerceSubscriptionItem(
        object: CommerceSubscriptionItemObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        instanceId: mapValueOfType<String>(json, r'instance_id')!,
        status: CommerceSubscriptionItemStatusEnum.fromJson(json[r'status'])!,
        credit: CommerceSubscriptionCreditResponse.fromJson(json[r'credit']),
        planId: mapValueOfType<String>(json, r'plan_id'),
        priceId: mapValueOfType<String>(json, r'price_id'),
        plan: CommercePlan.fromJson(json[r'plan']),
        planPeriod: CommerceSubscriptionItemPlanPeriodEnum.fromJson(
            json[r'plan_period'])!,
        paymentMethod:
            CommercePaymentMethodResponse.fromJson(json[r'payment_method']),
        lifetimePaid: CommerceMoneyResponse.fromJson(json[r'lifetime_paid']),
        nextPayment: CommerceSubscriptionItemNextPaymentResponse.fromJson(
            json[r'next_payment']),
        payerId: mapValueOfType<String>(json, r'payer_id')!,
        payer: CommercePayerResponse.fromJson(json[r'payer']),
        isFreeTrial: mapValueOfType<bool>(json, r'is_free_trial')!,
        periodStart: mapValueOfType<int>(json, r'period_start')!,
        periodEnd: mapValueOfType<int>(json, r'period_end'),
        prorationDate: mapDateTime(json, r'proration_date', r''),
        canceledAt: mapValueOfType<int>(json, r'canceled_at'),
        pastDueAt: mapValueOfType<int>(json, r'past_due_at'),
        endedAt: mapValueOfType<int>(json, r'ended_at'),
        createdAt: mapValueOfType<int>(json, r'created_at'),
        updatedAt: mapValueOfType<int>(json, r'updated_at'),
      );
    }
    return null;
  }

  static List<CommerceSubscriptionItem> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommerceSubscriptionItem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommerceSubscriptionItem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CommerceSubscriptionItem> mapFromJson(dynamic json) {
    final map = <String, CommerceSubscriptionItem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CommerceSubscriptionItem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CommerceSubscriptionItem-objects as value to a dart map
  static Map<String, List<CommerceSubscriptionItem>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CommerceSubscriptionItem>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CommerceSubscriptionItem.listFromJson(
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
    'plan_period',
    'payer_id',
    'is_free_trial',
    'period_start',
    'period_end',
    'canceled_at',
    'past_due_at',
    'ended_at',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class CommerceSubscriptionItemObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const CommerceSubscriptionItemObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const commerceSubscriptionItem =
      CommerceSubscriptionItemObjectEnum._(r'commerce_subscription_item');

  /// List of all possible values in this [enum][CommerceSubscriptionItemObjectEnum].
  static const values = <CommerceSubscriptionItemObjectEnum>[
    commerceSubscriptionItem,
  ];

  static CommerceSubscriptionItemObjectEnum? fromJson(dynamic value) =>
      CommerceSubscriptionItemObjectEnumTypeTransformer().decode(value);

  static List<CommerceSubscriptionItemObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommerceSubscriptionItemObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommerceSubscriptionItemObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CommerceSubscriptionItemObjectEnum] to String,
/// and [decode] dynamic data back to [CommerceSubscriptionItemObjectEnum].
class CommerceSubscriptionItemObjectEnumTypeTransformer {
  factory CommerceSubscriptionItemObjectEnumTypeTransformer() =>
      _instance ??= const CommerceSubscriptionItemObjectEnumTypeTransformer._();

  const CommerceSubscriptionItemObjectEnumTypeTransformer._();

  String encode(CommerceSubscriptionItemObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CommerceSubscriptionItemObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CommerceSubscriptionItemObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'commerce_subscription_item':
          return CommerceSubscriptionItemObjectEnum.commerceSubscriptionItem;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CommerceSubscriptionItemObjectEnumTypeTransformer] instance.
  static CommerceSubscriptionItemObjectEnumTypeTransformer? _instance;
}

/// Current status of the subscription item.
class CommerceSubscriptionItemStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const CommerceSubscriptionItemStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const active = CommerceSubscriptionItemStatusEnum._(r'active');
  static const canceled = CommerceSubscriptionItemStatusEnum._(r'canceled');
  static const expired = CommerceSubscriptionItemStatusEnum._(r'expired');
  static const ended = CommerceSubscriptionItemStatusEnum._(r'ended');
  static const pastDue = CommerceSubscriptionItemStatusEnum._(r'past_due');
  static const upcoming = CommerceSubscriptionItemStatusEnum._(r'upcoming');
  static const incomplete = CommerceSubscriptionItemStatusEnum._(r'incomplete');
  static const abandoned = CommerceSubscriptionItemStatusEnum._(r'abandoned');

  /// List of all possible values in this [enum][CommerceSubscriptionItemStatusEnum].
  static const values = <CommerceSubscriptionItemStatusEnum>[
    active,
    canceled,
    expired,
    ended,
    pastDue,
    upcoming,
    incomplete,
    abandoned,
  ];

  static CommerceSubscriptionItemStatusEnum? fromJson(dynamic value) =>
      CommerceSubscriptionItemStatusEnumTypeTransformer().decode(value);

  static List<CommerceSubscriptionItemStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommerceSubscriptionItemStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommerceSubscriptionItemStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CommerceSubscriptionItemStatusEnum] to String,
/// and [decode] dynamic data back to [CommerceSubscriptionItemStatusEnum].
class CommerceSubscriptionItemStatusEnumTypeTransformer {
  factory CommerceSubscriptionItemStatusEnumTypeTransformer() =>
      _instance ??= const CommerceSubscriptionItemStatusEnumTypeTransformer._();

  const CommerceSubscriptionItemStatusEnumTypeTransformer._();

  String encode(CommerceSubscriptionItemStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CommerceSubscriptionItemStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CommerceSubscriptionItemStatusEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'active':
          return CommerceSubscriptionItemStatusEnum.active;
        case r'canceled':
          return CommerceSubscriptionItemStatusEnum.canceled;
        case r'expired':
          return CommerceSubscriptionItemStatusEnum.expired;
        case r'ended':
          return CommerceSubscriptionItemStatusEnum.ended;
        case r'past_due':
          return CommerceSubscriptionItemStatusEnum.pastDue;
        case r'upcoming':
          return CommerceSubscriptionItemStatusEnum.upcoming;
        case r'incomplete':
          return CommerceSubscriptionItemStatusEnum.incomplete;
        case r'abandoned':
          return CommerceSubscriptionItemStatusEnum.abandoned;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CommerceSubscriptionItemStatusEnumTypeTransformer] instance.
  static CommerceSubscriptionItemStatusEnumTypeTransformer? _instance;
}

/// The billing period for this subscription item.
class CommerceSubscriptionItemPlanPeriodEnum {
  /// Instantiate a new enum with the provided [value].
  const CommerceSubscriptionItemPlanPeriodEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const month = CommerceSubscriptionItemPlanPeriodEnum._(r'month');
  static const annual = CommerceSubscriptionItemPlanPeriodEnum._(r'annual');

  /// List of all possible values in this [enum][CommerceSubscriptionItemPlanPeriodEnum].
  static const values = <CommerceSubscriptionItemPlanPeriodEnum>[
    month,
    annual,
  ];

  static CommerceSubscriptionItemPlanPeriodEnum? fromJson(dynamic value) =>
      CommerceSubscriptionItemPlanPeriodEnumTypeTransformer().decode(value);

  static List<CommerceSubscriptionItemPlanPeriodEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommerceSubscriptionItemPlanPeriodEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommerceSubscriptionItemPlanPeriodEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CommerceSubscriptionItemPlanPeriodEnum] to String,
/// and [decode] dynamic data back to [CommerceSubscriptionItemPlanPeriodEnum].
class CommerceSubscriptionItemPlanPeriodEnumTypeTransformer {
  factory CommerceSubscriptionItemPlanPeriodEnumTypeTransformer() =>
      _instance ??=
          const CommerceSubscriptionItemPlanPeriodEnumTypeTransformer._();

  const CommerceSubscriptionItemPlanPeriodEnumTypeTransformer._();

  String encode(CommerceSubscriptionItemPlanPeriodEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CommerceSubscriptionItemPlanPeriodEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CommerceSubscriptionItemPlanPeriodEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'month':
          return CommerceSubscriptionItemPlanPeriodEnum.month;
        case r'annual':
          return CommerceSubscriptionItemPlanPeriodEnum.annual;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CommerceSubscriptionItemPlanPeriodEnumTypeTransformer] instance.
  static CommerceSubscriptionItemPlanPeriodEnumTypeTransformer? _instance;
}
