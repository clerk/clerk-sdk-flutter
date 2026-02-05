//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CommercePaymentSourceResponse {
  /// Returns a new [CommercePaymentSourceResponse] instance.
  CommercePaymentSourceResponse({
    required this.object,
    required this.id,
    required this.payerId,
    required this.paymentMethod,
    this.isDefault,
    required this.gateway,
    required this.gatewayExternalId,
    this.gatewayExternalAccountId,
    required this.last4,
    required this.status,
    required this.walletType,
    required this.cardType,
    this.expiryYear,
    this.expiryMonth,
    required this.createdAt,
    required this.updatedAt,
    this.isRemovable,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  CommercePaymentSourceResponseObjectEnum object;

  /// Unique identifier for the payment source.
  String id;

  /// Unique identifier for the payer.
  String payerId;

  /// The payment method type.
  CommercePaymentSourceResponsePaymentMethodEnum paymentMethod;

  /// Whether this is the default payment source for the payer.
  bool? isDefault;

  /// The payment gateway.
  String gateway;

  /// External ID in the payment gateway.
  String gatewayExternalId;

  /// External account ID in the payment gateway.
  String? gatewayExternalAccountId;

  /// Last 4 digits of the card (for card payment sources).
  String last4;

  /// Status of the payment source.
  CommercePaymentSourceResponseStatusEnum status;

  /// Type of wallet (if applicable).
  String walletType;

  /// Type of card (if applicable).
  String cardType;

  /// Card expiration year (for card payment sources).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? expiryYear;

  /// Card expiration month (for card payment sources).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? expiryMonth;

  /// Unix timestamp (in milliseconds) when the payment source was created.
  int createdAt;

  /// Unix timestamp (in milliseconds) when the payment source was last updated.
  int updatedAt;

  /// Whether this payment source can be removed.
  bool? isRemovable;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommercePaymentSourceResponse &&
          other.object == object &&
          other.id == id &&
          other.payerId == payerId &&
          other.paymentMethod == paymentMethod &&
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
      (paymentMethod.hashCode) +
      (isDefault == null ? 0 : isDefault!.hashCode) +
      (gateway.hashCode) +
      (gatewayExternalId.hashCode) +
      (gatewayExternalAccountId == null
          ? 0
          : gatewayExternalAccountId!.hashCode) +
      (last4.hashCode) +
      (status.hashCode) +
      (walletType.hashCode) +
      (cardType.hashCode) +
      (expiryYear == null ? 0 : expiryYear!.hashCode) +
      (expiryMonth == null ? 0 : expiryMonth!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode) +
      (isRemovable == null ? 0 : isRemovable!.hashCode);

  @override
  String toString() =>
      'CommercePaymentSourceResponse[object=$object, id=$id, payerId=$payerId, paymentMethod=$paymentMethod, isDefault=$isDefault, gateway=$gateway, gatewayExternalId=$gatewayExternalId, gatewayExternalAccountId=$gatewayExternalAccountId, last4=$last4, status=$status, walletType=$walletType, cardType=$cardType, expiryYear=$expiryYear, expiryMonth=$expiryMonth, createdAt=$createdAt, updatedAt=$updatedAt, isRemovable=$isRemovable]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'payer_id'] = this.payerId;
    json[r'payment_method'] = this.paymentMethod;
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
    json[r'last4'] = this.last4;
    json[r'status'] = this.status;
    json[r'wallet_type'] = this.walletType;
    json[r'card_type'] = this.cardType;
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
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    if (this.isRemovable != null) {
      json[r'is_removable'] = this.isRemovable;
    } else {
      json[r'is_removable'] = null;
    }
    return json;
  }

  /// Returns a new [CommercePaymentSourceResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CommercePaymentSourceResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CommercePaymentSourceResponse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CommercePaymentSourceResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CommercePaymentSourceResponse(
        object:
            CommercePaymentSourceResponseObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        payerId: mapValueOfType<String>(json, r'payer_id')!,
        paymentMethod: CommercePaymentSourceResponsePaymentMethodEnum.fromJson(
            json[r'payment_method'])!,
        isDefault: mapValueOfType<bool>(json, r'is_default'),
        gateway: mapValueOfType<String>(json, r'gateway')!,
        gatewayExternalId:
            mapValueOfType<String>(json, r'gateway_external_id')!,
        gatewayExternalAccountId:
            mapValueOfType<String>(json, r'gateway_external_account_id'),
        last4: mapValueOfType<String>(json, r'last4')!,
        status:
            CommercePaymentSourceResponseStatusEnum.fromJson(json[r'status'])!,
        walletType: mapValueOfType<String>(json, r'wallet_type')!,
        cardType: mapValueOfType<String>(json, r'card_type')!,
        expiryYear: mapValueOfType<int>(json, r'expiry_year'),
        expiryMonth: mapValueOfType<int>(json, r'expiry_month'),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
        isRemovable: mapValueOfType<bool>(json, r'is_removable'),
      );
    }
    return null;
  }

  static List<CommercePaymentSourceResponse> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommercePaymentSourceResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommercePaymentSourceResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CommercePaymentSourceResponse> mapFromJson(dynamic json) {
    final map = <String, CommercePaymentSourceResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CommercePaymentSourceResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CommercePaymentSourceResponse-objects as value to a dart map
  static Map<String, List<CommercePaymentSourceResponse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CommercePaymentSourceResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CommercePaymentSourceResponse.listFromJson(
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
    'payment_method',
    'gateway',
    'gateway_external_id',
    'last4',
    'status',
    'wallet_type',
    'card_type',
    'created_at',
    'updated_at',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class CommercePaymentSourceResponseObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const CommercePaymentSourceResponseObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const commerceSource =
      CommercePaymentSourceResponseObjectEnum._(r'commerce_source');

  /// List of all possible values in this [enum][CommercePaymentSourceResponseObjectEnum].
  static const values = <CommercePaymentSourceResponseObjectEnum>[
    commerceSource,
  ];

  static CommercePaymentSourceResponseObjectEnum? fromJson(dynamic value) =>
      CommercePaymentSourceResponseObjectEnumTypeTransformer().decode(value);

  static List<CommercePaymentSourceResponseObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommercePaymentSourceResponseObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommercePaymentSourceResponseObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CommercePaymentSourceResponseObjectEnum] to String,
/// and [decode] dynamic data back to [CommercePaymentSourceResponseObjectEnum].
class CommercePaymentSourceResponseObjectEnumTypeTransformer {
  factory CommercePaymentSourceResponseObjectEnumTypeTransformer() =>
      _instance ??=
          const CommercePaymentSourceResponseObjectEnumTypeTransformer._();

  const CommercePaymentSourceResponseObjectEnumTypeTransformer._();

  String encode(CommercePaymentSourceResponseObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CommercePaymentSourceResponseObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CommercePaymentSourceResponseObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'commerce_source':
          return CommercePaymentSourceResponseObjectEnum.commerceSource;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CommercePaymentSourceResponseObjectEnumTypeTransformer] instance.
  static CommercePaymentSourceResponseObjectEnumTypeTransformer? _instance;
}

/// The payment method type.
class CommercePaymentSourceResponsePaymentMethodEnum {
  /// Instantiate a new enum with the provided [value].
  const CommercePaymentSourceResponsePaymentMethodEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const card = CommercePaymentSourceResponsePaymentMethodEnum._(r'card');
  static const applePay =
      CommercePaymentSourceResponsePaymentMethodEnum._(r'apple_pay');
  static const googlePay =
      CommercePaymentSourceResponsePaymentMethodEnum._(r'google_pay');

  /// List of all possible values in this [enum][CommercePaymentSourceResponsePaymentMethodEnum].
  static const values = <CommercePaymentSourceResponsePaymentMethodEnum>[
    card,
    applePay,
    googlePay,
  ];

  static CommercePaymentSourceResponsePaymentMethodEnum? fromJson(
          dynamic value) =>
      CommercePaymentSourceResponsePaymentMethodEnumTypeTransformer()
          .decode(value);

  static List<CommercePaymentSourceResponsePaymentMethodEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommercePaymentSourceResponsePaymentMethodEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            CommercePaymentSourceResponsePaymentMethodEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CommercePaymentSourceResponsePaymentMethodEnum] to String,
/// and [decode] dynamic data back to [CommercePaymentSourceResponsePaymentMethodEnum].
class CommercePaymentSourceResponsePaymentMethodEnumTypeTransformer {
  factory CommercePaymentSourceResponsePaymentMethodEnumTypeTransformer() =>
      _instance ??=
          const CommercePaymentSourceResponsePaymentMethodEnumTypeTransformer
              ._();

  const CommercePaymentSourceResponsePaymentMethodEnumTypeTransformer._();

  String encode(CommercePaymentSourceResponsePaymentMethodEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a CommercePaymentSourceResponsePaymentMethodEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CommercePaymentSourceResponsePaymentMethodEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'card':
          return CommercePaymentSourceResponsePaymentMethodEnum.card;
        case r'apple_pay':
          return CommercePaymentSourceResponsePaymentMethodEnum.applePay;
        case r'google_pay':
          return CommercePaymentSourceResponsePaymentMethodEnum.googlePay;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CommercePaymentSourceResponsePaymentMethodEnumTypeTransformer] instance.
  static CommercePaymentSourceResponsePaymentMethodEnumTypeTransformer?
      _instance;
}

/// Status of the payment source.
class CommercePaymentSourceResponseStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const CommercePaymentSourceResponseStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const active = CommercePaymentSourceResponseStatusEnum._(r'active');
  static const disconnected =
      CommercePaymentSourceResponseStatusEnum._(r'disconnected');

  /// List of all possible values in this [enum][CommercePaymentSourceResponseStatusEnum].
  static const values = <CommercePaymentSourceResponseStatusEnum>[
    active,
    disconnected,
  ];

  static CommercePaymentSourceResponseStatusEnum? fromJson(dynamic value) =>
      CommercePaymentSourceResponseStatusEnumTypeTransformer().decode(value);

  static List<CommercePaymentSourceResponseStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommercePaymentSourceResponseStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommercePaymentSourceResponseStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CommercePaymentSourceResponseStatusEnum] to String,
/// and [decode] dynamic data back to [CommercePaymentSourceResponseStatusEnum].
class CommercePaymentSourceResponseStatusEnumTypeTransformer {
  factory CommercePaymentSourceResponseStatusEnumTypeTransformer() =>
      _instance ??=
          const CommercePaymentSourceResponseStatusEnumTypeTransformer._();

  const CommercePaymentSourceResponseStatusEnumTypeTransformer._();

  String encode(CommercePaymentSourceResponseStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CommercePaymentSourceResponseStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CommercePaymentSourceResponseStatusEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'active':
          return CommercePaymentSourceResponseStatusEnum.active;
        case r'disconnected':
          return CommercePaymentSourceResponseStatusEnum.disconnected;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CommercePaymentSourceResponseStatusEnumTypeTransformer] instance.
  static CommercePaymentSourceResponseStatusEnumTypeTransformer? _instance;
}
