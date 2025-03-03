//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerifyDomainProxyRequest {
  /// Returns a new [VerifyDomainProxyRequest] instance.
  VerifyDomainProxyRequest({
    this.domainId,
    this.proxyUrl,
  });

  /// The ID of the domain that will be updated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? domainId;

  /// The full URL of the proxy which will forward requests to the Clerk Frontend API for this domain. e.g. https://example.com/__clerk
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? proxyUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerifyDomainProxyRequest &&
          other.domainId == domainId &&
          other.proxyUrl == proxyUrl;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (domainId == null ? 0 : domainId!.hashCode) +
      (proxyUrl == null ? 0 : proxyUrl!.hashCode);

  @override
  String toString() =>
      'VerifyDomainProxyRequest[domainId=$domainId, proxyUrl=$proxyUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.domainId != null) {
      json[r'domain_id'] = this.domainId;
    } else {
      json[r'domain_id'] = null;
    }
    if (this.proxyUrl != null) {
      json[r'proxy_url'] = this.proxyUrl;
    } else {
      json[r'proxy_url'] = null;
    }
    return json;
  }

  /// Returns a new [VerifyDomainProxyRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VerifyDomainProxyRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "VerifyDomainProxyRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "VerifyDomainProxyRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VerifyDomainProxyRequest(
        domainId: mapValueOfType<String>(json, r'domain_id'),
        proxyUrl: mapValueOfType<String>(json, r'proxy_url'),
      );
    }
    return null;
  }

  static List<VerifyDomainProxyRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerifyDomainProxyRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerifyDomainProxyRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VerifyDomainProxyRequest> mapFromJson(dynamic json) {
    final map = <String, VerifyDomainProxyRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerifyDomainProxyRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VerifyDomainProxyRequest-objects as value to a dart map
  static Map<String, List<VerifyDomainProxyRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<VerifyDomainProxyRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VerifyDomainProxyRequest.listFromJson(
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
