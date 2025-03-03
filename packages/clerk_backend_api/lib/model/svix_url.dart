//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SvixURL {
  /// Returns a new [SvixURL] instance.
  SvixURL({
    required this.svixUrl,
  });

  String svixUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SvixURL && other.svixUrl == svixUrl;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (svixUrl.hashCode);

  @override
  String toString() => 'SvixURL[svixUrl=$svixUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'svix_url'] = this.svixUrl;
    return json;
  }

  /// Returns a new [SvixURL] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SvixURL? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SvixURL[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SvixURL[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SvixURL(
        svixUrl: mapValueOfType<String>(json, r'svix_url')!,
      );
    }
    return null;
  }

  static List<SvixURL> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SvixURL>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SvixURL.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SvixURL> mapFromJson(dynamic json) {
    final map = <String, SvixURL>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SvixURL.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SvixURL-objects as value to a dart map
  static Map<String, List<SvixURL>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SvixURL>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SvixURL.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'svix_url',
  };
}
