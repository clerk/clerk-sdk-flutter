//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SetUserPasswordCompromisedRequest {
  /// Returns a new [SetUserPasswordCompromisedRequest] instance.
  SetUserPasswordCompromisedRequest({
    this.revokeAllSessions,
  });

  bool? revokeAllSessions;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SetUserPasswordCompromisedRequest &&
          other.revokeAllSessions == revokeAllSessions;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (revokeAllSessions == null ? 0 : revokeAllSessions!.hashCode);

  @override
  String toString() =>
      'SetUserPasswordCompromisedRequest[revokeAllSessions=$revokeAllSessions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.revokeAllSessions != null) {
      json[r'revoke_all_sessions'] = this.revokeAllSessions;
    } else {
      json[r'revoke_all_sessions'] = null;
    }
    return json;
  }

  /// Returns a new [SetUserPasswordCompromisedRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SetUserPasswordCompromisedRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SetUserPasswordCompromisedRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SetUserPasswordCompromisedRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SetUserPasswordCompromisedRequest(
        revokeAllSessions: mapValueOfType<bool>(json, r'revoke_all_sessions'),
      );
    }
    return null;
  }

  static List<SetUserPasswordCompromisedRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SetUserPasswordCompromisedRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SetUserPasswordCompromisedRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SetUserPasswordCompromisedRequest> mapFromJson(
      dynamic json) {
    final map = <String, SetUserPasswordCompromisedRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SetUserPasswordCompromisedRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SetUserPasswordCompromisedRequest-objects as value to a dart map
  static Map<String, List<SetUserPasswordCompromisedRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SetUserPasswordCompromisedRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SetUserPasswordCompromisedRequest.listFromJson(
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
