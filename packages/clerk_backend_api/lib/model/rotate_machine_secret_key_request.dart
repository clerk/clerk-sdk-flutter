//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RotateMachineSecretKeyRequest {
  /// Returns a new [RotateMachineSecretKeyRequest] instance.
  RotateMachineSecretKeyRequest({
    required this.previousTokenTtl,
  });

  /// The time in seconds that the previous secret key will remain valid after rotation. This ensures a graceful transition period for updating applications with the new secret key. Set to 0 to immediately expire the previous key. Maximum value is 8 hours (28800 seconds).
  ///
  /// Minimum value: 0
  /// Maximum value: 28800
  int previousTokenTtl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RotateMachineSecretKeyRequest &&
          other.previousTokenTtl == previousTokenTtl;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (previousTokenTtl.hashCode);

  @override
  String toString() =>
      'RotateMachineSecretKeyRequest[previousTokenTtl=$previousTokenTtl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'previous_token_ttl'] = this.previousTokenTtl;
    return json;
  }

  /// Returns a new [RotateMachineSecretKeyRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RotateMachineSecretKeyRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "RotateMachineSecretKeyRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "RotateMachineSecretKeyRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RotateMachineSecretKeyRequest(
        previousTokenTtl: mapValueOfType<int>(json, r'previous_token_ttl')!,
      );
    }
    return null;
  }

  static List<RotateMachineSecretKeyRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RotateMachineSecretKeyRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RotateMachineSecretKeyRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RotateMachineSecretKeyRequest> mapFromJson(dynamic json) {
    final map = <String, RotateMachineSecretKeyRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RotateMachineSecretKeyRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RotateMachineSecretKeyRequest-objects as value to a dart map
  static Map<String, List<RotateMachineSecretKeyRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<RotateMachineSecretKeyRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RotateMachineSecretKeyRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'previous_token_ttl',
  };
}
