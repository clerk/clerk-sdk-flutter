//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateSessionTokenRequest {
  /// Returns a new [CreateSessionTokenRequest] instance.
  CreateSessionTokenRequest({
    this.expiresInSeconds,
  });

  /// Use this parameter to override the default session token lifetime.
  ///
  /// Minimum value: 30
  /// Maximum value: 315360000
  num? expiresInSeconds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateSessionTokenRequest &&
          other.expiresInSeconds == expiresInSeconds;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (expiresInSeconds == null ? 0 : expiresInSeconds!.hashCode);

  @override
  String toString() =>
      'CreateSessionTokenRequest[expiresInSeconds=$expiresInSeconds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.expiresInSeconds != null) {
      json[r'expires_in_seconds'] = this.expiresInSeconds;
    } else {
      json[r'expires_in_seconds'] = null;
    }
    return json;
  }

  /// Returns a new [CreateSessionTokenRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateSessionTokenRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateSessionTokenRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateSessionTokenRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateSessionTokenRequest(
        expiresInSeconds: json[r'expires_in_seconds'] == null
            ? null
            : num.parse('${json[r'expires_in_seconds']}'),
      );
    }
    return null;
  }

  static List<CreateSessionTokenRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateSessionTokenRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateSessionTokenRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateSessionTokenRequest> mapFromJson(dynamic json) {
    final map = <String, CreateSessionTokenRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateSessionTokenRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateSessionTokenRequest-objects as value to a dart map
  static Map<String, List<CreateSessionTokenRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateSessionTokenRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateSessionTokenRequest.listFromJson(
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
