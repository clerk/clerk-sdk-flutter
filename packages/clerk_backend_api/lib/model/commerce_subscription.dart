//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CommerceSubscription {
  /// Returns a new [CommerceSubscription] instance.
  CommerceSubscription({
    required this.object,
    required this.id,
    required this.instanceId,
    required this.status,
    required this.payerId,
    required this.createdAt,
    required this.updatedAt,
    required this.activeAt,
    required this.pastDueAt,
    this.subscriptionItems = const [],
    this.nextPayment,
    this.eligibleForFreeTrial,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  CommerceSubscriptionObjectEnum object;

  /// Unique identifier for the commerce subscription.
  String id;

  /// The ID of the instance this subscription belongs to.
  String instanceId;

  /// The current status of the subscription.
  CommerceSubscriptionStatusEnum status;

  /// The ID of the payer for this subscription.
  String payerId;

  /// Unix timestamp (milliseconds) of creation.
  int createdAt;

  /// Unix timestamp (milliseconds) of last update.
  int updatedAt;

  /// Unix timestamp (milliseconds) when the subscription became active.
  int? activeAt;

  /// Unix timestamp (milliseconds) when the subscription became past due.
  int? pastDueAt;

  /// Array of subscription items in this subscription.
  List<CommerceSubscriptionItem> subscriptionItems;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CommerceSubscriptionNextPayment? nextPayment;

  /// Whether the payer is eligible for a free trial.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? eligibleForFreeTrial;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommerceSubscription &&
          other.object == object &&
          other.id == id &&
          other.instanceId == instanceId &&
          other.status == status &&
          other.payerId == payerId &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt &&
          other.activeAt == activeAt &&
          other.pastDueAt == pastDueAt &&
          _deepEquality.equals(other.subscriptionItems, subscriptionItems) &&
          other.nextPayment == nextPayment &&
          other.eligibleForFreeTrial == eligibleForFreeTrial;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (instanceId.hashCode) +
      (status.hashCode) +
      (payerId.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode) +
      (activeAt == null ? 0 : activeAt!.hashCode) +
      (pastDueAt == null ? 0 : pastDueAt!.hashCode) +
      (subscriptionItems.hashCode) +
      (nextPayment == null ? 0 : nextPayment!.hashCode) +
      (eligibleForFreeTrial == null ? 0 : eligibleForFreeTrial!.hashCode);

  @override
  String toString() =>
      'CommerceSubscription[object=$object, id=$id, instanceId=$instanceId, status=$status, payerId=$payerId, createdAt=$createdAt, updatedAt=$updatedAt, activeAt=$activeAt, pastDueAt=$pastDueAt, subscriptionItems=$subscriptionItems, nextPayment=$nextPayment, eligibleForFreeTrial=$eligibleForFreeTrial]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'instance_id'] = this.instanceId;
    json[r'status'] = this.status;
    json[r'payer_id'] = this.payerId;
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    if (this.activeAt != null) {
      json[r'active_at'] = this.activeAt;
    } else {
      json[r'active_at'] = null;
    }
    if (this.pastDueAt != null) {
      json[r'past_due_at'] = this.pastDueAt;
    } else {
      json[r'past_due_at'] = null;
    }
    json[r'subscription_items'] = this.subscriptionItems;
    if (this.nextPayment != null) {
      json[r'next_payment'] = this.nextPayment;
    } else {
      json[r'next_payment'] = null;
    }
    if (this.eligibleForFreeTrial != null) {
      json[r'eligible_for_free_trial'] = this.eligibleForFreeTrial;
    } else {
      json[r'eligible_for_free_trial'] = null;
    }
    return json;
  }

  /// Returns a new [CommerceSubscription] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CommerceSubscription? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CommerceSubscription[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CommerceSubscription[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CommerceSubscription(
        object: CommerceSubscriptionObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        instanceId: mapValueOfType<String>(json, r'instance_id')!,
        status: CommerceSubscriptionStatusEnum.fromJson(json[r'status'])!,
        payerId: mapValueOfType<String>(json, r'payer_id')!,
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
        activeAt: mapValueOfType<int>(json, r'active_at'),
        pastDueAt: mapValueOfType<int>(json, r'past_due_at'),
        subscriptionItems:
            CommerceSubscriptionItem.listFromJson(json[r'subscription_items']),
        nextPayment:
            CommerceSubscriptionNextPayment.fromJson(json[r'next_payment']),
        eligibleForFreeTrial:
            mapValueOfType<bool>(json, r'eligible_for_free_trial'),
      );
    }
    return null;
  }

  static List<CommerceSubscription> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommerceSubscription>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommerceSubscription.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CommerceSubscription> mapFromJson(dynamic json) {
    final map = <String, CommerceSubscription>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CommerceSubscription.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CommerceSubscription-objects as value to a dart map
  static Map<String, List<CommerceSubscription>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CommerceSubscription>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CommerceSubscription.listFromJson(
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
    'payer_id',
    'created_at',
    'updated_at',
    'active_at',
    'past_due_at',
    'subscription_items',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class CommerceSubscriptionObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const CommerceSubscriptionObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const commerceSubscription =
      CommerceSubscriptionObjectEnum._(r'commerce_subscription');

  /// List of all possible values in this [enum][CommerceSubscriptionObjectEnum].
  static const values = <CommerceSubscriptionObjectEnum>[
    commerceSubscription,
  ];

  static CommerceSubscriptionObjectEnum? fromJson(dynamic value) =>
      CommerceSubscriptionObjectEnumTypeTransformer().decode(value);

  static List<CommerceSubscriptionObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommerceSubscriptionObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommerceSubscriptionObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CommerceSubscriptionObjectEnum] to String,
/// and [decode] dynamic data back to [CommerceSubscriptionObjectEnum].
class CommerceSubscriptionObjectEnumTypeTransformer {
  factory CommerceSubscriptionObjectEnumTypeTransformer() =>
      _instance ??= const CommerceSubscriptionObjectEnumTypeTransformer._();

  const CommerceSubscriptionObjectEnumTypeTransformer._();

  String encode(CommerceSubscriptionObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CommerceSubscriptionObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CommerceSubscriptionObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'commerce_subscription':
          return CommerceSubscriptionObjectEnum.commerceSubscription;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CommerceSubscriptionObjectEnumTypeTransformer] instance.
  static CommerceSubscriptionObjectEnumTypeTransformer? _instance;
}

/// The current status of the subscription.
class CommerceSubscriptionStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const CommerceSubscriptionStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const active = CommerceSubscriptionStatusEnum._(r'active');
  static const pastDue = CommerceSubscriptionStatusEnum._(r'past_due');
  static const canceled = CommerceSubscriptionStatusEnum._(r'canceled');
  static const ended = CommerceSubscriptionStatusEnum._(r'ended');
  static const abandoned = CommerceSubscriptionStatusEnum._(r'abandoned');
  static const incomplete = CommerceSubscriptionStatusEnum._(r'incomplete');

  /// List of all possible values in this [enum][CommerceSubscriptionStatusEnum].
  static const values = <CommerceSubscriptionStatusEnum>[
    active,
    pastDue,
    canceled,
    ended,
    abandoned,
    incomplete,
  ];

  static CommerceSubscriptionStatusEnum? fromJson(dynamic value) =>
      CommerceSubscriptionStatusEnumTypeTransformer().decode(value);

  static List<CommerceSubscriptionStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommerceSubscriptionStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommerceSubscriptionStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CommerceSubscriptionStatusEnum] to String,
/// and [decode] dynamic data back to [CommerceSubscriptionStatusEnum].
class CommerceSubscriptionStatusEnumTypeTransformer {
  factory CommerceSubscriptionStatusEnumTypeTransformer() =>
      _instance ??= const CommerceSubscriptionStatusEnumTypeTransformer._();

  const CommerceSubscriptionStatusEnumTypeTransformer._();

  String encode(CommerceSubscriptionStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CommerceSubscriptionStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CommerceSubscriptionStatusEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'active':
          return CommerceSubscriptionStatusEnum.active;
        case r'past_due':
          return CommerceSubscriptionStatusEnum.pastDue;
        case r'canceled':
          return CommerceSubscriptionStatusEnum.canceled;
        case r'ended':
          return CommerceSubscriptionStatusEnum.ended;
        case r'abandoned':
          return CommerceSubscriptionStatusEnum.abandoned;
        case r'incomplete':
          return CommerceSubscriptionStatusEnum.incomplete;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CommerceSubscriptionStatusEnumTypeTransformer] instance.
  static CommerceSubscriptionStatusEnumTypeTransformer? _instance;
}
