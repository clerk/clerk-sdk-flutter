//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BillingPaymentAttempt {
  /// Returns a new [BillingPaymentAttempt] instance.
  BillingPaymentAttempt({
    required this.object,
    required this.id,
    required this.paymentId,
    required this.instanceId,
    required this.chargeType,
    required this.payeeId,
    required this.payee,
    required this.payerId,
    required this.payer,
    this.subscriptionItemId,
    this.subscriptionItem,
    required this.amount,
    required this.paymentMethodId,
    required this.paymentMethod,
    required this.statementId,
    required this.gatewayExternalId,
    required this.gatewayExternalUrl,
    required this.status,
    required this.paidAt,
    required this.failedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  BillingPaymentAttemptObjectEnum object;

  /// Unique identifier for the payment attempt.
  String id;

  /// Unique identifier for the associated payment.
  String paymentId;

  /// The ID of the instance this payment attempt belongs to.
  String instanceId;

  /// Type of charge for this payment attempt.
  String chargeType;

  /// Unique identifier for the payee.
  String payeeId;

  /// The payee associated with this payment attempt.
  Object payee;

  /// Unique identifier for the payer.
  String payerId;

  CommercePayerResponse payer;

  /// Unique identifier for the associated subscription item.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? subscriptionItemId;

  /// The subscription item associated with this payment attempt.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? subscriptionItem;

  CommerceMoneyResponse amount;

  /// Unique identifier for the payment method.
  String paymentMethodId;

  CommercePaymentMethodResponse paymentMethod;

  /// Unique identifier for the associated statement.
  String statementId;

  /// External identifier from the payment gateway.
  String? gatewayExternalId;

  /// External URL from the payment gateway.
  String? gatewayExternalUrl;

  /// The current status of the payment attempt.
  BillingPaymentAttemptStatusEnum status;

  /// Unix timestamp (in milliseconds) when the payment was completed.
  int? paidAt;

  /// Unix timestamp (in milliseconds) when the payment failed to be processed.
  int? failedAt;

  /// Unix timestamp (in milliseconds) when the payment attempt was created.
  int createdAt;

  /// Unix timestamp (in milliseconds) when the payment attempt was last updated.
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillingPaymentAttempt &&
          other.object == object &&
          other.id == id &&
          other.paymentId == paymentId &&
          other.instanceId == instanceId &&
          other.chargeType == chargeType &&
          other.payeeId == payeeId &&
          other.payee == payee &&
          other.payerId == payerId &&
          other.payer == payer &&
          other.subscriptionItemId == subscriptionItemId &&
          other.subscriptionItem == subscriptionItem &&
          other.amount == amount &&
          other.paymentMethodId == paymentMethodId &&
          other.paymentMethod == paymentMethod &&
          other.statementId == statementId &&
          other.gatewayExternalId == gatewayExternalId &&
          other.gatewayExternalUrl == gatewayExternalUrl &&
          other.status == status &&
          other.paidAt == paidAt &&
          other.failedAt == failedAt &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (paymentId.hashCode) +
      (instanceId.hashCode) +
      (chargeType.hashCode) +
      (payeeId.hashCode) +
      (payee.hashCode) +
      (payerId.hashCode) +
      (payer.hashCode) +
      (subscriptionItemId == null ? 0 : subscriptionItemId!.hashCode) +
      (subscriptionItem == null ? 0 : subscriptionItem!.hashCode) +
      (amount.hashCode) +
      (paymentMethodId.hashCode) +
      (paymentMethod.hashCode) +
      (statementId.hashCode) +
      (gatewayExternalId == null ? 0 : gatewayExternalId!.hashCode) +
      (gatewayExternalUrl == null ? 0 : gatewayExternalUrl!.hashCode) +
      (status.hashCode) +
      (paidAt == null ? 0 : paidAt!.hashCode) +
      (failedAt == null ? 0 : failedAt!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'BillingPaymentAttempt[object=$object, id=$id, paymentId=$paymentId, instanceId=$instanceId, chargeType=$chargeType, payeeId=$payeeId, payee=$payee, payerId=$payerId, payer=$payer, subscriptionItemId=$subscriptionItemId, subscriptionItem=$subscriptionItem, amount=$amount, paymentMethodId=$paymentMethodId, paymentMethod=$paymentMethod, statementId=$statementId, gatewayExternalId=$gatewayExternalId, gatewayExternalUrl=$gatewayExternalUrl, status=$status, paidAt=$paidAt, failedAt=$failedAt, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'payment_id'] = this.paymentId;
    json[r'instance_id'] = this.instanceId;
    json[r'charge_type'] = this.chargeType;
    json[r'payee_id'] = this.payeeId;
    json[r'payee'] = this.payee;
    json[r'payer_id'] = this.payerId;
    json[r'payer'] = this.payer;
    if (this.subscriptionItemId != null) {
      json[r'subscription_item_id'] = this.subscriptionItemId;
    } else {
      json[r'subscription_item_id'] = null;
    }
    if (this.subscriptionItem != null) {
      json[r'subscription_item'] = this.subscriptionItem;
    } else {
      json[r'subscription_item'] = null;
    }
    json[r'amount'] = this.amount;
    json[r'payment_method_id'] = this.paymentMethodId;
    json[r'payment_method'] = this.paymentMethod;
    json[r'statement_id'] = this.statementId;
    if (this.gatewayExternalId != null) {
      json[r'gateway_external_id'] = this.gatewayExternalId;
    } else {
      json[r'gateway_external_id'] = null;
    }
    if (this.gatewayExternalUrl != null) {
      json[r'gateway_external_url'] = this.gatewayExternalUrl;
    } else {
      json[r'gateway_external_url'] = null;
    }
    json[r'status'] = this.status;
    if (this.paidAt != null) {
      json[r'paid_at'] = this.paidAt;
    } else {
      json[r'paid_at'] = null;
    }
    if (this.failedAt != null) {
      json[r'failed_at'] = this.failedAt;
    } else {
      json[r'failed_at'] = null;
    }
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [BillingPaymentAttempt] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BillingPaymentAttempt? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "BillingPaymentAttempt[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "BillingPaymentAttempt[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return BillingPaymentAttempt(
        object: BillingPaymentAttemptObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        paymentId: mapValueOfType<String>(json, r'payment_id')!,
        instanceId: mapValueOfType<String>(json, r'instance_id')!,
        chargeType: mapValueOfType<String>(json, r'charge_type')!,
        payeeId: mapValueOfType<String>(json, r'payee_id')!,
        payee: mapValueOfType<Object>(json, r'payee')!,
        payerId: mapValueOfType<String>(json, r'payer_id')!,
        payer: CommercePayerResponse.fromJson(json[r'payer'])!,
        subscriptionItemId:
            mapValueOfType<String>(json, r'subscription_item_id'),
        subscriptionItem: mapValueOfType<Object>(json, r'subscription_item'),
        amount: CommerceMoneyResponse.fromJson(json[r'amount'])!,
        paymentMethodId: mapValueOfType<String>(json, r'payment_method_id')!,
        paymentMethod:
            CommercePaymentMethodResponse.fromJson(json[r'payment_method'])!,
        statementId: mapValueOfType<String>(json, r'statement_id')!,
        gatewayExternalId: mapValueOfType<String>(json, r'gateway_external_id'),
        gatewayExternalUrl:
            mapValueOfType<String>(json, r'gateway_external_url'),
        status: BillingPaymentAttemptStatusEnum.fromJson(json[r'status'])!,
        paidAt: mapValueOfType<int>(json, r'paid_at'),
        failedAt: mapValueOfType<int>(json, r'failed_at'),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<BillingPaymentAttempt> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BillingPaymentAttempt>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BillingPaymentAttempt.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BillingPaymentAttempt> mapFromJson(dynamic json) {
    final map = <String, BillingPaymentAttempt>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BillingPaymentAttempt.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BillingPaymentAttempt-objects as value to a dart map
  static Map<String, List<BillingPaymentAttempt>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<BillingPaymentAttempt>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BillingPaymentAttempt.listFromJson(
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
    'payment_id',
    'instance_id',
    'charge_type',
    'payee_id',
    'payee',
    'payer_id',
    'payer',
    'amount',
    'payment_method_id',
    'payment_method',
    'statement_id',
    'gateway_external_id',
    'gateway_external_url',
    'status',
    'paid_at',
    'failed_at',
    'created_at',
    'updated_at',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class BillingPaymentAttemptObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const BillingPaymentAttemptObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const commercePayment =
      BillingPaymentAttemptObjectEnum._(r'commerce_payment');

  /// List of all possible values in this [enum][BillingPaymentAttemptObjectEnum].
  static const values = <BillingPaymentAttemptObjectEnum>[
    commercePayment,
  ];

  static BillingPaymentAttemptObjectEnum? fromJson(dynamic value) =>
      BillingPaymentAttemptObjectEnumTypeTransformer().decode(value);

  static List<BillingPaymentAttemptObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BillingPaymentAttemptObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BillingPaymentAttemptObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BillingPaymentAttemptObjectEnum] to String,
/// and [decode] dynamic data back to [BillingPaymentAttemptObjectEnum].
class BillingPaymentAttemptObjectEnumTypeTransformer {
  factory BillingPaymentAttemptObjectEnumTypeTransformer() =>
      _instance ??= const BillingPaymentAttemptObjectEnumTypeTransformer._();

  const BillingPaymentAttemptObjectEnumTypeTransformer._();

  String encode(BillingPaymentAttemptObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a BillingPaymentAttemptObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BillingPaymentAttemptObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'commerce_payment':
          return BillingPaymentAttemptObjectEnum.commercePayment;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [BillingPaymentAttemptObjectEnumTypeTransformer] instance.
  static BillingPaymentAttemptObjectEnumTypeTransformer? _instance;
}

/// The current status of the payment attempt.
class BillingPaymentAttemptStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const BillingPaymentAttemptStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const pending = BillingPaymentAttemptStatusEnum._(r'pending');
  static const paid = BillingPaymentAttemptStatusEnum._(r'paid');
  static const failed = BillingPaymentAttemptStatusEnum._(r'failed');

  /// List of all possible values in this [enum][BillingPaymentAttemptStatusEnum].
  static const values = <BillingPaymentAttemptStatusEnum>[
    pending,
    paid,
    failed,
  ];

  static BillingPaymentAttemptStatusEnum? fromJson(dynamic value) =>
      BillingPaymentAttemptStatusEnumTypeTransformer().decode(value);

  static List<BillingPaymentAttemptStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BillingPaymentAttemptStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BillingPaymentAttemptStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BillingPaymentAttemptStatusEnum] to String,
/// and [decode] dynamic data back to [BillingPaymentAttemptStatusEnum].
class BillingPaymentAttemptStatusEnumTypeTransformer {
  factory BillingPaymentAttemptStatusEnumTypeTransformer() =>
      _instance ??= const BillingPaymentAttemptStatusEnumTypeTransformer._();

  const BillingPaymentAttemptStatusEnumTypeTransformer._();

  String encode(BillingPaymentAttemptStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a BillingPaymentAttemptStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BillingPaymentAttemptStatusEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'pending':
          return BillingPaymentAttemptStatusEnum.pending;
        case r'paid':
          return BillingPaymentAttemptStatusEnum.paid;
        case r'failed':
          return BillingPaymentAttemptStatusEnum.failed;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [BillingPaymentAttemptStatusEnumTypeTransformer] instance.
  static BillingPaymentAttemptStatusEnumTypeTransformer? _instance;
}
