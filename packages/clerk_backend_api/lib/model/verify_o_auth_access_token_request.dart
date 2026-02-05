//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerifyOAuthAccessTokenRequest {
  /// Returns a new [VerifyOAuthAccessTokenRequest] instance.
  VerifyOAuthAccessTokenRequest({
    this.accessToken,
    this.secret,
  });

  /// The access token to verify.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? accessToken;

  /// The access token to verify. This is deprecated, use `access_token` instead.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? secret;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerifyOAuthAccessTokenRequest &&
          other.accessToken == accessToken &&
          other.secret == secret;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (accessToken == null ? 0 : accessToken!.hashCode) +
      (secret == null ? 0 : secret!.hashCode);

  @override
  String toString() =>
      'VerifyOAuthAccessTokenRequest[accessToken=$accessToken, secret=$secret]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.accessToken != null) {
      json[r'access_token'] = this.accessToken;
    } else {
      json[r'access_token'] = null;
    }
    if (this.secret != null) {
      json[r'secret'] = this.secret;
    } else {
      json[r'secret'] = null;
    }
    return json;
  }

  /// Returns a new [VerifyOAuthAccessTokenRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VerifyOAuthAccessTokenRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "VerifyOAuthAccessTokenRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "VerifyOAuthAccessTokenRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VerifyOAuthAccessTokenRequest(
        accessToken: mapValueOfType<String>(json, r'access_token'),
        secret: mapValueOfType<String>(json, r'secret'),
      );
    }
    return null;
  }

  static List<VerifyOAuthAccessTokenRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerifyOAuthAccessTokenRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerifyOAuthAccessTokenRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VerifyOAuthAccessTokenRequest> mapFromJson(dynamic json) {
    final map = <String, VerifyOAuthAccessTokenRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerifyOAuthAccessTokenRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VerifyOAuthAccessTokenRequest-objects as value to a dart map
  static Map<String, List<VerifyOAuthAccessTokenRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<VerifyOAuthAccessTokenRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VerifyOAuthAccessTokenRequest.listFromJson(
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
