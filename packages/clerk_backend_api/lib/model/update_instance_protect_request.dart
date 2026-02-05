//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateInstanceProtectRequest {
  /// Returns a new [UpdateInstanceProtectRequest] instance.
  UpdateInstanceProtectRequest({
    this.rulesEnabled,
    this.specterEnabled,
  });

  bool? rulesEnabled;

  bool? specterEnabled;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateInstanceProtectRequest &&
          other.rulesEnabled == rulesEnabled &&
          other.specterEnabled == specterEnabled;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (rulesEnabled == null ? 0 : rulesEnabled!.hashCode) +
      (specterEnabled == null ? 0 : specterEnabled!.hashCode);

  @override
  String toString() =>
      'UpdateInstanceProtectRequest[rulesEnabled=$rulesEnabled, specterEnabled=$specterEnabled]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.rulesEnabled != null) {
      json[r'rules_enabled'] = this.rulesEnabled;
    } else {
      json[r'rules_enabled'] = null;
    }
    if (this.specterEnabled != null) {
      json[r'specter_enabled'] = this.specterEnabled;
    } else {
      json[r'specter_enabled'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateInstanceProtectRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateInstanceProtectRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UpdateInstanceProtectRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UpdateInstanceProtectRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateInstanceProtectRequest(
        rulesEnabled: mapValueOfType<bool>(json, r'rules_enabled'),
        specterEnabled: mapValueOfType<bool>(json, r'specter_enabled'),
      );
    }
    return null;
  }

  static List<UpdateInstanceProtectRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdateInstanceProtectRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateInstanceProtectRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateInstanceProtectRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateInstanceProtectRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateInstanceProtectRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateInstanceProtectRequest-objects as value to a dart map
  static Map<String, List<UpdateInstanceProtectRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UpdateInstanceProtectRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateInstanceProtectRequest.listFromJson(
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
