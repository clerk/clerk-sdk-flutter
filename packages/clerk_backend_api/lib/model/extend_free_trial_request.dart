//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ExtendFreeTrialRequest {
  /// Returns a new [ExtendFreeTrialRequest] instance.
  ExtendFreeTrialRequest({
    required this.extendTo,
  });

  /// RFC3339 timestamp to extend the free trial to. Must be in the future and not more than 365 days from now.
  DateTime extendTo;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtendFreeTrialRequest && other.extendTo == extendTo;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (extendTo.hashCode);

  @override
  String toString() => 'ExtendFreeTrialRequest[extendTo=$extendTo]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'extend_to'] = this.extendTo.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [ExtendFreeTrialRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ExtendFreeTrialRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ExtendFreeTrialRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ExtendFreeTrialRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ExtendFreeTrialRequest(
        extendTo: mapDateTime(json, r'extend_to', r'')!,
      );
    }
    return null;
  }

  static List<ExtendFreeTrialRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ExtendFreeTrialRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ExtendFreeTrialRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ExtendFreeTrialRequest> mapFromJson(dynamic json) {
    final map = <String, ExtendFreeTrialRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ExtendFreeTrialRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ExtendFreeTrialRequest-objects as value to a dart map
  static Map<String, List<ExtendFreeTrialRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ExtendFreeTrialRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ExtendFreeTrialRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'extend_to',
  };
}
