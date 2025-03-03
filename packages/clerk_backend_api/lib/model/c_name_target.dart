//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CNameTarget {
  /// Returns a new [CNameTarget] instance.
  CNameTarget({
    required this.host,
    required this.value,
    required this.required_,
  });

  String host;

  String value;

  /// Denotes whether this CNAME target is required to be set in order for the domain to be considered deployed.
  bool required_;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CNameTarget &&
          other.host == host &&
          other.value == value &&
          other.required_ == required_;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (host.hashCode) + (value.hashCode) + (required_.hashCode);

  @override
  String toString() =>
      'CNameTarget[host=$host, value=$value, required_=$required_]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'host'] = this.host;
    json[r'value'] = this.value;
    json[r'required'] = this.required_;
    return json;
  }

  /// Returns a new [CNameTarget] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CNameTarget? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CNameTarget[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CNameTarget[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CNameTarget(
        host: mapValueOfType<String>(json, r'host')!,
        value: mapValueOfType<String>(json, r'value')!,
        required_: mapValueOfType<bool>(json, r'required')!,
      );
    }
    return null;
  }

  static List<CNameTarget> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CNameTarget>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CNameTarget.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CNameTarget> mapFromJson(dynamic json) {
    final map = <String, CNameTarget>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CNameTarget.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CNameTarget-objects as value to a dart map
  static Map<String, List<CNameTarget>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CNameTarget>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CNameTarget.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'host',
    'value',
    'required',
  };
}
