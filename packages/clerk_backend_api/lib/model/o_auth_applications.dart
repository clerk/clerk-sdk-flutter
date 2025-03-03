//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OAuthApplications {
  /// Returns a new [OAuthApplications] instance.
  OAuthApplications({
    this.data = const [],
    required this.totalCount,
  });

  List<OAuthApplication> data;

  /// Total number of OAuth applications
  int totalCount;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OAuthApplications &&
          _deepEquality.equals(other.data, data) &&
          other.totalCount == totalCount;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (data.hashCode) + (totalCount.hashCode);

  @override
  String toString() => 'OAuthApplications[data=$data, totalCount=$totalCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'data'] = this.data;
    json[r'total_count'] = this.totalCount;
    return json;
  }

  /// Returns a new [OAuthApplications] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OAuthApplications? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "OAuthApplications[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "OAuthApplications[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OAuthApplications(
        data: OAuthApplication.listFromJson(json[r'data']),
        totalCount: mapValueOfType<int>(json, r'total_count')!,
      );
    }
    return null;
  }

  static List<OAuthApplications> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OAuthApplications>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OAuthApplications.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OAuthApplications> mapFromJson(dynamic json) {
    final map = <String, OAuthApplications>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OAuthApplications.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OAuthApplications-objects as value to a dart map
  static Map<String, List<OAuthApplications>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<OAuthApplications>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OAuthApplications.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'data',
    'total_count',
  };
}
