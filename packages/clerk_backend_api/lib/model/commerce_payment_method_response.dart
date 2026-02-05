//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CommercePaymentMethodResponse {
  /// Returns a new [CommercePaymentMethodResponse] instance.
  CommercePaymentMethodResponse({
    required this.object,
    required this.id,
    required this.payerId,
    required this.paymentType,
    this.isDefault,
    required this.gateway,
    required this.gatewayExternalId,
    required this.gatewayExternalAccountId,
    required this.last4,
    required this.status,
    this.walletType,
    required this.cardType,
    this.expiryYear,
    this.expiryMonth,
    this.createdAt,
    this.updatedAt,
    this.isRemovable,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  CommercePaymentMethodResponseObjectEnum object;

  /// Unique identifier for the payment method.
  String id;

  /// Unique identifier for the payer.
  String payerId;

  /// The payment method type.
  CommercePaymentMethodResponsePaymentTypeEnum paymentType;

  /// Whether this is the default payment method for the payer.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isDefault;

  /// The payment gateway.
  String gateway;

  /// External ID in the payment gateway.
  String gatewayExternalId;

  /// External account ID in the payment gateway.
  String? gatewayExternalAccountId;

  /// Last 4 digits of the card (for card payment methods).
  String? last4;

  /// Status of the payment method.
  CommercePaymentMethodResponseStatusEnum status;

  /// Type of wallet (if applicable).
  String? walletType;

  /// Type of card (if applicable).
  String? cardType;

  /// Card expiration year (for card payment methods).
  int? expiryYear;

  /// Card expiration month (for card payment methods).
  int? expiryMonth;

  /// Unix timestamp (in milliseconds) when the payment method was created.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? createdAt;

  /// Unix timestamp (in milliseconds) when the payment method was last updated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? updatedAt;

  /// Whether this payment method can be removed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isRemovable;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommercePaymentMethodResponse &&
          other.object == object &&
          other.id == id &&
          other.payerId == payerId &&
          other.paymentType == paymentType &&
          other.isDefault == isDefault &&
          other.gateway == gateway &&
          other.gatewayExternalId == gatewayExternalId &&
          other.gatewayExternalAccountId == gatewayExternalAccountId &&
          other.last4 == last4 &&
          other.status == status &&
          other.walletType == walletType &&
          other.cardType == cardType &&
          other.expiryYear == expiryYear &&
          other.expiryMonth == expiryMonth &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt &&
          other.isRemovable == isRemovable;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (payerId.hashCode) +
      (paymentType.hashCode) +
      (isDefault == null ? 0 : isDefault!.hashCode) +
      (gateway.hashCode) +
      (gatewayExternalId.hashCode) +
      (gatewayExternalAccountId == null
          ? 0
          : gatewayExternalAccountId!.hashCode) +
      (last4 == null ? 0 : last4!.hashCode) +
      (status.hashCode) +
      (walletType == null ? 0 : walletType!.hashCode) +
      (cardType == null ? 0 : cardType!.hashCode) +
      (expiryYear == null ? 0 : expiryYear!.hashCode) +
      (expiryMonth == null ? 0 : expiryMonth!.hashCode) +
      (createdAt == null ? 0 : createdAt!.hashCode) +
      (updatedAt == null ? 0 : updatedAt!.hashCode) +
      (isRemovable == null ? 0 : isRemovable!.hashCode);

  @override
  String toString() =>
      'CommercePaymentMethodResponse[object=$object, id=$id, payerId=$payerId, paymentType=$paymentType, isDefault=$isDefault, gateway=$gateway, gatewayExternalId=$gatewayExternalId, gatewayExternalAccountId=$gatewayExternalAccountId, last4=$last4, status=$status, walletType=$walletType, cardType=$cardType, expiryYear=$expiryYear, expiryMonth=$expiryMonth, createdAt=$createdAt, updatedAt=$updatedAt, isRemovable=$isRemovable]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'payer_id'] = this.payerId;
    json[r'payment_type'] = this.paymentType;
    if (this.isDefault != null) {
      json[r'is_default'] = this.isDefault;
    } else {
      json[r'is_default'] = null;
    }
    json[r'gateway'] = this.gateway;
    json[r'gateway_external_id'] = this.gatewayExternalId;
    if (this.gatewayExternalAccountId != null) {
      json[r'gateway_external_account_id'] = this.gatewayExternalAccountId;
    } else {
      json[r'gateway_external_account_id'] = null;
    }
    if (this.last4 != null) {
      json[r'last4'] = this.last4;
    } else {
      json[r'last4'] = null;
    }
    json[r'status'] = this.status;
    if (this.walletType != null) {
      json[r'wallet_type'] = this.walletType;
    } else {
      json[r'wallet_type'] = null;
    }
    if (this.cardType != null) {
      json[r'card_type'] = this.cardType;
    } else {
      json[r'card_type'] = null;
    }
    if (this.expiryYear != null) {
      json[r'expiry_year'] = this.expiryYear;
    } else {
      json[r'expiry_year'] = null;
    }
    if (this.expiryMonth != null) {
      json[r'expiry_month'] = this.expiryMonth;
    } else {
      json[r'expiry_month'] = null;
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
    if (this.isRemovable != null) {
      json[r'is_removable'] = this.isRemovable;
    } else {
      json[r'is_removable'] = null;
    }
    return json;
  }

  /// Returns a new [CommercePaymentMethodResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CommercePaymentMethodResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CommercePaymentMethodResponse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CommercePaymentMethodResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CommercePaymentMethodResponse(
        object:
            CommercePaymentMethodResponseObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        payerId: mapValueOfType<String>(json, r'payer_id')!,
        paymentType: CommercePaymentMethodResponsePaymentTypeEnum.fromJson(
            json[r'payment_type'])!,
        isDefault: mapValueOfType<bool>(json, r'is_default'),
        gateway: mapValueOfType<String>(json, r'gateway')!,
        gatewayExternalId:
            mapValueOfType<String>(json, r'gateway_external_id')!,
        gatewayExternalAccountId:
            mapValueOfType<String>(json, r'gateway_external_account_id'),
        last4: mapValueOfType<String>(json, r'last4'),
        status:
            CommercePaymentMethodResponseStatusEnum.fromJson(json[r'status'])!,
        walletType: mapValueOfType<String>(json, r'wallet_type'),
        cardType: mapValueOfType<String>(json, r'card_type'),
        expiryYear: mapValueOfType<int>(json, r'expiry_year'),
        expiryMonth: mapValueOfType<int>(json, r'expiry_month'),
        createdAt: mapValueOfType<int>(json, r'created_at'),
        updatedAt: mapValueOfType<int>(json, r'updated_at'),
        isRemovable: mapValueOfType<bool>(json, r'is_removable'),
      );
    }
    return null;
  }

  static List<CommercePaymentMethodResponse> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommercePaymentMethodResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommercePaymentMethodResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CommercePaymentMethodResponse> mapFromJson(dynamic json) {
    final map = <String, CommercePaymentMethodResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CommercePaymentMethodResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CommercePaymentMethodResponse-objects as value to a dart map
  static Map<String, List<CommercePaymentMethodResponse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CommercePaymentMethodResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CommercePaymentMethodResponse.listFromJson(
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
    'payer_id',
    'payment_type',
    'gateway',
    'gateway_external_id',
    'gateway_external_account_id',
    'last4',
    'status',
    'card_type',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class CommercePaymentMethodResponseObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const CommercePaymentMethodResponseObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const commercePaymentMethod =
      CommercePaymentMethodResponseObjectEnum._(r'commerce_payment_method');

  /// List of all possible values in this [enum][CommercePaymentMethodResponseObjectEnum].
  static const values = <CommercePaymentMethodResponseObjectEnum>[
    commercePaymentMethod,
  ];

  static CommercePaymentMethodResponseObjectEnum? fromJson(dynamic value) =>
      CommercePaymentMethodResponseObjectEnumTypeTransformer().decode(value);

  static List<CommercePaymentMethodResponseObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommercePaymentMethodResponseObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommercePaymentMethodResponseObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CommercePaymentMethodResponseObjectEnum] to String,
/// and [decode] dynamic data back to [CommercePaymentMethodResponseObjectEnum].
class CommercePaymentMethodResponseObjectEnumTypeTransformer {
  factory CommercePaymentMethodResponseObjectEnumTypeTransformer() =>
      _instance ??=
          const CommercePaymentMethodResponseObjectEnumTypeTransformer._();

  const CommercePaymentMethodResponseObjectEnumTypeTransformer._();

  String encode(CommercePaymentMethodResponseObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CommercePaymentMethodResponseObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CommercePaymentMethodResponseObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'commerce_payment_method':
          return CommercePaymentMethodResponseObjectEnum.commercePaymentMethod;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CommercePaymentMethodResponseObjectEnumTypeTransformer] instance.
  static CommercePaymentMethodResponseObjectEnumTypeTransformer? _instance;
}

/// The payment method type.
class CommercePaymentMethodResponsePaymentTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const CommercePaymentMethodResponsePaymentTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const card = CommercePaymentMethodResponsePaymentTypeEnum._(r'card');
  static const link = CommercePaymentMethodResponsePaymentTypeEnum._(r'link');

  /// List of all possible values in this [enum][CommercePaymentMethodResponsePaymentTypeEnum].
  static const values = <CommercePaymentMethodResponsePaymentTypeEnum>[
    card,
    link,
  ];

  static CommercePaymentMethodResponsePaymentTypeEnum? fromJson(
          dynamic value) =>
      CommercePaymentMethodResponsePaymentTypeEnumTypeTransformer()
          .decode(value);

  static List<CommercePaymentMethodResponsePaymentTypeEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommercePaymentMethodResponsePaymentTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            CommercePaymentMethodResponsePaymentTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CommercePaymentMethodResponsePaymentTypeEnum] to String,
/// and [decode] dynamic data back to [CommercePaymentMethodResponsePaymentTypeEnum].
class CommercePaymentMethodResponsePaymentTypeEnumTypeTransformer {
  factory CommercePaymentMethodResponsePaymentTypeEnumTypeTransformer() =>
      _instance ??=
          const CommercePaymentMethodResponsePaymentTypeEnumTypeTransformer._();

  const CommercePaymentMethodResponsePaymentTypeEnumTypeTransformer._();

  String encode(CommercePaymentMethodResponsePaymentTypeEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a CommercePaymentMethodResponsePaymentTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CommercePaymentMethodResponsePaymentTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'card':
          return CommercePaymentMethodResponsePaymentTypeEnum.card;
        case r'link':
          return CommercePaymentMethodResponsePaymentTypeEnum.link;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CommercePaymentMethodResponsePaymentTypeEnumTypeTransformer] instance.
  static CommercePaymentMethodResponsePaymentTypeEnumTypeTransformer? _instance;
}

/// Status of the payment method.
class CommercePaymentMethodResponseStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const CommercePaymentMethodResponseStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const active = CommercePaymentMethodResponseStatusEnum._(r'active');
  static const disconnected =
      CommercePaymentMethodResponseStatusEnum._(r'disconnected');

  /// List of all possible values in this [enum][CommercePaymentMethodResponseStatusEnum].
  static const values = <CommercePaymentMethodResponseStatusEnum>[
    active,
    disconnected,
  ];

  static CommercePaymentMethodResponseStatusEnum? fromJson(dynamic value) =>
      CommercePaymentMethodResponseStatusEnumTypeTransformer().decode(value);

  static List<CommercePaymentMethodResponseStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommercePaymentMethodResponseStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommercePaymentMethodResponseStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CommercePaymentMethodResponseStatusEnum] to String,
/// and [decode] dynamic data back to [CommercePaymentMethodResponseStatusEnum].
class CommercePaymentMethodResponseStatusEnumTypeTransformer {
  factory CommercePaymentMethodResponseStatusEnumTypeTransformer() =>
      _instance ??=
          const CommercePaymentMethodResponseStatusEnumTypeTransformer._();

  const CommercePaymentMethodResponseStatusEnumTypeTransformer._();

  String encode(CommercePaymentMethodResponseStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CommercePaymentMethodResponseStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CommercePaymentMethodResponseStatusEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'active':
          return CommercePaymentMethodResponseStatusEnum.active;
        case r'disconnected':
          return CommercePaymentMethodResponseStatusEnum.disconnected;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CommercePaymentMethodResponseStatusEnumTypeTransformer] instance.
  static CommercePaymentMethodResponseStatusEnumTypeTransformer? _instance;
}
