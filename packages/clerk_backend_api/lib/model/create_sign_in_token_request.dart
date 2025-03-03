//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateSignInTokenRequest {
  /// Returns a new [CreateSignInTokenRequest] instance.
  CreateSignInTokenRequest({
    required this.userId,
    this.expiresInSeconds = 2592000,
  });

  /// The ID of the user that can use the newly created sign in token
  String userId;

  /// Optional parameter to specify the life duration of the sign in token in seconds. By default, the duration is 30 days.
  ///
  /// Minimum value: 1
  int? expiresInSeconds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateSignInTokenRequest &&
          other.userId == userId &&
          other.expiresInSeconds == expiresInSeconds;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (userId.hashCode) +
      (expiresInSeconds == null ? 0 : expiresInSeconds!.hashCode);

  @override
  String toString() =>
      'CreateSignInTokenRequest[userId=$userId, expiresInSeconds=$expiresInSeconds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'user_id'] = this.userId;
    if (this.expiresInSeconds != null) {
      json[r'expires_in_seconds'] = this.expiresInSeconds;
    } else {
      json[r'expires_in_seconds'] = null;
    }
    return json;
  }

  /// Returns a new [CreateSignInTokenRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateSignInTokenRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateSignInTokenRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateSignInTokenRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateSignInTokenRequest(
        userId: mapValueOfType<String>(json, r'user_id')!,
        expiresInSeconds:
            mapValueOfType<int>(json, r'expires_in_seconds') ?? 2592000,
      );
    }
    return null;
  }

  static List<CreateSignInTokenRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateSignInTokenRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateSignInTokenRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateSignInTokenRequest> mapFromJson(dynamic json) {
    final map = <String, CreateSignInTokenRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateSignInTokenRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateSignInTokenRequest-objects as value to a dart map
  static Map<String, List<CreateSignInTokenRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateSignInTokenRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateSignInTokenRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'user_id',
  };
}
