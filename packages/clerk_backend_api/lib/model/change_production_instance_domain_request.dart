//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ChangeProductionInstanceDomainRequest {
  /// Returns a new [ChangeProductionInstanceDomainRequest] instance.
  ChangeProductionInstanceDomainRequest({
    this.homeUrl,
    this.isSecondary,
  });

  /// The new home URL of the production instance e.g. https://www.example.com
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? homeUrl;

  /// Whether this is a domain for a secondary app, meaning that any subdomain provided is significant and will be stored as part of the domain. This is useful for supporting multiple apps (one primary and multiple secondaries) on the same root domain (eTLD+1).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isSecondary;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChangeProductionInstanceDomainRequest &&
          other.homeUrl == homeUrl &&
          other.isSecondary == isSecondary;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (homeUrl == null ? 0 : homeUrl!.hashCode) +
      (isSecondary == null ? 0 : isSecondary!.hashCode);

  @override
  String toString() =>
      'ChangeProductionInstanceDomainRequest[homeUrl=$homeUrl, isSecondary=$isSecondary]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.homeUrl != null) {
      json[r'home_url'] = this.homeUrl;
    } else {
      json[r'home_url'] = null;
    }
    if (this.isSecondary != null) {
      json[r'is_secondary'] = this.isSecondary;
    } else {
      json[r'is_secondary'] = null;
    }
    return json;
  }

  /// Returns a new [ChangeProductionInstanceDomainRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChangeProductionInstanceDomainRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ChangeProductionInstanceDomainRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ChangeProductionInstanceDomainRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ChangeProductionInstanceDomainRequest(
        homeUrl: mapValueOfType<String>(json, r'home_url'),
        isSecondary: mapValueOfType<bool>(json, r'is_secondary'),
      );
    }
    return null;
  }

  static List<ChangeProductionInstanceDomainRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ChangeProductionInstanceDomainRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChangeProductionInstanceDomainRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ChangeProductionInstanceDomainRequest> mapFromJson(
      dynamic json) {
    final map = <String, ChangeProductionInstanceDomainRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            ChangeProductionInstanceDomainRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ChangeProductionInstanceDomainRequest-objects as value to a dart map
  static Map<String, List<ChangeProductionInstanceDomainRequest>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ChangeProductionInstanceDomainRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ChangeProductionInstanceDomainRequest.listFromJson(
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
