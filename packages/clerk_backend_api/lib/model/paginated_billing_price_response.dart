//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PaginatedBillingPriceResponse {
  /// Returns a new [PaginatedBillingPriceResponse] instance.
  PaginatedBillingPriceResponse({
    this.data = const [],
    required this.totalCount,
  });

  /// Array of prices.
  List<BillingPriceResponse> data;

  /// Total number of prices.
  int totalCount;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginatedBillingPriceResponse &&
          _deepEquality.equals(other.data, data) &&
          other.totalCount == totalCount;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (data.hashCode) + (totalCount.hashCode);

  @override
  String toString() =>
      'PaginatedBillingPriceResponse[data=$data, totalCount=$totalCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'data'] = this.data;
    json[r'total_count'] = this.totalCount;
    return json;
  }

  /// Returns a new [PaginatedBillingPriceResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PaginatedBillingPriceResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "PaginatedBillingPriceResponse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "PaginatedBillingPriceResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PaginatedBillingPriceResponse(
        data: BillingPriceResponse.listFromJson(json[r'data']),
        totalCount: mapValueOfType<int>(json, r'total_count')!,
      );
    }
    return null;
  }

  static List<PaginatedBillingPriceResponse> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PaginatedBillingPriceResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PaginatedBillingPriceResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PaginatedBillingPriceResponse> mapFromJson(dynamic json) {
    final map = <String, PaginatedBillingPriceResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PaginatedBillingPriceResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PaginatedBillingPriceResponse-objects as value to a dart map
  static Map<String, List<PaginatedBillingPriceResponse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<PaginatedBillingPriceResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PaginatedBillingPriceResponse.listFromJson(
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
