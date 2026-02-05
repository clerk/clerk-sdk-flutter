//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PriceTransitionRequest {
  /// Returns a new [PriceTransitionRequest] instance.
  PriceTransitionRequest({
    required this.fromPriceId,
    required this.toPriceId,
  });

  /// The current price ID of the subscription item.
  String fromPriceId;

  /// The target price ID to transition to.
  String toPriceId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceTransitionRequest &&
          other.fromPriceId == fromPriceId &&
          other.toPriceId == toPriceId;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (fromPriceId.hashCode) + (toPriceId.hashCode);

  @override
  String toString() =>
      'PriceTransitionRequest[fromPriceId=$fromPriceId, toPriceId=$toPriceId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'from_price_id'] = this.fromPriceId;
    json[r'to_price_id'] = this.toPriceId;
    return json;
  }

  /// Returns a new [PriceTransitionRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PriceTransitionRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "PriceTransitionRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "PriceTransitionRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PriceTransitionRequest(
        fromPriceId: mapValueOfType<String>(json, r'from_price_id')!,
        toPriceId: mapValueOfType<String>(json, r'to_price_id')!,
      );
    }
    return null;
  }

  static List<PriceTransitionRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PriceTransitionRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PriceTransitionRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PriceTransitionRequest> mapFromJson(dynamic json) {
    final map = <String, PriceTransitionRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PriceTransitionRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PriceTransitionRequest-objects as value to a dart map
  static Map<String, List<PriceTransitionRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<PriceTransitionRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PriceTransitionRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'from_price_id',
    'to_price_id',
  };
}
