//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AddDomainRequest {
  /// Returns a new [AddDomainRequest] instance.
  AddDomainRequest({
    required this.name,
    required this.isSatellite,
    this.proxyUrl,
  });

  /// The new domain name. Can contain the port for development instances.
  String name;

  /// Marks the new domain as satellite. Only `true` is accepted at the moment.
  bool isSatellite;

  /// The full URL of the proxy which will forward requests to the Clerk Frontend API for this domain. Applicable only to production instances.
  String? proxyUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddDomainRequest &&
          other.name == name &&
          other.isSatellite == isSatellite &&
          other.proxyUrl == proxyUrl;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name.hashCode) +
      (isSatellite.hashCode) +
      (proxyUrl == null ? 0 : proxyUrl!.hashCode);

  @override
  String toString() =>
      'AddDomainRequest[name=$name, isSatellite=$isSatellite, proxyUrl=$proxyUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'name'] = this.name;
    json[r'is_satellite'] = this.isSatellite;
    if (this.proxyUrl != null) {
      json[r'proxy_url'] = this.proxyUrl;
    } else {
      json[r'proxy_url'] = null;
    }
    return json;
  }

  /// Returns a new [AddDomainRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AddDomainRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "AddDomainRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "AddDomainRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AddDomainRequest(
        name: mapValueOfType<String>(json, r'name')!,
        isSatellite: mapValueOfType<bool>(json, r'is_satellite')!,
        proxyUrl: mapValueOfType<String>(json, r'proxy_url'),
      );
    }
    return null;
  }

  static List<AddDomainRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <AddDomainRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AddDomainRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AddDomainRequest> mapFromJson(dynamic json) {
    final map = <String, AddDomainRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AddDomainRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AddDomainRequest-objects as value to a dart map
  static Map<String, List<AddDomainRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<AddDomainRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AddDomainRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'is_satellite',
  };
}
