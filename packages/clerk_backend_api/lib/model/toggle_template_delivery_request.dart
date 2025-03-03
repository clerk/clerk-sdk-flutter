//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ToggleTemplateDeliveryRequest {
  /// Returns a new [ToggleTemplateDeliveryRequest] instance.
  ToggleTemplateDeliveryRequest({
    this.deliveredByClerk,
  });

  /// Whether Clerk should deliver emails or SMS messages based on the current template
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? deliveredByClerk;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToggleTemplateDeliveryRequest &&
          other.deliveredByClerk == deliveredByClerk;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (deliveredByClerk == null ? 0 : deliveredByClerk!.hashCode);

  @override
  String toString() =>
      'ToggleTemplateDeliveryRequest[deliveredByClerk=$deliveredByClerk]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.deliveredByClerk != null) {
      json[r'delivered_by_clerk'] = this.deliveredByClerk;
    } else {
      json[r'delivered_by_clerk'] = null;
    }
    return json;
  }

  /// Returns a new [ToggleTemplateDeliveryRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ToggleTemplateDeliveryRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ToggleTemplateDeliveryRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ToggleTemplateDeliveryRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ToggleTemplateDeliveryRequest(
        deliveredByClerk: mapValueOfType<bool>(json, r'delivered_by_clerk'),
      );
    }
    return null;
  }

  static List<ToggleTemplateDeliveryRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ToggleTemplateDeliveryRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ToggleTemplateDeliveryRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ToggleTemplateDeliveryRequest> mapFromJson(dynamic json) {
    final map = <String, ToggleTemplateDeliveryRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ToggleTemplateDeliveryRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ToggleTemplateDeliveryRequest-objects as value to a dart map
  static Map<String, List<ToggleTemplateDeliveryRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ToggleTemplateDeliveryRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ToggleTemplateDeliveryRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
