//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CommercePriceTransitionResponse {
  /// Returns a new [CommercePriceTransitionResponse] instance.
  CommercePriceTransitionResponse({
    required this.object,
    required this.subscriptionItem,
    required this.transition,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  CommercePriceTransitionResponseObjectEnum object;

  SchemasCommerceSubscriptionItem subscriptionItem;

  CommercePriceTransitionDetails transition;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommercePriceTransitionResponse &&
          other.object == object &&
          other.subscriptionItem == subscriptionItem &&
          other.transition == transition;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) + (subscriptionItem.hashCode) + (transition.hashCode);

  @override
  String toString() =>
      'CommercePriceTransitionResponse[object=$object, subscriptionItem=$subscriptionItem, transition=$transition]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'subscription_item'] = this.subscriptionItem;
    json[r'transition'] = this.transition;
    return json;
  }

  /// Returns a new [CommercePriceTransitionResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CommercePriceTransitionResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CommercePriceTransitionResponse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CommercePriceTransitionResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CommercePriceTransitionResponse(
        object: CommercePriceTransitionResponseObjectEnum.fromJson(
            json[r'object'])!,
        subscriptionItem: SchemasCommerceSubscriptionItem.fromJson(
            json[r'subscription_item'])!,
        transition:
            CommercePriceTransitionDetails.fromJson(json[r'transition'])!,
      );
    }
    return null;
  }

  static List<CommercePriceTransitionResponse> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommercePriceTransitionResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommercePriceTransitionResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CommercePriceTransitionResponse> mapFromJson(
      dynamic json) {
    final map = <String, CommercePriceTransitionResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CommercePriceTransitionResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CommercePriceTransitionResponse-objects as value to a dart map
  static Map<String, List<CommercePriceTransitionResponse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CommercePriceTransitionResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CommercePriceTransitionResponse.listFromJson(
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
    'subscription_item',
    'transition',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class CommercePriceTransitionResponseObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const CommercePriceTransitionResponseObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const commercePriceTransition =
      CommercePriceTransitionResponseObjectEnum._(r'commerce_price_transition');

  /// List of all possible values in this [enum][CommercePriceTransitionResponseObjectEnum].
  static const values = <CommercePriceTransitionResponseObjectEnum>[
    commercePriceTransition,
  ];

  static CommercePriceTransitionResponseObjectEnum? fromJson(dynamic value) =>
      CommercePriceTransitionResponseObjectEnumTypeTransformer().decode(value);

  static List<CommercePriceTransitionResponseObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CommercePriceTransitionResponseObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommercePriceTransitionResponseObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CommercePriceTransitionResponseObjectEnum] to String,
/// and [decode] dynamic data back to [CommercePriceTransitionResponseObjectEnum].
class CommercePriceTransitionResponseObjectEnumTypeTransformer {
  factory CommercePriceTransitionResponseObjectEnumTypeTransformer() =>
      _instance ??=
          const CommercePriceTransitionResponseObjectEnumTypeTransformer._();

  const CommercePriceTransitionResponseObjectEnumTypeTransformer._();

  String encode(CommercePriceTransitionResponseObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CommercePriceTransitionResponseObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CommercePriceTransitionResponseObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'commerce_price_transition':
          return CommercePriceTransitionResponseObjectEnum
              .commercePriceTransition;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CommercePriceTransitionResponseObjectEnumTypeTransformer] instance.
  static CommercePriceTransitionResponseObjectEnumTypeTransformer? _instance;
}
