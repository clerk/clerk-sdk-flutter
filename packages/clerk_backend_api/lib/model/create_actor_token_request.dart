//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateActorTokenRequest {
  /// Returns a new [CreateActorTokenRequest] instance.
  CreateActorTokenRequest({
    required this.userId,
    required this.actor,
    this.expiresInSeconds = 3600,
    this.sessionMaxDurationInSeconds = 1800,
  });

  /// The ID of the user being impersonated.
  String userId;

  CreateActorTokenRequestActor actor;

  /// Optional parameter to specify the life duration of the actor token in seconds. By default, the duration is 1 hour.
  int expiresInSeconds;

  /// The maximum duration that the session which will be created by the generated actor token should last. By default, the duration of a session created via an actor token, lasts 30 minutes.
  int sessionMaxDurationInSeconds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateActorTokenRequest &&
          other.userId == userId &&
          other.actor == actor &&
          other.expiresInSeconds == expiresInSeconds &&
          other.sessionMaxDurationInSeconds == sessionMaxDurationInSeconds;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (userId.hashCode) +
      (actor.hashCode) +
      (expiresInSeconds.hashCode) +
      (sessionMaxDurationInSeconds.hashCode);

  @override
  String toString() =>
      'CreateActorTokenRequest[userId=$userId, actor=$actor, expiresInSeconds=$expiresInSeconds, sessionMaxDurationInSeconds=$sessionMaxDurationInSeconds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'user_id'] = this.userId;
    json[r'actor'] = this.actor;
    json[r'expires_in_seconds'] = this.expiresInSeconds;
    json[r'session_max_duration_in_seconds'] = this.sessionMaxDurationInSeconds;
    return json;
  }

  /// Returns a new [CreateActorTokenRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateActorTokenRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateActorTokenRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateActorTokenRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateActorTokenRequest(
        userId: mapValueOfType<String>(json, r'user_id')!,
        actor: CreateActorTokenRequestActor.fromJson(json[r'actor'])!,
        expiresInSeconds:
            mapValueOfType<int>(json, r'expires_in_seconds') ?? 3600,
        sessionMaxDurationInSeconds:
            mapValueOfType<int>(json, r'session_max_duration_in_seconds') ??
                1800,
      );
    }
    return null;
  }

  static List<CreateActorTokenRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateActorTokenRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateActorTokenRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateActorTokenRequest> mapFromJson(dynamic json) {
    final map = <String, CreateActorTokenRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateActorTokenRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateActorTokenRequest-objects as value to a dart map
  static Map<String, List<CreateActorTokenRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateActorTokenRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateActorTokenRequest.listFromJson(
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
    'actor',
  };
}
