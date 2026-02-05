//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetApiKeys200Response {
  /// Returns a new [GetApiKeys200Response] instance.
  GetApiKeys200Response({
    this.data = const [],
    required this.totalCount,
  });

  List<GetApiKeys200ResponseDataInner> data;

  num totalCount;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetApiKeys200Response &&
          _deepEquality.equals(other.data, data) &&
          other.totalCount == totalCount;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (data.hashCode) + (totalCount.hashCode);

  @override
  String toString() =>
      'GetApiKeys200Response[data=$data, totalCount=$totalCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'data'] = this.data;
    json[r'total_count'] = this.totalCount;
    return json;
  }

  /// Returns a new [GetApiKeys200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetApiKeys200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "GetApiKeys200Response[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "GetApiKeys200Response[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetApiKeys200Response(
        data: GetApiKeys200ResponseDataInner.listFromJson(json[r'data']),
        totalCount: num.parse('${json[r'total_count']}'),
      );
    }
    return null;
  }

  static List<GetApiKeys200Response> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <GetApiKeys200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetApiKeys200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetApiKeys200Response> mapFromJson(dynamic json) {
    final map = <String, GetApiKeys200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetApiKeys200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetApiKeys200Response-objects as value to a dart map
  static Map<String, List<GetApiKeys200Response>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<GetApiKeys200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetApiKeys200Response.listFromJson(
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
