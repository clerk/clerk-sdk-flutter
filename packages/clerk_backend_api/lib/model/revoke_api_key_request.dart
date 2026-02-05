//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RevokeApiKeyRequest {
  /// Returns a new [RevokeApiKeyRequest] instance.
  RevokeApiKeyRequest({
    this.revocationReason,
  });

  String? revocationReason;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RevokeApiKeyRequest &&
          other.revocationReason == revocationReason;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (revocationReason == null ? 0 : revocationReason!.hashCode);

  @override
  String toString() =>
      'RevokeApiKeyRequest[revocationReason=$revocationReason]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.revocationReason != null) {
      json[r'revocation_reason'] = this.revocationReason;
    } else {
      json[r'revocation_reason'] = null;
    }
    return json;
  }

  /// Returns a new [RevokeApiKeyRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RevokeApiKeyRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "RevokeApiKeyRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "RevokeApiKeyRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RevokeApiKeyRequest(
        revocationReason: mapValueOfType<String>(json, r'revocation_reason'),
      );
    }
    return null;
  }

  static List<RevokeApiKeyRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RevokeApiKeyRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RevokeApiKeyRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RevokeApiKeyRequest> mapFromJson(dynamic json) {
    final map = <String, RevokeApiKeyRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RevokeApiKeyRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RevokeApiKeyRequest-objects as value to a dart map
  static Map<String, List<RevokeApiKeyRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<RevokeApiKeyRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RevokeApiKeyRequest.listFromJson(
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
