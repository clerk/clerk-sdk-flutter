//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SAMLConnections {
  /// Returns a new [SAMLConnections] instance.
  SAMLConnections({
    this.data = const [],
    required this.totalCount,
  });

  List<SchemasSAMLConnection> data;

  /// Total number of SAML Connections
  int totalCount;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SAMLConnections &&
          _deepEquality.equals(other.data, data) &&
          other.totalCount == totalCount;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (data.hashCode) + (totalCount.hashCode);

  @override
  String toString() => 'SAMLConnections[data=$data, totalCount=$totalCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'data'] = this.data;
    json[r'total_count'] = this.totalCount;
    return json;
  }

  /// Returns a new [SAMLConnections] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SAMLConnections? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SAMLConnections[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SAMLConnections[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SAMLConnections(
        data: SchemasSAMLConnection.listFromJson(json[r'data']),
        totalCount: mapValueOfType<int>(json, r'total_count')!,
      );
    }
    return null;
  }

  static List<SAMLConnections> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SAMLConnections>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SAMLConnections.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SAMLConnections> mapFromJson(dynamic json) {
    final map = <String, SAMLConnections>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SAMLConnections.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SAMLConnections-objects as value to a dart map
  static Map<String, List<SAMLConnections>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SAMLConnections>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SAMLConnections.listFromJson(
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
