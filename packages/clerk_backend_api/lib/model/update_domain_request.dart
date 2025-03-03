//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateDomainRequest {
  /// Returns a new [UpdateDomainRequest] instance.
  UpdateDomainRequest({
    this.name,
    this.proxyUrl,
    this.isSecondary,
  });

  /// The new domain name. For development instances, can contain the port, i.e `myhostname:3000`. For production instances, must be a valid FQDN, i.e `mysite.com`. Cannot contain protocol scheme.
  String? name;

  /// The full URL of the proxy that will forward requests to Clerk's Frontend API. Can only be updated for production instances.
  String? proxyUrl;

  /// Whether this is a domain for a secondary app, meaning that any subdomain provided is significant and will be stored as part of the domain. This is useful for supporting multiple apps (one primary and multiple secondaries) on the same root domain (eTLD+1).
  bool? isSecondary;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateDomainRequest &&
          other.name == name &&
          other.proxyUrl == proxyUrl &&
          other.isSecondary == isSecondary;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name == null ? 0 : name!.hashCode) +
      (proxyUrl == null ? 0 : proxyUrl!.hashCode) +
      (isSecondary == null ? 0 : isSecondary!.hashCode);

  @override
  String toString() =>
      'UpdateDomainRequest[name=$name, proxyUrl=$proxyUrl, isSecondary=$isSecondary]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.proxyUrl != null) {
      json[r'proxy_url'] = this.proxyUrl;
    } else {
      json[r'proxy_url'] = null;
    }
    if (this.isSecondary != null) {
      json[r'is_secondary'] = this.isSecondary;
    } else {
      json[r'is_secondary'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateDomainRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateDomainRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UpdateDomainRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UpdateDomainRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateDomainRequest(
        name: mapValueOfType<String>(json, r'name'),
        proxyUrl: mapValueOfType<String>(json, r'proxy_url'),
        isSecondary: mapValueOfType<bool>(json, r'is_secondary'),
      );
    }
    return null;
  }

  static List<UpdateDomainRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdateDomainRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateDomainRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateDomainRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateDomainRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateDomainRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateDomainRequest-objects as value to a dart map
  static Map<String, List<UpdateDomainRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UpdateDomainRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateDomainRequest.listFromJson(
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
