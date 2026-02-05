//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateM2MTokenRequest {
  /// Returns a new [CreateM2MTokenRequest] instance.
  CreateM2MTokenRequest({
    this.secondsUntilExpiration,
    this.claims,
  });

  /// Minimum value: 0
  num? secondsUntilExpiration;

  Object? claims;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateM2MTokenRequest &&
          other.secondsUntilExpiration == secondsUntilExpiration &&
          other.claims == claims;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (secondsUntilExpiration == null ? 0 : secondsUntilExpiration!.hashCode) +
      (claims == null ? 0 : claims!.hashCode);

  @override
  String toString() =>
      'CreateM2MTokenRequest[secondsUntilExpiration=$secondsUntilExpiration, claims=$claims]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.secondsUntilExpiration != null) {
      json[r'seconds_until_expiration'] = this.secondsUntilExpiration;
    } else {
      json[r'seconds_until_expiration'] = null;
    }
    if (this.claims != null) {
      json[r'claims'] = this.claims;
    } else {
      json[r'claims'] = null;
    }
    return json;
  }

  /// Returns a new [CreateM2MTokenRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateM2MTokenRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateM2MTokenRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateM2MTokenRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateM2MTokenRequest(
        secondsUntilExpiration: json[r'seconds_until_expiration'] == null
            ? null
            : num.parse('${json[r'seconds_until_expiration']}'),
        claims: mapValueOfType<Object>(json, r'claims'),
      );
    }
    return null;
  }

  static List<CreateM2MTokenRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateM2MTokenRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateM2MTokenRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateM2MTokenRequest> mapFromJson(dynamic json) {
    final map = <String, CreateM2MTokenRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateM2MTokenRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateM2MTokenRequest-objects as value to a dart map
  static Map<String, List<CreateM2MTokenRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateM2MTokenRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateM2MTokenRequest.listFromJson(
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
